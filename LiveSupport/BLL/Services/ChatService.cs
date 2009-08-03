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
using System.Threading;



public class ChatService
{
    public static event EventHandler<VisitorChatRequestEventArgs> VisitorChatRequest; //�ÿͶԻ�����
    public static event EventHandler<OperatorChatRequestEventArgs> OperatorChatRequest; //�ͷ��Ի�����
    public static event EventHandler<VisitorChatRequestAcceptedEventArgs> VisitorChatRequestAccepted; // �ÿͶԻ����󱻽���
    public static event EventHandler<OperatorChatRequestAcceptedEventArgs> OperatorChatRequestAccepted; // �ͷ��Ի����뱻����
    public static event EventHandler<OperatorChatRequestDeclinedEventArgs> OperatorChatRequestDeclined; // �ͷ��Ի����뱻�ܾ�
    public static event EventHandler<NewChatEventArgs> NewChat; // �µĶԻ�
    public static event EventHandler<ChatStatusChangedEventArgs> ChatStatusChanged; // �Ի�״̬�ı�

    public static event EventHandler<OperatorChatJoinInviteEventArgs> ChatJoinInvite;
    public static event EventHandler<OperatorChatJoinInviteAcceptedEventArgs> ChatJoinInviteAccepted;
    public static event EventHandler<OperatorChatJoinInviteDeclinedEventArgs> ChatJoinInviteDeclined;
    // Chat Message
    public static event EventHandler<ChatMessageEventArgs> NewMessage;

    #region const int ����
    public const int AcceptChatRequestReturn_OK = 0;
    public const int AcceptChatRequestReturn_Error_AcceptedByOthers = -1;// �Ի��Ѿ��������ͷ�����
    public const int AcceptChatRequestReturn_Error_ChatRequestCanceled = -2;   // �ÿ�ȡ���Ի����� (����: �ÿ�����Ի������ϹرնԻ�)
    public const int AcceptChatRequestReturn_Error_Others = -3;// �������� 

    public const int OperatorRequestChatReturn_OK = 0;
    //public const int OperatorRequestChatReturn_Error_Others = -2;
    public const int OperatorRequestChatReturn_Error_Others = -3;
    #endregion 
    public static IChatProvider Provider = new SqlChatProvider();
    public static List<Chat> chats = new List<Chat>();
    public static string ChatTempDataDir;

    private static List<OperatorChatRequestEventArgs> operatorChatRequests = new List<OperatorChatRequestEventArgs>();
    private static List<VisitorChatRequestEventArgs> visitorChatRequests = new List<VisitorChatRequestEventArgs>();

    #region �Ի���ѯ
    /// <summary>
    /// ���ͷ��Ƿ񷢳���������
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
    /// ����ChatId��ȡ�Ի�
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
    /// ȡ��ʷ�Ự��¼����VisitorID
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    public static List<Chat> GetHistoryChatByVisitorId(string visitorId)
    {
        return Provider.GetChatByVisitorId(visitorId);
    }
    /// <summary>
    /// �Ƿ�������Ϣ
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="lastCheck"></param>
    /// <returns></returns>
    public static bool HasNewMessage(string chatId, long lastCheck)
    {
        throw new NotImplementedException();
    }

    /// <summary>
    /// ��ȡ���жԻ�
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
    /// �жϿͷ��Ƿ��н�����(Status����Closed)��Chat
    /// </summary>
    /// <param name="p"></param>
    /// <returns></returns>
    private static bool IsOperatorHasActiveChat(string operatorId)
    {
        List<Chat> cs = FindChatsByOperatorId(operatorId);
        foreach (Chat item in cs)
        {
            if (item.Status != ChatStatus.Closed && item.Status != ChatStatus.Decline)
            {
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// ����OperatorId���ҿͷ��ĶԻ�
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
    /// ��������Ϣ
    /// </summary>
    /// <param name="m"></param>
    public static void SendMessage(Message m)
    {
        SendMessage(m, DateTime.Now);
    }

    
    /// <summary>
    /// �رնԻ���Ϣ
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="userName"></param>
    public static bool CloseChat(string chatId, string closeBy)
    {
        Trace.WriteLine(string.Format("ChatService.CloseChat(ChatId = {0}��CloseBy��{1})", chatId, closeBy));
        Chat chat = GetChatById(chatId);
        if (chat == null)
        {
            Trace.WriteLine("Waring: ChatService.CloseChat()���� ,ChatId "+ chatId + " ������");
            return false;
        }

        if (chat.Status == ChatStatus.Closed)
        {
            Trace.WriteLine("Waring: ChatService.CloseChat() �Ի����ǹر�״̬ ,ChatId " + chatId + " ������");
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
        m.Text = string.Format("{0}�ѹرնԻ�", closeBy);
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
        // ע��: IsOperatorHasActiveChat��Ҫ�ڸ���chat status�����
        if (!string.IsNullOrEmpty(chat.OperatorId) && !IsOperatorHasActiveChat(chat.OperatorId) && OperatorService.IsOperatorOnline(chat.OperatorId))
        {   
            OperatorService.SetOperatorStatus(chat.OperatorId, OperatorStatus.Idle);//�ر�ʱ�ı�ͷ�״̬
        }

        if (ChatStatusChanged != null)
        {
            ChatStatusChanged(null, new ChatStatusChangedEventArgs(chatId, ChatStatus.Closed));
        }
        return true;        
    }

    /// <summary>
    /// �ͷ����ܶԻ�����
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
            Trace.WriteLine(string.Format("Error: AcceptChatRequest(OperatorId={0},ChatId={1}) ����δ�ҵ��öԻ�", operatorId, chatId));
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
            m1.Text = string.Format("�ͷ�:{0}�Ѿ��������ĶԻ�����",OperatorService.GetOperatorById(operatorId).NickName);
            SendMessage(m1);

            Message m2 = new Message();
            m2.ChatId = chat.ChatId;
            m2.SentDate = DateTime.Now;
            m2.Type = MessageType.SystemMessage_ToOperator;
            m2.Text = string.Format("���Ѿ����ܷÿ�{0}�ĶԻ�����",VisitorService.GetVisitorById(chat.VisitorId).Name);
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
            Trace.WriteLine(string.Format("ChatService.AccpetChatRequest({0},{1})����״̬�Ƿ�: ChatStatus={2}",operatorId,chatId,chat.Status));
            return AcceptChatRequestReturn_Error_Others;
        }
    }


        
    /// <summary>
    /// �ͷ���������Ի�
    /// </summary>
    /// <param name="operatorId">�ͷ�ID</param>
    /// <param name="visitorId"></param>
    public static Chat OperatorRequestChat(string operatorId, string visitorId)
    {
        Trace.WriteLine(string.Format("ChatService.OperatorRequestChat(OperatorId = {0},VisitorId = {1})", operatorId, visitorId));
        Visitor visitor = VisitorService.GetVisitorById(visitorId);
        Operator op = OperatorService.GetOperatorById(operatorId);
        if (visitor == null || op == null)
        {
            Trace.WriteLine(string.Format("Error: ChatService.OperatorRequestChat({0},{1}) ����Opertor��VisitorΪ��",operatorId,visitorId));
            return null;
        }
        
        Chat chat = new Chat();
        chat.IsInviteByOperator = true;
        chat.CreateBy = op.NickName;
        chat.CreateTime = DateTime.Now;
        chat.LastCheckTime = DateTime.Now.Ticks;
        chat.AccountId = op.AccountId;
        chat.VisitorId = visitorId;
        chat.OperatorId = operatorId;
        chats.Add(chat);
        Provider.AddChat(chat);

        op.Status = OperatorStatus.InviteChat;//���ͷ���Ϊ������       
        chat.Status = ChatStatus.Requested;
        //VisitSessionService.SetSessionStatus(visitor.CurrentSessionId, VisitSessionStatus.ChatRequesting);

        Message m = new Message();
        m.ChatId =chat.ChatId;
        m.Text = "��������ÿͣ����Ե�...";
        m.Type = MessageType.SystemMessage_ToOperator;
        SendMessage(m, DateTime.Now.AddMilliseconds(50));

        if (OperatorChatRequest != null)
        {
            var req = new OperatorChatRequestEventArgs(operatorId, visitorId);
            OperatorChatRequest(null, req);
        }

        return chat;
    }

    private static void SendMessage(Message m, DateTime dateTime)
    {
        Chat chat = GetChatById(m.ChatId);
        if (chat == null)
        {
            // TODO: �Ƿ���Ҫ�׳��쳣
            Trace.WriteLine("Error: ������Ϣʧ��,ChatId " + m.ChatId + " ������");
        }
        else if (chat.Status == ChatStatus.Closed)
        {
            // TODO: �Ƿ���Ҫ�׳��쳣
            Trace.WriteLine("Error: ������Ϣʧ��,ChatId " + m.ChatId + " ״̬Ϊ�ѹر�");
        }
        else
        {
            if (NewMessage != null)
            {
                NewMessage(null, new ChatMessageEventArgs(m));
            }
            m.SentDate = dateTime;
            MessageService.AddMessage(m);
        }
    }


    /// <summary>
    /// �ܾ��ͷ��Ự����
    /// </summary>
    /// <param name="chatId"></param>
    public static void DeclineOperatorInvitation(string chatId)
    {
        Trace.WriteLine(string.Format("ChatService.DeclineOperatorInvitation(ChatId = {0})",chatId));
        Chat chat = GetChatById(chatId);
        if (chat != null)
        {
            chat.Status = ChatStatus.Decline;

            SendMessage(new Message(chat.ChatId, "�ÿ��Ѿܾ��Ի�����!", MessageType.SystemMessage_ToOperator));
            if (!string.IsNullOrEmpty(chat.OperatorId) && !IsOperatorHasActiveChat(chat.OperatorId))
            {
                OperatorService.SetOperatorStatus(chat.OperatorId, OperatorStatus.Idle);//�ر�ʱ�ı�ͷ�״̬
            }
        }
        else
        {
            Trace.WriteLine(string.Format("Error: ChatService.DeclineOperatorInvitation({0} ���� δ�ҵ���Chat",chatId));
        }
    }
    /// <summary>
    /// ���ܿͷ�����
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
            s.Status = VisitSessionStatus.Chatting;//���ÿ�״̬��Ϊ�Ի���
            s.ChatingTime = DateTime.Now;
        }
        SendMessage(new Message(chat.ChatId, "�ÿ��ѽ��ܶԻ�����!", MessageType.SystemMessage_ToOperator));
        SendMessage(new Message(chat.ChatId, "���ѽ��ܶԻ�����!", MessageType.SystemMessage_ToVisitor));
    }

    /// <summary>
    /// ҳ������Ի�
    /// </summary>
    /// <param name="CurrentVisitor"></param>
    /// <returns>ChatId</returns>
    public static string ChatPageRequestChat(Visitor visitor)
    {
        Trace.WriteLine(string.Format("ChatService.ChatPageRequestChat(Visitor = {0})", visitor));
        if (!string.IsNullOrEmpty(visitor.Name))
        {
            Visitor vs = VisitorService.GetVisitorById(visitor.VisitorId);
            vs.Name = visitor.Name;
            VisitorService.UpdateVisitor(vs);
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
        m.Text = "���ڽ���ͷ������Ե�...";
        m.Type = MessageType.SystemMessage_ToVisitor;
        m.Source = "ϵͳ";
        m.Destination = "�ÿ�";
        SendMessage(m, DateTime.Now.AddMilliseconds(100));

        if (VisitorChatRequest != null)
        {
            VisitorChatRequestEventArgs req = new VisitorChatRequestEventArgs(visitor.VisitorId);
            visitorChatRequests.Add(req);
            VisitorChatRequest(null, req);
        }
        
        return chatRequest.ChatId;
    }
    /// <summary>
    /// chat��ʱ��ʾ�ʹ���
    /// </summary>
    public static void MaintanStatus()
    {
        foreach (Chat item in chats)
        {
            if (item.Status == ChatStatus.Accepted && !OperatorService.IsOperatorOnline(item.OperatorId))
            {
                SendMessage(new Message(item.ChatId, "�ÿͷ��Ѳ�����!", MessageType.SystemMessage_ToVisitor));
                CloseChat(item.ChatId, "ϵͳ");
                continue;
            }
            DateTime nowTime=DateTime.Now;
            if (nowTime > item.CreateTime.AddSeconds(60) && nowTime < item.CreateTime.AddSeconds(120) && item.Status == ChatStatus.Requested)
            {
                if (item.IsInviteByOperator)
                {
                        SendMessage(new Message(item.ChatId, "�ÿ���Ӧ��! �Ƿ�����ȴ���", MessageType.SystemMessage_ToOperator));
                }
                else
                {
                      SendMessage(new Message(item.ChatId, "�ͷ���æ! �Ƿ�����ȴ���", MessageType.SystemMessage_ToVisitor));
                }             
            }
            else if (nowTime > item.CreateTime.AddSeconds(180) && item.Status == ChatStatus.Requested)
            {
                if (item.IsInviteByOperator)
                {
                    SendMessage(new Message(item.ChatId, "�ÿͻ�����Ӧ��! ϵͳǿ�н��Ի��ر�!", MessageType.SystemMessage_ToOperator));
                }
                else
                {
                    SendMessage(new Message(item.ChatId, "�ͷ���æ!�޷�Ӧ����!", MessageType.SystemMessage_ToVisitor));
                }
                CloseChat(item.ChatId, "ϵͳ");
                Trace.WriteLine(string.Format("Chat {0} Leave", item.ChatId));
            }
        }
    }
}
