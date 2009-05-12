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
using LiveSupport.DAL.Entity;
using LiveSupport.BLL;

public partial class Default2 : System.Web.UI.Page
{
    Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
     
            if (Session["User"] != null)
            {
                account =(Account)Session["User"];
            }
            else
            {
                this.Response.Redirect("../Login.aspx");
            }
        
    }
    //插入
    //protected void LinkButton2_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (this.txtLoginName.Text == "")
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入坐席用户名');</script>");
    //            return;
    //        }
    //        if (this.txtPwd.Text == "")
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入密码');</script>");
    //            return;
    //        }
    //        Operator op = new Operator();
    //        op.AccountId = account.Id;
    //        op.Name = this.txtLoginName.Text;
    //        op.Password = this.txtPwd.Text;
    //        op.Email = this.txtEmail.Text;
    //        if (cbIs.Checked == true)
    //            op.IsOnline = true;
    //        else
    //            op.IsOnline = false;
    //        OperatorsManager.InsertOperator(op);
    //        this.Response.Redirect("OperatorsManagment.aspx");
    //    }
    //    catch (Exception ex)
    //    {
            
    //    }
    //}
    //protected void LinkButton3_Click(object sender, EventArgs e)
    //{
    //    this.Response.Redirect("OperatorsManagment.aspx");
    //}
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
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
            if (this.txtPwd.Text!=this.txtPwds.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('重置密码与密码不相同,请从新输入...');</script>");
                return;
            }
            Operator op = new Operator();
            op.AccountId = account.Id;
            op.Name = this.txtLoginName.Text;
            op.Password = this.txtPwd.Text;
            op.Email = this.txtEmail.Text;
            if (cbIs.Checked == true)
                op.IsOnline = true;
            else
                op.IsOnline = false;
            OperatorsManager.InsertOperator(op);
            this.Response.Redirect("OperatorsManagment.aspx");
        }
        catch (Exception ex)
        {

        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        this.Response.Redirect("OperatorsManagment.aspx");
    }
}
