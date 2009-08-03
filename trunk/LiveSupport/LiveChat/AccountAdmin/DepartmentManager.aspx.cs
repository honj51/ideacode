using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    Operator oepr;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] != null)
        {
            oepr = (Operator)Session["User"];
        }
        else
        {
            Response.Redirect("Login.aspx?redirect=" + HttpContext.Current.Request.Url.PathAndQuery);
        }


    }
    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["AccountId"] = oepr.Account.AccountId;
    }
    protected void gvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#6699ff'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");

            string departmentId = this.gvDepartment.DataKeys[e.Row.RowIndex].Value.ToString();

            ImageButton imbtnDelete = (ImageButton)e.Row.FindControl("ImageButtonDelete");
            imbtnDelete.AlternateText = "删除";
            imbtnDelete.CommandArgument = departmentId.ToString();
            imbtnDelete.Attributes.Add("onclick", "javascript:return confirm('确定删除客服账户?');");
        }
    }
    protected void gvDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "cmdDelete")
        {
            Department depar = DepartmentManager.GetDepartmentById(e.CommandArgument.ToString());
            if (!depar.IsDefault)
            {
                bool b = DepartmentManager.DeleteDepartmentById(e.CommandArgument.ToString());
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
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('默认部门不允许删除!');</script>");
                return;
            }
        }
        
    }
    protected void gvDepartment_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //this.gvDepartment.EditIndex = e.NewEditIndex;

    }
    //修改
    protected void gvDepartment_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
    }
    protected void ObjectDataSource1_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["AccountId"] = oepr.Account.AccountId;
    }
    protected void gvDepartment_DataBound(object sender, EventArgs e)
    {
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("AddDepartment.aspx");
    }
}
