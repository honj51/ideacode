using System;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IVisitSessionProvider
    {
        VisitSession GetSessionById(string sessionId);
        System.Collections.Generic.List<VisitSession> GetVisitSessionByVisitor(string visitorId);
        void NewSession(VisitSession session);
        List<VisitSession> GetAllVisitSessionByAccountId(string accountId, string beginDate, string endDate);
        Dictionary<string, int> GetLocationCountByAccountId(string accountId, string beginDate, string endDate);
        Dictionary<string, int> GetReferrerByAccountId(string accountId, string beginDate, string endDate);
    }
}
