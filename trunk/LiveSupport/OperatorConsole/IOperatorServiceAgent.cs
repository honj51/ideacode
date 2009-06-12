using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
    public interface IOperatorServiceAgent
    {
        Operator Login(string accountName, string operatorName, string password);
        void Logout();
        List<Visitor> GetAllVisitors(string accountId);
        //NewChangesCheckResult CheckNewChanges(NewChangesCheck check);
        void UploadFile(byte[] bs, string fileName, string chatId);
        bool SendMessage(Message msg);
        int ChangePassword(string oldPassword, string newPassword);
        int ResetOperatorPassword(string loginName); 
        bool CloseChat(string chatId);
        List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end);
        List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end);
        int AcceptChatRequest(string chatId);
        Chat InviteChat(string visitorId);
        List<SystemAdvertise> GetSystemAdvertise(string versionNumber);
        void SaveQuickResponse(List<QuickResponseCategory> response);
        List<QuickResponseCategory> GetQuickResponse();
        NewChangesCheckResult GetNextNewChanges();
        Operator GetOperatorById(string operatorId);
        #region 公开事件
        event EventHandler<EventArgs> ConnectionLost;
        event EventHandler<NewVisitorEventArgs> NewVisitor;
        event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;
        event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;
        event EventHandler<ChatStatusChangeEventArgs> ChatStatusChange;
        event EventHandler<NewMessageEventArgs> NewMessage;


        #endregion

        #region 公开属性
        List<Visitor> Visitors { get; set; }
        List<Operator> Operators { get; set; }
        Operator CurrentOperator { get; set; }
        List<Chat> Chats { get; set; }
        List<QuickResponseCategory> QuickResponseCategory { get; }
        #endregion

        Operator GetOperatorById(string operatorId);

        Chat GetChatRequest(string p);

        bool IsVisitorExist(string p);
    }

    public class NewVisitorEventArgs : EventArgs
    {
        public NewVisitorEventArgs(Visitor visitor)
        {
            this.Visitor = visitor;
        }
        public Visitor Visitor;
    }

    public class VisitorSessionChangeEventArgs : EventArgs
    {
        public VisitorSessionChangeEventArgs(VisitSession visitSession)
        {
            this.VisitSession = visitSession;
        }
        public VisitSession VisitSession;
    }

    public class OperatorStatusChangeEventArgs : EventArgs
    {
        public OperatorStatusChangeEventArgs(Operator op)
        {
            this.Operator = op;
        }
        public Operator Operator;
    }

    public class ChatStatusChangeEventArgs : EventArgs
    {
        public ChatStatusChangeEventArgs(Chat c)
        {
            this.Chat = c;
        }
        public Chat Chat;
    }

    public class NewMessageEventArgs : EventArgs
    {
        public NewMessageEventArgs(Message m)
        {
            this.Message = m;
        }
        public Message Message;
    }
}
