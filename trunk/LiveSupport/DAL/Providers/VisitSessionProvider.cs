using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;

/// <summary>
/// Summary description for ChatRequestProvider
/// </summary>
public abstract class VisitSessionProvider : ProviderBase
{
    public abstract void NewSession(VisitSession session);
    public abstract VisitSession GetSessionById(string sessionId);
}
