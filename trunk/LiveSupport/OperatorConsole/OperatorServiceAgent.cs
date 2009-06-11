using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Net;
using System.Net.Sockets;

namespace LiveSupport.OperatorConsole
{
    class OperatorServiceAgent : IOperatorServiceAgent
    {
        private static OperatorServiceAgent _default;
        private List<Visitor> visitors = new List<Visitor>();
        private List<Chat> chats = new List<Chat>();
        private List<QuickResponseCategory> quickResponseCategory;
        private List<Operator> operators = new List<Operator>();
        private NewChangesCheck lastCheck = new NewChangesCheck();
        private OperatorWS ws = new OperatorWS();
        private Operator currentOperator;

        #region 公开属性
        public OperatorWS WS
        {
            get { return ws; }
            set { ws = value; }
        }

        public static OperatorServiceAgent Default
        {
            get 
            {
                if (OperatorServiceAgent._default == null)
                {
                    OperatorServiceAgent._default = new OperatorServiceAgent();
                }
                return OperatorServiceAgent._default; 
            }
        }
        
        public List<Visitor> Visitors
        {
            get { return visitors; }
            set { visitors = value; }
        }
        
        public List<Chat> Chats
        {
            get { return chats; }
            set { chats = value; }
        }
        
        public Operator CurrentOperator
        {
            get { return currentOperator; }
            set { currentOperator = value; }
        }

        public List<QuickResponseCategory> QuickResponseCategory
        {
            get
            {
                if (quickResponseCategory == null)
                {
                    quickResponseCategory = GetQuickResponse();
                }
                return quickResponseCategory;
            }
        }
        #endregion

        public OperatorServiceAgent()
        {
            lastCheck.ChatSessionChecks = new MessageCheck[] { };
            lastCheck.NewVisitorLastCheckTime = DateTime.Today.Ticks;
        }

        #region OperatorServiceClient 成员

        public Operator Login(string accountName, string operatorName, string password)
        {
            currentOperator = ws.Login(accountName, operatorName, password);
            if (currentOperator != null)
            {
                AuthenticationHeader h = new AuthenticationHeader();
                h.OperatorId = currentOperator.OperatorId;
                h.OperatorSession = currentOperator.OperatorSession;
                ws.AuthenticationHeaderValue = h;
            }
            return currentOperator;
        }

        public void Logout()
        {
            ws.Logout();
        }

        public List<Visitor> GetAllVisitors(string accountId)
        {
            return new List<Visitor>(ws.GetAllVisitors(accountId));
        }

        public NewChangesCheckResult CheckNewChanges(NewChangesCheck check)
        {
            return ws.CheckNewChanges(check);
        }

        public void UploadFile(byte[] bs, string fileName, string chatId)
        {
            ws.UploadFile(bs, fileName, chatId);
        }

        public bool SendMessage(Message msg)
        {
            return ws.SendMessage(msg);
        }

        public int ChangePassword(string oldPassword, string newPassword)
        {
            return ws.ChangePassword(oldPassword, newPassword);
        }

        public int ResetOperatorPassword(string loginName)
        {
            return ws.ResetOperatorPassword(loginName);
        }

        public bool CloseChat(string chatId)
        {
            return ws.CloseChat(chatId);
        }

        public List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
        {
            return new List<Message>(ws.GetHistoryChatMessage(visitorId, begin, end));
        }

        public List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
        {
            return new List<PageRequest>(ws.GetHistoryPageRequests(visitorId, begin, end));
        }

        public int AcceptChatRequest(string chatId)
        {
            return ws.AcceptChatRequest(chatId);
        }

        public Chat InviteChat(string visitorId)
        {
            return ws.InviteChat(visitorId);
        }

        public List<SystemAdvertise> GetSystemAdvertise(string versionNumber)
        {
            return new List<SystemAdvertise>(ws.GetSystemAdvertise(versionNumber));
        }

        public void SaveQuickResponse(List<QuickResponseCategory> response)
        {
            ws.SaveQuickResponse(response.ToArray());
        }

        public List<QuickResponseCategory> GetQuickResponse()
        {
            return new List<QuickResponseCategory>(ws.GetQuickResponse());
        }

        public NewChangesCheckResult GetNextNewChanges()
        {
            NewChangesCheckResult result = getNewChanges(lastCheck);
            foreach (var item in result.NewVisitors)
            {
                lastCheck.NewVisitorLastCheckTime = Math.Max(lastCheck.NewVisitorLastCheckTime, item.CurrentSession.VisitingTime.Ticks);
                visitors.Add(item);
                NewVisitor(this, new NewVisitorEventArgs(item));
            }

            foreach (var item in result.VisitSessionChange)
            {
                if (checkIfVisitSessionStatusChange(item))
                {
                    GetVisitorBySessionId(item.SessionId).CurrentSession = item;
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(item));
                }                
            }
            processOpertors(result);
            processChats(result);

            lastCheck.ChatSessionChecks = processMessages(result).ToArray();
            return result;
        }

        private void processChats(NewChangesCheckResult result)
        {
            this.chats.Clear();
            this.chats.AddRange(result.Chats);

            foreach (var item in this.chats)
            {
                if (item.Status == ChatStatus.Requested && !item.IsInviteByOperator)
                {
                    Visitor visitor = null;
                    if (this.visitors != null)
                    {
                        foreach (var v in this.visitors)
                        {
                            if (v.VisitorId == item.VisitorId)
                            {
                                visitor = v;
                                break;
                            }
                        }

                        NotifyForm.ShowNotifier(true, "访客 " + visitor.Name + " 请求对话！", item);
                    }
                }
            }
        }

        private void processOpertors(NewChangesCheckResult result)
        {

            if (result.Operators != null)
            {
                if (result.Operators.Length > Operators.Count || checkIfOperatorStatusChanges(Operators, result.Operators))
                {
                    Operators.Clear();
                    Operators.AddRange(result.Operators);
                }
            }
        }

        private List<MessageCheck> processMessages(NewChangesCheckResult result)
        {
            List<MessageCheck> nextChecks = new List<MessageCheck>();

            foreach (var chat in chats)
            {
                LiveSupport.OperatorConsole.LiveChatWS.Message[] ms = null;
                foreach (var item in result.Messages)
                {
                    if (chat.ChatId == item.ChatId)
                    {
                        ms = item.Messages;
                        break;
                    }
                }

                MessageCheck c = new MessageCheck();
                c.ChatId = chat.ChatId;
                c.LastCheckTime = chat.CreateTime.Ticks;
                if (ms != null)
                {
                    foreach (var m in ms)
                    {
                        if (m != null && m.SentDate.Ticks >= c.LastCheckTime)
                        {
                            NewMessage(this, new NewMessageEventArgs(m));
                            c.LastCheckTime = Math.Max(m.SentDate.Ticks, c.LastCheckTime);
                        }
                        else
                            continue;

                    }
                }
                nextChecks.Add(c);

            }
            return nextChecks;
        }

        private NewChangesCheckResult getNewChanges(NewChangesCheck check)
        {
            try
            {
                return CheckNewChanges(lastCheck);
            }
            catch (WebException ex)
            {
                if (ex.InnerException != null && ex.InnerException is SocketException && (ex.InnerException as SocketException).ErrorCode == 10061)
                {
                    ConnectionLost(this, null);
                    return null;
                }
                else
                {
                    throw;
                }
            }
        }

        private bool checkIfOperatorStatusChanges(List<Operator> ops, Operator[] p)
        {
            if (ops == null || p == null)
            {
                return false;

            }
            for (int i = 0; i < p.Length; i++)
            {

                foreach (var item in ops)
                {
                    if (p[i].Status != item.Status && p[i].OperatorId == item.OperatorId)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        private bool checkIfVisitSessionStatusChange(VisitSession session)
        {
            VisitSession s = GetVisitSessionById(session.SessionId);
            if (s.Status != session.Status)
            {
                return true;
            }
            return false;
        }

        private VisitSession GetVisitSessionById(string sessionId)
        {
            
            Visitor v = GetVisitorBySessionId(sessionId);
            return v == null? null:v.CurrentSession;
        }

        private Visitor GetVisitorBySessionId(string sessionId)
        {
            foreach (var item in visitors)
            {
                if (item.CurrentSession.SessionId == sessionId)
                {
                    return item;
                }
            }
            return null;
        }
        #endregion

        #region IOperatorServiceAgent 成员

        public event EventHandler<EventArgs> ConnectionLost;

        public event EventHandler<NewVisitorEventArgs> NewVisitor;

        public event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;

        public event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;

        public event EventHandler<ChatStatusChangeEventArgs> ChatStatusChange;

        public event EventHandler<NewMessageEventArgs> NewMessage;

        public List<Operator> Operators
        {
            get
            {
                return operators;
            }
            set
            {
                operators = value;
            }
        }
        public Operator GetOperatorById(string operatorId)
        {
            foreach (var item in operators)
            {
                if (item.OperatorId == operatorId)
                {
                    return item;
                }
            }
            return null;
        }

        #endregion
    }
}
