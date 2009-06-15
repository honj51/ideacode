using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.BLL
{    
    public class ChatMessageManager
    {
        private static IMessageProvider Provider;
 
        #region 通过ChatId获得聊天记录
        public static List<Message> GetChatMessageByChatId(string chatId)
        {
            Provider = new SqlMessageProvider();
            return Provider.GetChatMessageByChatId(chatId);
        }
        #endregion
    }
}
