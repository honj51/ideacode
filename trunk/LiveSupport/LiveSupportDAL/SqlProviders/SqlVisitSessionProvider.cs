using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlVisitSessionProvider
    {

        public static void NewSession(VisitSession session)
        {
            string sql = string.Format("INSERT INTO LiveChat_VisitSession "
           +"([SessionId]"
           +" ,[VisitorId]"
           +" ,[IP]"
           +",[Browser]"
           +" ,[Location]"
           +" ,[VisitingTime]"
           +" ,[DomainRequested]"
           +",[Operator]"
           +" ,[Referrer]"
           +" ,[PageRequestCount]"
           +",[Status])"
           +"VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}')",
                session.SessionId, session.VisitorId,  session.IP, session.Browser,session.Location,  session.VisitingTime,  session.DomainRequested,  session.OperatorId, session.Referrer, session.PageRequestCount, session.Status);
            DBHelper.ExecuteCommand(sql);
        }

        public static List<VisitSession> GetVisitSessionChange(DateTime lastCheck)
        {
            throw new NotImplementedException();
            return null;
        }

        public static VisitSession GetSessionById(string sessionId)
        {
            throw new NotImplementedException();
            return null;
        }
    }
}