using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    Operator oepr;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] != null)
        {
            oepr = (Operator)Session["User"];
            this.txtCompanyName.Text = oepr.Account.CompanyName;
        }
        else
        {
            Response.Redirect("../Default.aspx");
        }

    }
    //添加
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtDepartmentName.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('部门不能为空');</script>");
            return;
        }
        Department dep = new Department();
        dep.DepartmentId = Guid.NewGuid().ToString();
        dep.DepartmentName = this.txtDepartmentName.Text;
        dep.Account = AccountsManager.GetAccountByAccountId(oepr.Account.AccountId);
        dep.IsDefault = false;
        dep.AddDate = DateTime.Now.ToString();
        bool b = DepartmentManager.AddDepartment(dep);
        if (b)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('添加成功'); window.location='DepartmentManager.aspx';</script>");
            return;
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('已经存在此部门');</script>");
            return;
        }
    }
}
