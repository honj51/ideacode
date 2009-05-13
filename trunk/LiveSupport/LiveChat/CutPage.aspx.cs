using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Windows.Forms;
using System.Windows;
using LiveSupport.LiveSupportModel;
using System.Web.Mail;
public partial class CutPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChatService.SendEmail("330263258@qq.com", "老翁鸡测试一下！！", "呵呵");
        //string sReturn = string.Empty;
        //MailMessage mailMsg = new MailMessage();
        //mailMsg.BodyFormat = MailFormat.Html;
        //mailMsg.To = "tao410396629@126.com";
        //mailMsg.From = "410396629@qq.com";
        //mailMsg.Subject = "email.Subject";
        //mailMsg.Body = "email.Body";

        //mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1"); 
        // mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "410396629@qq.com"); 
        // mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", ""); 
        //SmtpMail.SmtpServer = "smtp.qq.com";//smpt服务器 
        //try
        //{
        //    SmtpMail.Send(mailMsg);
        //    this.Label1.Text = "发送成功";
        //}
        //catch (Exception err)
        //{
        //    this.Label2.Text = "<font color=red>发送失败" + err.Message.ToString() + "</font>";
        //}
    }
}