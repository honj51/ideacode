using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlChatProvider
    {

        public static void AddChat(Chat chatRequest)
        {
            string sql = string.Format("INSERT INTO LiveChat_Chat "+
                "(ChatId,CreateBy,CreateTime,AccountId,VisitorId,Status) " 
            +"VALUES('{0}','{1}','{2}','{3}','{4}','{5}')" ,
                chatRequest.ChatId, chatRequest.CreateBy, chatRequest.CreateTime,chatRequest.AccountId, chatRequest.VisitorId, chatRequest.Status);
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// ¹Ø±Õ¶Ô»°
        /// </summary>
        /// <param name="chat">Chat</param>
        /// <returns></returns>
        public static int CloseChat(Chat chat)
        {
            string sql = string.Format("update dbo.LiveChat_Chat set CloseBy='{0}' and CloseTime='{2}' where ChatId='{3}'",chat.CloseBy,chat.CloseTime,chat.ChatId);
            return DBHelper.ExecuteCommand(sql);
        }
    }
}
