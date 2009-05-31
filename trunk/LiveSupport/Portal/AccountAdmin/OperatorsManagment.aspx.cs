using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
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
    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        string id = account.AccountId;
        e.InputParameters["accountId"] = account.AccountId;
    }
    //增加客服
    protected void Button1_Click(object sender, EventArgs e)
    {

        //Response.Redirect("OperatorCreate.aspx?cmd=cmdInsert");
        Response.Redirect("OperatorCreate.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdEdit")
        {
            Response.Redirect("OperatorEdit.aspx?operatorId=" + e.CommandArgument.ToString());
        }
        else if (e.CommandName == "cmdDelete")
        {
            try
            {
                OperatorsManager.DeleteOperatorByid(e.CommandArgument.ToString());
                Response.Redirect("OperatorsManagment.aspx");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请删除客服的聊天记录'); window.location='ChatAnnal.aspx';</script>");
                return;
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#6699ff'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");

            string operatorId = this.GridView1.DataKeys[e.Row.RowIndex].Value.ToString();
            ImageButton imbtnEdit;
            imbtnEdit = (ImageButton)e.Row.FindControl("ImageButtonEdit");
            imbtnEdit.AlternateText = "编辑";
            imbtnEdit.CommandArgument = operatorId.ToString();

            ImageButton imbtnDelete = (ImageButton)e.Row.FindControl("ImageButtonDelete");
            imbtnDelete.AlternateText = "删除";
            imbtnDelete.CommandArgument = operatorId.ToString();
            imbtnDelete.Attributes.Add("onclick", "javascript:return confirm('确定删除客服账户?');");
        }
    }
}
