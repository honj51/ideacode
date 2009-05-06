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
    public abstract List<Visitor> GetVistorsByStatus(int accountId, VisitSessionStatus status);
}
