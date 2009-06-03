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
    static VisitorService()
    { 
        // Load all Accounts
    }

    private const int maxVisitorCountInMemory = 200;//定义最大值 
    private static List<Visitor> visitors = new List<Visitor>();
    public static IVisitorProvider Provider = new SqlVisitorProvider();
    /// <summary>
    /// 查询一行访客信息跟据访客ID
    /// </summary>
    /// <param name="visitorId">访客ID</param>
    /// <returns>Visitorc对象</returns>
    public static Visitor GetVisitor(string visitorId)
    {
        Visitor v = null;
        foreach (Visitor item in visitors)
        {
            if (item == null) continue;
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
                Trace.WriteLine(string.Format("GetVisitor from DB: VisitorId=", v.VisitorId));
                visitors.Add(v);
            }
        }
        return v;
    }

    /// <summary>
    /// 取所有该公司的在在线访客
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
    /// <param name="lastCheck">最后一个访客时间</param>
    /// <returns>Visitor集合</returns>
    public static List<Visitor> GetNewVisitors(string accountId, long lastCheck)
    {
        Trace.WriteLine(string.Format("{0}({1},{2})",MethodBase.GetCurrentMethod().Name,accountId,lastCheck));
        StringBuilder sb = new StringBuilder();
        List<Visitor> vs = new List<Visitor>();
        foreach (Visitor item in visitors)
        {
            if (item == null) continue;
            if (item.CurrentSession == null)
            {
                continue;
            }
            else if (item.AccountId == accountId && item.CurrentSession != null&& item.CurrentSession.VisitingTime.Ticks > lastCheck)
            {
                vs.Add(item);
                sb.AppendFormat("VisitId={0},Status={1},SessionId={2} | ", item.VisitorId, item.CurrentSession.Status.ToString(), item.CurrentSession.VisitorId);
            }
        }
        Trace.WriteLine(string.Format("Return {0} : {1}", vs.Count, sb.ToString()));
        Trace.Flush();
        return vs;     
    }
    /// <summary>
    /// 新增访客信息
    /// </summary>
    /// <param name="visitor"></param>
    public static void NewVisitor(Visitor visitor)
    {
        Trace.WriteLine(string.Format("NewVisitor : {0}", visitor.ToString()));
        if (GetVisitor(visitor.VisitorId) == null)
        {
            Provider.NewVisitor(visitor);
            visitors.Add(visitor);
        }
        else
        {
            Trace.WriteLine("Visitor Found, will not add to DB");
        }

        // 删除多出的Visitor
        if (visitors.Count > maxVisitorCountInMemory)
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
}
