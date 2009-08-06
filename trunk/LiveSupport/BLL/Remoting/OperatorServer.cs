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

namespace LiveSupport.BLL.Remoting
{
    public class OperatorServer : IOperatorServer
    {
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
            Console.WriteLine("HelloServer activated");
            OperatorService.OperatorStatusChange += new EventHandler<OperatorStatusChangeEventArgs>(OperatorService_OperatorStatusChange);
            ChatService.NewChat += new EventHandler<NewChatEventArgs>(ChatService_NewChat);
            ChatService.NewMessage += new EventHandler<ChatMessageEventArgs>(ChatService_NewMessage);
            ChatService.OperatorChatRequest += new EventHandler<OperatorChatRequestEventArgs>(ChatService_OperatorChatRequest);
            ChatService.OperatorChatRequestAccepted += new EventHandler<OperatorChatRequestAcceptedEventArgs>(ChatService_OperatorChatRequestAccepted);
            ChatService.OperatorChatRequestDeclined += new EventHandler<OperatorChatRequestDeclinedEventArgs>(ChatService_OperatorChatRequestDeclined);
            ChatService.ChatStatusChanged += new EventHandler<ChatStatusChangedEventArgs>(ChatService_ChatStatusChanged);
            ChatService.VisitorChatRequest += new EventHandler<VisitorChatRequestEventArgs>(ChatService_VisitorChatRequest);
            ChatService.VisitorChatRequestAccepted += new EventHandler<VisitorChatRequestAcceptedEventArgs>(ChatService_VisitorChatRequestAccepted);
        }

        #region 事件处理
        void ChatService_VisitorChatRequestAccepted(object sender, VisitorChatRequestAcceptedEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_VisitorChatRequest(object sender, VisitorChatRequestEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_ChatStatusChanged(object sender, ChatStatusChangedEventArgs e)
        {
                throw new NotImplementedException();
        }

        void ChatService_OperatorChatRequestDeclined(object sender, OperatorChatRequestDeclinedEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_OperatorChatRequestAccepted(object sender, OperatorChatRequestAcceptedEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_OperatorChatRequest(object sender, OperatorChatRequestEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_NewMessage(object sender, ChatMessageEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_NewChat(object sender, NewChatEventArgs e)
        {
            throw new NotImplementedException();
        }

        void OperatorService_OperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)
        {
            safeFireEvent(OperatorStatusChange, e);
        }
        #endregion 

        #region IOperatorServer 成员

        private void safeFireEvent(Delegate del, EventArgs args)
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
                sh.DataArrive += new EventHandler<DataArriveEventArgs>(sh_DataArrive);
                sh.Listen();

            }));
            socketHandlingThread.Start();
        }

        public void Stop()
        {
            socketHandlingThread.Abort();
        }

        #endregion

        static void sh_DataArrive(object sender, DataArriveEventArgs e)
        {
            if (e.Data.GetType() == typeof(LoginAction))
            {
            // sh.SendPacket(e.Socket, new OperatorStatusChangeEventArgs("123", LiveSupport.LiveSupportModel.OperatorStatus.Idle));
            }
            else if (e.Data.GetType() == typeof(LogoutAction))
            {

            }
        }
    }
}
