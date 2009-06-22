using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using LiveSupport.LiveSupportModel;

public partial class AdminManager_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //登陆
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        string adminName = ConfigurationManager.AppSettings["AdminUser"].ToString();
        string adminPwd = ConfigurationManager.AppSettings["AdminPwd"].ToString();
        if (this.txtUser.Text == adminName && this.txtPwd.Text == adminPwd)
        {
            AdminUser user = new AdminUser();
            user.AdminName = adminName;
            user.AdminPwd = adminPwd;
            user.LoginDate = DateTime.Now;
            user.LoginIP = Request.ServerVariables["LOCAL_ADDR"];
            int count=Convert.ToInt32(ConfigurationManager.AppSettings["LoginCount"].ToString());
            count++;
            user.LoginCount = count;

            ConfigurationManager.AppSettings["LoginCount"] = user.LoginCount + "";
            ConfigurationManager.AppSettings["LoginIP"] = user.LoginIP;
            ConfigurationManager.AppSettings["LoginDate"] = user.LoginDate.ToString();
            Session["adminUser"] = user;
            this.Response.Redirect("Frame.aspx");
        }
        else
        {
            this.ltlTip.Text = "登陆失败!";
        }
    }
}
