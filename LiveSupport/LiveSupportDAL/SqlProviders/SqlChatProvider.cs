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
    }
}
