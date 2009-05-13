using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using System.Text;
using System.Web.Mail;
using LiveSupport.LiveSupportDAL.SqlProviders;



public class ChatService
{
    static ChatService()
    { 
    }

    private static List<Chat> chats = new List<Chat>();

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
        mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "410396629@qq.com");
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
    public static void ChatPageRequestChat(Chat chatRequest)
    {
        chats.Add(chatRequest);

        SqlChatProvider.AddChat(chatRequest);
        Message m = new Message();
        m.ChatId = chatRequest.ChatId;
        m.Text = "正在接入客服，请稍等...";
        m.Type = MessageType.SystemMessage_ToVisitor;
        MessageService.AddMessage(m);
    }

    public static List<Chat> GetAllChatRequest(string accountId)
    {
        return chats.FindAll(c => c.AccountId == accountId);
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
                return 0;
            }
            else
            {
                return -3;
            }
        }
        else
        {
            return -2;
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
}
