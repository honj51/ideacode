using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface IMessageProvider
    {
        void AddMessage(LiveSupport.LiveSupportModel.Message msg);
        int DeleteChatMessageByChatId(string chatId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Message> GetChatMessageByChatId(string chatId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Message> GetHistoryChatMessage(string sessionId, DateTime begin, DateTime end);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Message> GetMessages(string SessionId, DateTime lastCheck);
    }
}
