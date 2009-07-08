using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using LiveSupport.LiveSupportModel;

public partial class PortalMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Operator oper = (Operator)Session["User"];
            this.lblUserName.Text = oper.NickName;
            this.PanelShow.Visible = true;
            this.PanelLogin.Visible = false;
        }
        else
        {
            this.PanelLogin.Visible = true;
            this.PanelShow.Visible = false;

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        this.Response.Redirect("Index.aspx");
        this.PanelLogin.Visible = true;
    }
}
