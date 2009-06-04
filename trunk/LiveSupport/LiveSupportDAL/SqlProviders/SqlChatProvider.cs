using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlChatProvider : IChatProvider
    {
        #region ��ӷÿͼ�¼
        public void AddChat(Chat chatRequest)
        {
            string sql = string.Format("INSERT INTO LiveChat_Chat "+
                "(ChatId,CreateBy,CreateTime,AccountId,VisitorId,Status) " 
            +"VALUES('{0}','{1}','{2}','{3}','{4}','{5}')" ,
                chatRequest.ChatId, chatRequest.CreateBy, chatRequest.CreateTime,chatRequest.AccountId, chatRequest.VisitorId, chatRequest.Status);
            DBHelper.ExecuteCommand(sql);
        }
        #endregion


        #region �رնԻ�
        public int CloseChat(Chat chat)
        {
            string sql = string.Format("update dbo.LiveChat_Chat set CloseBy='{0}', CloseTime='{1}',OperatorId='{2}', Status='{3}' where ChatId='{4}'", chat.CloseBy, chat.CloseTime, chat.OperatorId, chat.Status, chat.ChatId);
            return DBHelper.ExecuteCommand(sql);
        }
        #endregion

        #region ͨ���ͷ���Ż�����ж���
        public List<Chat> GetChatByOperatorId(string operatorId,string beginDate, string endDate)
        {
            string sql = string.Format("select * from LiveChat_Chat where OperatorId='{0}' and CreateTime>='{1}' and CreateTime<='{2}'", operatorId, beginDate, endDate);
            SqlDataReader sdr=DBHelper.GetReader(sql);
            List<Chat> list = new List<Chat>();
            while (sdr.Read())
            {
                Chat chat = new Chat(sdr);
                SqlVisitSessionProvider vs = new SqlVisitSessionProvider();
                chat.Vs = vs.GetSessionById(chat.ChatId);
                list.Add(chat);
            }
            sdr.Close();
            return list;
        }
        #endregion

        #region ͨ��ChatIdɾ��Chat
        public int DeleteChatById(string chatId)
        {
            try
            {
                SqlMessageProvider mp = new SqlMessageProvider();
                mp.DeleteChatMessageByChatId(chatId);//ɾ�������¼
                string sql = "delete from LiveChat_Chat where ChatId='" + chatId + "'";
                return DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        #endregion

        #region IChatProvider ��Ա

        /// <summary>
        /// ����visitorid ��ѯ���еĶԻ�
        /// </summary>
        /// <param name="visitorId"></param>
        /// <returns></returns>
        public List<Chat> GetChatByVisitorId(string visitorId)
        {
            string sql = string.Format("SELECT * FROM [LiveSupport].[dbo].[LiveChat_Chat] where visitorid ='{0}'", visitorId);
            SqlDataReader sdr = DBHelper.GetReader(sql);
            List<Chat> list = new List<Chat>();
            while (sdr.Read())
            {
                Chat chat = new Chat(sdr);
                SqlVisitSessionProvider vs = new SqlVisitSessionProvider();
                chat.Vs = vs.GetSessionById(chat.ChatId);
                list.Add(chat);
            }
            sdr.Close();
            return list;
        }

        #endregion
    }
}
