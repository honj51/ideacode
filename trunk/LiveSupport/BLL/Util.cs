﻿using System;
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
        #endregion
        #region 邮件
        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="toEmail">收收者</param>
        /// <param name="email">收信人</param>
        /// <param name="emailPwd">密码</param>
        /// <param name="emailSmtp">服务器</param>
        /// <param name="subject">主题</param>
        /// <param name="body">正文</param>
        /// <returns></returns>
        public static bool SendEmail(string toEmail, string email, string emailPwd, string emailSmtp, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(email);//发送者邮箱
                mail.To.Add(new MailAddress(toEmail));//接收者邮箱
                mail.Subject = subject;//主题
                mail.Body = body;//正文

                SmtpClient mailer = new SmtpClient(emailSmtp);//指定发送的服务器
                mailer.Credentials = new NetworkCredential(email, emailPwd);//用户名与密码
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
