using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
using System.Data;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlChatProvider : IChatProvider
    {
        #region 添加访客记录
        public void AddChat(Chat chatRequest)
        {
            string sql = string.Format("INSERT INTO LiveChat_Chat "+
                "(ChatId,CreateBy,CreateTime,AccountId,VisitorId,Status) " 
            +"VALUES('{0}','{1}','{2}','{3}','{4}','{5}')" ,
                chatRequest.ChatId, chatRequest.CreateBy, chatRequest.CreateTime,chatRequest.AccountId, chatRequest.VisitorId, chatRequest.Status);
            DBHelper.ExecuteCommand(sql);
        }
        #endregion


        #region 关闭对话
        public int CloseChat(Chat chat)
        {
            //string sql = string.Format("update dbo.LiveChat_Chat set CloseBy='{0}', CloseTime='{1}',OperatorId='{2}', Status='{3}' where ChatId='{4}'", chat.CloseBy, chat.CloseTime, chat.OperatorId, chat.Status, chat.ChatId);
            //return DBHelper.ExecuteCommand(sql);
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update LiveChat_Chat set ");
            strSql.Append("CloseBy=@CloseBy,");
            strSql.Append("CloseTime=@CloseTime,");
            strSql.Append("OperatorId=@OperatorId,");
            strSql.Append("Status=@Status");
            strSql.Append(" where ChatId=@ChatId ");
            SqlParameter[] parameters = {
					new SqlParameter("@ChatId", SqlDbType.VarChar,50),
					new SqlParameter("@CloseBy", SqlDbType.VarChar,50),
					new SqlParameter("@CloseTime", SqlDbType.DateTime),
					new SqlParameter("@OperatorId", SqlDbType.VarChar,50),
					new SqlParameter("@Status", SqlDbType.VarChar,50)};
            parameters[0].Value = chat.ChatId;
            parameters[1].Value = chat.CloseBy;
            parameters[2].Value = chat.CloseTime;
            parameters[3].Value = chat.OperatorId;
            parameters[4].Value = chat.Status;
            return DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }
        #endregion

        #region 通过客服编号获得所有访客记录
        public List<Chat> GetChatByOperatorId(string operatorId,string beginDate, string endDate)
        {
            string sql = string.Format("select * from LiveChat_Chat where OperatorId='{0}' and CreateTime>='{1}' and CloseTime<='{2}'", operatorId, beginDate, endDate);
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

        #region 通过ChatId删除Chat
        public int DeleteChatById(string chatId)
        {
            try
            {
                SqlMessageProvider mp = new SqlMessageProvider();
                mp.DeleteChatMessageByChatId(chatId);//删除聊天记录
                string sql = "delete from LiveChat_Chat where ChatId='" + chatId + "'";
                return DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        #endregion

        #region IChatProvider 成员

        /// <summary>
        /// 跟据visitorid 查询所有的对话
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
