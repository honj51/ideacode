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

public partial class AdminManager_left : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
}
