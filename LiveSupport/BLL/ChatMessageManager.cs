using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.BLL
{
    public class ChatMessageManager
    {
        #region 通过ChatId获得聊天记录
        public static List<Message> GetChatMessageByChatId(string chatId)
        {
            return SqlMessageProvider.GetChatMessageByChatId(chatId);
        }
        #endregion
    }
}
