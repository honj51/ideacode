using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;


/// <summary>
///VisitorService 的摘要说明
/// </summary>
public class VisitorService
{
    private const int MaxVisitorCountInMemory = 200;//定义最大值 
    private static List<Visitor> visitors = new List<Visitor>();
    public static IVisitorProvider Provider = new SqlVisitorProvider();
    public static List<Visitor> GetAllVisitors()
    {
        return visitors;
    }
    /// <summary>
    /// 查询一行访客信息跟据访客ID
    /// </summary>
    /// <param name="visitorId">访客ID</param>
    /// <returns>Visitorc对象</returns>
    public static Visitor GetVisitorById(string visitorId)
    {
        Visitor v = null;
        foreach (Visitor item in visitors)
        {
            //if (item == null) continue;
            if (item.VisitorId == visitorId)
            {
                v = item;
                break;
            }
        }
        if (v == null)
        {
            v = Provider.GetVisitorById(visitorId);
            if (v != null)
            {
                v.CurrentSession = null;
                Trace.WriteLine(string.Format("VisitorService.GetVisitorById() from DB: VisitorId=", v.VisitorId));
                visitors.Add(v);
            }
        }
        return v;
    }

    /// <summary>
    /// 取所有该公司的在线访客
    /// </summary>
    /// <param name="accountId">公司ID</param>
    /// <returns></returns>
    public static List<Visitor> GetAllOnlineVisitors(string accountId)
    {
        Trace.WriteLine(string.Format("VisitorService.GetAllOnlineVisitors(accountId = {0})", accountId));
        List<Visitor> onlineVisitors = new List<Visitor>();
        foreach (Visitor item in visitors)
        {
            if (item.CurrentSession != null && item.CurrentSession.Status != VisitSessionStatus.Leave && item.AccountId == accountId)
            {
                onlineVisitors.Add(item);
            }
        }
        return onlineVisitors;
    }
    /// <summary>
    /// 取新添的访客信息
    /// </summary>
    /// <param name="lastCheck"></param>
    /// <returns>Visitor集合</returns>
    public static List<Visitor> GetNewVisitors(string accountId, long lastCheck)
    {
        Trace.WriteLine(string.Format("{0}({1},{2})",MethodBase.GetCurrentMethod().Name,accountId,lastCheck));
        StringBuilder sb = new StringBuilder();
        List<Visitor> vs = new List<Visitor>();
        foreach (Visitor item in visitors)
        {
            //if (item == null) continue;
            if (item.CurrentSession == null)
            {
                continue;
            }
            else if (item.AccountId == accountId && item.CurrentSession.VisitingTime.Ticks > lastCheck)
            {
                vs.Add(item);
                sb.Append(item.ToString());
            }
        }
        Trace.WriteLine(string.Format("Return Count={0} : {1}", vs.Count, sb.ToString()));
        return vs;     
    }

    /// <summary>
    /// 新增访客信息
    /// </summary>
    /// <param name="visitor"></param>
    public static void NewVisitor(Visitor visitor)
    {
        Trace.WriteLine(string.Format("NewVisitor : {0}", visitor.ToString()));
        if (GetVisitorById(visitor.VisitorId) == null)
        {
            Provider.NewVisitor(visitor);
            visitors.Add(visitor);
        }
        else
        {
            Trace.WriteLine("Error: Visitor is aleady exist");
        }

        // 删除多出的Visitor
        if (visitors.Count > MaxVisitorCountInMemory)
        {
            for (int i = visitors.Count-1; i > 0; i--)
            {
                if (visitors[i].CurrentSession.Status == VisitSessionStatus.Leave)
                {
                    visitors.RemoveAt(i);
                    break;
                }
            }
        }
    }
    /// <summary>
    /// 更新一个
    /// </summary>
    /// <param name="vs"></param>
    public static void UpdateVisitor(Visitor vs)
    {
        Provider.UpdateVisitor(vs);
    }
}
