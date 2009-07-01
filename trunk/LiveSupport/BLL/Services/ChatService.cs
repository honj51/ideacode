using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;
using System.Net.Mail;
using System.Net;
using LiveSupport.BLL;
using System.Diagnostics;
using System.IO;
using OperatorServiceInterface;



public class ChatService
{
    public static event EventHandler<VisitorChatRequestEventArgs> VisitorChatRequest; //访客对话请求
    public static event EventHandler<OperatorChatRequestEventArgs> OperatorChatRequest; //客服对话邀请
    public static event EventHandler<VisitorChatRequestAcceptedEventArgs> VisitorChatRequestAccepted; // 访客对话请求被接受
    public static event EventHandler<OperatorChatRequestAcceptedEventArgs> OperatorChatRequestAccepted; // 客服对话邀请被接受
    public static event EventHandler<OperatorChatRequestDeclinedEventArgs> OperatorChatRequestDeclined; // 客服对话邀请被拒绝
    public static event EventHandler<NewChatEventArgs> NewChat; // 新的对话
    public static event EventHandler<ChatStatusChangedEventArgs> ChatStatusChanged; // 对话状态改变

    public static event EventHandler<OperatorChatJoinInviteEventArgs> ChatJoinInvite;
    public static event EventHandler<OperatorChatJoinInviteAcceptedEventArgs> ChatJoinInviteAccepted;
    public static event EventHandler<OperatorChatJoinInviteDeclinedEventArgs> ChatJoinInviteDeclined;
    // Chat Message
    public static event EventHandler<ChatMessageEventArgs> NewMessage;

    #region const int 定义
    public const int AcceptChatRequestReturn_OK = 0;
    public const int AcceptChatRequestReturn_Error_AcceptedByOthers = -1;// 对话已经被其他客服接受
    public const int AcceptChatRequestReturn_Error_ChatRequestCanceled = -2;   // 访客取消对话请求 (例如: 访客请求对话后马上关闭对话)
    public const int AcceptChatRequestReturn_Error_Others = -3;// 其他错误 

    public const int OperatorRequestChatReturn_OK = 0;
    //public const int OperatorRequestChatReturn_Error_Others = -2;
    public const int OperatorRequestChatReturn_Error_Others = -3;
    #endregion 
    public static IChatProvider Provider = new SqlChatProvider();
    public static List<Chat> chats = new List<Chat>();
    public static string ChatTempDataDir;

    private static List<OperatorChatRequestEventArgs> operatorChatRequests = new List<OperatorChatRequestEventArgs>();
    private static List<VisitorChatRequestEventArgs> visitorChatRequests = new List<VisitorChatRequestEventArgs>();

    #region 对话查询
    /// <summary>
    /// 检查客服是否发出主动邀请
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    public static string GetOperatorInvitation(string visitorId)
    {
        foreach (var chat in chats)
        {
            if (chat.VisitorId == visitorId && chat.Status == ChatStatus.Requested && chat.IsInviteByOperator)
            {
                return chat.ChatId;
            }
        }
        return null;
    }
    public static List<Chat> GetAllChat()
    {
        return chats;
    }
    /// <summary>
    /// 根据ChatId获取对话
    /// </summary>
    /// <param name="chatId"></param>
    /// <returns></returns>
    public static Chat GetChatById(string chatId)
    {
        foreach (Chat item in chats)
        {
            if (item.ChatId == chatId)
            {
                return item;
            }
        }
        return null;
    }
    /// <summary>
    /// 取历史会话记录跟据VisitorID
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    public static List<Chat> GetHistoryChatByVisitorId(string visitorId)
    {
        return Provider.GetChatByVisitorId(visitorId);
    }
    /// <summary>
    /// 是否有新消息
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="lastCheck"></param>
    /// <returns></returns>
    public static bool HasNewMessage(string chatId, long lastCheck)
    {
        throw new NotImplementedException();
    }

    /// <summary>
    /// 获取所有对话
    /// </summary>
    /// <param name="accountId"></param>
    /// <returns></returns>
    public static List<Chat> GetAllChatByAccountId(string accountId)
    {
        List<Chat> list = new List<Chat>() ;
        foreach (Chat item in chats)
        {
            if (item.AccountId == accountId && item.Status != ChatStatus.Closed)
            {
                list.Add(item);
            }
        }
        return list;
    }

    /// <summary>
    /// 判断客服是否有进行中(Status不是Closed)的Chat
    /// </summary>
    /// <param name="p"></param>
    /// <returns></returns>
    private static bool IsOperatorHasActiveChat(string operatorId)
    {
        List<Chat> cs = FindChatsByOperatorId(operatorId);
        foreach (Chat item in cs)
        {
            if (item.Status != ChatStatus.Closed)
            {
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// 根据OperatorId查找客服的对话
    /// </summary>
    /// <param name="operatorId"></param>
    /// <returns></returns>
    private static List<Chat> FindChatsByOperatorId(string operatorId)
    {
        List<Chat> cs = new List<Chat>();
        foreach (Chat item in chats)
        {
            if (!string.IsNullOrEmpty(item.OperatorId) && item.OperatorId == operatorId)
            {
                cs.Add(item);
            }
        }
        return cs;
    }

    #endregion

    /// <summary>
    /// 发送新消息
    /// </summary>
    /// <param name="m"></param>
    public static void SendMessage(Message m)
    {
        Chat chat = GetChatById(m.ChatId);
        if (chat == null)
        {
            // TODO: 是否需要抛出异常
            Trace.WriteLine("Error: 发生消息失败,ChatId " + m.ChatId + " 不存在");
        }
        else if (chat.Status == ChatStatus.Closed)
        {
            // TODO: 是否需要抛出异常
            Trace.WriteLine("Error: 发生消息失败,ChatId " + m.ChatId + " 状态为已关闭");
        }
        else
        {
            if (NewMessage != null)
            {
                NewMessage(null, new ChatMessageEventArgs(m));
            }
            m.SentDate = DateTime.Now;
            MessageService.AddMessage(m);
        }
    }

    
    /// <summary>
    /// 关闭对话信息
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="userName"></param>
    public static bool CloseChat(string chatId, string closeBy)
    {
        Trace.WriteLine(string.Format("ChatService.CloseChat(ChatId = {0}，CloseBy＝{1})", chatId, closeBy));
        Chat chat = GetChatById(chatId);
        if (chat == null)
        {
            Trace.WriteLine("Waring: ChatService.CloseChat()错误 ,ChatId "+ chatId + " 不存在");
            return false;
        }

        if (chat.Status == ChatStatus.Closed)
        {
            Trace.WriteLine("Waring: ChatService.CloseChat() 对话已是关闭状态 ,ChatId " + chatId + " 不存在");
            try
            {
                Directory.Delete(ChatTempDataDir + chatId, true);
            }
            catch (Exception)
            {
            }
            return true;
        }
        
        Message m = new Message();
        m.ChatId =chatId;
        m.SentDate = DateTime.Now;
        m.Type = MessageType.SystemMessage_ToBoth;
        m.Text = string.Format("{0}已关闭对话", closeBy);
        SendMessage(m);

        chat.Status = ChatStatus.Closed;
        chat.CloseTime = DateTime.Now;
        chat.CloseBy = closeBy;
        if (chat.OperatorId==null||chat.OperatorId=="")
        {
            chat.OperatorId = null;
        }
        Provider.CloseChat(chat);
                
        VisitSessionService.SetSessionStatus(VisitorService.GetVisitorById(chat.VisitorId).CurrentSessionId, VisitSessionStatus.Visiting);
        // 注意: IsOperatorHasActiveChat需要在更改chat status后调用
        if (!string.IsNullOrEmpty(chat.OperatorId) && !IsOperatorHasActiveChat(chat.OperatorId))
        {   
            OperatorService.SetOperatorStatus(chat.OperatorId, OperatorStatus.Idle);//关闭时改变客服状态
        }

        if (ChatStatusChanged != null)
        {
            ChatStatusChanged(null, new ChatStatusChangedEventArgs(chatId, ChatStatus.Closed));
        }
        return true;        
    }

    /// <summary>
    /// 客服接受对话请求
    /// </summary>
    /// <param name="operatorId"></param>
    /// <param name="chatId"></param>
    /// <returns></returns>
    public static int AcceptChatRequest(string operatorId, string chatId)
    {
        Trace.WriteLine(string.Format("ChatService.AcceptChatRequest(OperatorId={0},ChatId={1})", operatorId, chatId));

        Chat chat = GetChatById(chatId);
        if (chat == null)
        {
            Trace.WriteLine(string.Format("Error: AcceptChatRequest(OperatorId={0},ChatId={1}) 错误，未找到该对话", operatorId, chatId));
            return AcceptChatRequestReturn_Error_Others;
        }

        if (chat.Status == ChatStatus.Accepted)
        {
            return AcceptChatRequestReturn_Error_AcceptedByOthers;
        }
        else if (chat.Status == ChatStatus.Requested)
        {
            chat.Status = ChatStatus.Accepted;
            chat.OperatorId = operatorId;
            chat.AcceptTime = DateTime.Now;
            
            Message m1 = new Message();
            m1.ChatId = chat.ChatId;
            m1.SentDate = DateTime.Now;
            m1.Type = MessageType.SystemMessage_ToVisitor;
            m1.Text = string.Format("客服:{0}已经接受您的对话请求",OperatorService.GetOperatorById(operatorId).NickName);
            SendMessage(m1);

            Message m2 = new Message();
            m2.ChatId = chat.ChatId;
            m2.SentDate = DateTime.Now;
            m2.Type = MessageType.SystemMessage_ToOperator;
            m2.Text = string.Format("你已经接受访客{0}的对话请求",VisitorService.GetVisitorById(chat.VisitorId).Name);
            SendMessage(m2);

            OperatorService.SetOperatorStatus(operatorId, OperatorStatus.Chatting);
            
            VisitSession s = VisitSessionService.GetSessionById(VisitorService.GetVisitorById(chat.VisitorId).CurrentSessionId);
            s.OperatorId = operatorId;
            s.Status = VisitSessionStatus.Chatting;
            s.ChatingTime = DateTime.Now;
            
            

            return AcceptChatRequestReturn_OK;
        }
        else if (chat.Status == ChatStatus.Closed)
        {
            return AcceptChatRequestReturn_Error_ChatRequestCanceled;
        }
        else
        {
            Trace.WriteLine(string.Format("ChatService.AccpetChatRequest({0},{1})错误，状态非法: ChatStatus={2}",operatorId,chatId,chat.Status));
            return AcceptChatRequestReturn_Error_Others;
        }
    }


        
    /// <summary>
    /// 客服主动邀请对话
    /// </summary>
    /// <param name="operatorId">客服ID</param>
    /// <param name="visitorId"></param>
    public static Chat OperatorRequestChat(string operatorId, string visitorId)
    {
        Trace.WriteLine(string.Format("ChatService.OperatorRequestChat(OperatorId = {0},VisitorId = {1})", operatorId, visitorId));
        Visitor visitor = VisitorService.GetVisitorById(visitorId);
        Operator op = OperatorService.GetOperatorById(operatorId);
        if (visitor == null || op == null)
        {
            Trace.WriteLine(string.Format("Error: ChatService.OperatorRequestChat({0},{1}) 错误Opertor或Visitor为空",operatorId,visitorId));
            return null;
        }
        
        Chat chat = new Chat();
        chat.IsInviteByOperator = true;
        chat.CreateBy = op.NickName;
        chat.CreateTime = DateTime.Now;
        chat.AccountId = op.AccountId;
        chat.VisitorId = visitorId;
        chat.OperatorId = operatorId;
        chats.Add(chat);
        Provider.AddChat(chat);

        op.Status = OperatorStatus.InviteChat;//将客服改为请求中       
        chat.Status = ChatStatus.Requested;
        //VisitSessionService.SetSessionStatus(visitor.CurrentSessionId, VisitSessionStatus.ChatRequesting);

        Message m = new Message();
        m.ChatId =chat.ChatId;
        m.Text = "正在邀请访客，请稍等...";
        m.Type = MessageType.SystemMessage_ToOperator;
        SendMessage(m);

        if (OperatorChatRequest != null)
        {
            var req = new OperatorChatRequestEventArgs(operatorId, visitorId);
            OperatorChatRequest(null, req);
        }

        return chat;
    }


    /// <summary>
    /// 拒绝客服会话邀请
    /// </summary>
    /// <param name="chatId"></param>
    public static void DeclineOperatorInvitation(string chatId)
    {
        Trace.WriteLine(string.Format("ChatService.DeclineOperatorInvitation(ChatId = {0})",chatId));
        Chat chat = GetChatById(chatId);
        if (chat != null)
        {
            SendMessage(new Message(chat.ChatId, "访客已拒绝对话邀请!", MessageType.SystemMessage_ToOperator));
            if (!string.IsNullOrEmpty(chat.OperatorId) && !IsOperatorHasActiveChat(chat.OperatorId))
            {
                OperatorService.SetOperatorStatus(chat.OperatorId, OperatorStatus.Idle);//关闭时改变客服状态
            }
            chat.Status = ChatStatus.Decline;
        }
        else
        {
            Trace.WriteLine(string.Format("Error: ChatService.DeclineOperatorInvitation({0} 错误， 未找到该Chat",chatId));
        }
    }
    /// <summary>
    /// 接受客服邀请
    /// </summary>
    /// <param name="chatId"></param>
    public static void AcceptOperatorInvitation(string chatId)
    {
        Trace.WriteLine(string.Format("ChatService.AcceptOperatorInvitation(ChatId = {0})", chatId));
        Chat chat = GetChatById(chatId);
        if (chat != null)
        {
            chat.Status = ChatStatus.Accepted;
            if (chat.OperatorId != null)
            {
                OperatorService.GetOperatorById(chat.OperatorId).Status = OperatorStatus.Chatting;
            }
            VisitSession s = VisitSessionService.GetSessionById(VisitorService.GetVisitorById(chat.VisitorId).CurrentSessionId); 
            s.Status = VisitSessionStatus.Chatting;//将访客状态改为对话中
            s.ChatingTime = DateTime.Now;
        }
        SendMessage(new Message(chat.ChatId, "访客已接受对话邀请!", MessageType.SystemMessage_ToOperator));
        SendMessage(new Message(chat.ChatId, "您已接受对话邀请!", MessageType.SystemMessage_ToVisitor));
    }

    /// <summary>
    /// 页面请求对话
    /// </summary>
    /// <param name="CurrentVisitor"></param>
    /// <returns>ChatId</returns>
    public static string ChatPageRequestChat(Visitor visitor)
    {
        Trace.WriteLine(string.Format("ChatService.ChatPageRequestChat(Visitor = {0})", visitor));
        if (!string.IsNullOrEmpty(visitor.Name))
        {
            VisitorService.GetVisitorById(visitor.VisitorId).Name = visitor.Name;//改变访客名
        }
        Chat chatRequest = new Chat();
        chatRequest.AccountId = visitor.AccountId;
        chatRequest.CreateTime = DateTime.Now;
        chatRequest.Status = ChatStatus.Requested;
        chatRequest.VisitorId = visitor.VisitorId;

        chats.Add(chatRequest);
        Provider.AddChat(chatRequest);

        VisitSession s = VisitSessionService.GetSessionById(visitor.CurrentSessionId);
        s.ChatRequestTime = DateTime.Now;
        s.Status = VisitSessionStatus.ChatRequesting;

        Message m = new Message();
        m.ChatId = chatRequest.ChatId;
        m.Text = "正在接入客服，请稍等...";
        m.Type = MessageType.SystemMessage_ToVisitor;
        m.Source = "系统";
        m.Destination = "访客";
        SendMessage(m);

        if (VisitorChatRequest != null)
        {
            VisitorChatRequestEventArgs req = new VisitorChatRequestEventArgs(visitor.VisitorId);
            visitorChatRequests.Add(req);
            VisitorChatRequest(null, req);
        }
        
        return chatRequest.ChatId;
    }
    /// <summary>
    /// chat超时提示和处理
    /// </summary>
    public static void MaintanStatus()
    {
        foreach (Chat item in chats)
        {
            DateTime nowTime=DateTime.Now;
            if (nowTime > item.CreateTime.AddSeconds(120) && nowTime < item.CreateTime.AddSeconds(180) && item.Status == ChatStatus.Requested)
            {
                if (item.IsInviteByOperator)
                {
                        SendMessage(new Message(item.ChatId, "访客无应答! 是否继续等待。", MessageType.SystemMessage_ToOperator));
                }
                else
                {
                      SendMessage(new Message(item.ChatId, "客服正忙! 是否继续等待。", MessageType.SystemMessage_ToVisitor));
                }             
            }
            else if (nowTime > item.CreateTime.AddSeconds(480) && item.Status == ChatStatus.Requested)
            {
                if (item.IsInviteByOperator)
                {
                    SendMessage(new Message(item.ChatId, "访客还是无应答! 系统强行将对话关闭!", MessageType.SystemMessage_ToOperator));
                }
                else
                {
                    SendMessage(new Message(item.ChatId, "客服很忙!无法应答你!", MessageType.SystemMessage_ToVisitor));
                }
                CloseChat(item.ChatId, "系统自动");
                Trace.WriteLine(string.Format("Chat {0} Leave", item.ChatId));
            }
        }
    }
}
