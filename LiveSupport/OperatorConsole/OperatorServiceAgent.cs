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
        private List<Operator> operators = new List<Operator>();
        private List<string> domainNames = new List<string>();

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
        private Dictionary<string, List<LeaveWord>> leaveWords = new Dictionary<string,List<LeaveWord>>();
        private Dictionary<string, List<QuickResponseCategory>> quickResponseCategorys = new Dictionary<string, List<QuickResponseCategory>>();

        public Dictionary<string, List<QuickResponseCategory>> QuickResponseCategorys
        {
            get { return quickResponseCategorys; }
            set { quickResponseCategorys = value; }
        }
        #region 公开属性

        public Dictionary<string, List<LeaveWord>> LeaveWords
        {
            get { return leaveWords; }
            set { leaveWords = value; }
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

        public List<string> DomainNames
        {
            get { return domainNames; }
            set { domainNames = value; }
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
            ws.SendMessageCompleted += new LiveSupport.OperatorConsole.LiveChatWS.SendMessageCompletedEventHandler(ws_SendMessageCompleted);
            ws.InviteChatCompleted += new LiveSupport.OperatorConsole.LiveChatWS.InviteChatCompletedEventHandler(ws_InviteChatCompleted);
            ws.AcceptChatRequestCompleted += new LiveSupport.OperatorConsole.LiveChatWS.AcceptChatRequestCompletedEventHandler(ws_AcceptChatRequestCompleted);
            ws.CloseChatCompleted += new LiveSupport.OperatorConsole.LiveChatWS.CloseChatCompletedEventHandler(ws_CloseChatCompleted);
            ws.GetQuickResponseByDomainNameCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetQuickResponseByDomainNameCompletedEventHandler(ws_GetQuickResponseByDomainNameCompleted);
            ws.GetQuickResponseCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetQuickResponseCompletedEventHandler(ws_GetQuickResponseCompleted);
            ws.SaveQuickResponseByDomainNameCompleted += new LiveSupport.OperatorConsole.LiveChatWS.SaveQuickResponseByDomainNameCompletedEventHandler(ws_SaveQuickResponseByDomainNameCompleted);
            ws.GetHistoryChatMessageCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetHistoryChatMessageCompletedEventHandler(ws_GetHistoryChatMessageCompleted);
            ws.GetHistoryPageRequestsCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetHistoryPageRequestsCompletedEventHandler(ws_GetHistoryPageRequestsCompleted);
            ws.GetAccountDomainsCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetAccountDomainsCompletedEventHandler(ws_GetAccountDomainsCompleted);
            ws.GetLeaveWordCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetLeaveWordCompletedEventHandler(ws_GetLeaveWordCompleted);
            ws.GetLeaveWordNotRepliedCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetLeaveWordNotRepliedCompletedEventHandler(ws_GetLeaveWordNotRepliedCompleted);
            ws.GetLeaveWordByDomainNameCompleted += new LiveSupport.OperatorConsole.LiveChatWS.GetLeaveWordByDomainNameCompletedEventHandler(ws_GetLeaveWordByDomainNameCompleted);
            ws.UpdateLeaveWordByIdCompleted += new LiveSupport.OperatorConsole.LiveChatWS.UpdateLeaveWordByIdCompletedEventHandler(ws_UpdateLeaveWordByIdCompleted);
            ws.DelLeaveWordByIdCompleted += new LiveSupport.OperatorConsole.LiveChatWS.DelLeaveWordByIdCompletedEventHandler(ws_DelLeaveWordByIdCompleted);
        }

        #region WebService 异步操作完成 事件处理
        void ws_GetLeaveWordNotRepliedCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetLeaveWordNotRepliedCompletedEventArgs e)
        {
            List<LeaveWord> leaveWords = new List<LeaveWord>();

            foreach (var item in e.Result)
            {
                leaveWords.Add(Common.Convert(item) as LeaveWord);
            }
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_DelLeaveWordByIdCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.DelLeaveWordByIdCompletedEventArgs e)
        {
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_UpdateLeaveWordByIdCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.UpdateLeaveWordByIdCompletedEventArgs e)
        {
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_GetLeaveWordCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetLeaveWordCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                leaveWords.Clear();
                foreach (var item in e.Result)
                {
                    LeaveWord lw = Common.Convert(item) as LeaveWord;
                    if (string.IsNullOrEmpty(lw.DomainName))
                    {
                        List<LeaveWord> lws = new List<LeaveWord>();
                        lws.Add(lw);
                        leaveWords[""] = lws;
                    }
                    else if (leaveWords.ContainsKey(lw.DomainName))
                    {
                        leaveWords[lw.DomainName].Add(lw);
                    }
                    else
                    {
                        List<LeaveWord> lws = new List<LeaveWord>();
                        lws.Add(lw);
                        leaveWords[lw.DomainName] = lws;
                    }
                }

                if (DataLoadCompleted != null)
                {
                    DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.LeaveWord));
                }
            }
            else
            {
                Trace.TraceError("Load LeaveWord Failed: " + e.Error.Message);
            }
        }

        void ws_GetLeaveWordByDomainNameCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetLeaveWordByDomainNameCompletedEventArgs e)
        {
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_GetAccountDomainsCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetAccountDomainsCompletedEventArgs e)
        {
            if (e.Error==null)
            {
                domainNames = new List<string>(e.Result);

                if (DataLoadCompleted != null)
                {
                    DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.AccountDomains));
                }
            }
           
        }

        void ws_GetHistoryPageRequestsCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetHistoryPageRequestsCompletedEventArgs e)
        {
            List<PageRequest> lPageRequest = new List<PageRequest>();

            foreach (var item in e.Result)
            {
                lPageRequest.Add(Common.Convert(item) as PageRequest);
            }

            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_GetHistoryChatMessageCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetHistoryChatMessageCompletedEventArgs e)
        {
            List<Message> lMessage =new List<Message>();

                foreach (var item in e.Result)
                {
                    lMessage.Add(Common.Convert(item) as Message);
                }
                if (AsyncCallCompleted != null)
                {
                    AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
                }
        }

        void ws_SaveQuickResponseByDomainNameCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_GetQuickResponseCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetQuickResponseCompletedEventArgs e)
        {
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_GetQuickResponseByDomainNameCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.GetQuickResponseByDomainNameCompletedEventArgs e)
        {

            if (e.Error == null)
            {
                List<QuickResponseCategory> qcs = new List<QuickResponseCategory>();
                foreach (var item in e.Result)
                {
                    qcs.Add(Common.Convert(item) as QuickResponseCategory);
                }
                quickResponseCategorys[e.UserState.ToString()] = qcs;
            }

            if (DataLoadCompleted != null)
            {
                DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.QuickResponseByDomainName));
            }
        }

        void ws_CloseChatCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.CloseChatCompletedEventArgs e)
        {
           // AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
        }

        void ws_AcceptChatRequestCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.AcceptChatRequestCompletedEventArgs e)
        {
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_InviteChatCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.InviteChatCompletedEventArgs e)
        {
            if (AsyncCallCompleted != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
            }
        }

        void ws_SendMessageCompleted(object sender, LiveSupport.OperatorConsole.LiveChatWS.SendMessageCompletedEventArgs e)
        {
            if (AsyncCallCompleted  != null)
            {
                AsyncCallCompleted(this, new AsyncCallCompletedEventArg(e));
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
                    ws.GetAccountDomainsAsync(Guid.NewGuid());
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
        #endregion

        void timer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            lock (this.timer)
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

                ws.LoginAsync(accountNumber, operatorName, password, Guid.NewGuid());
            }
            catch (Exception e)
            {
                Trace.WriteLine(e.Message);
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
                    addChat(vc.Chat);
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
                    addChat(ocr.Chat);
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
                    visitor.CurrentSession.OperatorId = op.OperatorId;
                    VisitSession vs = visitor.CurrentSession;
                    vs.ChatingTime = v.VisitorChatRequest.Chat.AcceptTime;
                    vs.Status = VisitSessionStatus.Chatting;

                    //VisitorChatRequestAccepted(this, (VisitorChatRequestAcceptedEventArgs)e.Data);
                    OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(v.VisitorChatRequest.Chat.OperatorId, OperatorStatus.Chatting));
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(vs));
                }
            }
            // 客服对话邀请被接受
            else if (e.Data.GetType() == typeof(OperatorChatRequestAcceptedEventArgs))
            {
                OperatorChatRequestAcceptedEventArgs ocr = (OperatorChatRequestAcceptedEventArgs)e.Data;
                Operator op = GetOperatorById(ocr.ChatRequest.OperatorId);
                Visitor v = GetVisitorById(ocr.ChatRequest.VisitorId);
                if (op != null && v != null)
                {
                    op.Status = OperatorStatus.Chatting;
                    v.CurrentSession.Status = VisitSessionStatus.Chatting;
                    if (OperatorChatRequestAccepted != null)
                    {
                        OperatorChatRequestAccepted(this, (OperatorChatRequestAcceptedEventArgs)e.Data);
                    }
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                    OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(op.OperatorId, op.Status));
                }
            }
            // 客服对话邀请被拒绝
            else if (e.Data.GetType() == typeof(OperatorChatRequestDeclinedEventArgs))
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
                    if (OperatorChatRequestDeclined != null)
                    {
                        OperatorChatRequestDeclined(this, (OperatorChatRequestDeclinedEventArgs)e.Data);
                    }
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

                if (ChatStatusChanged != null)
                {
                    ChatStatusChanged(this, cs); 
                }
            }
            else if (e.Data.GetType() == typeof(OperatorChatJoinInviteEventArgs))
            {
                ChatJoinInvite(this, (OperatorChatJoinInviteEventArgs)e.Data);
            }
            else if (e.Data.GetType() == typeof(OperatorChatJoinInviteAcceptedEventArgs))
            {
                ChatJoinInviteAccepted(this, (OperatorChatJoinInviteAcceptedEventArgs)e.Data);
            }
            else if (e.Data.GetType() == typeof(OperatorChatJoinInviteDeclinedEventArgs))
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
                Visitor v = GetVisitorById(nv.Visitor.VisitorId);
                if (v != null)
                {
                    v.CurrentSession = nv.Session;
                    VisitorSessionChange(this, new VisitorSessionChangeEventArgs(v.CurrentSession));
                }
                else
                {
                    addVisitor(nv.Visitor);
                    NewVisiting(this, (NewVisitingEventArgs)e.Data);
                }
            }
            // 访客离开
            else if (e.Data.GetType() == typeof(VisitorLeaveEventArgs))
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

        private void addChat(Chat chat)
        {
            Chat c = GetChatByChatId(chat.ChatId);
            if (c != null)
            {
                chats.Remove(c);
            }
            chats.Add(chat);
        }

        private void addVisitor(Visitor visitor) 
        {
            Visitor v = GetVisitorById(visitor.VisitorId);
            if (v!=null)
            {
                visitors.Remove(v);
            }
            visitors.Add(visitor);
        }

        void socketHandler_DataArrive(object sender, DataArriveEventArgs e)
        {
            try
            {
                Trace.Write("OperatorServiceAgent Recv: " + e.Data.ToString());
                processServerEvents(e);
                Trace.WriteLine("  [Process completed]");
            }
            catch (Exception ex)
            {
                Trace.WriteLine("Error: processServerEvents through exception: " + ex.Message);
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

        public void Logout()
        {
            ws.GetSystemAdvertiseCompleted -= new LiveSupport.OperatorConsole.LiveChatWS.GetSystemAdvertiseCompletedEventHandler(ws_GetSystemAdvertiseCompleted);
            ws.GetLeaveWordCompleted -= new LiveSupport.OperatorConsole.LiveChatWS.GetLeaveWordCompletedEventHandler(ws_GetLeaveWordCompleted);
            socketHandler.DataArrive -= new EventHandler<DataArriveEventArgs>(socketHandler_DataArrive);
            socket.Disconnect(false);
            timer.Enabled = false;
            //ws.LogoutAsync(Guid.NewGuid());
            ws.Logout();
        }

        public void SendMessage(Message msg)
        {
            ws.SendMessageAsync(Common.Convert(msg) as LiveChatWS.Message, Guid.NewGuid());
        }

        public int ChangePassword(string oldPassword, string newPassword)
        {
            return ws.ChangePassword(oldPassword, newPassword);
        }

        public int ResetOperatorPassword(string loginName)
        {
            return ws.ResetOperatorPassword(loginName);
        }

        public void CloseChat(string chatId)
        {
            ws.CloseChatAsync(chatId, Guid.NewGuid());
        }

        public void GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
        {
            ws.GetHistoryChatMessageAsync(visitorId, begin, end, Guid.NewGuid());
        }

        public void GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
        {
            ws.GetHistoryPageRequestsAsync(visitorId, begin, end, Guid.NewGuid());
        }

        public void AcceptChatRequest(string chatId)
        {
            ws.AcceptChatRequestAsync(chatId, Guid.NewGuid());
        }

        public void InviteChat(string visitorId)
        {
            ws.InviteChatAsync(visitorId, Guid.NewGuid());
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
            if (e.Error == null)
            {
                if (DataLoadCompleted != null)
                {
                    DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.SystemAdvertise));
                }
            }
            else
            {
                Trace.TraceWarning("Load SystemAdvertise Failed!");
            }
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

        public void RestartLogin()
        {
            try
            {
                Login(accountNumber, operatorName, password);
            }
            catch (Exception wex)
            {
                Trace.TraceError("RestartLogin Exception: " + wex.Message);
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

        public void GetLeaveWord()
        {
            ws.GetLeaveWordAsync(Guid.NewGuid());
        }

        public void UpdateLeaveWordById(string sendDate, string name, bool isReplied, string id)
        {
            ws.UpdateLeaveWordByIdAsync(sendDate, name, isReplied, id, Guid.NewGuid());
        }

        public void DelLeaveWordById(string id)
        {
            ws.DelLeaveWordByIdAsync(id, Guid.NewGuid());
        }

        public void GetLeaveWordByDomainName(string domainName)
        {
            ws.GetLeaveWordByDomainNameAsync(domainName, Guid.NewGuid());
        }

        public void GetAccountDomains()
        {
            ws.GetAccountDomainsAsync(Guid.NewGuid());
        }

        public void GetQuickResponseByDomainName(string domainName)
        {
            ws.GetQuickResponseByDomainNameAsync(domainName, domainName);
        }

        public void SaveQuickResponseByDomainName(List<QuickResponseCategory> response, string domainName)
        {
            quickResponseCategorys[domainName] = response;

            List<LiveChatWS.QuickResponseCategory> llQuickResponseCategory = new List<LiveSupport.OperatorConsole.LiveChatWS.QuickResponseCategory>();
            foreach (var item in response)
            {
                llQuickResponseCategory.Add(Common.Convert(item) as LiveChatWS.QuickResponseCategory);
            }
            ws.SaveQuickResponseByDomainNameAsync(llQuickResponseCategory.ToArray(), domainName, Guid.NewGuid());
        }

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

        public event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;

        public event EventHandler<AsyncCallCompletedEventArg> AsyncCallCompleted;

        #endregion
    }
}
