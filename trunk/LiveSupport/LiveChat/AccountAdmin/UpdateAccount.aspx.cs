using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    Operator oper;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] != null)
        {
            oper = (Operator)Session["User"];
            if(!IsPostBack)
            this.txtNickname.Text = oper.NickName;
        }
        else
        {
            Response.Redirect("Login.aspx?redirect=" + HttpContext.Current.Request.Url.PathAndQuery);
        }

    }
    //密码修改
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (this.txtNickname.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('昵称不能为空');</script>");
            return;
        }
        if (this.txtAgoPwd.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('原始密码不能为空');</script>");
            return;
        }
        if (this.txtAgoPwd.Text != oper.Password)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('原始密码不正确');</script>");
            return;
        }
        if (this.txtPwd.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('新密码不能为空');</script>");
            return;
        }
        if (this.txtPwds.Text != this.txtPwd.Text)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('确认密码与新密码不一致');</script>");
            return;
        }
        oper.NickName = this.txtNickname.Text;
        oper.Password = this.txtPwds.Text;

        bool b = OperatorsManager.UpdateOperator(oper);
        if (b)
        {
           
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('修改成功!');window.location='../Login.aspx';</script>");
            return;
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('修改失败!');</script>");
            return;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AccountHome.aspx");
    }
}
