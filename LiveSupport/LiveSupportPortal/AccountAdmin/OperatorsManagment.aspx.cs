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

public partial class AccountAdmin_OperatorsManangment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {
            MembershipUser user = Membership.GetUser();
            this.ObjectDataSource1.SelectParameters.Clear();
            QueryStringParameter p = new QueryStringParameter("accountId", TypeCode.Int32, AccountsManager.GetAccount().Id.ToString());
            p.DefaultValue = "3";
            this.ObjectDataSource1.SelectParameters.Add(p);
            //this.ObjectDataSource1.SelectParameters["accountId"] = AccountsManager.GetAccount().Id.ToString();
            this.ObjectDataSource1.DataBind();
        }
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
