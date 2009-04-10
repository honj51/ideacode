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
            //this.ObjectDataSource1.SelectParameters["accountId"] = AccountsManager.GetAccount().Id.ToString();
            //this.ObjectDataSource1.DataBind();
        }
        
    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["accountId"] = AccountsManager.GetAccount().Id.ToString();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdEdit")
        {            
            Response.Redirect("OperatorEdit.aspx?operatorId="+e.CommandArgument.ToString());
        }
        else if (e.CommandName == "cmdDelete")
        {

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("OperatorCreate.aspx?cmd=cmdInsert");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int operatorId = (int)this.GridView1.DataKeys[e.Row.RowIndex].Value;
            ImageButton imbtnEdit;
            imbtnEdit = (ImageButton)e.Row.FindControl("ImageButtonEdit");
            imbtnEdit.AlternateText = "编辑";
            imbtnEdit.CommandArgument = operatorId.ToString();

            ImageButton imbtnDelete = (ImageButton)e.Row.FindControl("ImageButtonDelete");
            //assigning alternate text for w3c validation
            imbtnDelete.AlternateText = "删除";
            imbtnDelete.CommandArgument = e.Row.RowIndex.ToString(System.Globalization.CultureInfo.CurrentCulture.NumberFormat);
            imbtnDelete.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete?');");
        }

    }
}
