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

public partial class Default2 : System.Web.UI.Page
{
    Account account;
    protected void Page_Load(object sender, EventArgs e)
    {

            if (Session["User"] != null)
            {
                account = (Account)Session["User"];
                this.txtNickname.Text = account.NickName;
            }
            else
            {
                Response.Redirect("../Login.aspx");
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
        if (this.txtAgoPwd.Text != account.Password)
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
        string accountId = account.AccountId;
        string password = this.txtPwd.Text; ;
        string nickName = this.txtNickname.Text; ;
        bool b=AccountsManager.UpdateAccountByAccountId(accountId, password, nickName);
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
}
