using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using System.Text;
using System.Web.Mail;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;



public class ChatService
{
    #region const int ����
    public const int AcceptChatRequestReturn_OK = 0;
    public const int AcceptChatRequestReturn_Error_AcceptedByOthers = -1;
    public const int AcceptChatRequestReturn_Error_ChatRequestCanceled = -2;
    public const int AcceptChatRequestReturn_Error_Others = -3;
    public const int ResetOperatorPassword_OK = 0;
    public const int ResetOperatorPassword_PermissionDenied=-1;
    public const int ResetOperatorPassword_OtheError=-2;
    #endregion 
    public static IChatProvider Provider = new SqlChatProvider();
    public static List<Chat> chats = new List<Chat>();

    public static bool HasNewMessage(string chatId, long lastCheck)
    {
        throw new NotImplementedException();
    }
    #region ��ĸ������ͷ����ʼ�
    /// <summary>
    /// ��ĸ�����
    /// </summary>
    /// <param name="n">���ɳ���</param>
    /// <returns></returns>
    public static string RandLetter(int n)
    {
        char[] arrChar = new char[]{
            'a','b','d','c','e','f','g','h','i','j','k','l','m','n','p','r','q','s','t','u','v','w','z','y','x',
            '_',
          'A','B','C','D','E','F','G','H','I','J','K','L','M','N','Q','P','R','T','S','V','U','W','X','Y','Z'
          };
        StringBuilder num = new StringBuilder();

        Random rnd = new Random(DateTime.Now.Millisecond);
        for (int i = 0; i < n; i++)
        {
            num.Append(arrChar[rnd.Next(0, arrChar.Length)].ToString());

        }

        return num.ToString();
    }

    /// <summary>
    /// �����ʼ�
    /// </summary>
    /// <param name="to">������</param>
    /// <param name="subject">����</param>
    /// <param name="body">����</param>
    public static void SendEmail(string to, string subject, string body)
    {

        string username = ConfigurationManager.AppSettings["WSUser"].ToString();
        string pwd = ConfigurationManager.AppSettings["Pwd"].ToString();
        string sReturn = string.Empty;
        MailMessage mailMsg = new MailMessage();
        mailMsg.BodyFormat = MailFormat.Html;
        mailMsg.To = to;
        mailMsg.From = ConfigurationManager.AppSettings["Email"].ToString();
        mailMsg.Subject = subject;
        mailMsg.Body = body;
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "410396629");
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "19870312");
        SmtpMail.SmtpServer = ConfigurationManager.AppSettings["SMTPServer"].ToString();
        try
        {
            SmtpMail.Send(mailMsg);
        }
        catch (Exception err)
        {
            throw err;
        }
    }
    #endregion
 

    public static List<Chat> GetAllChatRequest(string accountId)
    {
        //return chats.FindAll(c => c.AccountId == accountId);
        List<Chat> list = new List<Chat>() ;
        foreach (Chat item in chats)
        {
            if (item.AccountId == accountId)
            {
                list.Add(item);
            }
        }
        return list;
    }

    public static void SendMessage(Message m)
    {
        MessageService.AddMessage(m);
    }

    public static int ChangPassword(string operatorId, string oldPassword, string newPassword)
    {
      return  OperatorService.ChangPassword(operatorId, oldPassword, newPassword);
    }
    /// <summary>
    /// ������ϯ����
    /// </summary>
    /// <param name="loginName">��¼��</param>
    public static int ResetOperatorPassword(string loginName)
    {
        Operator op = OperatorService.GetOperatorByLoginName(loginName);
        if (loginName != null || op != null)
        {
            if (op.Email != null)
            {
                string body = "����������ǣ�" + RandLetter(8);
                string subject = "���뼤��";
                SendEmail(op.Email, subject, body);
                return ResetOperatorPassword_OK;
            }
            else
            {
                return ResetOperatorPassword_PermissionDenied;
            }
        }
        else
        {
            return ResetOperatorPassword_OtheError;
        }
    }
    /// <summary>
    /// �жϴ��û��Ƿ����
    /// </summary>
    /// <param name="loginName"></param>
    /// <returns></returns>
    public static bool GetOperatorByloginName(string loginName)
    {
      Operator op= OperatorService.GetOperatorByLoginName(loginName);
      if (op != null)
      {
          return true;
      }
      else
          return false;
    }
    /// <summary>
    /// �رնԻ���Ϣ
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="userName"></param>
    public static bool CloseChat(string chatId, string closeBy)
    {
        Chat chat = null;
        foreach (Chat item in chats)
        {
            if(item.ChatId == chatId)
            {
                chat = item;
            }
        }
        if (chat == null)
        {
            return false;
        }
        if (chat.Status == ChatStatus.Closed)
        {
            return true;
        }
        chat.Status = ChatStatus.Closed;
        VisitSessionService.GetSessionById(chat.ChatId).Status = VisitSessionStatus.Visiting;
        chat.CloseTime = DateTime.Now;
        chat.CloseBy = closeBy;
        if (Provider.CloseChat(chat) > 0)
        {
            Message m = new Message();
            m.ChatId =chatId;
            m.SentDate = DateTime.Now;
            m.Type = MessageType.SystemMessage_ToBoth;
            m.Text = string.Format("{0}�ѹرնԻ�", closeBy);
            SendMessage(m);
            return true;
        }
        else
        {
            return false;
        }
    }
    /// <summary>
    /// ���ܶԻ�����
    /// </summary>
    /// <param name="operatorId"></param>
    /// <param name="chatId"></param>
    /// <returns></returns>
    public static int AcceptChatRequest(string operatorId, string chatId)
    {
        Chat chat = GetChatById(chatId);
        if (chat == null)
        {
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
            OperatorService.GetOperatorById(chat.OperatorId).Status = OperatorStatus.Chatting;//���ͷ�״̬��Ϊ���ڶԻ���
            VisitSessionService.GetSessionById(chat.ChatId).Status = VisitSessionStatus.Chatting;
            VisitSessionService.GetSessionById(chat.ChatId).OperatorId = operatorId;
            VisitSessionService.GetSessionById(chat.ChatId).ChatingTime = DateTime.Now;
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
            m2.Text = string.Format("���Ѿ����ܷÿ�{0}�ĶԻ�����",VisitorService.GetVisitor(VisitSessionService.GetSessionById(chat.ChatId).VisitorId).Name);
            SendMessage(m2);
            return AcceptChatRequestReturn_OK;
        }
        else if (chat.Status == ChatStatus.Decline)
        {
            return AcceptChatRequestReturn_Error_ChatRequestCanceled;
        }
        else
        {

            return AcceptChatRequestReturn_Error_Others;
        }
    }

    public static Chat GetChatById(string chatId)
    {
       // return chats.Find(c => c.ChatId == chatId);
        foreach (Chat item in chats)
        {
            if (item.ChatId==chatId)
            {
                return item;
            }
        }
        return null;
    }
    /// <summary>
    /// �ÿ�����Ի�
    /// </summary>
    /// <param name="chatRequest"></param>
    public static void ChatPageRequestChat(Chat chatRequest)
    {
        Chat ch = null;
        foreach (Chat item in chats)
        {
            if (item.ChatId==chatRequest.ChatId)
            {
                ch = item;
            }
        }
        if (ch != null)
        {
            chats.Remove(ch);
            chats.Add(chatRequest);
        }
        else
        {
            chats.Add(chatRequest);
            Provider.AddChat(chatRequest);
        }

        VisitSession s = VisitSessionService.GetSessionById(chatRequest.ChatId);
        s.ChatRequestTime = DateTime.Now;
        Message m = new Message();
        m.ChatId = chatRequest.ChatId;
        m.Text = "���ڽ���ͷ������Ե�...";
        m.Type = MessageType.SystemMessage_ToVisitor;
        m.Source = "ϵͳ";
        m.Destination = "�ÿ�";
        MessageService.AddMessage(m);
    }
    /// <summary>
    /// �ͷ���������Ի�
    /// </summary>
    /// <param name="operatorId">�ͷ�ID</param>
    /// <param name="visitorId"></param>
    public static int OperatorRequestChat(string operatorId, string visitorId)
    {
        Visitor visitor = VisitorService.GetVisitor(visitorId);

        Chat chat = ChatService.GetChatById(visitor.CurrentSessionId);
        
        if (chat == null)
        {
            Operator op = OperatorService.GetOperatorById(operatorId);
            op.Status = OperatorStatus.InviteChat;//���ͷ���Ϊ������
            chat = new Chat();
            chat.ChatId = visitor.CurrentSessionId;
            chat.CreateBy = op.NickName;
            chat.CreateTime = DateTime.Now;
            chat.AccountId = op.AccountId;
            chat.VisitorId = visitorId;
            chat.OperatorId = operatorId;
            chats.Add(chat);
            Provider.AddChat(chat);
        }
         

        chat.Status = ChatStatus.Requested;
        Message m = new Message();
        m.ChatId =chat.ChatId;
        m.Text = "��������ÿͣ����Ե�...";
        m.Type = MessageType.SystemMessage_ToOperator;
        MessageService.AddMessage(m);
        return 0;
    }
    /// <summary>
    /// ���ͷ��Ƿ񷢳���������
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    public static string GetOperatorInvation(string visitorId)
    {
        Chat chat=GetChatById(VisitorService.GetVisitor(visitorId).CurrentSessionId);
        if (chat != null && chat.Status == ChatStatus.Requested && !string.IsNullOrEmpty(chat.OperatorId))
        {
            return chat.ChatId;
        }
        return null;
    }
    /// <summary>
    /// �ܾ��ͷ��Ự����
    /// </summary>
    /// <param name="chatId"></param>
    public static void DeclineOperatorInvitation(string chatId)
    {
        Chat chat = GetChatById(chatId);
        if (chat != null)
        {
            OperatorService.GetOperatorById(chat.OperatorId).Status = OperatorStatus.Idle;//���ͷ�״̬��Ϊ������
            chat.Status = ChatStatus.Decline;
            MessageService.AddMessage(new Message(chat.ChatId, "�ÿ��Ѿܾ��Ի�����!", MessageType.SystemMessage_ToOperator));
        }        
    }
    /// <summary>
    /// ���ܿͷ��Ự����
    /// </summary>
    /// <param name="chatId"></param>
    public static void AcceptOperatorInvitation(string chatId)
    {
        Chat chat = GetChatById(chatId);
        if (chat != null)
        {
            chat.Status = ChatStatus.Accepted;
            VisitSessionService.GetSessionById(chat.ChatId).Status = VisitSessionStatus.Chatting;//���ͷ�״̬��Ϊ�Ի���
            VisitSessionService.GetSessionById(chat.ChatId).ChatingTime = DateTime.Now;
        }
        MessageService.AddMessage(new Message(chat.ChatId, "�ÿ��ѽ��ܶԻ�����!", MessageType.SystemMessage_ToOperator));
    }
}
