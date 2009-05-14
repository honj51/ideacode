using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Diagnostics;

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
    /// <summary>
    /// 获取聊天历史记录
    /// </summary>
    /// <param name="visitorId">会话ID</param>
    /// <param name="begin">开始时间</param>
    /// <param name="end">结束时间</param>
    /// <returns>消息集合</returns>
    public static List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
    {
       return SqlMessageProvider.GetHistoryChatMessage(visitorId, begin, end);
    }

    public static List<Message> GetMessagesForChatPage(string chatId, long lastCheck)
    {
        List<Message> ms = GetMessages(chatId, lastCheck).FindAll(m => Message.IsChatMessage(m) ||
            m.Type == MessageType.SystemMessage_ToVisitor || m.Type == MessageType.SystemMessage_ToBoth);
        Debug.WriteLine(string.Format("GetMessagesForChatPage({0},{1}) Count={2}", chatId, lastCheck, ms.Count));
        return ms;
    }

    internal static List<Message> GetMessagesForOperator(string chatId, long lastCheck)
    {
        List<Message> ms = GetMessages(chatId, lastCheck).FindAll(m => m.Type == MessageType.ChatMessage_VistorToOperator ||
            m.Type == MessageType.SystemMessage_ToOperator || m.Type == MessageType.SystemMessage_ToBoth);
        Debug.WriteLine(string.Format("GetMessagesForOperator({0},{1}) Count={2}", chatId, lastCheck, ms.Count));
        return ms;
    }
}
