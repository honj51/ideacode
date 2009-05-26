<%@ WebHandler Language="C#" Class="LSBanner" %>

using System;
using System.Web;

public class LSBanner : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        string aid =context.Request.QueryString["aid"];
        string IconStyle = "0"; //客服样式(图片)
        string InviteStyle = "0";//主动邀请样式
        string ChatStyle = "0";//聊天样式
        string IcoLocation ="0";//显示的位置样式
        string bannerType ="0";// 0: 简单按钮, 1: 客服列表, 2: 部门列表
        if (context.Request.QueryString["aid"] != null)
        { 
            aid=context.Request.QueryString["aid"];
        }
        if (context.Request.QueryString["IconStyle"]!=null)
        {
           IconStyle=context.Request.QueryString["IconStyle"]; //客服样式(图片)
        }
        if (context.Request.QueryString["InviteStyle"] != null)
        {
            InviteStyle = context.Request.QueryString["InviteStyle"];//主动邀请样式
        }
        if(context.Request.QueryString["ChatStyle"]!=null)
        {
           ChatStyle=context.Request.QueryString["ChatStyle"]; //聊天样式
        }
        if (context.Request.QueryString["IcoLocation"] != null)
        {
            IcoLocation = context.Request.QueryString["IcoLocation"];//显示的位置样式
        }
        
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.AppendLine(string.Format("var homeUrl = '{0}';",homeRootUrl));
        sb.AppendLine(string.Format("var bannerType ={0};", bannerType));// 0: 简单按钮, 1: 客服列表, 2: 部门列表
        sb.AppendLine(string.Format("var bannerStyle = {0};",IconStyle));// 0,1,2 图片
        sb.AppendLine(string.Format("var invitePanelStyle = {0};",InviteStyle));// 0,1,2主动邀请样式
        sb.AppendLine(string.Format("var bannerPos = {0};",IcoLocation));// 0:固定, 1:左上角, 2:右上角,3:左边 ,4:右边, 5:左下角, 6:右下角
        sb.AppendLine(string.Format("var accountId = {0};",aid));
        sb.AppendLine(" document.write('<script type=\"text/javascript\" language=\"javascript\" src=\"" + homeRootUrl + "/js/live2.js\"></script> ');");
        sb.AppendLine(" document.write('<script type=\"text/javascript\" language=\"javascript\" src=\"" + homeRootUrl + "/js/orientation.js\"></script> ');");
        context.Response.ContentType = "text/plain"; // context.Response.ContentType = "application/x-javascript";
        context.Response.Write(sb.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}