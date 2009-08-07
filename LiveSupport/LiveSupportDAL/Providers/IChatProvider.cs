using System;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IChatProvider
    {
        void AddChat(Chat chatRequest);
        int CloseChat(Chat chat);
        int DeleteChatById(string chatId);
        List<Chat> GetChatByOperatorId(string operatorId, string beginDate, string endDate);
        List<Chat> GetAllChatByAccountId(string accountId, string beginDate, string endDate);
        List<Chat> GetChatByVisitorId(string visitorId);
        List<Chat> GetChatByAccountId(string accountId, string status);
        List<Chat> GetCurrentlyChat(string status);
        List<Chat> GetChatByAccountNumber(string accountNumber, string status);

    }
}
