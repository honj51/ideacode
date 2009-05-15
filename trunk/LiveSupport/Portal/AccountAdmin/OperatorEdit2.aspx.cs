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
            if (!IsPostBack)
            {
                if (Request.QueryString["operatorId"] != null)
                {
                    DataBindDepartment(account.AccountId);
                    string operatorId = Request.QueryString["operatorId"].ToString();
                    DataBindOperator(operatorId);
                }
            }
        }
        else
        {
            this.Response.Redirect("../Login.aspx");
        }
    }
    //绑定公司部门
    public void DataBindDepartment(string AccountId)
    {
        List<Department> list = DepartmentManager.GetDepartmentByAccountId(AccountId);
        if (list != null)
        {
            this.ddlDepartment.DataSource = list;
            this.ddlDepartment.DataTextField = "DepartmentName";
            this.ddlDepartment.DataValueField = "DepartmentId";
            this.ddlDepartment.DataBind();
        }
    }
    //绑定客服信息
    public void DataBindOperator(string operatorId)
    {
        Operator op=OperatorsManager.GetOperatorByOperatorId(operatorId);
        this.ddlDepartment.SelectedValue = op.Department.DepartmentId;
        this.txtLoginName.Text = op.LoginName;
        this.txtNickName.Text = op.NickName;
        this.txtPwd.Text = op.Password;
        this.txtEmail.Text = op.Email;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
}
