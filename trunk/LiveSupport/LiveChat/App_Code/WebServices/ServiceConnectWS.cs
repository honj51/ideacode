using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Web.Caching;
using LiveSupport.DAL.Entity;
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
    /// 通过AccountId和IP查询是否有客服主动邀请的ChatRequest,如果有返回ChatId,没有返回空
    /// </summary>
    /// <param name="accountId"></param>
    /// <param name="ip"></param>
    /// <returns>ChatId</returns>
    [WebMethod]
    public string GetOperatorInvitation(int accountId, string ip)
    {
        string chatId = ChatService.GetChatRequestByAccountIdAndIP(accountId, ip);
        if (!string.IsNullOrEmpty(chatId))
        {
            // 更新该ChatRequest的状态
            ChatService.UpdateIsShowRequestsByAidandIP(accountId, ip, ChatRequestStatus_Hide);
        }
        return chatId;

    }

    [WebMethod]
    public void RemoveChatRequestByChatId(string chatid)
    {
        ChatRequestInfo req = new ChatRequestInfo();
        req.ChatId = chatid;
        ChatService.RemoveChatRequest(req);
    }

}
