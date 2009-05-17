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

        string callback = context.Request.QueryString["callback"];
        context.Response.ContentType = "application/x-javascript";
        string data = string.Empty;

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
                    data = string.Format("{{ \"InviteChatId\" : \"{0}\"}}", chatId);
                }   
                //data = string.Format("{{ 'InviteChatId' : '{0}'}}", 123);
            }                     
        }
        else if (action == Action_AcceptOperatorInvitation)
        {
            string chatId = context.Request["chatId"];
            if (!string.IsNullOrEmpty(chatId))
            {
                ChatService.AcceptOperatorInvitation(chatId);
                //data = "ChatId=" + chatId+" Accpeted";
            }
            // 
        }
        else if (action == Action_DeclineOperatorInvitation)
        {
            string chatId = context.Request["chatId"];
            if (!string.IsNullOrEmpty(chatId))
            {
                //data ="ChatId=" + chatId + " Declined";
                ChatService.DeclineOperatorInvitation(chatId);
            }
        }
        context.Response.Write(string.Format("{0}({1})", callback, data));
        context.Response.Expires = -1;
        context.Response.End();       
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}