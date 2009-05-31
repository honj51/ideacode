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
    }
}
