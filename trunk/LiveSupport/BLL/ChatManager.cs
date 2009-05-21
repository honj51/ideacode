using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.BLL
{
    public class ChatManager
    {
        #region 通过客服编号获得所有对象
        public static List<Chat> GetChatByOperatorId(string operatorId, string beginDate, string endDate)
        {
            return SqlChatProvider.GetChatByOperatorId(operatorId, beginDate, endDate);
        }
        #endregion

        #region 通过ChatId删除Chat
        public static bool DeleteChatById(string chatId)
        {
            int i = 0;
            i = SqlChatProvider.DeleteChatById(chatId);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

    }
}
