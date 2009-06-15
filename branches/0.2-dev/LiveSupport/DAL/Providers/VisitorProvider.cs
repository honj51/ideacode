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
    public abstract Visitor GetVisitorById(string visitorId);//跟据访客ID查单行记录
    public abstract void NewVisitor(Visitor visitor);//保存一条新的访客记录
    public abstract List<Visitor> GetAllOnlineVisitors(int accountId);//根据公司ID查询所有在线访客
}
