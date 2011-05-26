using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{

    protected void Page_Load(object sender, EventArgs e)
    {

        string admin_id = (string)Session["admin_id"];
        if (string.IsNullOrEmpty(admin_id))
        {
            Response.Redirect("Login.aspx");
        }
    }
}
