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
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //登录
    protected void LoginButton_Click(object sender, EventArgs e)
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
