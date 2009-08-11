using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Web.Services.Protocols;
using System.Diagnostics;
using System.Threading;
using OperatorServiceInterface;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.OperatorConsole
{
    class OperatorServiceAgent : IOperatorServiceAgent
    {
        enum TimerAction
        {
            HeartBeat, ReConnect, None
        }
        private static OperatorServiceAgent _default;
        private List<Visitor> visitors = new List<Visitor>();
        private List<Chat> chats = new List<Chat>();
        private List<QuickResponseCategory> quickResponseCategory = null;
        private List<Operator> operators = new List<Operator>();
        //private NewChangesCheck lastCheck = new NewChangesCheck();
        private LiveSupport.OperatorConsole.LiveChatWS.OperatorWS ws = new LiveSupport.OperatorConsole.LiveChatWS.OperatorWS();
        private Operator currentOperator;
        private System.Timers.Timer timer = new System.Timers.Timer(10000);
        private TimerAction timerAction = TimerAction.None;
        private string accountNumber;
        private string operatorName;
        private string password;
        private SocketHandler socketHandler;
        private Socket socket;
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
            ws.Timeout = 5000;
            state = ConnectionState.Disconnected;
            timer.Elapsed += new System.Timers.ElapsedEventHandler(timer_Elapsed);
            ws.LoginCompleted += new LiveChatWS.LoginCompletedEventHandler(ws_LoginCompleted);
            ws.GetSystemAdvertiseCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetSystemAdvertiseCompletedEventHandler(ws_GetSystemAdvertiseCompleted);
            ws.GetAllOperatorsCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetAllOperatorsCompletedEventHandler(ws_GetAllOperatorsCompleted);
            ws.GetAllVisitorsCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetAllVisitorsCompletedEventHandler(ws_GetAllVisitorsCompleted);
            //ws.GetLeaveWordCompleted += new GetLeaveWordCompletedEventHandler(ws_GetLeaveWordCompleted);
        }

        void timer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            if (this.timer.SynchronizingObject == null) return;
            lock (this.timer.SynchronizingObject)
            {
                try
                {
                    switch (timerAction)
                    {
                        case TimerAction.HeartBeat:
                            socketHandler.SendPacket(socket, new HeartBeatAction(CurrentOperator.OperatorId));
                            break;
                        case TimerAction.ReConnect:
                            RestartLogin();
                            break;
                        case TimerAction.None:
                            break;
                        default:
                            break;
                    }

                }
                catch (Exception ex)
                {
                    Trace.WriteLine(ex.Message);
                }
            }
        }

        void ws_GetAllVisitorsCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetAllVisitorsCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                List<Visitor> vs = new List<Visitor>();
                for (int i = 0; i < e.Result.Length; i++)
                {
                    vs.Add((Visitor)Common.Convert(e.Result[i]));
                }
                visitors = vs;
                if (DataLoadCompleted != null)
                {
                    DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.Visitors));
                }
            }
        }

        void ws_GetAllOperatorsCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetAllOperatorsCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                List<Operator> ops = new List<Operator>();
                for (int i = 0; i < e.Result.Length; i++)
                {
                    ops.Add((Operator)Common.Convert(e.Result[i]));
                }

                operators = ops;
                if (DataLoadCompleted != null)
                {
                    DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.Operators));
                }

            }
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
            }
            catch (Exception e)
            {
                Trace.WriteLine(e.Message);
            }
        }

        void ws_LoginCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.LoginCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                currentOperator = (Operator)Common.Convert(e.Result);

                if (currentOperator != null)
                {
                    LiveSupport.OperatorConsole.LiveChatWS.AuthenticationHeader h = new LiveSupport.OperatorConsole.LiveChatWS.AuthenticationHeader();
                    h.OperatorId = currentOperator.OperatorId;
                    h.OperatorSession = currentOperator.OperatorSession;
                    ws.AuthenticationHeaderValue = h;

                    socketHandler = new SocketHandler();
                    IPHostEntry entry = Dns.GetHostEntry("lcs.zxkefu.cn");
                    socket = socketHandler.Connect(entry.AddressList[0].ToString());
                    //socket = socketHandler.Connect("127.0.0.1");
                    socketHandler.DataArrive += new EventHandler<DataArriveEventArgs>(socketHandler_DataArrive);
                    socketHandler.Exception += new EventHandler<ExceptionEventArgs>(socketHandler_Exception);
                    socketHandler.SendPacket(socket, new LoginAction(currentOperator.OperatorId));

                    fireConnectStateChange(ConnectionState.Connected, "登录成功");
                    timer.Enabled = false;
                    ws.GetSystemAdvertiseAsync(productVersion, Guid.NewGuid());
                    ws.GetLeaveWordAsync(Guid.NewGuid());
                    ws.GetAllVisitorsAsync(currentOperator.AccountId, Guid.NewGuid());
                    ws.GetAllOperatorsAsync(Guid.NewGuid());
                    //Disable the timer checkNewChangesTimer.Enabled = true;
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

        void socketHandler_Exception(object sender, ExceptionEventArgs e)
        {
            if (e.Exception is SocketException && !socket.Connected)
            {
                if (autoLoginEnabled)
                {
                    timer.Enabled = true;
                }
                fireConnectStateChange(ConnectionState.Disconnected, e.Exception.Message);
            }
        }

        void processServerEvents(DataArriveEventArgs e)
        {
            // 客服状态改变
            if (e.Data.GetType() == typeof(OperatorStatusChangeEventArgs))
            {
                OperatorStatusChangeEventArgs os = (OperatorStatusChangeEventArgs)e.Data;
                Operator op = GetOperatorById(os.OperatorId);
                if (op != null)
                {
                    op.Status = os.Status;
                    OperatorStatusChanged(this, os);
                }
            }
            //访客对话请求
            else if (e.Data.GetType() == typeof(VisitorChatRequestEventArgs))
            {
                VisitorChatRequestEventArgs vc = (VisitorChatRequestEventArgs)e.Data;
                Visitor v = GetVisitorById(vc.VisitorId);
                if (v != null)
                {
                    v.CurrentSession.Status = VisitSessionStatus.ChatRequesting;
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                    VisitorChatRequest(this, vc);
                    chats.Add(vc.Chat);
                }
            }
            //客服对话邀请
            else if (e.Data.GetType() == typeof(OperatorChatRequestEventArgs))
            {
                OperatorChatRequestEventArgs ocr = (OperatorChatRequestEventArgs)e.Data;
                Operator op = GetOperatorById(ocr.OperatorId);
                Visitor v = GetVisitorById(ocr.VisitorId);
                if (op != null && v != null)
                {
                    op.Status = OperatorStatus.InviteChat;
                    //v.CurrentSession.Status = VisitSessionStatus.
                    //OperatorChatRequest(this, ocr);
                    OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(op.OperatorId, OperatorStatus.InviteChat));
                }
            }
            // 访客对话请求被接受
            else if (e.Data.GetType() == typeof(VisitorChatRequestAcceptedEventArgs))
            {
                VisitorChatRequestAcceptedEventArgs v = e.Data as VisitorChatRequestAcceptedEventArgs;
                Chat chat = GetChatByChatId(v.VisitorChatRequest.Chat.ChatId);
                Operator op = GetOperatorById(v.VisitorChatRequest.Chat.OperatorId);
                Visitor visitor = GetVisitorById(v.VisitorChatRequest.VisitorId);
                if (chat != null && op != null && visitor != null)
                {
                    chat.OperatorId = v.VisitorChatRequest.Chat.OperatorId;
                    op.Status = OperatorStatus.Chatting;
                    VisitSession vs = visitor.CurrentSession;
                    vs.ChatingTime = v.VisitorChatRequest.Chat.AcceptTime;
                    vs.Status = VisitSessionStatus.Chatting;

                    //VisitorChatRequestAccepted(this, (VisitorChatRequestAcceptedEventArgs)e.Data);
                    OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(v.VisitorChatRequest.Chat.OperatorId, OperatorStatus.Chatting));
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(vs));
                }
            }
            // 客服对话邀请被接受
            else if (e.Data.GetType() == typeof(OperatorChatRequestAcceptedEventArgs) && OperatorChatRequestAccepted != null)
            {
                OperatorChatRequestAcceptedEventArgs ocr = (OperatorChatRequestAcceptedEventArgs)e.Data;
                Operator op = GetOperatorById(ocr.ChatRequest.OperatorId);
                Visitor v = GetVisitorById(ocr.ChatRequest.VisitorId);
                if (op != null && v != null)
                {
                    op.Status = OperatorStatus.Chatting;
                    v.CurrentSession.Status = VisitSessionStatus.Chatting;
                    OperatorChatRequestAccepted(this, (OperatorChatRequestAcceptedEventArgs)e.Data);
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                }
            }
            // 客服对话邀请被拒绝
            else if (e.Data.GetType() == typeof(OperatorChatRequestDeclinedEventArgs) && OperatorChatRequestDeclined != null)
            {
                OperatorChatRequestDeclinedEventArgs ocr = (OperatorChatRequestDeclinedEventArgs)e.Data;
                Operator op = GetOperatorById(ocr.ChatRequest.OperatorId);
                Visitor v = GetVisitorById(ocr.ChatRequest.VisitorId);
                Chat c = GetChatByChatId(ocr.ChatRequest.Chat.ChatId);
                if (op != null && v != null && c != null)
                {
                    c.Status = ChatStatus.Decline;
                    if (!IsOperatorHasActiveChat(op.OperatorId))
                    {
                        op.Status = OperatorStatus.Idle;
                        OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(op.OperatorId, OperatorStatus.Idle));
                    }
                    v.CurrentSession.Status = VisitSessionStatus.Visiting;
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                    OperatorChatRequestDeclined(this, (OperatorChatRequestDeclinedEventArgs)e.Data);
                }
            }
            // 新的对话
            else if (e.Data.GetType() == typeof(NewChatEventArgs))
            {
                NewChat(this, (NewChatEventArgs)e.Data);
            }
            // 对话状态改变
            else if (e.Data.GetType() == typeof(ChatStatusChangedEventArgs))
            {
                ChatStatusChangedEventArgs cs = (ChatStatusChangedEventArgs)e.Data;

                Chat chat = GetChatByChatId(cs.ChatId);
                if (chat == null) return;
                Visitor v = GetVisitorById(chat.VisitorId);
                if (v == null) return;
                chat.Status = cs.Status;
                Operator o = GetOperatorById(chat.OperatorId);

                if (chat.Status == ChatStatus.Accepted)
                {
                    v.CurrentSession.Status = VisitSessionStatus.Chatting;
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                    o.Status = OperatorStatus.Chatting;
                    OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(chat.OperatorId, OperatorStatus.Chatting));
                }
                else if (chat.Status == ChatStatus.Closed)
                {
                    v.CurrentSession.Status = VisitSessionStatus.Visiting;
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                    if (o != null && !IsOperatorHasActiveChat(chat.OperatorId))
                    {
                        o.Status = OperatorStatus.Idle;
                        OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(chat.OperatorId, OperatorStatus.Idle));
                    }
                }

                ChatStatusChanged(this, cs);
            }
            else if (e.Data.GetType() == typeof(OperatorChatJoinInviteEventArgs) && ChatJoinInvite != null)
            {
                ChatJoinInvite(this, (OperatorChatJoinInviteEventArgs)e.Data);
            }
            else if (e.Data.GetType() == typeof(OperatorChatJoinInviteAcceptedEventArgs) && ChatJoinInviteAccepted != null)
            {
                ChatJoinInviteAccepted(this, (OperatorChatJoinInviteAcceptedEventArgs)e.Data);
            }
            else if (e.Data.GetType() == typeof(OperatorChatJoinInviteDeclinedEventArgs) && ChatJoinInviteDeclined != null)
            {
                ChatJoinInviteDeclined(this, (OperatorChatJoinInviteDeclinedEventArgs)e.Data);
            }
            // 新消息
            else if (e.Data.GetType() == typeof(ChatMessageEventArgs) && NewMessage != null)
            {
                NewMessage(this, (ChatMessageEventArgs)e.Data);
            }
            // 新访问,访客可能已经存在
            else if (e.Data.GetType() == typeof(NewVisitingEventArgs) && NewVisiting != null)
            {
                NewVisitingEventArgs nv = (NewVisitingEventArgs)e.Data;
                nv.Visitor.CurrentSession = nv.Session;
                visitors.Add(nv.Visitor);

                NewVisiting(this, (NewVisitingEventArgs)e.Data);
            }
            // 访客离开
            else if (e.Data.GetType() == typeof(VisitorLeaveEventArgs) && VisitorLeave != null)
            {
                VisitorLeaveEventArgs vl = e.Data as VisitorLeaveEventArgs;
                Visitor v = GetVisitorById(vl.VisitorId);
                if (v != null)
                {
                    v.CurrentSession.Status = VisitSessionStatus.Leave;
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                }
                //VisitorLeave(this, (VisitorLeaveEventArgs)e.Data);
            }
        }

        void socketHandler_DataArrive(object sender, DataArriveEventArgs e)
        {
            try
            {
                Debug.WriteLine("OperatorServiceAgent Recv: " + e.Data.ToString());
                processServerEvents(e);
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void fireConnectStateChange(ConnectionState state, string message)
        {
            Trace.WriteLine("ConnectStateChange : " + state.ToString() + " " + message);
            State = state;
            if (ConnectionStateChanged != null)
            {
                ConnectionStateChangeEventArgs args = new ConnectionStateChangeEventArgs(State);
                args.Message = message;
                ConnectionStateChanged(this, args);
            }
        }

        //void ws_GetLeaveWordCompleted(object sender, GetLeaveWordCompletedEventArgs e)
        //{
        //    if (NewLeaveWords != null && e.Error == null)
        //    {
        //        NewLeaveWords(this, new LeaveWordEventArgs(new List<LeaveWord>(e.Result)));
        //    }
        //}

        private object checkNewChangesLocker = new object();

        //void checkNewChangesTimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        //{

        //    if (!Monitor.TryEnter(this.checkNewChangesLocker))
        //    {
        //        return;
        //    }
        //    try
        //    {
        //        if (State == ConnectionState.Connected && enablePooling)
        //        {
        //            getNextNewChanges();
        //        }
        //        else if (State == ConnectionState.Disconnected)
        //        {
        //            RestartLogin();
        //        }
        //    }
        //    finally
        //    {
        //        Monitor.Exit(this.checkNewChangesLocker);
        //    }

        //}

        public void Logout()
        {
            ws.GetSystemAdvertiseCompleted -= new LiveSupport.OperatorConsole.LiveChatWS.GetSystemAdvertiseCompletedEventHandler(ws_GetSystemAdvertiseCompleted);
            //ws.GetLeaveWordCompleted -= new GetLeaveWordCompletedEventHandler(ws_GetLeaveWordCompleted);
            socketHandler.DataArrive -= new EventHandler<DataArriveEventArgs>(socketHandler_DataArrive);
            socket.Disconnect(false);
            EnablePooling = false;
            timer.Enabled = false;
            //ws.LogoutAsync(Guid.NewGuid());
            ws.Logout();
        }

        //public NewChangesCheckResult CheckNewChanges(NewChangesCheck check)
        //{
        //      return ws.CheckNewChanges(check);
        //}

        public void SendMessage(Message msg)
        {
            ws.SendMessage(Common.Convert(msg) as LiveChatWS.Message);
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
            List<Message> lMessage = null;
            try
            {
                lMessage = new List<Message>();
                foreach (var item in ws.GetHistoryChatMessage(visitorId, begin, end))
                {
                    lMessage.Add(Common.Convert(item) as Message);
                }
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
                lPageRequest = new List<PageRequest>();

                foreach (var item in ws.GetHistoryPageRequests(visitorId, begin, end))
                {
                    lPageRequest.Add(Common.Convert(item) as PageRequest);
                }
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
                num = ws.AcceptChatRequest(chatId);
            }
            catch (WebException)
            {
                return -3;
            }
            return num;
        }

        public Chat InviteChat(string visitorId)
        {
            Chat chat = Common.Convert(ws.InviteChat(visitorId)) as Chat;
            chats.Add(chat);
            return chat;
        }

        public bool IsVisitorHasActiveChat(string visitorId)
        {
            lock (chats)
            {
                foreach (var item in chats)
                {
                    if (item.VisitorId == visitorId && (item.Status == ChatStatus.Accepted || item.Status == ChatStatus.Requested))
                    {
                        return true;
                    }
                }
                return false;
            }
        }


        public bool IsOperatorHasActiveChat(string operatorId)
        {
            lock (chats)
            {
                foreach (var item in chats)
                {
                    if (item.OperatorId == operatorId && (item.Status == ChatStatus.Accepted || item.Status == ChatStatus.Requested))
                    {
                        return true;
                    }
                }
                return false;
            }
        }

        private Chat GetChatByVisitorId(string visitorId)
        {
            foreach (var item in Chats)
            {
                if (item.VisitorId == visitorId)
                {
                    return item;
                }
            }
            return null;
        }

        void ws_GetSystemAdvertiseCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetSystemAdvertiseCompletedEventArgs e)
        {
            //if (NewSystemAdvertise != null && e.Error == null)
            //{
            //    NewSystemAdvertise(this, new SystemAdvertiseEventArgs(new List<SystemAdvertise>(e.Result)));
            //}
        }

        public List<QuickResponseCategory> GetQuickResponse()
        {
            List<QuickResponseCategory> lQuickResponseCategory = null;
            try
            {
                lQuickResponseCategory = new List<QuickResponseCategory>();
                foreach (var item in ws.GetQuickResponse())
                {
                    lQuickResponseCategory.Add(Common.Convert(item) as QuickResponseCategory);
                }
            }
            catch (WebException)
            {
                return null;
            }
            return lQuickResponseCategory;
        }

        //private NewChangesCheckResult getNextNewChanges()
        //{
        //    NewChangesCheckResult result = getNewChanges();

        //    if (result == null) return null;

        //    if (result.NewVisitors != null)
        //    {
        //        foreach (var item in result.NewVisitors)
        //        {
        //            lastCheck.NewVisitorLastCheckTime = Math.Max(lastCheck.NewVisitorLastCheckTime, item.CurrentSession.VisitingTime.Ticks);
        //            if (IsVisitorExist(item.VisitorId))
        //            {
        //                Visitor v = GetVisitorById(item.VisitorId);
        //                v.CurrentSession = item.CurrentSession;
        //                if (VisitorSessionChange!=null)
        //                {
        //                    //Trace.WriteLine("VisitorSessionChange: " + result.VisitSessionChange.Length);
        //                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
        //                }

        //            }
        //            else
        //            {
        //                visitors.Add(item);
        //                if (NewVisitor != null)
        //                {
        //                    //Trace.WriteLine("NewVisitors: " + result.NewVisitors.Length);
        //                    NewVisitor(this, new NewVisitorEventArgs(item));
        //                }
        //            }
        //        }

        //    }
        //    if (result.VisitSessionChange != null)
        //    {
        //        foreach (var item in result.VisitSessionChange)
        //        {
        //            if (checkIfVisitSessionStatusChange(item))
        //            {
        //                GetVisitorBySessionId(item.SessionId).CurrentSession = item;
        //                if (VisitorSessionChange!=null)
        //                {   
        //                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(item));
        //                }

        //            }
        //        }
        //    }

        //    if (result.Operators != null)
        //    {
        //        processOpertors(result);
        //    }
        //    if (result.Messages != null)
        //    {
        //            lastCheck.ChatSessionChecks = processMessages(result).ToArray();
        //    }

        //    processChats(result);

        //    return result;
        //}

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
        //private void processChats(NewChangesCheckResult result)
        //{
        //    if (result.Chats == null)
        //    {
        //        return;
        //    }
        //    // 1. 查找新的对话请求，并显示NotifyForm
        //    foreach (var item in result.Chats)
        //    {
        //        if (item.Status == ChatStatus.Requested && !item.IsInviteByOperator && GetChatByChatId(item.ChatId) == null)
        //        {
        //            Visitor visitor = GetVisitorById(item.VisitorId);
        //            if (NewChatRequest != null)
        //            {
        //                NewChatRequest(this, new NewChatRequestEventArgs(visitor.Name, item));
        //            }
        //        }
        //    }

        //    // 2. 保存LastCheckTime
        //    foreach (var item in result.Chats)
        //    {
        //        Chat c = GetChatByChatId(item.ChatId);
        //        if (c != null)
        //        {
        //            item.LastCheckTime = c.LastCheckTime;
        //        }
        //    }

        //    lock (this.chats)
        //    {
        //        this.chats.Clear();
        //        this.chats.AddRange(result.Chats);
        //    }
        //}

        //private void processOpertors(NewChangesCheckResult result)
        //{
        //    if (result.Operators != null)
        //    {
        //        if (result.Operators.Length > Operators.Count || checkIfOperatorStatusChanges(result.Operators))
        //        {
        //            Operators.Clear();
        //            Operators.AddRange(result.Operators);
        //            if (NewChanges != null)
        //            {
        //                NewChanges(this, new NewChangesCheckResultEventArgs(result));
        //            }
        //        }
        //    }
        //}

        //private List<MessageCheck> processMessages(NewChangesCheckResult result)
        //{
        //    if (result.Messages == null)
        //    {
        //        return null;
        //    }
        //    List<MessageCheck> nextChecks = new List<MessageCheck>();

        //    foreach (var chat in chats)
        //    {
        //        LiveSupport.OperatorConsole.LiveChatWS.Message[] ms = null;
        //        foreach (var item in result.Messages)
        //        {
        //            if (chat.ChatId == item.ChatId)
        //            {
        //                ms = item.Messages;
        //                break;
        //            }
        //        }

        //        MessageCheck c = new MessageCheck();
        //        c.ChatId = chat.ChatId;
        //        c.LastCheckTime = chat.LastCheckTime;
        //        if (ms != null)
        //        {
        //            foreach (var m in ms)
        //            {
        //                if (m != null && m.SentDate.Ticks >= c.LastCheckTime)
        //                {
        //                    if (NewMessage != null)
        //                    {
        //                        NewMessage(this, new NewMessageEventArgs(m));
        //                        c.LastCheckTime = Math.Max(m.SentDate.Ticks, c.LastCheckTime);
        //                    }

        //                }
        //                else
        //                    continue;

        //            }
        //            chat.LastCheckTime = c.LastCheckTime;
        //        }

        //        nextChecks.Add(c);

        //    }
        //    return nextChecks;
        //}

        //int faultCount = 0;
        //const int MAX_FAULT_COUNT = 10;

        //private NewChangesCheckResult getNewChanges()
        //{
        //    NewChangesCheckResult result = null;
        //    try
        //    {
        //        result = ws.CheckNewChanges(lastCheck); //CheckNewChanges(lastCheck);
        //        faultCount = 0;
        //        if (result != null && result.ReturnCode == ReturnCodeEnum.ReturnCode_SessionInvalid)
        //        {
        //            resetConnection("该帐号已在其他地方登陆！", ExceptionStatus.User);
        //        }
        //    }
        //    catch (WebException ex)
        //    {
        //        faultCount++;

        //        if (faultCount >= MAX_FAULT_COUNT)
        //        {
        //            faultCount = 0;
        //            resetConnection("连接中断", ExceptionStatus.System);
        //        }
        //    }
        //    catch (InvalidOperationException ioe)
        //    {
        //        faultCount++;

        //        if (faultCount >= MAX_FAULT_COUNT)
        //        {
        //            faultCount = 0;
        //            resetConnection("连接中断", ExceptionStatus.System);
        //        }
        //    }
        //    catch (SoapException ave)
        //    {
        //        faultCount++;
        //        if (faultCount >= MAX_FAULT_COUNT)
        //        {
        //            faultCount = 0;
        //            if (ave.Message.Contains("AccessViolationException"))
        //            {
        //                resetConnection("服务访问拒绝", ExceptionStatus.System);
        //            }
        //            else
        //            {
        //                resetConnection("Soap异常", ExceptionStatus.System);
        //            }
        //        }
        //        else
        //        {
        //            Login(accountNumber, operatorName, password);
        //        }
        //    }
        //    return result;
        //}

        //private void resetConnection(string message,ExceptionStatus status)
        //{
        //    state = ConnectionState.Disconnected;

        //    if (status == ExceptionStatus.User)
        //    {
        //        enablePooling = false;
        //    }
        //    if (ConnectionStateChanged != null)
        //    {
        //        ConnectionStateChangeEventArgs args = new ConnectionStateChangeEventArgs(state);
        //        args.Status = status;
        //        args.Message = message;
        //        ConnectionStateChanged(this, args);
        //    }
        //}

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
            if (s == null)
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
            return v == null ? null : v.CurrentSession;
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

        public List<LeaveWord> GetLeaveWord()
        {
            List<LeaveWord> leaveWords = new List<LeaveWord>();
            try
            {
                foreach (var item in ws.GetLeaveWord())
                {
                    leaveWords.Add(Common.Convert(item) as LeaveWord);
                }
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
                result = ws.UpdateLeaveWordById(sendDate, name, isReplied, id);
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

            foreach (var item in ws.GetLeaveWordNotReplied())
            {
                leaveWords.Add(Common.Convert(item) as LeaveWord);
            }
            return leaveWords;
        }

        public List<LeaveWord> GetLeaveWordByDomainName(string domainName)
        {
            List<LeaveWord> leaveWords = new List<LeaveWord>();
            foreach (var item in ws.GetLeaveWordByDomainName(domainName))
            {
                leaveWords.Add(Common.Convert(item) as LeaveWord);
            }
            return leaveWords;

        }
        public List<string> GetAccountDomains()
        {
            return new List<string>(ws.GetAccountDomains());
        }

        public List<QuickResponseCategory> GetQuickResponseByDomainName(string domainName)
        {
            List<QuickResponseCategory> lQuickResponseCategory = null;
            try
            {
                lQuickResponseCategory = new List<QuickResponseCategory>();
                foreach (var item in ws.GetQuickResponseByDomainName(domainName))
                {
                    lQuickResponseCategory.Add(Common.Convert(item) as QuickResponseCategory);
                }
            }
            catch (WebException)
            {
                return null;
            }
            return lQuickResponseCategory;
        }

        public void SaveQuickResponseByDomainName(List<QuickResponseCategory> response, string domainName)
        {
            List<LiveChatWS.QuickResponseCategory> llQuickResponseCategory = new List<LiveSupport.OperatorConsole.LiveChatWS.QuickResponseCategory>();
            foreach (var item in response)
            {
                llQuickResponseCategory.Add(Common.Convert(item) as LiveChatWS.QuickResponseCategory);
            }
            ws.SaveQuickResponseByDomainName(llQuickResponseCategory.ToArray(), domainName);

        }

        #endregion

        #region IOperatorServiceAgent 成员

        //public event EventHandler<ConnectionLostEventArgs> ConnectionLost;

        //public event EventHandler<NewVisitorEventArgs> NewVisitor;

        //public event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;

        //public event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;

        //public event EventHandler<ChatStatusChangeEventArgs> ChatStatusChange;

        //public event EventHandler<NewMessageEventArgs> NewMessage;

        //public event EventHandler<NewChatRequestEventArgs> NewChatRequest;

        //public event EventHandler<NewChangesCheckResultEventArgs> NewChanges;

        //public event EventHandler<SystemAdvertiseEventArgs> NewSystemAdvertise;

        //public event EventHandler<LeaveWordEventArgs> NewLeaveWords;

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

        #region IOperatorServerEvents 成员

        public event EventHandler<OperatorServiceInterface.OperatorStatusChangeEventArgs> OperatorStatusChanged;

        public event EventHandler<VisitorChatRequestEventArgs> VisitorChatRequest;

        public event EventHandler<OperatorChatRequestEventArgs> OperatorChatRequest;

        public event EventHandler<VisitorChatRequestAcceptedEventArgs> VisitorChatRequestAccepted;

        public event EventHandler<OperatorChatRequestAcceptedEventArgs> OperatorChatRequestAccepted;

        public event EventHandler<OperatorChatRequestDeclinedEventArgs> OperatorChatRequestDeclined;

        public event EventHandler<NewChatEventArgs> NewChat;

        public event EventHandler<ChatStatusChangedEventArgs> ChatStatusChanged;

        public event EventHandler<OperatorChatJoinInviteEventArgs> ChatJoinInvite;

        public event EventHandler<OperatorChatJoinInviteAcceptedEventArgs> ChatJoinInviteAccepted;

        public event EventHandler<OperatorChatJoinInviteDeclinedEventArgs> ChatJoinInviteDeclined;

        public event EventHandler<ChatMessageEventArgs> NewMessage;

        public event EventHandler<NewVisitingEventArgs> NewVisiting;

        public event EventHandler<VisitorLeaveEventArgs> VisitorLeave;

        public event EventHandler<DataLoadCompletedEventArgs> DataLoadCompleted;


        #endregion

        #region IOperatorServiceAgent 成员


        public event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;

        #endregion
    }
}
