using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{

    public class SqlMessageProvider
    {
        /// <summary>
        /// 查询会话中某时刻后添加的数据
        /// </summary>
        /// <param name="SessionId">会话ID</param>
        /// <param name="lastCheck">最后收到信息的时间</param>
        /// <returns>Message集合</returns>
        public static List<Message> GetMessages(string SessionId, DateTime lastCheck)
        {
            string sql = "select * from dbo.LiveChat_Message where chatid='" + SessionId + "'";
            sql += lastCheck == DateTime.MinValue ?  "": " and SentDate>'" + lastCheck+"'";
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

        public static void AddMessage(Message msg)
        {
            string sql = string.Format("insert into dbo.LiveChat_Message values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
             msg.MessageId, msg.ChatId, msg.Source, msg.Destination, msg.Text, msg.SentDate, msg.Type.ToString());
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// 获取聊天历史记录
        /// </summary>
        /// <param name="visitorId">会话ID</param>
        /// <param name="begin">开始时间</param>
        /// <param name="end">结束时间</param>
        public static List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
        {
            string sql = string.Format("select * from dbo.LiveChat_Message where ChatID='{0}'and SentDate>='{1}'  and SentDate <= '{2}'", visitorId, begin, end);
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
    }
}

