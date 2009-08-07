using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Collections;

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

        #region 通过公司编号获取所有对话
        public static int[] GetAllChatByAccountId(string accountId, string beginDate, string endDate)
        {
            List<Chat> chatList = Provider.GetAllChatByAccountId(accountId, beginDate, endDate);
            int[] hour = new int[24];
            if (chatList.Count > 0)
            {
                //遍历对话集合
                for (int i = 0; i < chatList.Count; i++)
                {
                    for (int j = 0; j < 23; j++)
                    {
                        int count = 0;
                        if (chatList[i].CreateTime.Hour == j)
                        {
                            count++;
                            hour[j] = hour[j] + count;
                            break;
                        }
                    }
                }
                return hour;
            }
            else
            {
                return null;
            }

        }
        #endregion


        #region 通过公司编号获取所有对话统计客服对话数
        public static Hashtable GetOperatorChatByAccountId(string accountId, string beginDate, string endDate)
        {
            List<Chat> chatList = Provider.GetAllChatByAccountId(accountId, beginDate, endDate);
            Hashtable operatorTable = new Hashtable();
            if (chatList.Count > 0)
            {
                //获得所有客服
                List<Operator> operatorList=OperatorsManager.GetOperatorByAccountId(accountId);
                if (operatorList.Count > 0)
                {
                    //遍历客服集合
                    for (int j = 0; j < operatorList.Count; j++)
                    {
                        int count = 0;
                        for (int i = 0; i < chatList.Count; i++)
                        {
                            if (chatList[i].OperatorId == operatorList[j].OperatorId)
                            {
                                count++;
                            }
                        }
                        operatorTable.Add(operatorList[j].NickName, count);
                    }
                    return operatorTable;
                }
                return null;
            }
            else
            {
                return null;
            }

        }
        #endregion

        
    }
}
