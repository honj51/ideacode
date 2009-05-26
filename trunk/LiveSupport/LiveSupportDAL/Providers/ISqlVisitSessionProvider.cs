using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlVisitSessionProvider
    {
        LiveSupport.LiveSupportModel.VisitSession GetSessionById(string sessionId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.VisitSession> GetVisitSessionByVisitor(string visitorId);
        void NewSession(LiveSupport.LiveSupportModel.VisitSession session);
    }
}
