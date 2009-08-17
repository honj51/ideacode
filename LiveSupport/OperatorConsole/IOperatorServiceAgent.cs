using System;
using System.Collections.Generic;
using System.Text;
using OperatorServiceInterface;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.OperatorConsole
{
    public enum ConnectionState
    {
        Disconnected, Connecting, Disconnecting, Connected
    }

    public interface IOperatorServiceAgent
    {
        #region OperatorService 方法
        /* 对话接口 */
        void Login(string accountName, string operatorName, string password);
        void RestartLogin(); // 重新登录（使用已有帐号）
        void Logout();

        /* 对话接口 */
        void SendFile(string fileName, string chatId, object action);
        void SendMessage(Message msg);
        void CloseChat(string chatId);
        void AcceptChatRequest(string chatId);
        void InviteChat(string visitorId);

        /* 管理接口 */
        void ChangePassword(string oldPassword, string newPassword);
        void ResetOperatorPassword(string loginName);

        /* 查询功能接口 */
        void GetAccountDomains(); //获取帐号相关域名
        void GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end); //获取历史聊天记录
        void GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end); //获取访客浏览页面记录
        bool IsVisitorHasActiveChat(string visitorId);
        
        /* 快捷回复相关接口 */
        void GetQuickResponseByDomainName(string domainName);
        void SaveQuickResponseByDomainName(List<QuickResponseCategory> response, string domainName);

        /* 留言相关接口 */
        void GetLeaveWord();
        void UpdateLeaveWordById(string sendDate, string name, bool isReplied, string id);
        void DelLeaveWordById(string id);
        void GetLeaveWordByDomainName(string domainName);
        #endregion

        #region 查询方法
        Operator GetOperatorById(string operatorId);
        Visitor GetVisitorById(string visitorId);
        Chat GetChatRequest(string visitorId);
        Chat GetChatByChatId(string chatId);
        #endregion

        #region 公开事件
        event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChanged;
        event EventHandler<NewVisitingEventArgs> NewVisiting; // 新访问,访客可能已经存在
        event EventHandler<VisitorChatRequestEventArgs> VisitorChatRequest; //访客对话请求
        event EventHandler<OperatorChatRequestEventArgs> OperatorChatRequest; //客服对话邀请
        event EventHandler<ChatMessageEventArgs> NewMessage;
        event EventHandler<VisitorChatRequestAcceptedEventArgs> VisitorChatRequestAccepted; // 访客对话请求被接受
        event EventHandler<OperatorChatRequestAcceptedEventArgs> OperatorChatRequestAccepted; // 客服对话邀请被接受
        event EventHandler<OperatorChatRequestDeclinedEventArgs> OperatorChatRequestDeclined; // 客服对话邀请被拒绝
        event EventHandler<ChatStatusChangedEventArgs> ChatStatusChanged; // 对话状态改变
        event EventHandler<VisitorSessionChangeEventArgs> VisitorSessionChange;
        event EventHandler<ConnectionStateChangeEventArgs> ConnectionStateChanged;
        event EventHandler<DataLoadCompletedEventArgs> DataLoadCompleted;
        event EventHandler<AsyncCallCompletedEventArg> AsyncCallCompleted;
        #endregion

        #region 公开属性
        List<Visitor> Visitors { get; }
        List<Operator> Operators { get;}
        Operator CurrentOperator { get; }
        List<Chat> Chats { get; }
        List<string> DomainNames  { get;  }
        string ProductVersion { get; set; }
        ConnectionState State { get;  }
        bool AutoLoginEnabled { get; set; }
        List<SystemAdvertise> SystemAdvertise { get; set; }
        Dictionary<string, List<LeaveWord>> LeaveWords { get; }
        Dictionary<string, List<QuickResponseCategory>> QuickResponseCategorys { get; }
        #endregion
    }

    public class AsyncCallCompletedEventArg : EventArgs
    {
        public object Result;
        public AsyncCallCompletedEventArg(object result)
        {
            this.Result = result;
        }
    }

    public enum DataLoadEventType
    {
        Operators, Visitors, SystemAdvertise, LeaveWord, QuickResponseByDomainName, AccountDomains
    }

    public class DataLoadCompletedEventArgs : EventArgs
    {
        public DataLoadEventType DataType;
        public DataLoadCompletedEventArgs(DataLoadEventType dataType)
        {
            this.DataType = dataType;
        }
    }
    
    public class ConnectionStateChangeEventArgs : EventArgs
    {
        public string Message;
        public ConnectionState State;
        public ConnectionStateChangeEventArgs(ConnectionState state)
        {
            this.State = state;
        }
    }

    public class VisitorSessionChangeEventArgs : EventArgs
    {
        public VisitorSessionChangeEventArgs(VisitSession visitSession)
        {
            this.VisitSession = visitSession;
        }
        public VisitSession VisitSession;
    }
}
