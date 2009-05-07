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
}
