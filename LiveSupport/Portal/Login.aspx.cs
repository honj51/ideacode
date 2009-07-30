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
        Session["user"] = null;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string accountNumber = this.txtNumber.Text;
        string loginName = this.UserName.Text;
        string loginPwd = this.Password.Text;

        Operator oper = OperatorsManager.Login(accountNumber, loginName, loginPwd);

        if (oper != null)
        {
            Session["User"] = oper;
            if (Request.QueryString["redirect"] != null)
            {
                Response.Redirect(Request.QueryString["redirect"].ToString());
            } 
            else
            {
                this.Response.Redirect("~/AccountAdmin/AccountHome.aspx");
            }
  
        }
        else
        {
            this.FailureText.Text = "您的登录尝试不成功。请重试。";
        }
    }
}
