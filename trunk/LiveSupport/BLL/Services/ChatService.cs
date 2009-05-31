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
    #region const int 定义
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
    #region 字母随机数和发送邮件
    /// <summary>
    /// 字母随机数
    /// </summary>
    /// <param name="n">生成长度</param>
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
    /// 发送邮件
    /// </summary>
    /// <param name="to">收信人</param>
    /// <param name="subject">主题</param>
    /// <param name="body">正文</param>
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
    /// 重置座席密码
    /// </summary>
    /// <param name="loginName">登录名</param>
    public static int ResetOperatorPassword(string loginName)
    {
        Operator op = OperatorService.GetOperatorByLoginName(loginName);
        if (loginName != null || op != null)
        {
            if (op.Email != null)
            {
                string body = "你的新密码是：" + RandLetter(8);
                string subject = "密码激活";
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
    /// 判断此用户是否存在
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
    /// 关闭对话信息
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
        if (chat.OperatorId != null)
        {
            OperatorService.GetOperatorById(chat.OperatorId).Status = OperatorStatus.Idle;//关闭时改变客服状态
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
            m.Text = string.Format("{0}已关闭对话", closeBy);
            SendMessage(m);
            return true;
        }
        else
        {
            return false;
        }
    }
    /// <summary>
    /// 客服接受对话请求
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
            OperatorService.GetOperatorById(chat.OperatorId).Status = OperatorStatus.Chatting;//将客服状态改为正在对话中
            VisitSessionService.GetSessionById(chat.ChatId).Status = VisitSessionStatus.Chatting;
            VisitSessionService.GetSessionById(chat.ChatId).OperatorId = operatorId;
            VisitSessionService.GetSessionById(chat.ChatId).ChatingTime = DateTime.Now;
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
            m2.Text = string.Format("你已经接受访客{0}的对话请求",VisitorService.GetVisitor(VisitSessionService.GetSessionById(chat.ChatId).VisitorId).Name);
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
    /// 访客邀请对话
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
        m.Text = "正在接入客服，请稍等...";
        m.Type = MessageType.SystemMessage_ToVisitor;
        m.Source = "系统";
        m.Destination = "访客";
        MessageService.AddMessage(m);
    }
    /// <summary>
    /// 客服主动邀请对话
    /// </summary>
    /// <param name="operatorId">客服ID</param>
    /// <param name="visitorId"></param>
    public static int OperatorRequestChat(string operatorId, string visitorId)
    {
        if (operatorId == null)
        {
            return 3;
        }
        Visitor visitor = VisitorService.GetVisitor(visitorId);
        Chat chat = ChatService.GetChatById(visitor.CurrentSessionId); 
        if (chat == null)
        {
            Operator op = OperatorService.GetOperatorById(operatorId);
            op.Status = OperatorStatus.InviteChat;//将客服改为请求中
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
        OperatorService.GetOperatorById(operatorId).Status = OperatorStatus.InviteChat;//客服主动要请对话改变状态
        chat.Status = ChatStatus.Requested;
        Message m = new Message();
        m.ChatId =chat.ChatId;
        m.Text = "正在邀请访客，请稍等...";
        m.Type = MessageType.SystemMessage_ToOperator;
        MessageService.AddMessage(m);
        return 0;
    }
    /// <summary>
    /// 检查客服是否发出主动邀请
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
    /// 拒绝客服会话请求
    /// </summary>
    /// <param name="chatId"></param>
    public static void DeclineOperatorInvitation(string chatId)
    {
        Chat chat = GetChatById(chatId);
        if (chat != null)
        {
            OperatorService.GetOperatorById(chat.OperatorId).Status = OperatorStatus.Idle;//将客服状态改为空闲中
            chat.Status = ChatStatus.Decline;
            MessageService.AddMessage(new Message(chat.ChatId, "访客已拒绝对话邀请!", MessageType.SystemMessage_ToOperator));
        }        
    }
    /// <summary>
    /// 接受客服会话请求
    /// </summary>
    /// <param name="chatId"></param>
    public static void AcceptOperatorInvitation(string chatId)
    {
        Chat chat = GetChatById(chatId);
        if (chat != null)
        {
            chat.Status = ChatStatus.Accepted;
            if (chat.OperatorId != null)
            {
                OperatorService.GetOperatorById(chat.OperatorId).Status = OperatorStatus.Chatting;
            }
            VisitSessionService.GetSessionById(chat.ChatId).Status = VisitSessionStatus.Chatting;//将访客状态改为对话中
            VisitSessionService.GetSessionById(chat.ChatId).ChatingTime = DateTime.Now;
        }
        MessageService.AddMessage(new Message(chat.ChatId, "访客已接受对话邀请!", MessageType.SystemMessage_ToOperator));
    }
}
