using System;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IMessageProvider
    {
        void AddMessage(Message msg);
        int DeleteChatMessageByChatId(string chatId);
        List<Message> GetChatMessageByChatId(string chatId);
        List<Message> GetHistoryChatMessage(string sessionId, DateTime begin, DateTime end);
        List<Message> GetMessages(string SessionId, DateTime lastCheck);
    }
}
