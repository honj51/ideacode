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
using LiveSupport.LiveSupportModel;

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
   //增加
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
            op.OperatorId = Guid.NewGuid().ToString();
            op.AccountId = account.AccountId;
            op.LoginName = this.txtLoginName.Text;
            op.Password = this.txtPwd.Text;
            op.NickName = this.txtNickName.Text;
            op.IsAdmin = Boolean.Parse(this.ddlIsAdmin.SelectedValue.Trim());
            
            op.Status = (OperatorStatus)Enum.Parse((typeof(OperatorStatus)), this.ddlStatus.SelectedValue);
            op.AVChatStatus = this.ddlAVChatStatus.SelectedValue;
            op.Email = this.txtEmail.Text;


            OperatorsManager.NewOperator(op);
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
