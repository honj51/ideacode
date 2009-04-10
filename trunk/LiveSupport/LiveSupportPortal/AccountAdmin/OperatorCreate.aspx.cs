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

public partial class AccountAdmin_OperatorCreate : System.Web.UI.Page
{
    //private Operator op;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["accountId"] = AccountsManager.GetAccount().Id.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        this.DataBind();
        
        Operator op = this.DetailsView1.DataItem as Operator;
        op.Name = this.DetailsView1.
        OperatorsManager.SaveOperator(op);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}
