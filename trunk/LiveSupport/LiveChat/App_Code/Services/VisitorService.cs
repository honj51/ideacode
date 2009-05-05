using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;
using LiveSupport.BLL;

/// <summary>
///VisitorService 的摘要说明
/// </summary>
public class VisitorService
{
    private static VisitorProvider _visitor = null;

    public static VisitorProvider Visitor
    {
        get { return VisitorService._visitor; }
        set { VisitorService._visitor = value; }
    }
    public static List<Visitor> GetVisitorByStatus(Visitor vs)
    {
        return  _visitor.GetVistorByStatus(vs);
    }
}
