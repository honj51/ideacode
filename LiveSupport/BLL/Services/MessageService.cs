using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Diagnostics;
using LiveSupport.LiveSupportDAL.Providers;

/// <summary>
///MessageService 的摘要说明
/// </summary>
public class MessageService
{
    public static IMessageProvider Provider = new SqlMessageProvider();

    /// <summary>
    /// 取某时断新添的消息
    /// </summary>
    /// <param name="chatId">会话ID</param>
    /// <param name="lastCheck">最后收到消息的时间</param>
    /// <returns></returns>
    public static List<Message> GetMessages(string chatId, long lastCheck)
    {
        return Provider.GetMessages(chatId, new DateTime(lastCheck));
    }
    /// <summary>
    /// 添加新消息
    /// </summary>
    /// <param name="msg"></param>
    public static void AddMessage(Message msg)
    {
        Provider.AddMessage(msg);
    }
    /// <summary>
    /// 获取聊天历史记录
    /// </summary>
    /// <param name="chatId">会话ID</param>
    /// <param name="begin">开始时间</param>
    /// <param name="end">结束时间</param>
    /// <returns>消息集合</returns>
    public static List<Message> GetHistoryChatMessage(string chatId, DateTime begin, DateTime end)
    {
        Trace.WriteLine(string.Format("GetHistoryChatMessage({0},{1},{2})", chatId, begin, end));
        return Provider.GetHistoryChatMessage(chatId, begin, end);
    }
    /// <summary>
    /// 取最新发送给ChatPage页面的消息
    /// </summary>
    /// <param name="chatId">ChatID</param>
    /// <param name="lastCheck">最后时间</param>
    /// <returns></returns>
    public static List<Message> GetMessagesForChatPage(string chatId, long lastCheck)
    {
        List<Message> ms = new List<Message>();
        foreach (Message item in GetMessages(chatId, lastCheck))
        {
            if (Message.IsChatMessage(item) || item.Type == MessageType.SystemMessage_ToVisitor || item.Type == MessageType.SystemMessage_ToBoth||item.Type==MessageType.CommandMessage_VidoeChat_OperatorToVisitor)//改
            {
                ms.Add(item);
            }
        }
        Trace.WriteLine(string.Format("GetMessagesForChatPage({0},{1}) Count={2}", chatId, lastCheck, ms.Count));
        return ms;
    }
    /// <summary>
    /// 取最新发送给Operator客服的消息
    /// </summary>
    /// <param name="chatId">ChatID</param>
    /// <param name="lastCheck">最后时间</param>
    /// <returns></returns>
    public static List<Message> GetMessagesForOperator(string chatId, long lastCheck)
    {
        List<Message> ms = new List<Message>() ;
        foreach (Message item in GetMessages(chatId, lastCheck))
        {
            if (item.Type == MessageType.ChatMessage_VistorToOperator ||
            item.Type == MessageType.SystemMessage_ToOperator || item.Type == MessageType.SystemMessage_ToBoth||item.Type==MessageType.CommandMessage_VideoChat_VistorToOperator)//改 
            {
                ms.Add(item);
            }
        }
        Trace.WriteLine(string.Format("GetMessagesForOperator({0},{1}) Count={2}", chatId, lastCheck, ms.Count));
        return ms;
    }

    public static List<Message> GetMessagesByChatId(string chatId)
    {
        return Provider.GetChatMessageByChatId(chatId);
    }
}
