using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;
using System.Configuration;

public partial class GetBackPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnGet_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Session["createRandom"] != null)
            {
                if (this.txtRandom.Text == Session["createRandom"].ToString())
                {
                    Operator oper = OperatorsManager.GetPasswordByAccountNumberLoginNameAndEmail(this.txtAccountNumber.Text.Trim(), this.txtOperatorLoginName.Text.Trim(), this.txtEmail.Text.Trim());

                    if (oper != null)
                    {
                        string toEmail = this.txtEmail.Text;
                        string email = ConfigurationManager.AppSettings["Email"];
                        string emailPwd = ConfigurationManager.AppSettings["Password"];
                        string emailSmtp = ConfigurationManager.AppSettings["SMTPServer"];
                        string title = "互动科技LiveSpport在线客服系统提示您：";
                        string content = "尊敬的客服 " + oper.NickName + " 您好!\n   您公司ID为："+oper.Account.AccountNumber+",您的账号为：" + oper.LoginName + ",您的密码为：" + oper.Password + ",请您牢记,感谢您一直以来对我们公司产品的支持与厚爱!\n \n \n \n \n \n \n \n                                                        如需帮助请浏览我们公司的官方网站 http://www.hudongsoft.cn";
                        bool b = LiveSupport.BLL.Utils.Util.SendEmailAsync(toEmail, email, emailPwd, emailSmtp, title, content);
                        if (b)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('您的密码已经发送至您的Email中,请您查阅...');window.location='index.aspx';</script>");
                            return;
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('发送失败,从稍候从试...');</script>");
                            return;
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('您的账号或Email错误!');</script>");
                        return;
                    }


                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('验证码输入错误!');</script>");

                }
            }
        }
        catch (Exception ex)
        {

        }
    }
}
