using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlPageRequestProvider
    {
        /// <summary>
        /// 获取网站页面访问历史记录
        /// </summary>
        /// <param name="visitorId">访客ID</param>
        /// <param name="begin">开始时间</param>
        /// <param name="end"> 结束时间</param>
        /// <returns>Pagerequest集合</returns>
        public static List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
        {
            string sql = string.Format("select * from dbo.LiveChat_PageRequest where accountid='{0}' and requesttime>='{1}' and requesttime<='{2}'", visitorId, begin, end);
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
    }
}
