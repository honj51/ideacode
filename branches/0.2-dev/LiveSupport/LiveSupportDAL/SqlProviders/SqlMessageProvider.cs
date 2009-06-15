using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using System.Data;
using LiveSupport.LiveSupportDAL.Providers;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{

    public class SqlMessageProvider : IMessageProvider
    {

        /// <summary>
        /// 查询会话中某时刻后添加的数据
        /// </summary>
        /// <param name="SessionId">会话ID</param>
        /// <param name="lastCheck">最后收到信息的时间</param>
        /// <returns>Message集合</returns>
        public List<Message> GetMessages(string SessionId, DateTime lastCheck)
        {
            string sql = "select * from dbo.LiveChat_Message where chatid='" + SessionId + "'";
            sql += lastCheck == DateTime.MinValue ?  "": " and SentDate>'" + lastCheck.Ticks+"'";
            sql += "order by SentDate";
            SqlDataReader data = null;
            List<Message> retList = new List<Message>();
            try
            {
                data = DBHelper.GetReader(sql);
                while (data.Read())
                    retList.Add(new Message(data));
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return retList;
        }

        public void AddMessage(Message msg)
        {
            SqlConnection conn = DBHelper.Getconn();
            SqlCommand cmd = new SqlCommand("LiveChat_ChatMessagesAdd", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader data = null;
            List<Message> retList = new List<Message>();
            try
            {
                cmd.Parameters.Add("@MessageId", SqlDbType.VarChar, 50).Value = msg.MessageId;
                cmd.Parameters.Add("@ChatID", SqlDbType.VarChar, 50).Value = msg.ChatId;
                cmd.Parameters.Add("@Source", SqlDbType.VarChar, 50).Value = msg.Source;
                cmd.Parameters.Add("@Destination", SqlDbType.VarChar, 50).Value = msg.Destination;
                cmd.Parameters.Add("@Text", SqlDbType.Text).Value = msg.Text;
                cmd.Parameters.Add("@SentDate", SqlDbType.BigInt).Value = msg.SentDate.Ticks;
                cmd.Parameters.Add("@Type", SqlDbType.VarChar, 50).Value = msg.Type.ToString();
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                conn.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
        }
        /// <summary>
        /// 获取聊天历史记录
        /// </summary>
        /// <param name="chatId">会话ID</param>
        /// <param name="begin">开始时间</param>
        /// <param name="end">结束时间</param>
        public List<Message> GetHistoryChatMessage(string chatId, DateTime begin, DateTime end)
        {
            string sql = string.Format("select * from dbo.LiveChat_Message where ChatID='{0}'and SentDate>='{1}'  and SentDate <= '{2}'", chatId, begin.Ticks, end.Ticks);
            SqlDataReader data = null;
            List<Message> retList = new List<Message>();
            try
            {
                data = DBHelper.GetReader(sql);
                while (data.Read())
                    retList.Add(new Message(data));
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return retList;
        }

        #region 通过ChatId获得聊天记录
        public List<Message> GetChatMessageByChatId(string chatId)
        {
            string sql = "select * from dbo.LiveChat_Message where ChatID='"+chatId+"'";
            SqlDataReader data = null;
            List<Message> retList = new List<Message>();
            try
            {
                data = DBHelper.GetReader(sql);
                while (data.Read())
                    retList.Add(new Message(data));
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return retList;
        }
        #endregion

        #region  通过ChatId删除所有聊天记录
        public int DeleteChatMessageByChatId(string chatId)
        {
            try
            {
                string sql = "delete from LiveChat_Message where ChatID='" + chatId + "'";
                return DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        #endregion
    }
}

