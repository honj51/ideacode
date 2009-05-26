using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlChatProvider
    {
        void AddChat(LiveSupport.LiveSupportModel.Chat chatRequest);
        int CloseChat(LiveSupport.LiveSupportModel.Chat chat);
        int DeleteChatById(string chatId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Chat> GetChatByOperatorId(string operatorId, string beginDate, string endDate);
    }
}
