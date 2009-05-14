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
using System.Net.Mail;
using System.Net;

public partial class CutPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ChatService.SendEmail("330263258@qq.com", "老翁鸡测试一下！！", "<html><body><img src='http://b19.photo.store.qq.com/http_imgload.cgi?/rurl4_b=7e1d86c59086a6cdd74a4fd31c97741d60aeff8047c3a53a82eaa98b8f46f5807ec162c9af0d0c03bd00b85adeefc76d41ae966565209f9fe811857b719838097d78df78c62ec29c69608a5572cbff8d24cc6461' width='135' height='130' /></body></html>");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();

        msg.From = new MailAddress("410396629@qq.com");
        msg.To.Add(new MailAddress("330263258@qq.com"));

        msg.Subject = "式工";
        msg.Body ="fdsafdsafdsa";
      //   string attachFile;
      //   attachFile = FileUpload1.FileName;

      // System.Net.Mail.Attachment mailadd = new Attachment(FileUpload1.PostedFile.InputStream, attachFile);

       // msg.Attachments.Add(mailadd);

        SmtpClient smt = new SmtpClient();
        smt.Host = "smtp.qq.com";
        smt.Port = 25;
        smt.Credentials = new NetworkCredential("410396629", "19870312");
        smt.Send(msg);
    }
}