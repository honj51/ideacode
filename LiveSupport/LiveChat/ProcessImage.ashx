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
        if (context.Request.QueryString["aid"] == null)
        {
            return;
        }
        string accountId = context.Request.QueryString["aid"].ToString();
        string referrer = string.Empty;
        string pageRequested = string.Empty;
        string domainRequested = string.Empty;
        string visitorUserAgent = string.Empty;
        string visitorIP = string.Empty;
        string imgName = string.Empty;
        bool opOnline = false;

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
        // 1. 查找Visitor，没有则新增一个
        Visitor visitor = getVisitor(context, accountId);
        
        // 2.查找VisitSession，没有则新增一个
        if (visitor.CurrentSession == null || visitor.CurrentSession.Status == VisitSessionStatus.Leave)
        {
            VisitSession session = new VisitSession();
            session.Browser = visitorUserAgent;
            session.IP = visitorIP;
            session.VisitingTime = DateTime.Now;
            session.VisitorId = visitor.VisitorId;
            session.DomainRequested = domainRequested;
            session.PageRequested = pageRequested;
            session.Referrer = referrer;
            session.Status = VisitSessionStatus.Visiting;
            visitor.CurrentSession = session;
            VisitSessionService.NewSession(session);
            System.Diagnostics.Debug.WriteLine("Add new session "+session.SessionId + " for " + visitor.VisitorId);
        }

        visitor.CurrentSession.Location = IpSearch.GetAddressWithIP(visitorIP);
        
        // TODO:
        PageRequest pageRequest = new PageRequest();
        pageRequest.AccountId = accountId;
        pageRequest.Page = context.Request.Url.ToString();
        pageRequest.Referrer = context.Request.UrlReferrer.ToString();
        pageRequest.RequestTime = DateTime.Now;
        pageRequest.SessionId = visitor.CurrentSessionId;
        PageRequestService.AddPageRequest(pageRequest);
        visitor.VisitCount = visitor.VisitCount + 1;        

        // we get the status of the operators
        opOnline = OperatorService.HasOnlineOperator(accountId);

        if (opOnline)
            imgName = "online.jpg";
        else
            imgName = "offline.jpg";

        System.Drawing.Image returnImg = System.Drawing.Image.FromFile(context.Server.MapPath("Images/" + imgName));
        returnImg.Save(context.Response.OutputStream, ImageFormat.Jpeg);
    }

    private static Visitor getVisitor(HttpContext context, string accountId)
    {
        System.Diagnostics.Debug.WriteLine(System.Reflection.MethodBase.GetCurrentMethod().Name + "(" + accountId + ")");
        Visitor visitor;
        string visitorId = null;
        if (context.Request.Cookies["VisitorId"] != null)
        {
            visitorId = context.Request.Cookies["VisitorId"].Value.ToString();            
        }

        if (visitorId != null && VisitorService.GetVisitor(visitorId) != null)
        {
            visitor = VisitorService.GetVisitor(visitorId);            
        }
        else
        {
            visitor = new Visitor();
            context.Response.Cookies["VisitorId"].Value = visitor.VisitorId;
            context.Response.Cookies["VisitorId"].Expires = DateTime.Now.AddMonths(12);
            visitor.AccountId = accountId;
            System.Diagnostics.Debug.WriteLine("Create new visitor " + visitor.VisitorId);
            VisitorService.NewVisitor(visitor);
        }
        return visitor;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}