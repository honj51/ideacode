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
using LiveSupport.BLL;
using System.Collections.Generic;

public partial class Default2 : System.Web.UI.Page
{
    Account account;
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
    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["AccountId"] = account.AccountId;
    }
    protected void gvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#6699ff'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");

            string departmentId = this.gvDepartment.DataKeys[e.Row.RowIndex].Value.ToString();
            ImageButton imbtnEdit;
            imbtnEdit = (ImageButton)e.Row.FindControl("ImageButtonEdit");
            imbtnEdit.AlternateText = "编辑";
            imbtnEdit.CommandArgument = departmentId.ToString();

            ImageButton imbtnDelete = (ImageButton)e.Row.FindControl("ImageButtonDelete");
            imbtnDelete.AlternateText = "删除";
            imbtnDelete.CommandArgument = departmentId.ToString();
            imbtnDelete.Attributes.Add("onclick", "javascript:return confirm('确定删除客服账户?');");
        }
    }
    protected void gvDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName == "cmdEdit")
        //{
        //    Response.Redirect("OperatorEdit.aspx?operatorId=" + e.CommandArgument.ToString());
        //}
        //else
        if (e.CommandName == "cmdDelete")
        {
            bool b=DepartmentManager.DeleteDepartmentById(e.CommandArgument.ToString());
            if (b)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('删除成功'); window.location='DepartmentManager.aspx';</script>");
                return;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请先删除该部门下的客服');window.location='OperatorsManagment.aspx';</script>");
                return;
            }
        }
    }
    protected void gvDepartment_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //this.gvDepartment.EditIndex = e.NewEditIndex;
        
    }
}
