using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;

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

    }
}