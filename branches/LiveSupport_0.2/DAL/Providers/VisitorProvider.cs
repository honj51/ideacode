using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;

/// <summary>
/// Summary description for ChatRequestProvider
/// </summary>
public abstract class VisitorProvider : ProviderBase
{
    public abstract Visitor GetVisitorById(string visitorId);
    public abstract void NewVisitor(Visitor visitor);
    public abstract List<Visitor> GetAllOnlineVisitors(int accountId);
}
