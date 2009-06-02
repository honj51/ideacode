using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using System.Net;

namespace LiveSupport.BLL
{
    public class Util
    {
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
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(ConfigurationManager.AppSettings["Email"].ToString());//发送者
            mail.To.Add(new MailAddress(to));//收信者
            mail.Subject = subject;//主题
            mail.Body = body; //正文
            SmtpClient mailer = new SmtpClient(ConfigurationManager.AppSettings["SMTPServer"].ToString());
            mailer.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
            mailer.Send(mail);
        }
        #endregion
 
    }
}
