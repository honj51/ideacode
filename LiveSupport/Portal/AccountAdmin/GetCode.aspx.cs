using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
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
