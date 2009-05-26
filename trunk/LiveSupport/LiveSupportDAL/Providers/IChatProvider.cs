using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IChatProvider
    {
        void AddChat(Chat chatRequest);
        int CloseChat(Chat chat);
        int DeleteChatById(string chatId);
        System.Collections.Generic.List<Chat> GetChatByOperatorId(string operatorId, string beginDate, string endDate);
    }
}
