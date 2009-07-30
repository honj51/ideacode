﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class AccountAdmin_Default2 : System.Web.UI.Page
{
    Operator oper;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["User"] != null)
        {
            oper = (Operator)Session["User"];
            if (!IsPostBack)
                DataBindDepartment(oper.Account.AccountId);
        }
        else
        {
            this.Response.Redirect("../Login.aspx?redirect=" + HttpContext.Current.Request.Url.PathAndQuery);
        }


    }
    //绑定公司部门
    public void DataBindDepartment(string accountId)
    {
        this.ddlDepartment.DataSource = DepartmentManager.GetDepartmentByAccountId(accountId);
        this.ddlDepartment.DataTextField = "DepartmentName";
        this.ddlDepartment.DataValueField = "DepartmentId";
        this.ddlDepartment.DataBind();
    }
    //增加
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (this.ddlDepartment.Items.Count <= 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请先添加部门');window.location='AddDepartment.aspx';</script>");
                return;
            }
            if (this.txtLoginName.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入坐席用户名');</script>");
                return;
            }
            if (this.txtPwd.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入密码');</script>");
                return;
            }
            if (this.txtPwd.Text != this.txtPwds.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('重置密码与密码不相同,请从新输入...');</script>");
                return;
            }
            Operator op = new Operator();
            op.Account = oper.Account;
            op.LoginName = this.txtLoginName.Text;
            op.Password = this.txtPwd.Text;
            op.NickName = this.txtNickName.Text;
            op.IsAdmin = false;
            op.Department = DepartmentManager.GetDepartmentById(this.ddlDepartment.SelectedValue);
            op.Status = (OperatorStatus)Enum.Parse((typeof(OperatorStatus)),OperatorStatus.Offline.ToString());
            op.AVChatStatus = OperatorStatus.Offline.ToString() ;
            op.Email = this.txtEmail.Text;


            bool b = OperatorsManager.NewOperator(op);
            if (b)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('添加成功!');window.location='OperatorsManagment.aspx';</script>");
                return;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('已经存在此客服ID');</script>");
                return;
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('添加失败');</script>");
            return;
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        this.Response.Redirect("OperatorsManagment.aspx");
    }
}
