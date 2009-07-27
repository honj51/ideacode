<%@ WebHandler Language="C#" Class="LSBanner" %>

using System;
using System.Web;

public class LSBanner : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        string aid =context.Request.QueryString["aid"];
        LiveSupport.LiveSupportModel.Account account=  AccountService.GetAccountById(aid);//公司对象
        LiveSupport.LiveSupportModel.WebSite webSite=LiveSupport.BLL.WebSiteManager.GetWebSiteByDomainName(Lib.GetDomainName(context.Request.UrlReferrer.ToString()));//用堿名取一行数
        if (webSite == null)
        {
            webSite = new LiveSupport.LiveSupportModel.WebSite();
            webSite.DomainName =Lib.GetDomainName(context.Request.UrlReferrer.ToString());
            webSite.ChatStyle = "0";
            webSite.IcoLocation = "0";
            webSite.IconStyle = "0";
            webSite.InviteStyle = "0";
            webSite.RegisterId =aid; 
            LiveSupport.BLL.WebSiteManager.NewWebSite(webSite);
        }
        string IconStyle = webSite.IconStyle; //客服样式(图片)
        string inviteImageUrl;
        if (webSite.InviteStyle == "UserDefined")
        {
            inviteImageUrl = homeRootUrl + "/Images/" + account.AccountNumber + "/" + webSite.DomainName;
        }
        else
        {
            inviteImageUrl = homeRootUrl + "/Images/Default"; 
        }
        string InviteStyle =webSite.InviteStyle;//主动邀请样式
        string ChatStyle = webSite.ChatStyle;//聊天样式
        string IcoLocation = webSite.IcoLocation;//显示的位置样式
        string bannerType ="0";// 0: 简单按钮, 1: 客服列表, 2: 部门列表
        string LCS_BannerJs = "orientationIE.js";
        if (context.Request.QueryString["aid"] != null)
        { 
            aid=context.Request.QueryString["aid"];
        }
        if (account.CompanyName == null)
        {
            account.CompanyName = "LiveSupport";
        }
        ////判断浏览器
        if (context.Request.ServerVariables["HTTP_USER_AGENT"] != null)
        {
            if (context.Request.ServerVariables["HTTP_USER_AGENT"].ToString().Contains("Firefox"))
            {
                LCS_BannerJs = "orientationFireFox.js";
            }
        }
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.AppendLine(string.Format("var LCS_homeUrl = '{0}';",homeRootUrl));
        sb.AppendLine(string.Format("var LCS_inviteImageUrl = '{0}';", inviteImageUrl));
        sb.AppendLine(string.Format("var LCS_bannerType ={0};", bannerType));// 0: 简单按钮, 1: 客服列表, 2: 部门列表
        sb.AppendLine(string.Format("var LCS_bannerStyle = {0};",IconStyle));// 0,1,2 图片
        sb.AppendLine(string.Format("var LCS_invitePanelStyle = {0};",InviteStyle));// 0,1,2主动邀请样式
        sb.AppendLine(string.Format("var LCS_bannerPos = {0};",IcoLocation));// 0:固定, 1:左上角, 2:右上角,3:左边 ,4:右边, 5:左下角, 6:右下角
        sb.AppendLine(string.Format("var LCS_accountId = '{0}';",aid));
        sb.AppendLine(string.Format("var LCS_companyName = '{0}';", account.CompanyName));
        sb.AppendLine(" document.write('<script type=\"text/javascript\" language=\"javascript\" src=\"" + homeRootUrl + "/js/live2.js\"></script> ');");
        sb.AppendLine(" document.write('<script type=\"text/javascript\" language=\"javascript\" src=\"" + homeRootUrl + "/js/"+LCS_BannerJs+"\"></script> ');");
        context.Response.ContentType = "text/plain"; // context.Response.ContentType = "application/x-javascript";
        context.Response.Write(sb.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}