using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;


/// <summary>
///VisitorService 的摘要说明
/// </summary>
public class VisitorService
{
    private const int maxVisitorCountInMemory = 200;//定义最大值 

    private static List<Visitor> visitors = new List<Visitor>();

    /// <summary>
    /// 查询一行访客信息跟据访客ID
    /// </summary>
    /// <param name="visitorId">访客ID</param>
    /// <returns>Visitorc对象</returns>
    public static Visitor GetVisitor(string visitorId)
    {
        foreach (var item in visitors)
        {
            if (item.VisitorId == visitorId)
            {
                return item;
            }
        }
       return LiveSupport.LiveSupportDAL.SqlProviders.SqlVisitorProvider.GetVisitorById(visitorId);
    }
    /// <summary>
    /// 保存新的访客信息和会话信息
    /// </summary>
    /// <param name="visitor">visitor对象</param>
    /// <param name="session">VisitSession对象</param>
    public static void NewVisit(Visitor visitor, VisitSession session)
    {
        LiveSupport.LiveSupportDAL.SqlProviders.SqlVisitorProvider.NewVisitor(visitor);
        visitors.Add(visitor);
        if (visitors.Count > maxVisitorCountInMemory)
        {
            for (int i = visitors.Count; i > 0 ; i--)
            {
                if (visitors[i].CurrentSession.Status == VisitSessionStatus.Leave)
                {
                    visitors.RemoveAt(i);
                    break;
                }
            }
        }
        VisitSessionService.NewSession(session);
    }
    /// <summary>
    /// 取所有该公司的在线客服
    /// </summary>
    /// <param name="accountId">公司ID</param>
    /// <returns></returns>
    public static List<Visitor> GetAllOnlineVisitors(int accountId)
    {
        List<Visitor> onlineVisitors = new List<Visitor>();
        foreach (var item in visitors)
        {
            if (item.CurrentSession != null && item.CurrentSession.Status != VisitSessionStatus.Leave)
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
    public static List<Visitor> GetNewVisitors(DateTime lastCheck)
    {
        List<Visitor> vs = new List<Visitor>();
        foreach (var item in visitors)
        {
            if (item.CurrentSession == null)
        	{
                continue;
	        }
            else if (item.CurrentSession != null && item.CurrentSession.VisitingTime > lastCheck)
            {
                vs.Add(item);
            }
        }
        return vs;       
    }
}
