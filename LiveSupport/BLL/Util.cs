using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using System.Diagnostics;
using System.Threading;
using System.Web;
using System.Web.Configuration;

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
            Trace.WriteLine(string.Format("Util.SendEmail(toEmail={0},email={1},emailPwd={2},emailSmtp={3},subject={4},body={5})", toEmail, email, emailPwd, emailSmtp, subject, body));
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
                Trace.WriteLine(string.Format("Error:Util.SendEmail 错误信息：{0}", ex.Message));
                return false;
            }
        }

        public static bool SendEmailAsync(string toEmail, string email, string emailPwd, string emailSmtp, string subject, string body)
        {
            try
            {
                AsyncEmailCarrier c = new AsyncEmailCarrier(toEmail, email, emailPwd, emailSmtp, subject, body);
                c.Send();

            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        class AsyncEmailCarrier 
        {
            public AsyncEmailCarrier(string toEmail, string email, string emailPwd, string emailSmtp, string subject, string body)
            {
                this.toEmail = toEmail;
                this.email = email;
                this.emailPwd = emailPwd;
                this.emailSmtp = emailSmtp;
                this.subject = subject;
                this.body = body;
            }

            public void Send()
            {
                Thread t = new Thread(new ThreadStart(threadFun));
                t.Start();
            }

            private void threadFun()
            {
                SendEmail(toEmail, email, emailPwd, emailSmtp, subject, body);
            }

            public string toEmail;
            public string email;
            public string emailPwd;
            public string emailSmtp;
            public string subject;
            public string body;

        }

        public bool IsImageFile(string fileName)
        {
            if (fileName.EndsWith(".bmp", System.StringComparison.CurrentCultureIgnoreCase) || fileName.EndsWith(".jpg", System.StringComparison.CurrentCultureIgnoreCase) || fileName.EndsWith(".gif", System.StringComparison.CurrentCultureIgnoreCase) || fileName.EndsWith(".png", System.StringComparison.CurrentCultureIgnoreCase))
            {
                return true;
            }
            return false; 
        }

        #endregion

        #region 取系统时间状态
        public static SysDateStates sysInfo = new SysDateStates();
      
        public static SysDateStates GetSysInfo()
        {
            return sysInfo;
        }
        public class SysDateStates
        {
            private DateTime startApplicationDate;

            public DateTime StartApplicationDate
            {
                get { return startApplicationDate; }
                set { startApplicationDate = value; }
            }
            private DateTime endApplicationDate;

            public DateTime EndApplicationDate
            {
                get { return endApplicationDate; }
                set { endApplicationDate = value; }
            }
            private DateTime errorDatre;

            public DateTime ErrorDatre
            {
                get { return errorDatre; }
                set { errorDatre = value; }
            }
            private DateTime startSessionDate;

            public DateTime StartSessionDate
            {
                get { return startSessionDate; }
                set { startSessionDate = value; }
            }
            private DateTime endSessionDate;

            public DateTime EndSessionDate
            {
                get { return endSessionDate; }
                set { endSessionDate = value; }
            }
        }
        #endregion

        #region 截取域名
        /// <summary>
        /// 截取域名
        /// </summary>
        /// <param name="urlReferer"></param>
        /// <returns></returns>
        public static string GetDomainName(string urlReferer)
        {
            string url = urlReferer.Replace("http://", string.Empty).ToString().Replace("https://", string.Empty).ToString();
            char[] c = "/".ToCharArray();

            string[] result = url.Split(c[0]);

            if (result[0] != null && result[0] != string.Empty)
                return result[0];
            else
                return string.Empty;
        }
        public static string GetApplicationPath(string urlReferer)
        {
            string url = urlReferer.ToString();
            char[] c = "/".ToCharArray();
            string[] result = url.Split(c[0]);
            if (result[0] != null && result[0] != string.Empty)
            {
                if (url.ToLower().Contains("localhost"))
                {
                    if (result.Length >= 3)
                    {
                        return result[0] + "//" + result[2] + "/"+result[3];
                    }
                    else
                    {
                        return result[0];
                    }
                }
                else
                {
                    return result[0];
                }
            }
            else
            {
                return string.Empty;
            }
        }
        #endregion

        #region 检查文件是否存在
        /// <summary>
        /// 返回文件是否存在
        /// </summary>
        /// <param name="filename">文件名</param>
        /// <returns>是否存在</returns>
        public static bool FileExists(string filename)
        {
            return System.IO.File.Exists(filename);
        }
        #endregion

        #region 获得当前绝对路径
        /// <summary>
        /// 获得当前绝对路径
        /// </summary>
        /// <param name="strPath">指定的路径</param>
        /// <returns>绝对路径</returns>
        public static string GetMapPath(string strPath)
        {
            if (HttpContext.Current != null)
            {
                return HttpContext.Current.Server.MapPath(strPath);
            }
            else //非web程序引用
            {
                strPath = strPath.Replace("/", "\\");
                if (strPath.StartsWith("\\"))
                {
                    strPath = strPath.Substring(strPath.IndexOf('\\', 1)).TrimStart('\\');
                }
                return System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, strPath);
            }
        }
        #endregion

        #region 更改配置文件中appsettings节点信息
        /// <summary>
        /// 更改配置文件中appsettings节点信息
        /// </summary>
        /// <param name="key">键名</param>
        /// <param name="value">值</param>
        /// <param name="type">类型（add,delete,update）</param>
        /// <returns></returns>
        public static bool SetappSettings(string key, string value, string type)
        {
            //打开配置文件
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
            //获取appSettings节点
            AppSettingsSection appSection = (AppSettingsSection)config.GetSection("appSettings");
            bool isno = true;
            switch (type)
            {
                case "add":
                    appSection.Settings.Remove(key);
                    appSection.Settings.Add(key, value);
                    break;
                case "delete":
                    appSection.Settings.Remove(key);
                    break;
                case "update":
                    appSection.Settings[key].Value = value;
                    break;
                default:
                    isno = false;
                    break;
            }
            config.Save();
            return isno;
        }
        #endregion

        #region 设置连接字符串信息
        /// <summary>
        /// 设置连接字符串信息
        /// </summary>
        /// <param name="keyName">键名</param>
        /// <param name="connectionStrings">连接字符串</param>
        public static void SetConnectionStrings(string keyName, string connectionStrings)
        {
            System.Configuration.Configuration c = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            c.ConnectionStrings.ConnectionStrings.Clear();
            ConnectionStringSettings s = new ConnectionStringSettings();
            s.ConnectionString = connectionStrings;
            s.Name = keyName;
            c.ConnectionStrings.ConnectionStrings.Add(s);
            c.Save();
        }
        #endregion 
    }
}
