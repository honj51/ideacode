using System;
using System.Collections.Generic;
using System.Text;
using OperatorServiceInterface;
using LiveSupport.LiveSupportModel;
using System.Runtime.Remoting.Messaging;
using System.Security;
using System.Security.Permissions;
using System.Configuration;
using System.Threading;
using System.Net.Sockets;
using System.Diagnostics;

namespace LiveSupport.BLL.Remoting
{
    public class OperatorServer : IOperatorServer
    {
        // TODO : Socket 调用异常处理
        // TODO : Operator 离线，断线后需处理 operatorSocketMap
        private Dictionary<string, Socket> operatorSocketMap = new Dictionary<string, Socket>(); //客户端和服服务器连接例表
        private SocketHandler sh;
        private Thread socketHandlingThread;

        private AuthenticateData AuthenticateData
        {
            [PermissionSet(SecurityAction.LinkDemand)]
            get
            {
                return CallContext.GetData("AuthenticateData") as AuthenticateData;
            }
        }

        public OperatorServer()
        {
            OperatorService.OperatorStatusChange += new EventHandler<OperatorStatusChangeEventArgs>(OperatorService_OperatorStatusChange);//客服状态改变
            ChatService.NewChat += new EventHandler<NewChatEventArgs>(ChatService_NewChat);//新的对话
            ChatService.NewMessage += new EventHandler<ChatMessageEventArgs>(ChatService_NewMessage);//有一条新消息
            ChatService.OperatorChatRequest += new EventHandler<OperatorChatRequestEventArgs>(ChatService_OperatorChatRequest);//客服主动邀请
            ChatService.OperatorChatRequestAccepted += new EventHandler<OperatorChatRequestAcceptedEventArgs>(ChatService_OperatorChatRequestAccepted);//客服请求对话被接受
            ChatService.OperatorChatRequestDeclined += new EventHandler<OperatorChatRequestDeclinedEventArgs>(ChatService_OperatorChatRequestDeclined);//客服请求对话被拒绝
            ChatService.ChatStatusChanged += new EventHandler<ChatStatusChangedEventArgs>(ChatService_ChatStatusChanged);//对话状态改变
            ChatService.VisitorChatRequest += new EventHandler<VisitorChatRequestEventArgs>(ChatService_VisitorChatRequest);//访客请求对话
            ChatService.VisitorChatRequestAccepted += new EventHandler<VisitorChatRequestAcceptedEventArgs>(ChatService_VisitorChatRequestAccepted);//访客请求对话被接受
            VisitSessionService.NewVisiting += new EventHandler<NewVisitingEventArgs>(VisitSessionService_NewVisiting);
            VisitSessionService.VisitorLeave += new EventHandler<VisitorLeaveEventArgs>(VisitSessionService_VisitorLeave);
        }

        void VisitSessionService_VisitorLeave(object sender, VisitorLeaveEventArgs e)
        {
            Visitor visitor = VisitorService.GetVisitorById(e.VisitorId);
            List<Socket> ss = new List<Socket>();
            foreach (var item in GetOnlineOperatorSockets(visitor.AccountId))
            {
                sh.SendPacket(item, e);
            }
        }

        void VisitSessionService_NewVisiting(object sender, NewVisitingEventArgs e)
        {
            Visitor visitor = VisitorService.GetVisitorById(e.Visitor.VisitorId);
            List<Socket> ss = new List<Socket>();
            foreach (var item in GetOnlineOperatorSockets(visitor.AccountId))
            {
                if (item.Connected)
                {
                    sh.SendPacket(item, e);
                }
            }
        }

        #region 事件处理
        /// <summary>
        /// 访客接受某客服的对话 to-all
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_VisitorChatRequestAccepted(object sender, VisitorChatRequestAcceptedEventArgs e)//tao-no
        {
            Visitor visitor = VisitorService.GetVisitorById(e.VisitorChatRequest.VisitorId);
            List<Socket> ss = new List<Socket>();
            foreach (var item in  GetOnlineOperatorSockets(visitor.AccountId))
            {
                sh.SendPacket(item,e);
            }
        }
        /// <summary>
        /// 访客请请求 to-all
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_VisitorChatRequest(object sender, VisitorChatRequestEventArgs e)
        {
            Visitor v = VisitorService.GetVisitorById(e.VisitorId);
            if (v != null)
            {
                List<Socket> sockets = GetOnlineOperatorSockets(v.AccountId);
                foreach (var item in sockets)
                {
                    sh.SendPacket(item, new VisitorChatRequestEventArgs(e.VisitorId,e.Chat));
                }
            }
        }
        /// <summary>
        /// 跟据公司ID获取当前在线的客服例表
        /// </summary>
        /// <param name="accountId"></param>
        /// <returns></returns>
        private List<Socket> GetOnlineOperatorSockets(string accountId)
        {
            List<Socket> ss = new List<Socket>();
            foreach (var item in OperatorService.GetAllOperatorsByAccountId(accountId))
            {
                if (operatorSocketMap.ContainsKey(item.OperatorId))
                {
                    ss.Add(operatorSocketMap[item.OperatorId]);
                }
            }
            return ss;
        }
        /// <summary>
        /// chat的状态改变发  to -all -operator
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_ChatStatusChanged(object sender, ChatStatusChangedEventArgs e)
        {
             Chat chat=ChatService.GetChatById(e.ChatId);
             foreach (var item in GetOnlineOperatorSockets(chat.AccountId))
             {
                 sh.SendPacket(item, e);
             }
        }
        /// <summary>
        /// 客服主动邀请被拒决 to-all
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_OperatorChatRequestDeclined(object sender, OperatorChatRequestDeclinedEventArgs e)//tao-ok
        {
            Operator op = OperatorService.GetOperatorById(e.ChatRequest.OperatorId);
            foreach (var item in GetOnlineOperatorSockets(op.AccountId))
            {
                sh.SendPacket(item, e);
            }
        }
        /// <summary>
        /// 客服主动请邀请被接受 to-all
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_OperatorChatRequestAccepted(object sender, OperatorChatRequestAcceptedEventArgs e)//wang-ok
        {
            Operator op = OperatorService.GetOperatorById(e.ChatRequest.OperatorId);
            foreach (var item in GetOnlineOperatorSockets(op.AccountId))
            {
                sh.SendPacket(item, e);
            }
        }
        /// <summary>
        /// 客脑主动邀请 to-all
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_OperatorChatRequest(object sender, OperatorChatRequestEventArgs e)//wang-ok
        {
            Operator op = OperatorService.GetOperatorById(e.OperatorId);
            foreach (var item in GetOnlineOperatorSockets(op.AccountId))
            {
                sh.SendPacket(item, e);
            }
        }
        /// <summary>
        /// 有一条新消息 to-1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_NewMessage(object sender, ChatMessageEventArgs e)//tao-ok
        {   
            Chat chat=ChatService.GetChatById(e.Message.ChatId);
            if (chat != null && Message.ToOperator(e.Message))
            {
                if (operatorSocketMap.ContainsKey(chat.OperatorId))
                {
                    sh.SendPacket(operatorSocketMap[chat.OperatorId], e);
                }
            }
        }
        /// <summary>
        /// 有一个新对话 to-all
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void ChatService_NewChat(object sender, NewChatEventArgs e)
        {
            foreach (var item in GetOnlineOperatorSockets(e.Chat.AccountId))
            {
                sh.SendPacket(item, e);
            }
        }

        void OperatorService_OperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)//wang 
        {
            Operator op = OperatorService.GetOperatorById(e.OperatorId);
            if (op != null)
            {
                foreach (var item in GetOnlineOperatorSockets(op.AccountId))
                {
                    sh.SendPacket(item, e);
                }
            }
        }
        #endregion 

        #region IOperatorServer 成员

        private void safeFireEvent(Delegate del, EventArgs args)//wang-
        {
            if (del != null)
            {
                Delegate d = null;
                foreach (Delegate item in del.GetInvocationList())
                {
                    try
                    {
                        d = item;
                        d.DynamicInvoke(new object[] { this,args });
                    }
                    catch
                    {
                        Delegate.Remove(del, d);
                        // TODO: 客服端回调失败，其他处理
                    }
                }
            }
        }

        #endregion

        #region 事件

        public event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;

        public event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChanged;

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

        #endregion

        #region 接口实现

        public Operator Login(string accountNumber, string operatorName, string password)
        {
            return OperatorService.Login(accountNumber, operatorName, password);
        }

        public void Logout()
        {
            OperatorService.Logout(AuthenticateData.OperatorId, AuthenticateData.OperatorSession);
        }

        public List<Visitor> GetAllVisitors(string accountId)
        {
            checkAuthentication();
            return VisitorService.GetAllOnlineVisitors(accountId);
        }

        public void UploadFile(byte[] bs, string fileName, string chatId)
        {
            checkAuthentication();
        }

        public bool SendMessage(Message msg)
        {
            checkAuthentication();
            if (msg.Type == MessageType.ChatMessage_OperatorToVisitor)
            {
                ChatService.SendMessage(msg);
                return true;
            }
            else
                return false;
        }

        public int ChangePassword(string oldPassword, string newPassword)
        {
            checkAuthentication();
            return OperatorService.ChangPassword(AuthenticateData.OperatorId, oldPassword, newPassword);
        }

        public int ResetOperatorPassword(string loginName)
        {
            checkAuthentication();
            return OperatorService.ResetOperatorPassword(AuthenticateData.OperatorId, loginName);
        }

        public bool CloseChat(string chatId)
        {
            checkAuthentication();
            return ChatService.CloseChat(chatId, OperatorService.GetOperatorById(AuthenticateData.OperatorId).NickName);
        }

        public List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
        {
            checkAuthentication();
            List<Message> list = new List<Message>();
            List<Chat> chats = ChatService.GetHistoryChatByVisitorId(visitorId);

            foreach (Chat item in chats)
            {
                if (item.CreateTime > begin && item.CreateTime < end)
                {
                    list.AddRange(MessageService.GetMessagesByChatId(item.ChatId));
                }
            }

            return list;
        }

        public List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
        {
            checkAuthentication();
            List<VisitSession> li = VisitSessionService.GetHistoryVisitSessionByVisitorId(visitorId);
            List<PageRequest> list = new List<PageRequest>();
            foreach (VisitSession m in li)
            {
                list.AddRange(PageRequestService.GetHistoryPageRequests(m.SessionId, begin, end));
            }
            return list;
        }

        public int AcceptChatRequest(string chatId)
        {
            checkAuthentication();
            return ChatService.AcceptChatRequest(AuthenticateData.OperatorId, chatId);
        }

        public Chat InviteChat(string visitorId)
        {
            checkAuthentication();
            return ChatService.OperatorRequestChat(AuthenticateData.OperatorId, visitorId);
        }

        public List<SystemAdvertise> GetSystemAdvertise(string versionNumber)
        {
            string homeRootUrl = ConfigurationManager.AppSettings["HomeRootUrl"].ToString();
            string LatestVersionNumber = ConfigurationManager.AppSettings["LatestOperatorConsoleVersionNumber"].ToString();
            string LatestUrl = ConfigurationManager.AppSettings["LatestOperatorConsoleUrl"].ToString();
            List<SystemAdvertise> li = new List<SystemAdvertise>();
            if (versionNumber != LatestVersionNumber)
            {
                SystemAdvertise sysinfo = new SystemAdvertise();
                //sysinfo.AdvertiseUrl = homeRootUrl+LatestUrl;
                sysinfo.AdvertiseUrl = LatestUrl;
                sysinfo.AdvertiseMessage = "该程序有新版本可用，请点击了解详情";
                li.Add(sysinfo);
            }
            SystemAdvertise a = new SystemAdvertise();
            a.AdvertiseMessage = "欢迎您使用LiveSupport客服交流系统";
            a.AdvertiseUrl = "http://www.zxkefu.cn/";
            li.Add(a);
            return li;
        }

        public void SaveQuickResponse(List<QuickResponseCategory> response)
        {
            checkAuthentication();
            OperatorService.SaveQuickResponse(AuthenticateData.OperatorId, response);
        }

        public List<LiveSupport.LiveSupportModel.QuickResponseCategory> GetQuickResponse()
        {
            checkAuthentication();
            return OperatorService.GetQuickResponse(AuthenticateData.OperatorId);
        }

        #endregion

        private void checkAuthentication()
        {

            if (AuthenticateData == null)
            {
                throw new AccessViolationException("CheckAuthentication Failed, Authentication is null");
            }
            else if (OperatorService.GetOperatorById(AuthenticateData.OperatorId) == null)
            {
                throw new AccessViolationException("CheckAuthentication Failed, Operator:" + AuthenticateData.OperatorId + " not exist");
            }
            else if (!OperatorService.IsOperatorOnline(AuthenticateData.OperatorId))
            {
                throw new AccessViolationException("CheckAuthentication Failed, Operator:" + AuthenticateData.OperatorId + " not online");
            }
        }

        public bool IsTyping(string chatId, bool isOperator)
        {
            throw new NotImplementedException();
        }


        #region IOperatorServer 成员


        public void Start()
        {
            socketHandlingThread = new Thread(new ThreadStart(delegate()
            {
                sh = new SocketHandler();
                sh.Exception += new EventHandler<ExceptionEventArgs>(sh_Exception);
                sh.DataArrive += new EventHandler<DataArriveEventArgs>(sh_DataArrive);
                sh.Listen();

            }));
            socketHandlingThread.Start();
        }

        void sh_Exception(object sender, ExceptionEventArgs e)
        {
            if (e.Exception is SocketException)
            {
                string so = e.Exception.Data["OperatorId"] as string;
                if (!string.IsNullOrEmpty(so))
                {
                    Operator op = OperatorService.GetOperatorById(so);
                    if (op != null)
                    {
                        Trace.WriteLine(string.Format("Warning: Operator {0} [{1}] forece logoff cause socket exception {2}",op.NickName,op.OperatorId,e.Exception.Message));
                        OperatorService.Logout(op.OperatorId, op.OperatorSession);
                    }
                }
            }
        }

        void sh_DataArrive(object sender, DataArriveEventArgs e)
        {
            if (e.Data.GetType() == typeof(LoginAction))
            {
                LoginAction action = e.Data as LoginAction;
                e.StateObject.OperatorId = action.OperatorId;
                if (operatorSocketMap.ContainsKey(action.OperatorId))
                {
                    try
                    {
                        if (operatorSocketMap[action.OperatorId].Connected)
                        {
                            sh.SendPacket(operatorSocketMap[action.OperatorId], new OperatorForceLogoffEventArgs());
                            operatorSocketMap[action.OperatorId].Close();
                        }

                    }
                    catch (Exception ex)
                    {
                        Trace.TraceError("ForceLogoff Operator " + action.OperatorId + "failed : " + ex.Message);
                    } 
                    operatorSocketMap[action.OperatorId] = e.StateObject.workSocket;
                }
                else
                    operatorSocketMap.Add(action.OperatorId, e.StateObject.workSocket);
            }
            else if (e.Data.GetType() == typeof(LogoutAction))
            {
                LogoutAction action = e.Data as LogoutAction;
                if (operatorSocketMap.ContainsKey(action.OperatorId))
                {
                    operatorSocketMap[action.OperatorId] = null;
                }
            }
            else if (e.Data.GetType() == typeof(HeartBeatAction))
            {
                HeartBeatAction a = e.Data as HeartBeatAction;
                Operator op = OperatorService.GetOperatorById(a.OperatorId);
                if (op != null)
                {
                    op.HeartBeatTime = DateTime.Now;
                }
            }
        }

        public void Stop()
        {
            socketHandlingThread.Abort();
        }

        #endregion

        #region IOperatorServerEvents 成员


        public event EventHandler<OperatorForceLogoffEventArgs> OperatorForceLogoff;

        #endregion
    }
}
