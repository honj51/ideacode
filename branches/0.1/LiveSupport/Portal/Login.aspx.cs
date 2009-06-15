using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class Login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string loginId = this.UserName.Text;
        string loginPwd = this.Password.Text;

        Account acc = AccountsManager.Login(loginId, loginPwd);

        if (acc != null)
        {
            Session["User"] = acc;
            this.Response.Redirect("~/AccountAdmin/AccountHome.aspx");
        }
        else
        {
            this.FailureText.Text = "您的登录尝试不成功。请重试。";
        }
    }
}
