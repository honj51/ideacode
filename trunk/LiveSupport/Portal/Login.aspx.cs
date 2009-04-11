using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_LoginError(object sender, EventArgs e)
    {
        System.Web.UI.WebControls.Login l = (System.Web.UI.WebControls.Login)sender;
        MembershipUser u = Membership.GetUser(l.UserName);

        if (!u.IsApproved)
        {
            l.FailureText = "帐户证在审核中";
            return;
        }

        if (u.IsLockedOut)
        {
            l.FailureText = "您的帐户已经被锁定";
            return;
        }

        // 默认错误消息提示
        l.FailureText = "您的登录尝试失败，请重试。";

    }
}
