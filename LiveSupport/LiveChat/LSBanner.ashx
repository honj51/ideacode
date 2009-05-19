<%@ WebHandler Language="C#" Class="LSBanner" %>

using System;
using System.Web;

public class LSBanner : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string aid = context.Request.QueryString["aid"];
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.AppendLine("var bannerType = 1;");// 1: 简单按钮, 2: 客服列表, 3: 部门列表
        sb.AppendLine("var bannerStyle = 1;");// 1,2,3 图片
        sb.AppendLine("var invitePanelStyle = 1;");// 1,2,3
        sb.AppendLine("var bannerPos = 0;");// 0:固定, 1:左上角, 2:右上角,3:左边 ,4:右边, 5:左下角, 6:右下角
        sb.AppendLine(string.Format("var accountId = {0};",aid));
        
        //sb.AppendLine(" document.write('<script type=\"text/javascript\" language=\"javascript\" src=\"http://localhost:3355/livechat/js/live2.js\"></script> ');");
        sb.AppendLine(" document.write('<script type=\"text/javascript\" language=\"javascript\" src=\"http://miraclew.gicp.net/lcs/js/live2.js\"></script> ');");
        context.Response.ContentType = "text/plain"; // context.Response.ContentType = "application/x-javascript";
        context.Response.Write(sb.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}