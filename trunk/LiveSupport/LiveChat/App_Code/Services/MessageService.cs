using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

/// <summary>
///MessageService 的摘要说明
/// </summary>
public class MessageService
{ 
    /// <summary>
    /// 跟据对话id,和最后发送时间后面新添的消息
    /// </summary>
    /// <param name="SessionId">ChatId会话ID</param>
    /// <param name="lastCheck">最后发消息的时间</param>
    /// <returns></returns>
    public static List<Message> GetMessages(string sessionId,DateTime lastCheck)
    {
      return  SqlMessageProvider.GetMessages(sessionId, lastCheck);
    }
    public static List<Message> GetMessages(string chatId, long lastCheck)
    {
        return GetMessages(chatId,new DateTime(lastCheck));
    }
    public static void AddMessage(Message msg)
    {
        SqlMessageProvider.AddMessage(msg);
    }
}
