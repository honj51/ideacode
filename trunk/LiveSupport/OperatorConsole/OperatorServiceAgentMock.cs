using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using OperatorServiceInterface;
//using TestUtility;
using System.Timers;

namespace LiveSupport.OperatorConsole
{
    class OperatorServiceAgentMock : IOperatorServiceAgent
    {
        List<Visitor> visitors = new List<Visitor>();
        List<Operator> operators = new List<Operator>();
        List<Chat> chats = new List<Chat>();
        List<string> domains = new List<string>();
        Account account;
        Timer timer = new Timer(2000);
        public OperatorServiceAgentMock()
        {
            //account = TestTool.CreateNewAccount();
            //CurrentOperator = TestTool.CreateNewOperator(account.AccountId);
            //CurrentOperator.IsAdmin = true;
            //CurrentOperator.LoginName = "Operator1";
            //CurrentOperator.NickName = "NickName1";
            //CurrentOperator.Status = LiveSupport.LiveSupportModel.OperatorStatus.Idle;

            //visitors.Add(TestTool.CreateNewVisitor(account.AccountId));
            //visitors.Add(TestTool.CreateNewVisitor(account.AccountId));
            //operators.Add(TestTool.CreateNewOperator(account.AccountId));
            //operators.Add(TestTool.CreateNewOperator(account.AccountId));
            //operators.Add(TestTool.CreateNewOperator(account.AccountId));
            //operators.Add(CurrentOperator);
            //chats.Add(TestTool.CreateNewChat(visitors[0], CurrentOperator));

            //domains.Add("www.zxkefu.cn");
            //domains.Add("www.sina.cn");
            //domains.Add("www.google.cn");
        }

        #region IOperatorServiceAgent 成员

        public void Login(string accountName, string operatorName, string password)
        {
            ConnectionStateChanged(this, new ConnectionStateChangeEventArgs(ConnectionState.Connected));
            timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
            timer.Start();
        }

        int step = 0;
        void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            if (step == 0)
            {
                if (OperatorStatusChanged != null)
                {
                    OperatorStatusChanged(this, new OperatorServiceInterface.OperatorStatusChangeEventArgs(CurrentOperator.OperatorId, CurrentOperator.Status));
                }
                DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.Operators));
                DataLoadCompleted(this, new DataLoadCompletedEventArgs(DataLoadEventType.Visitors));

                //NewVisiting(this, new NewVisitingEventArgs(visitors[0], visitors[0].CurrentSession));
            }
            //else if (step == 1)
            //{
            //    NewVisiting(this, new NewVisitingEventArgs(visitors[1], visitors[1].CurrentSession));
            //}
            else if (step == 2)
            {
                VisitorChatRequest(this, new VisitorChatRequestEventArgs(visitors[0].VisitorId, chats[0]));
            }
            else if (step == 3)
            {
                ChatStatusChanged(this, new ChatStatusChangedEventArgs(chats[0].ChatId, ChatStatus.Closed));
            }
            else if (step == 4)
            {
                VisitorLeave(this, new VisitorLeaveEventArgs(visitors[0].VisitorId));
            }
            step++;
        }

        void GenEvents()
        {
        }

        public void RestartLogin()
        {
            throw new NotImplementedException();
        }

        public void Logout()
        {

        }

        public void SendFile(string fileName, string chatId, object action)
        {
            throw new NotImplementedException();
        }

        public void SendMessage(LiveSupport.LiveSupportModel.Message msg)
        {
            msg.Text = "Echo > " + msg.Text;
            NewMessage(this, new ChatMessageEventArgs(msg));
        }

        Chat GetChatById(string id)
        {
            foreach (var item in chats)
            {
                if (item.ChatId == id)
                {
                    return item;
                }
            }
            return null;
        }

        public bool CloseChat(string chatId)
        {
            ChatStatusChanged(this,new OperatorServiceInterface.ChatStatusChangedEventArgs(chatId, ChatStatus.Closed));
            Chat chat = GetChatById(chatId);
            Visitor v = GetVisitorById(chat.VisitorId);
            v.CurrentSession.Status = VisitSessionStatus.Visiting;
            OperatorStatusChanged(this, new OperatorStatusChangeEventArgs(chat.OperatorId, OperatorStatus.Idle));
            VisitorSessionChange(this,new VisitorSessionChangeEventArgs(v.CurrentSession));
            return true;
        }

        public int AcceptChatRequest(string chatId)
        {
            VisitorChatRequestAccepted(this, new VisitorChatRequestAcceptedEventArgs(new VisitorChatRequestEventArgs(visitors[0].VisitorId, chats[0])));
            OperatorStatusChanged(this,new OperatorStatusChangeEventArgs(GetChatById(chatId).OperatorId, OperatorStatus.Chatting));
            return 1;
        }

        public LiveSupport.LiveSupportModel.Chat InviteChat(string visitorId)
        {
            throw new NotImplementedException();
        }

        public int ChangePassword(string oldPassword, string newPassword)
        {
            throw new NotImplementedException();
        }

        public int ResetOperatorPassword(string loginName)
        {
            throw new NotImplementedException();
        }

        public List<string> GetAccountDomains()
        {
            return domains;
        }

        public List<LiveSupport.LiveSupportModel.Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
        {
            throw new NotImplementedException();
        }

        public List<LiveSupport.LiveSupportModel.PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
        {
            throw new NotImplementedException();
        }

        public bool IsVisitorHasActiveChat(string visitorId)
        {
           return false;
        }

        public List<QuickResponseCategory> GetQuickResponse()
        {
            throw new NotImplementedException();
        }

        public List<QuickResponseCategory> GetQuickResponseByDomainName(string domainName)
        {
            return quickResponseCategory;
        }

        public void SaveQuickResponseByDomainName(List<LiveSupport.LiveSupportModel.QuickResponseCategory> response, string domainName)
        {
            throw new NotImplementedException();
        }


        List<LiveSupport.LiveSupportModel.LeaveWord> leavewords = new List<LeaveWord>();
        public List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWord()
        {
            LeaveWord lw = new LeaveWord();
            lw.Content = "111";
            leavewords.Add(lw);
            return leavewords;
        }

        public bool UpdateLeaveWordById(string sendDate, string name, bool isReplied, string id)
        {
            throw new NotImplementedException();
        }

        public bool DelLeaveWordById(string id)
        {
            throw new NotImplementedException();
        }

        public List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordNotReplied()
        {
            throw new NotImplementedException();
        }

        public List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordByDomainName(string domainName)
        {
            throw new NotImplementedException();
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


        public LiveSupport.LiveSupportModel.Chat GetChatRequest(string visitorId)
        {
            throw new NotImplementedException();
        }

        public bool IsVisitorExist(string visitorId)
        {
            throw new NotImplementedException();
        }

        public event EventHandler<ConnectionStateChangeEventArgs> ConnectionStateChanged;

        public event EventHandler<DataLoadCompletedEventArgs> DataLoadCompleted;


        public List<LiveSupport.LiveSupportModel.Visitor> Visitors
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public List<LiveSupport.LiveSupportModel.Operator> Operators
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

        Operator currentOperator;

        public LiveSupport.LiveSupportModel.Operator CurrentOperator
        {
            get
            {
                return currentOperator;
            }
            set
            {
                currentOperator = value;
            }
        }

        public List<LiveSupport.LiveSupportModel.Chat> Chats
        {
            get
            {
                return chats;
            }
            set
            {
                chats = value;
            }
        }

        List<QuickResponseCategory> quickResponseCategory = new List<QuickResponseCategory>();
        
        public List<QuickResponseCategory> QuickResponseCategory
        {
            get
            {
                return quickResponseCategory;
            }
            set
            {
                quickResponseCategory = value;
            }
        }

        public bool EnablePooling
        {
            get
            {
                return true;
            }
            set
            {
                
            }
        }

        public string ProductVersion
        {
            get
            {
                return "123456";
            }
            set
            {
            }
        }

        public ConnectionState State
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public bool AutoLoginEnabled
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        #endregion

        #region IOperatorServerEvents 成员

        public event EventHandler<OperatorServiceInterface.OperatorStatusChangeEventArgs> OperatorStatusChanged;

        public event EventHandler<OperatorServiceInterface.VisitorChatRequestEventArgs> VisitorChatRequest;

        public event EventHandler<OperatorServiceInterface.OperatorChatRequestEventArgs> OperatorChatRequest;

        public event EventHandler<OperatorServiceInterface.VisitorChatRequestAcceptedEventArgs> VisitorChatRequestAccepted;

        public event EventHandler<OperatorServiceInterface.OperatorChatRequestAcceptedEventArgs> OperatorChatRequestAccepted;

        public event EventHandler<OperatorServiceInterface.OperatorChatRequestDeclinedEventArgs> OperatorChatRequestDeclined;

        public event EventHandler<OperatorServiceInterface.NewChatEventArgs> NewChat;

        public event EventHandler<OperatorServiceInterface.ChatStatusChangedEventArgs> ChatStatusChanged;

        public event EventHandler<OperatorServiceInterface.OperatorChatJoinInviteEventArgs> ChatJoinInvite;

        public event EventHandler<OperatorServiceInterface.OperatorChatJoinInviteAcceptedEventArgs> ChatJoinInviteAccepted;

        public event EventHandler<OperatorServiceInterface.OperatorChatJoinInviteDeclinedEventArgs> ChatJoinInviteDeclined;

        public event EventHandler<OperatorServiceInterface.ChatMessageEventArgs> NewMessage;

        public event EventHandler<OperatorServiceInterface.NewVisitingEventArgs> NewVisiting;

        public event EventHandler<OperatorServiceInterface.VisitorLeaveEventArgs> VisitorLeave;

        #endregion

        #region IOperatorServiceAgent 成员


        public event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;

        #endregion

        #region IOperatorServiceAgent 成员


        public Chat GetChatByChatId(string chatId)
        {
            throw new NotImplementedException();
        }

        #endregion

        #region IOperatorServiceAgent 成员


        public event EventHandler<AsyncCallCompletedEventArg> AsyncCallCompleted;

        #endregion

        #region IOperatorServiceAgent 成员


        void IOperatorServiceAgent.AcceptChatRequest(string chatId)
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.InviteChat(string visitorId)
        {
            throw new NotImplementedException();
        }

        #endregion

        #region IOperatorServiceAgent 成员


        void IOperatorServiceAgent.GetQuickResponse()
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.GetQuickResponseByDomainName(string domainName)
        {
            throw new NotImplementedException();
        }

        #endregion

        #region IOperatorServiceAgent 成员


        void IOperatorServiceAgent.CloseChat(string chatId)
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.GetAccountDomains()
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.GetLeaveWord()
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.UpdateLeaveWordById(string sendDate, string name, bool isReplied, string id)
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.DelLeaveWordById(string id)
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.GetLeaveWordNotReplied()
        {
            throw new NotImplementedException();
        }

        void IOperatorServiceAgent.GetLeaveWordByDomainName(string domainName)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
