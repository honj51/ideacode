using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
using System.Data;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlVisitSessionProvider : IVisitSessionProvider
    {

        public void NewSession(VisitSession session)
        {
            string sql = string.Format("INSERT INTO LiveChat_VisitSession "
           +"([SessionId]"
           +" ,[VisitorId]"
           +" ,[IP]"
           +",[Browser]"
           +" ,[Location]"
           +" ,[VisitingTime]"
           +" ,[DomainRequested]"
           +",[OperatorId]"
           +" ,[Referrer]"
           +" ,[PageRequestCount]"
           +",[Status])"
           +"VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}')",
                session.SessionId, session.VisitorId,  session.IP, session.Browser,session.Location,  session.VisitingTime,  session.DomainRequested,  session.OperatorId, session.Referrer, session.PageRequestCount, session.Status);
            DBHelper.ExecuteCommand(sql);
        }

        public List<VisitSession> GetVisitSessionByVisitor(string visitorId)
        {
            string sql = "select * from dbo.LiveChat_VisitSession where visitorid='" + visitorId + "'";
            List<VisitSession> li = new List<VisitSession>();
            using (SqlDataReader r = DBHelper.GetReader(sql))
            {
                while (r.Read())
                {
                    li.Add(new VisitSession(r));

                }
                return li;
            }
        }
        /// <summary>
        /// 跟据会话ID查询一条会话信息
        /// </summary>
        /// <param name="sessionId"></param>
        /// <returns></returns>
        public VisitSession GetSessionById(string sessionId)
        {
            string sql = "select * from dbo.LiveChat_VisitSession where sessionid='" + sessionId + "'";
            SqlDataReader data = null;
            VisitSession visitSession = null;
            try
            {
                using (data = DBHelper.GetReader(sql))
                {
                    if (data.Read())
                    {
                        visitSession = new VisitSession(data);
                    }
                    return visitSession;
                }
            }
            catch
            {
                throw;
            }
           
        }


        #region 通过公司编号获取所有访客对话
        public List<VisitSession> GetAllVisitSessionByAccountId(string accountId, string beginDate, string endDate)
        {
            string sql = string.Format("select * from LiveChat_VisitSession where VisitingTime>='{0}' and VisitingTime<='{1}' and VisitorId in (select VisitorId from LiveChat_Visitor where AccountId='{2}')", beginDate,endDate,accountId);
            List<VisitSession> li = new List<VisitSession>();
            using (SqlDataReader r = DBHelper.GetReader(sql))
            {
                while (r.Read())
                {
                    li.Add(new VisitSession(r));

                }
                return li;
            }
        }
        #endregion

        #region 通过公司编号获得对话地区以及访问次数 成员
        public Dictionary<string, int> GetLocationCountByAccountId(string accountId, string beginDate, string endDate)
        {
            string sql = string.Format("select count(*) as lcount,location from LiveChat_VisitSession where VisitingTime>='{0}' and VisitingTime<='{1}' and VisitorId in (select VisitorId from LiveChat_Visitor where AccountId='{2}') group by location ",beginDate,endDate, accountId);
            using (SqlDataReader sdr = DBHelper.GetReader(sql))
            {
                Dictionary<string, int> dic = new Dictionary<string, int>();
                while (sdr.Read())
                {
                    if (sdr["Location"] != null && sdr["lcount"] != null)
                    {
                        dic.Add(sdr["Location"] + "", (int)sdr["lcount"]);
                    }
                }
                return dic;
            }
        }
        #endregion



        #region 通过公司编号统计引用页
        public Dictionary<string, int> GetReferrerByAccountId(string accountId, string beginDate, string endDate)
        {
            Dictionary<string, int> dic = new Dictionary<string, int>();
            using(SqlConnection conn=DBHelper.Getconn())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Proc_ReferrerStatistic", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@accountId ", SqlDbType.VarChar, 50).Value = accountId;
                cmd.Parameters.Add("@beginTime ", SqlDbType.VarChar, 50).Value = beginDate;
                cmd.Parameters.Add("@endTime ", SqlDbType.VarChar, 50).Value = endDate;
                SqlDataReader sdr=cmd.ExecuteReader();
                int sumCount = 0;
                int referrerCount = 0;
                while (sdr.Read())
                {
                    if (sdr["Rcount"] != null && sdr["Referrer"] != null && sdr["sumCount"]!=null)
                    {
                        dic.Add(sdr["Referrer"].ToString(),(int)sdr["Rcount"]);
                        sumCount = (int)sdr["sumCount"];
                        referrerCount = referrerCount + (int)sdr["Rcount"];
                    }
                }
                sdr.Close();
                if (sumCount != 0)
                {
                    int otherCount = sumCount - referrerCount;
                    dic.Add("其他", otherCount);
                }
                return dic;
            }
        }
        #endregion
    }
}