﻿using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface IVisitSessionProvider
    {
        VisitSession GetSessionById(string sessionId);
        System.Collections.Generic.List<VisitSession> GetVisitSessionByVisitor(string visitorId);
        void NewSession(VisitSession session);
    }
}
