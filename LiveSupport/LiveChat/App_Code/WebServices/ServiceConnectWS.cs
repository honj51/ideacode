using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Web.Caching;
using LiveSupport.LiveSupportModel;
using System.IO;

/// <summary>
/// Contains all functionality for an operator to maintain
/// a chat session with a client.
/// </summary>
[WebService(Namespace = "http://www.LiveSupport.cn/LiveSupportService/2009/04")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]
/// <summary>
///ServiceConnectWS 的摘要说明
/// </summary>
public class ServiceConnectWS : System.Web.Services.WebService
{
    // 表示客服主动要求的ChatRequest的状态
    public const string ChatRequestStatus_Show = "1";
    public const string ChatRequestStatus_Hide = "2";
    
    public ServiceConnectWS()
    {
    }

    /// <summary>
    /// 通过visitorId检查客服是否发出主动邀请返回ChatID
    /// </summary>
    /// <param name="accountId"></param>
    /// <param name="ip"></param>
    /// <returns>ChatId</returns>
    [WebMethod]
    public string GetOperatorInvitation(string visitorId)
    {
        return ChatService.GetOperatorInvation(visitorId);
    }

    /// <summary>
    /// 接受对话邀请
    /// </summary>
    /// <param name="chatId"></param>
    [WebMethod]
    public void AcceptOperatorInvitation(string chatId)
    {
        ChatService.AcceptOperatorInvitation(chatId);
    }

    [WebMethod]
    public void DeclineOperatorInvitation(string chatId)
    {
       ChatService.DeclineOperatorInvitation(chatId);
    }


    [WebMethod]
    public void RemoveChatRequestByChatId(string chatid)
    {
        //ChatRequestInfo req = new ChatRequestInfo();
        //req.ChatId = chatid;
        //ChatService.RemoveChatRequest(req);
    }

}
