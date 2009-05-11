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
            throw new NotImplementedException();
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