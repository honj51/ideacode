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

public partial class Default2 : System.Web.UI.Page
{
    public Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            account = (Account)Session["User"];
        }
        else
        {
            Response.Redirect("../Default.aspx");
        }
    }
    public string GetAccountId()
    {
        return account.AccountId;

    }
}
