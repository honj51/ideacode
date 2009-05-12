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
            string sql = "select * from dbo.LiveChat_Message where chatid='"+SessionId+"' and SentDate>"+lastCheck;
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

