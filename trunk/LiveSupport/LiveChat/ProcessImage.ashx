<%@ WebHandler Language="C#" Class="ProcessImage" %>
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Display the livechat image and log the http request
 * 
 * History:
 * 
 */

using System;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using LiveSupport.LiveSupportModel;

public class ProcessImage : IHttpHandler
{

	public void ProcessRequest(HttpContext context)
	{
        // 检查QueryString 参数
        string accountId = null;
;
        if (context.Request.QueryString["aid"]!=null)
        {
            accountId = context.Request.QueryString["aid"].ToString();
            return;
        }
              
		string referrer = string.Empty;        
		string pageRequested = string.Empty;
		string domainRequested = string.Empty;
		string visitorUserAgent = string.Empty;
		string visitorIP = string.Empty;
		string imgName = string.Empty;
		bool opOnline = false;

        // Add Request Log
        if (context.Request.QueryString["referrer"] != null)
            referrer = context.Request.QueryString["referrer"].ToString();
        
        if (context.Request.UserHostAddress != null)
            visitorIP = context.Request.UserHostAddress.ToString();

        if (context.Request.UrlReferrer != null)
        {
            pageRequested = context.Request.UrlReferrer.ToString();
            domainRequested = Lib.GetDomainName(context.Request.UrlReferrer.ToString());
        }

        if (context.Request.ServerVariables["HTTP_USER_AGENT"] != null)
            visitorUserAgent = context.Request.ServerVariables["HTTP_USER_AGENT"].ToString();


        // 建立 Visitor 和 VisitSession对象
        Visitor visitor;
        if (context.Request.Cookies["VisitorId"] == null)
        {            
            visitor = new Visitor();
            context.Response.Cookies["VisitorId"].Value = visitor.VisitorId;
        }
        else
        {
            string visitorId = context.Request.Cookies["VisitorId"].Value.ToString();
            visitor = VisitorService.GetVisitor(visitorId);
        }
        visitor.AccountId = accountId;            

        VisitSession session = new VisitSession();
        session.Browser = visitorUserAgent;
        session.IP = visitorIP;
        session.VisitingTime = DateTime.Now;
        session.VisitorId = visitor.VisitorId;
        session.DomainRequested = domainRequested;
        session.PageRequested = pageRequested;
        session.Referrer = referrer;

        visitor.CurrentSession = session;
        visitor.CurrentSessionId = session.SessionId;

        VisitorService.NewVisit(visitor, session);
                    
		// we get the status of the operators
		opOnline = OperatorService.GetOperatorStatus(accountId);

		if (opOnline)
			imgName = "online.jpg";
		else
			imgName = "offline.jpg";

		System.Drawing.Image returnImg = System.Drawing.Image.FromFile(context.Server.MapPath("Images/" + imgName));
		returnImg.Save(context.Response.OutputStream, ImageFormat.Jpeg);
	}

	public bool IsReusable
	{
		get
		{
			return false;
		}
	}
}