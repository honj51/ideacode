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
using LiveSupport.BLL;
using LiveSupport.DAL.Entity;

public partial class AccountAdmin_OperatorsManangment : System.Web.UI.Page
{
    Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
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
        //if (!Page.User.Identity.IsAuthenticated)
        //{
        //    Response.Redirect("../Default.aspx");
        //}
        //else
        //{
        //this.ObjectDataSource1.SelectParameters["accountId"] = AccountsManager.GetAccount().Id.ToString();
        //this.ObjectDataSource1.SelectParameters["accountId"] = account.Id;
        //this.ObjectDataSource1.DataBind();
        //}
        
    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        //e.InputParameters["accountId"] = AccountsManager.GetAccount().Id.ToString();
        e.InputParameters["accountId"]=account.Id.ToString(); 
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
            OperatorsManager.DeleteOperator(int.Parse(e.CommandArgument.ToString()));
            Response.Redirect("OperatorsManagment.aspx");
        }
    }
    //增加客服
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("OperatorCreate.aspx?cmd=cmdInsert");
        Response.Redirect("OperatorCreate2.aspx?");
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
            //imbtnDelete.CommandArgument = e.Row.RowIndex.ToString(System.Globalization.CultureInfo.CurrentCulture.NumberFormat);
            imbtnDelete.CommandArgument = operatorId.ToString();
            imbtnDelete.Attributes.Add("onclick", "javascript:return confirm('确定删除客服账户?');");
        }

    }
}
