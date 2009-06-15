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
    public abstract void NewSession(VisitSession session);//保存一条新访客会话
    public abstract VisitSession GetSessionById(string sessionId); //跟据访客会话取一行数据
    public abstract List<VisitSession> GetVisitSessionChange(DateTime lastCheck);//查询在这个时候之后新加的访客会话信息，
}
