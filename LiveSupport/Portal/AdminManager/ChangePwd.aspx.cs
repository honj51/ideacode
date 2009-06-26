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

public partial class AdminManager_UpdateAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.txtAdminLoginName.Text = ConfigurationManager.AppSettings["AdminUser"].ToString();
        AdminUser user;
        if (Session["adminUser"] != null)
        {
            user = Session["adminUser"] as AdminUser;
        }
        else
        {
            this.Response.Write("<script>alert('登陆超时,请从新登陆...');window.location='Default.aspx';</script>");
            return;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (this.txtOldPwd.Text == ConfigurationManager.AppSettings["AdminPwd"].ToString())
        {
            ConfigurationManager.AppSettings["AdminPwd"] = this.txtAdminPwd.Text;
            //Script.Alert("[密码修改成功！]", "Main.aspx");
            this.Response.Redirect("Default.aspx");
        }
        else
        {
           // this.ltb.Show("[原密码错误，请重新输入！]");
            
        }
    }
}
