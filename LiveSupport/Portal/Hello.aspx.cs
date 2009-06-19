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

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null && Request.QueryString["loginName"] != null && Request.QueryString["Email"] != null)
            {
                this.lblId.Text = Request.QueryString["id"].ToString();
                this.lblLoginName.Text = Request.QueryString["loginName"].ToString();
                this.lblEmail.Text = Request.QueryString["Email"].ToString();
            }
            else
            {
                this.Response.Redirect("Register.aspx");
            }
        }
    }
}
