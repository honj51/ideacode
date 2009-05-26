using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlPageRequestProvider : ISqlPageRequestProvider
    {
        /// <summary>
        /// 获取网站页面访问历史记录
        /// </summary>
        /// <param name="visitorId">访客ID</param>
        /// <param name="begin">开始时间</param>
        /// <param name="end"> 结束时间</param>
        /// <returns>Pagerequest集合</returns>
        public List<PageRequest> GetHistoryPageRequests(string sessionId, DateTime begin, DateTime end)
        {
            string sql = string.Format("select * from dbo.LiveChat_PageRequest where SessionId='{0}' and requesttime>='{1}' and requesttime<='{2}'", sessionId, begin, end);
            SqlDataReader data = null;
            List<PageRequest> list = new List<PageRequest>();
            try
            {
                data = DBHelper.GetReader(sql);
                while (data.Read())
                    list.Add(new PageRequest(data));
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return list;
        }
        /// <summary>
        /// 添加一条页面访问记录
        /// </summary>
        /// <param name="pageRequest"></param>
        public int AddPageRequest(PageRequest pageRequest)
        {
            string sql = string.Format(
           "INSERT INTO [LiveSupport].[dbo].[LiveChat_PageRequest]"
           + "([AccountId]"
           + " ,[SessionId]"
           + " ,[Page]"
           + " ,[RequestTime]"
           + " ,[Referrer])"
           + "VALUES('{0}','{1}','{2}','{3}','{4}')"
           , pageRequest.AccountId, pageRequest.SessionId, pageRequest.Page, pageRequest.RequestTime, pageRequest.Referrer);
           return  DBHelper.ExecuteCommand(sql);
        }
    }
}
