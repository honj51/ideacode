using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

namespace LiveSupport.BLL
{
    public class ChatManager
    {
        private static IChatProvider Provider = new SqlChatProvider();

        #region 通过客服编号获得所有对象
        public static List<Chat> GetChatByOperatorId(string operatorId, string beginDate, string endDate)
        {
            return Provider.GetChatByOperatorId(operatorId, beginDate, endDate);
        }
        #endregion

        #region 通过ChatId删除Chat
        public static bool DeleteChatById(string chatId)
        {
            int i = 0;
            i = Provider.DeleteChatById(chatId);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 查找当前对话
        public static List<Chat> LookupChat(string lookupType, string accountId, string accountNumber)
        {
            List<Chat> list = null;
            if (lookupType == "accountList")
            {
                list = SqlChatProvider._default.GetChatByAccountId(accountId, ChatStatus.Closed.ToString());
            }
            else if (lookupType == "accountNumber")
            {
                list = SqlChatProvider._default.GetChatByAccountNumber(accountNumber, ChatStatus.Closed.ToString());
            }
            else
            {
                list = SqlChatProvider._default.GetCurrentlyChat(ChatStatus.Closed.ToString());
            }
            return list;
        }
        #endregion

    }
}
