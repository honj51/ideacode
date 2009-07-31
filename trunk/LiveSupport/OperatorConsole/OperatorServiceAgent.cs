using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Net;
using System.Net.Sockets;
using System.Web.Services.Protocols;
using System.Diagnostics;
using System.Threading;

namespace LiveSupport.OperatorConsole
{
    class OperatorServiceAgent : IOperatorServiceAgent
    {
        private static OperatorServiceAgent _default;
        private List<Visitor> visitors = new List<Visitor>();
        private List<Chat> chats = new List<Chat>();
        private List<QuickResponseCategory> quickResponseCategory=null;
        private List<Operator> operators = new List<Operator>();
        private NewChangesCheck lastCheck = new NewChangesCheck();
        private OperatorWS ws = new OperatorWS();
        private Operator currentOperator;
        private System.Timers.Timer checkNewChangesTimer = new System.Timers.Timer(1000);
        private string accountNumber;
        private string operatorName;
        private string password;
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
            set
            {
                quickResponseCategory = value;
            }
        }

        #endregion

        public OperatorServiceAgent()
        {
            lastCheck.ChatSessionChecks = new MessageCheck[] { };
            lastCheck.NewVisitorLastCheckTime = DateTime.Today.Ticks;
            checkNewChangesTimer.AutoReset = true;
            ws.Timeout = 5000;
            state = ConnectionState.Disconnected;

            checkNewChangesTimer.Elapsed += new System.Timers.ElapsedEventHandler(checkNewChangesTimer_Elapsed);
            ws.LoginCompleted += new LoginCompletedEventHandler(ws_LoginCompleted);
            ws.GetSystemAdvertiseCompleted += new GetSystemAdvertiseCompletedEventHandler(ws_GetSystemAdvertiseCompleted);
            ws.GetLeaveWordCompleted += new GetLeaveWordCompletedEventHandler(ws_GetLeaveWordCompleted);
        }

        #region OperatorServiceAgent 成员

        public void Login(string accountNumber, string operatorName, string password)
        {
            if (State != ConnectionState.Disconnected)
            {
                return;
            }

            try
            {
                this.accountNumber = accountNumber;
                this.operatorName = operatorName;
                this.password = password;

                currentOperator = null;
                fireConnectStateChange(ConnectionState.Connecting, "登录中...");

                ws.LoginAsync(accountNumber, operatorName, password);
                    
                //currentOperator = ws.Login(accountNumber, operatorName, password);
            }
            catch (Exception e)
            {
                Trace.WriteLine(e.Message);  
            }
        }

        void ws_LoginCompleted(object sender, LoginCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                currentOperator = e.Result;

                if (currentOperator != null)
                {
                    AuthenticationHeader h = new AuthenticationHeader();
                    h.OperatorId = currentOperator.OperatorId;
                    h.OperatorSession = currentOperator.OperatorSession;
                    ws.AuthenticationHeaderValue = h;

                    fireConnectStateChange(ConnectionState.Connected, "登录成功");

                    ws.GetSystemAdvertiseAsync(productVersion, Guid.NewGuid());
                    ws.GetLeaveWordAsync(Guid.NewGuid());

                    checkNewChangesTimer.Enabled = true;
                }
                else
                {
                    fireConnectStateChange(ConnectionState.Disconnected, "登录失败，登录信息输入错误");
                }
            }
            else
            {
                fireConnectStateChange(ConnectionState.Disconnected, "登录失败，" + e.Error.Message);
            }
        }

        private void fireConnectStateChange(ConnectionState state, string message)
        {
            Trace.WriteLine("ConnectStateChange : " + state.ToString() + " " + message);
            State = state;
            if (ConnectionStateChanged != null)
            {
               ConnectionStateChangeEventArgs args= new ConnectionStateChangeEventArgs(State);
                args.Message=message;
                ConnectionStateChanged(this, args);
            }
        }

        void ws_GetLeaveWordCompleted(object sender, GetLeaveWordCompletedEventArgs e)
        {
            if (NewLeaveWords != null && e.Error == null)
            {
                NewLeaveWords(this, new LeaveWordEventArgs(new List<LeaveWord>(e.Result)));
            }
        }

        private object checkNewChangesLocker = new object();

        void checkNewChangesTimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {

            if (!Monitor.TryEnter(this.checkNewChangesLocker))
            {
                return;
            }
            try
            {
                if (State == ConnectionState.Connected && enablePooling)
                {
                    getNextNewChanges();
                }
                else if (State == ConnectionState.Disconnected)
                {
                    RestartLogin();
                }
            }
            finally
            {
                Monitor.Exit(this.checkNewChangesLocker);
            }

        }

        public void Logout()
        {
            ws.GetSystemAdvertiseCompleted -= new GetSystemAdvertiseCompletedEventHandler(ws_GetSystemAdvertiseCompleted);
            ws.GetLeaveWordCompleted -= new GetLeaveWordCompletedEventHandler(ws_GetLeaveWordCompleted);

            EnablePooling = false;
            checkNewChangesTimer.Stop();
            //ws.LogoutAsync(Guid.NewGuid());
            ws.Logout();
        }

        public NewChangesCheckResult CheckNewChanges(NewChangesCheck check)
        {
              return ws.CheckNewChanges(check);
        }

        public void SendMessage(LiveSupport.OperatorConsole.LiveChatWS.Message msg)
        {
            ws.SendMessage(msg);
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

        public List<LiveSupport.OperatorConsole.LiveChatWS.Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
        {
            List<Message> lMessage = null;
            try
            {
               lMessage = new List<Message>(ws.GetHistoryChatMessage(visitorId, begin, end));
            }
            catch (WebException)
            {
                return null;
            }
            return lMessage;
        }

        public List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
        {
            List<PageRequest> lPageRequest = null;
            try
            {
                lPageRequest = new List<PageRequest>(ws.GetHistoryPageRequests(visitorId, begin, end));
            }
            catch (Exception)
            {
                return null;
            }
            return lPageRequest;
        }

        public int AcceptChatRequest(string chatId)
        {
            int num;
            try
            {
                num= ws.AcceptChatRequest(chatId);
            }
            catch (WebException)
            {
                return -3;
                throw;
            }
            return num;
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

        void ws_GetSystemAdvertiseCompleted(object sender, GetSystemAdvertiseCompletedEventArgs e)
        {
            if (NewSystemAdvertise != null && e.Error == null)
            {
                NewSystemAdvertise(this, new SystemAdvertiseEventArgs(new List<SystemAdvertise>(e.Result)));
            }
        }

        public List<QuickResponseCategory> GetQuickResponse()
        {
            List<QuickResponseCategory> lQuickResponseCategory = null;
            try
            {
                lQuickResponseCategory=new List<QuickResponseCategory>(ws.GetQuickResponse());
            }
            catch (WebException)
            {
                return null;
            }
            return lQuickResponseCategory;
        }

        private NewChangesCheckResult getNextNewChanges()
        {
            NewChangesCheckResult result = getNewChanges();

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
                        if (VisitorSessionChange!=null)
                        {
                            //Trace.WriteLine("VisitorSessionChange: " + result.VisitSessionChange.Length);
                            VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                        }
                        
                    }
                    else
                    {
                        visitors.Add(item);
                        if (NewVisitor != null)
                        {
                            //Trace.WriteLine("NewVisitors: " + result.NewVisitors.Length);
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
                        if (VisitorSessionChange!=null)
                        {   
                            VisitorSessionChange(this, new VisitorSessionChangeEventArgs(item));
                        }
            
                    }
                }
            }

            if (result.Operators != null)
            {
                processOpertors(result);
            }
            if (result.Messages != null)
            {
                    lastCheck.ChatSessionChecks = processMessages(result).ToArray();
            }

            processChats(result);

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
            if (result.Chats == null)
            {
                return;
            }
            // 1. 查找新的对话请求，并显示NotifyForm
            foreach (var item in result.Chats)
            {
                if (item.Status == ChatStatus.Requested && !item.IsInviteByOperator && GetChatByChatId(item.ChatId) == null)
                {
                    Visitor visitor = GetVisitorById(item.VisitorId);
                    if (NewChatRequest != null)
                    {
                        NewChatRequest(this, new NewChatRequestEventArgs(visitor.Name, item));
                    }
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
                    if (NewChanges != null)
                    {
                        NewChanges(this, new NewChangesCheckResultEventArgs(result));
                    }
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

        int faultCount = 0;
        const int MAX_FAULT_COUNT = 10;

        private NewChangesCheckResult getNewChanges()
        {
            NewChangesCheckResult result = null;
            try
            {
                result = ws.CheckNewChanges(lastCheck); //CheckNewChanges(lastCheck);
                faultCount = 0;
                if (result != null && result.ReturnCode == ReturnCodeEnum.ReturnCode_SessionInvalid)
                {
                    resetConnection("该帐号已在其他地方登陆！", ExceptionStatus.User);
                }
            }
            catch (WebException ex)
            {
                faultCount++;

                if (faultCount >= MAX_FAULT_COUNT)
                {
                    faultCount = 0;
                    resetConnection("连接中断", ExceptionStatus.System);
                }
            }
            catch (InvalidOperationException ioe)
            {
                faultCount++;

                if (faultCount >= MAX_FAULT_COUNT)
                {
                    faultCount = 0;
                    resetConnection("连接中断", ExceptionStatus.System);
                }
            }
            catch (SoapException ave)
            {
                faultCount++;
                if (faultCount >= MAX_FAULT_COUNT)
                {
                    faultCount = 0;
                    if (ave.Message.Contains("AccessViolationException"))
                    {
                        resetConnection("服务访问拒绝", ExceptionStatus.System);
                    }
                    else
                    {
                        resetConnection("Soap异常", ExceptionStatus.System);
                    }
                }
                else
                {
                    Login(accountNumber, operatorName, password);
                }
            }
            return result;
        }

        private void resetConnection(string message,ExceptionStatus status)
        {
            state = ConnectionState.Disconnected;

            if (status == ExceptionStatus.User)
            {
                enablePooling = false;
            }
            if (ConnectionStateChanged != null)
            {
                ConnectionStateChangeEventArgs args = new ConnectionStateChangeEventArgs(state);
                args.Status = status;
                args.Message = message;
                ConnectionStateChanged(this, args);
            }
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

        public void RestartLogin() 
        {
            try
            {
              Login(accountNumber, operatorName, password);
            }
            catch (Exception wex)
            {
                Trace.WriteLine("RestartLogin Exception: " + wex.Message);
            }
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

        public  List<LeaveWord> GetLeaveWord()
        {
            List<LeaveWord> leaveWords = new List<LeaveWord>();
            try
            {
                leaveWords.AddRange(ws.GetLeaveWord());
            }
            catch (WebException)
            {
                return null;
            }
            return leaveWords;
        }

        public bool UpdateLeaveWordById(string sendDate, string name, bool isReplied, string id) 
        {
            bool result;
            try
            {
             result=ws.UpdateLeaveWordById(sendDate, name, isReplied, id);
            }
            catch (WebException)
            {
                return false;
            }

            return result;
        }

        public bool DelLeaveWordById(string id) 
        {
            return ws.DelLeaveWordById(id);
        }

        public List<LeaveWord> GetLeaveWordNotReplied() 
        {
            List<LeaveWord> leaveWords = new List<LeaveWord>();
            if (ws.GetLeaveWordNotReplied()!=null)
            {
                leaveWords.AddRange(ws.GetLeaveWordNotReplied());
            }

            return leaveWords;
        }

       public List<LeaveWord> GetLeaveWordByDomainName(string domainName) 
        {
            List<LeaveWord> leaveWords = new List<LeaveWord>();
            if (ws.GetLeaveWordByDomainName(domainName) != null)
            {
                leaveWords.AddRange(ws.GetLeaveWordByDomainName(domainName));
            }
            return leaveWords;
        
        }
        public List<string> GetAccountDomains()
        {
            return new List<string>(ws.GetAccountDomains());
        }

         public List<QuickResponseCategory> GetQuickResponseByDomainName(string domainName) 
        {
            return new List<QuickResponseCategory>(ws.GetQuickResponseByDomainName(domainName));
        }

         public void SaveQuickResponseByDomainName(List<QuickResponseCategory> response, string domainName) 
         {
             ws.SaveQuickResponseByDomainName(response.ToArray(), domainName);
         
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

        public event EventHandler<SystemAdvertiseEventArgs> NewSystemAdvertise;

        public event EventHandler<LeaveWordEventArgs> NewLeaveWords;

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

        public void SendFile(string fileName, string chatId, object action)
        {
            ws.SendFile(fileName, chatId, action);
        }


        #endregion

        #region 判断访客是否存在 成员
        public bool IsVisitorExist(string visitorId)
        {
            return GetVisitorById(visitorId) == null ? false : true;
        }

        #endregion

        #region IOperatorServiceAgent 成员

        private bool enablePooling;
        
        public bool EnablePooling
        {
            get
            {
                return enablePooling;
            }
            set
            {
                enablePooling = value;
            }
        }

        #endregion

        #region IOperatorServiceAgent 成员

        private string productVersion;
        public string ProductVersion
        {
            get
            {
                return productVersion;
            }
            set
            {
                productVersion = value;
            }
        }

        public event EventHandler<ConnectionStateChangeEventArgs> ConnectionStateChanged;

        public ConnectionState State
        {
            get
            {
                return state;
            }
            set
            {
                state = value;
            }
        }
        private ConnectionState state;
        private bool autoLoginEnabled = true;
        public bool AutoLoginEnabled
        {
            get
            {
                return autoLoginEnabled;
            }
            set
            {
                autoLoginEnabled = value;
            }
        }

        #endregion
    }
}
