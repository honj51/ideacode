<%@ WebHandler Language="C#" Class="LSBanner" %>

using System;
using System.Web;

public class LSBanner : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        string aid =context.Request.QueryString["aid"];
        LiveSupport.LiveSupportModel.Account account=  AccountService.GetAccountById(aid);//公司对象
        if (account == null)
        {
            return; 
        }
        LiveSupport.BLL.NewWebSite  NewWebSite=null;
        string domainName=null;
        if (context.Request.UrlReferrer != null)
        {
            domainName = Lib.GetDomainName(context.Request.UrlReferrer.ToString());//域名
            NewWebSite = LiveSupport.BLL.WebSiteManager.GetNewWebSiteByDomainName(domainName);//用堿名取一行数
        }
        if (NewWebSite == null)
        {
            NewWebSite = new LiveSupport.BLL.NewWebSite();
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
            NewWebSite.banners = bnr;
            NewWebSite.invites = ivt;
            NewWebSite.chatpage = cpg;
            NewWebSite.accountId = aid;
            NewWebSite.icoLocation = "0";
            NewWebSite.companyName = account.CompanyName;
            if (domainName != null)
            {
                NewWebSite.domainName = domainName;
                LiveSupport.BLL.WebSiteManager.AddNewWebSite(NewWebSite);
            }
        }
        if (NewWebSite.accountId != account.AccountId)
        {
            return; 
        }
        string inviteImageUrl;
        if (NewWebSite.invites.State == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
        {
            inviteImageUrl = homeRootUrl + "/Images/" + account.AccountNumber + "/" + NewWebSite.domainName;
        }
        else
        {
            inviteImageUrl = homeRootUrl + "/Images/Default"; 
        }
        string bannerType ="0";// 0: 简单按钮, 1: 客服列表, 2: 部门列表
        
        string LCS_BannerJs = "orientationIE.js";
        if (context.Request.QueryString["aid"] != null)
        { 
            aid=context.Request.QueryString["aid"];
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
        
        sb.AppendLine(string.Format("var LCS_homeUrl = '{0}';",homeRootUrl));//服务器路径
        sb.AppendLine(string.Format("var LCS_inviteImageUrl = '{0}';", inviteImageUrl));//图片路径
        sb.AppendLine(string.Format("var LCS_bannerType ='{0}';", bannerType));// 0: 简单按钮, 1: 客服列表, 2: 部门列表
        sb.AppendLine(string.Format("var LCS_invitePanel_BGStyle = '{0}';", NewWebSite.invites.Bgimg));// 0,1,2主动邀请背景
        sb.AppendLine(string.Format("var LCS_invitePanel_OKBtn = '{0}';", NewWebSite.invites.Okimg));// 0,1,2主动邀请OK按扭
        sb.AppendLine(string.Format("var LCS_invitePanel_NOBtn = '{0}';", NewWebSite.invites.Noimg));// 0,1,2主动邀请NO按扭
        sb.AppendLine(string.Format("var LCS_bannerPos = {0};", NewWebSite.icoLocation));// 0:固定, 1:左上角, 2:右上角,3:左边 ,4:右边, 5:左下角, 6:右下角
        sb.AppendLine(string.Format("var LCS_accountId = '{0}';",aid));//公司ID
        sb.AppendLine(string.Format("var LCS_companyName = '{0}';", NewWebSite.companyName));//公司名
        
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