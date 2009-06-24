using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
    public interface IOperatorServiceAgent
    {
        #region OperatorService 方法
        Operator Login(string accountName, string operatorName, string password);
        void Logout();
        void UploadFile(byte[] bs, string fileName, string chatId);
        bool SendMessage(Message msg);
        int ChangePassword(string oldPassword, string newPassword);
        int ResetOperatorPassword(string loginName);
        int ResetOperator(string operatorId, string chatId);
        bool CloseChat(string chatId);
        List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end);
        List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end);
        int AcceptChatRequest(string chatId);
        Chat InviteChat(string visitorId);
        List<SystemAdvertise> GetSystemAdvertise(string versionNumber);
        void SaveQuickResponse(List<QuickResponseCategory> response);
        List<QuickResponseCategory> GetQuickResponse();
        //NewChangesCheckResult GetNextNewChanges();
        List<Visitor> GetAllVisitors(string accountId);
        #endregion

        #region 查询方法
        Operator GetOperatorById(string operatorId);
        Visitor GetVisitorById(string visitorId);
        Chat GetChatRequest(string chatId);
        bool IsVisitorExist(string visitorId);
        #endregion

        #region 公开事件
        event EventHandler<ConnectionLostEventArgs> ConnectionLost;
        event EventHandler<NewVisitorEventArgs> NewVisitor;
        event EventHandler<NewChatRequestEventArgs> NewChatRequest;
        event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;
        event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;
        event EventHandler<ChatStatusChangeEventArgs> ChatStatusChange;
        event EventHandler<NewMessageEventArgs> NewMessage;
        event EventHandler<NewChangesCheckResultEventArgs> NewChanges;
        #endregion

        #region 公开属性
        List<Visitor> Visitors { get; set; }
        List<Operator> Operators { get; set; }
        Operator CurrentOperator { get; set; }
        List<Chat> Chats { get; set; }
        List<QuickResponseCategory> QuickResponseCategory { get; }
        #endregion
    }

    public class NewChangesCheckResultEventArgs : EventArgs
    {
        public NewChangesCheckResult Result;
        public NewChangesCheckResultEventArgs(NewChangesCheckResult result)
        {
            this.Result = result;
        }
    }

    public class ConnectionLostEventArgs : EventArgs
    {
        public string Message;
        public ConnectionLostEventArgs(string message)
        {
            this.Message = message;
        }
    }

    public class NewChatRequestEventArgs : EventArgs
    {
        public NewChatRequestEventArgs(string name, Chat c)
        {
            Name = name;
            Chat = c;
        }
        public Chat Chat;
        public string Name;
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
