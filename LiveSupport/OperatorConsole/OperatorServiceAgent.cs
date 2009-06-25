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
        private System.Timers.Timer checkNewChangesTimer = new System.Timers.Timer(1000);
        private bool pooling = true;
        #region 公开属性
       
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
            checkNewChangesTimer.AutoReset = false;
        }

        #region OperatorServiceAgent 成员

        public Operator Login(string accountNumber, string operatorName, string password)
        {
            currentOperator = ws.Login(accountNumber, operatorName, password);
            if (currentOperator != null)
            {
                AuthenticationHeader h = new AuthenticationHeader();
                h.OperatorId = currentOperator.OperatorId;
                h.OperatorSession = currentOperator.OperatorSession;
                ws.AuthenticationHeaderValue = h;

                // 开始查询 系统改变信息
                checkNewChangesTimer.Elapsed += new System.Timers.ElapsedEventHandler(checkNewChangesTimer_Elapsed);
                checkNewChangesTimer.Start();
            }
            return currentOperator;
        }

        void checkNewChangesTimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {   
            if (pooling)
            {
                getNextNewChanges();
                checkNewChangesTimer.Start();
            }
        }

        public void Logout()
        {
            checkNewChangesTimer.Stop();
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
            ws.UploadFileAsync(bs, fileName, chatId);
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
            Chat chat = GetChatByVisitorId(visitorId);
            if (chat == null)
            {
                return ws.InviteChat(visitorId);
            }
            else
                return null;
        }

        private Chat GetChatByVisitorId(string visitorId)
        {
            foreach (var item in Chats)
            {
                if (item.VisitorId==visitorId)
                {
                    return item;
                }
            }
            return null;
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

        private NewChangesCheckResult getNextNewChanges()
        {
            NewChangesCheckResult result = getNewChanges(lastCheck);
            if (result == null) return null;
            if (result.NewVisitors != null)
            {
                foreach (var item in result.NewVisitors)
                {
                    lastCheck.NewVisitorLastCheckTime = Math.Max(lastCheck.NewVisitorLastCheckTime, item.CurrentSession.VisitingTime.Ticks);
                    if (IsVisitorExist(item.VisitorId))
                    {
                        Visitor v = GetVisitorById(item.VisitorId);
                        v.CurrentSession = item.CurrentSession;
                        VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                    }
                    else
                    {
                        visitors.Add(item);
                        if (NewVisitor != null)
                        {
                            NewVisitor(this, new NewVisitorEventArgs(item)); 
                        }
                    }
                }

            }
            if (result.VisitSessionChange != null)
            {
                foreach (var item in result.VisitSessionChange)
                {
                    if (checkIfVisitSessionStatusChange(item))
                    {
                        GetVisitorBySessionId(item.SessionId).CurrentSession = item;
                        VisitorSessionChange(this, new VisitorSessionChangeEventArgs(item));
                    }
                }
            } 
            processOpertors(result);

            if (result.Messages != null)
            {
                lastCheck.ChatSessionChecks = processMessages(result).ToArray();
            }
            
            processChats(result);

            if (NewChanges != null)
            {
                NewChanges(this, new NewChangesCheckResultEventArgs(result));
            }
            return result;
        }

        public Visitor GetVisitorById(string visitorId)
        {
            foreach (var item in visitors)
            {
                if (visitorId == item.VisitorId)
                {
                    return item;
                }
            }
            return null;
        }

        private void processChats(NewChangesCheckResult result)
        {
            // 1. 查找新的对话请求，并显示NotifyForm
            foreach (var item in result.Chats)
            {
                if (item.Status == ChatStatus.Requested && !item.IsInviteByOperator && GetChatByChatId(item.ChatId) == null)
                {
                    Visitor visitor = GetVisitorById(item.VisitorId);
                    NewChatRequest(this, new NewChatRequestEventArgs(visitor.Name, item));
                }
            }

            // 2. 保存LastCheckTime
            foreach (var item in result.Chats)
            {
                Chat c = GetChatByChatId(item.ChatId);
                if (c != null)
                {
                    item.LastCheckTime = c.LastCheckTime;
                }
            }

            this.chats.Clear();
            this.chats.AddRange(result.Chats);
        }

        private void processOpertors(NewChangesCheckResult result)
        {

            if (result.Operators != null)
            {
                if (result.Operators.Length > Operators.Count || checkIfOperatorStatusChanges(result.Operators))
                {
                    Operators.Clear();
                    Operators.AddRange(result.Operators);
                }
            }
        }

        private List<MessageCheck> processMessages(NewChangesCheckResult result)
        {
            if (result.Messages == null)
            {
                return null;
            }
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
                c.LastCheckTime = chat.LastCheckTime;
                if (ms != null)
                {
                    foreach (var m in ms)
                    {
                        if (m != null && m.SentDate.Ticks >= c.LastCheckTime)
                        {
                            if (NewMessage != null)
                            {
                                NewMessage(this, new NewMessageEventArgs(m));
                                c.LastCheckTime = Math.Max(m.SentDate.Ticks, c.LastCheckTime);
                            }
                            
                        }
                        else
                            continue;

                    }
                    chat.LastCheckTime = c.LastCheckTime;
                }
               
                nextChecks.Add(c);

            }
            return nextChecks;
        }

        private NewChangesCheckResult getNewChanges(NewChangesCheck check)
        {
            NewChangesCheckResult result = null;
            try
            {
                result = CheckNewChanges(lastCheck);
                if (result != null && result.ReturnCode == ReturnCodeEnum.ReturnCode_SessionInvalid)
                {
                    resetConnection("该帐号已在其他地方登陆！");
                }
            }
            catch (WebException ex)
            {
                if (ex.InnerException != null && ex.InnerException is SocketException)
                {
                    resetConnection("连接中断");
                }
                else if (ex.Status == WebExceptionStatus.Timeout)
                {
                    // 超时
                }
                else
                {
                    throw;
                }
            }
            catch (AccessViolationException ave)
            {
                resetConnection("服务访问拒绝");
            }
            return result;
        }

        private void resetConnection(string message)
        {
            checkNewChangesTimer.Stop();
            pooling = false;
            ConnectionLost(this, new ConnectionLostEventArgs(message));
        }

        private bool checkIfOperatorStatusChanges(Operator[] p)
        {
            foreach (var item in p)
            {
                Operator op = GetOperatorById(item.OperatorId);
                if (op == null)
                {
                    continue;
                }
                if (op.Status != item.Status)
                {
                    return true;
                }
            }

            return false;
        }

        private bool checkIfVisitSessionStatusChange(VisitSession session)
        {
            VisitSession s = GetVisitSessionById(session.SessionId);
            if (s==null)
            {
                return false;
            }
            if (s.Status != session.Status)
            {
                return true;
            }
            return false;
        }

        public VisitSession GetVisitSessionById(string sessionId)
        {
            
            Visitor v = GetVisitorBySessionId(sessionId);
            return v == null? null:v.CurrentSession;
        }

        public Visitor GetVisitorBySessionId(string sessionId)
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

        public Chat GetChatByChatId(string chatId) 
        {
            foreach (var item in chats)
            {
                if (item.ChatId == chatId)
                {
                    return item;
                }
            }
            return null;
        }

        public int ResetOperator(string operatorId, string chatId)
        {
            throw new NotImplementedException();
        }

    
        #endregion

        #region IOperatorServiceAgent 成员

        public event EventHandler<ConnectionLostEventArgs> ConnectionLost;

        public event EventHandler<NewVisitorEventArgs> NewVisitor;

        public event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;

        public event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;

        public event EventHandler<ChatStatusChangeEventArgs> ChatStatusChange;

        public event EventHandler<NewMessageEventArgs> NewMessage;

        public event EventHandler<NewChatRequestEventArgs> NewChatRequest;

        public event EventHandler<NewChangesCheckResultEventArgs> NewChanges;

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

        public Chat GetChatRequest(string visitorId)
        {
            foreach (var item in chats)
            {
                if (item.VisitorId == visitorId && item.Status == ChatStatus.Requested)
                {
                    return item;
                }
            }
            return null;
        }

        #endregion

        #region 判断访客是否存在 成员
        public bool IsVisitorExist(string visitorId)
        {
            return GetVisitorById(visitorId) == null ? false : true;
        }

        #endregion

        #region IOperatorServiceAgent 成员


        public void SendFile(string fileName, string chatId, object action)
        {
            ws.SendFile(fileName, chatId, action); 
        }

        #endregion
    }
}
