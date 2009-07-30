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
            LiveSupport.BLL.NewWebSite  nwst= new LiveSupport.BLL.NewWebSite();
            LiveSupport.BLL.Banner bnr = new LiveSupport.BLL.Banner();
            bnr.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
            bnr.Offline = "offline0.JPG";
            bnr.Online = "online0.JPG";
            LiveSupport.BLL.Invite ivt = new LiveSupport.BLL.Invite();
            ivt.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
            ivt.Bgimg = "invite_bg0.gif";
            ivt.Noimg = "btn_no0.jpg";
            ivt.Okimg = "btn_ok0.jpg";
            LiveSupport.BLL.ChatPage cpg = new LiveSupport.BLL.ChatPage();
            cpg.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
            cpg.ChatPageBGImg = "chat_bg0.gif";
            cpg.ChatPageRightImg = "right_column_0.jpg";
            cpg.LeavePageTopImg = "topmove1.gif";
            nwst.banners = bnr;
            nwst.invites = ivt;
            nwst.chatpage = cpg;
            nwst.accountId = oepr.Account.AccountId;
            nwst.icoLocation = "0";
            nwst.domainName = this.txtDomainName.Text;
            if (WebSiteManager.AddNewWebSite(nwst))
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
