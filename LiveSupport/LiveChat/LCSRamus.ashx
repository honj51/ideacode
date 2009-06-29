<%@ WebHandler Language="C#" Class="LCSRamus" %>

using System;
using System.Web;

public class LCSRamus : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string aid = context.Request.QueryString["aid"];
        if (string.IsNullOrEmpty(aid))
        {
            return; 
        }
        // 判断某公司的客服是否在线
        if (OperatorService.HasOnlineOperator(CurrentAccount.AccountId))
        {
            pnlRequest.Visible = true;
        }
        else
        {
            pnlNoOperator.Visible = true;
        }
    }
    // 是否客服邀请的对话
    private bool isInvitatation()
    {
        // 主动邀请
        return context.Request.QueryString["chatid"] != null && !string.IsNullOrEmpty(context.Request.QueryString["chatid"].ToString());
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}