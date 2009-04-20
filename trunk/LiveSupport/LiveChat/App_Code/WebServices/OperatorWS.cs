#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Service called by the operator's console
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Web.Caching;
using LiveSupport.DAL.Entity;


    /// <summary>
    /// Contains all functionality for an operator to maintain
    /// a chat session with a client.
    /// </summary>
[WebService(Namespace = "http://www.LiveSupport.cn/LiveSupportService/2009/04")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class OperatorWS : System.Web.Services.WebService
{
    public AuthenticationHeader Authentication;

    public OperatorWS()
	{

		//Uncomment the following line if using designed components 
		//InitializeComponent(); 
	}

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public Operator LogIn(string userName, string password)
	{
        checkAuthentication();

		return OperatorService.LogIn(userName, password, Authentication.userName);
	}

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public List<RequestInfo> GetWebSiteRequests(int accountId, DateTime lastRequestTime)
	{
        checkAuthentication();
        return RequestService.GetRequest(accountId, lastRequestTime);
	}
    
    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public void SetOperatorStatus(int operatorId, bool isOnline)
	{
        checkAuthentication();
        OperatorService.UpdateStatus(operatorId, isOnline);
	}

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public List<ChatRequestInfo> GetChatRequests(Operator op)
	{
        checkAuthentication();
        return OperatorService.GetChatRequests(op);
	}

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public void AddMessage(ChatMessageInfo msg)
	{
        checkAuthentication();
        msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;
		ChatService.AddMessage(msg);
	}

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public void RemoveChatRequest(ChatRequestInfo req)
	{
        checkAuthentication();
        ChatService.RemoveChatRequest(req);
	}

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public List<ChatMessageInfo> GetChatMessages(string chatId, long lastCheck)
	{
        checkAuthentication();
        return ChatService.GetMessages(chatId, lastCheck);
	}

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool IsTyping(string chatId, bool isOperator)
    {
        checkAuthentication();
        bool retVal = false;
        HttpContext ctx = HttpContext.Current;
        if (ctx != null)
        {
            string who = isOperator ? "op" : "visitor";
            if (ctx.Application[chatId + "_" + who + "_typing"] != null)
                retVal = (bool)ctx.Application[chatId + "_" + who + "_typing"];
            
            // Clean up application variables
            DateTime lastCleanUp = DateTime.Now;
            DateTime now = DateTime.Now;
            if (ctx.Application["lastCleanUp"] != null)
                lastCleanUp = (DateTime)ctx.Application["lastCleanUp"];
            else
                ctx.Application.Add("lastCleanUp", DateTime.Now);

            TimeSpan duration = now - lastCleanUp;

            if ( duration.Seconds > 45 )
            {
                List<string> keyNames = new List<string>();
                foreach (string key in ctx.Application.Keys)
                    keyNames.Add(key);

                foreach (string key in keyNames)
                {
                    if (key.EndsWith("_typing"))
                        ctx.Application.Remove(key);
                }
                ctx.Application["lastCleanUp"] = DateTime.Now;
            }
            
        }
        return retVal;
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void SetTyping(string chatId, bool isOperator, bool typing)
    {
        //if (Authentication.userName != System.Configuration.ConfigurationManager.AppSettings["WSUser"].ToString())
        //    throw new AccessViolationException("invalid user");
        HttpContext ctx = HttpContext.Current;
        if (ctx != null)
        {
            string who = isOperator ? "op" : "visitor";
            if (ctx.Application[chatId + "_" + who + "_typing"] != null)
                ctx.Application[chatId + "_" + who + "_typing"] = typing;
            else
                ctx.Application.Add(chatId + "_" + who + "_typing", typing);
        }
     }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<Operator> GetOnlineOperator()
    {
        checkAuthentication();
        return OperatorService.GetOnlineOperator();
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void TransferChat(ChatRequestInfo chatRequest)
    {
        checkAuthentication();
        ChatService.RequestChat(chatRequest);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool HasNewMessage(string chatId, long lastMessageId)
    {
        checkAuthentication();
        return ChatService.HasNewMessage(chatId, lastMessageId);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool Invite(RequestInfo info)
    {
        checkAuthentication();
        return true;
    }


    private void checkAuthentication()
    {
        //if (Authentication.userName != System.Configuration.ConfigurationManager.AppSettings["WSUser"].ToString())
        //    throw new AccessViolationException("invalid user");
    }
}