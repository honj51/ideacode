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
    //添加域名
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["User"] != null)
        {
            oepr = (Operator)Session["User"];
            if (WebSiteManager.GetWebSiteByDomainName(this.txtDomainName.Text) != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('域名存在');</script>");
                return;
            }
            WebSite website = new WebSite();
            website.DomainName = this.txtDomainName.Text;
            website.ChatStyle = "0";
            website.IcoLocation = "0";
            website.IconStyle = "0";
            website.InviteStyle = "0";
            website.RegisterId = oepr.Account.AccountId;
            if (WebSiteManager.NewWebSite(website))
            {
                Response.Redirect("GetCode.aspx?domain=" + this.txtDomainName.Text);
            }
        }
        else
        {
            Response.Redirect("../Default.aspx");
        }
    }
}
