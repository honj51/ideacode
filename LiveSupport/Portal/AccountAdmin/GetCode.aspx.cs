using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    private Operator  oper;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            oper = (Operator)Session["User"];
        }
        else
        {
            Response.Redirect("../Default.aspx");
        }
    }
    public string GetAccountId()
    {
        return oper.Account.AccountId;

    }
}
