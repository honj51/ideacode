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



public class ChatService
{
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
    /// ��������Ϣ
    /// </summary>
    /// <param name="m"></param>
    public static void SendMessage(Message m)
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
            MessageService.AddMessage(m);
        }
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
        if (!string.IsNullOrEmpty(chat.OperatorId) && !IsOperatorHasActiveChat(chat.OperatorId))
        {   
            OperatorService.SetOperatorStatus(chat.OperatorId, OperatorStatus.Idle);//�ر�ʱ�ı�ͷ�״̬
        }

        return true;        
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
            if (item.Status != ChatStatus.Closed)
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
        SendMessage(m);

        return chat;
    }

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
            SendMessage(new Message(chat.ChatId, "�ÿ��Ѿܾ��Ի�����!", MessageType.SystemMessage_ToOperator));
            if (!string.IsNullOrEmpty(chat.OperatorId) && !IsOperatorHasActiveChat(chat.OperatorId))
            {
                OperatorService.SetOperatorStatus(chat.OperatorId, OperatorStatus.Idle);//�ر�ʱ�ı�ͷ�״̬
            }
            chat.Status = ChatStatus.Decline;
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
    }

    /// <summary>
    /// ҳ������Ի�
    /// </summary>
    /// <param name="CurrentVisitor"></param>
    /// <returns>ChatId</returns>
    public static string ChatPageRequestChat(Visitor visitor)
    {
        Trace.WriteLine(string.Format("ChatService.ChatPageRequestChat(Visitor = {0})", visitor));
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
        SendMessage(m);
                
        return chatRequest.ChatId;
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
}
