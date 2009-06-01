using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace LiveSupport.BLL
{
    public class EmailManager
    {
        #region 邮件
        public static bool SendEmail(string toEmail,string email,string emailPwd,string emailSmtp,string title,string content)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(email);//发送者邮箱
                mail.To.Add(new MailAddress(toEmail));//接收者邮箱
                mail.Subject = title;//主题
                string emailBody = content;             //内容
                mail.Body = emailBody;

                SmtpClient mailer = new SmtpClient(emailSmtp);//指定发送的服务器
                mailer.Credentials = new NetworkCredential(email,emailPwd);//用户名与密码
                mailer.Send(mail);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        #endregion
    }
}
