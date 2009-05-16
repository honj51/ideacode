<%@ WebHandler Language="C#" Class="VisitorHandler" %>

using System;
using System.Web;

public class VisitorHandler : IHttpHandler {
    
    private const string Action_Hit = "1";
    private const string Action_AcceptOperatorInvitation = "2";
    private const string Action_DeclineOperatorInvitation = "3";

    public void ProcessRequest (HttpContext context) {
        // 1. CHECK action
        string action = context.Request["Action"];
        if (string.IsNullOrEmpty(action))
        {
            return;
        }

        context.Response.ContentType = "text/plain";
        // 2. CHECK action parameters
        if (action == Action_Hit)
        {
            string visitorId = context.Request.QueryString["VisitorId"];
            if (!string.IsNullOrEmpty(visitorId))
            {
                VisitSessionService.Hit(visitorId);
                string chatId = ChatService.GetOperatorInvation(visitorId);
                if (chatId != null)
                {
                    context.Response.Write(string.Format("{{ \"InviteChatId\" : \"{0}\"}}" , chatId));
                }   
            }                     
        }
        else if (action == Action_AcceptOperatorInvitation)
        {
            string chatId = context.Request["chatId"];
            if (!string.IsNullOrEmpty(chatId))
            {
                ChatService.AcceptOperatorInvitation(chatId);
                context.Response.Write("ChatId=" + chatId+" Accpeted");
            }
            // 
        }
        else if (action == Action_DeclineOperatorInvitation)
        {
            string chatId = context.Request["chatId"];
            if (!string.IsNullOrEmpty(chatId))
            {
                context.Response.Write("ChatId=" + chatId + " Declined");
                ChatService.DeclineOperatorInvitation(chatId);
            }
        }
        context.Response.Expires = -1;
        context.Response.End();       
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}