using System;
using System.Data;
using System.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.BLL.Exceptions;
using OperatorServiceInterface;
/// <summary>
///VisitSessionService 的摘要说明
/// </summary>
public class VisitSessionService
{
    public class VisitSessionHit
    {
        public VisitSessionHit(VisitSession s)
        {
            Session = s;
            LastHitTime = DateTime.Now;
        }
        public VisitSession Session;
        public DateTime LastHitTime;
    }
    private static List<VisitSessionHit> sessions = new List<VisitSessionHit>();

    public static List<VisitSessionHit> Sessions
    {
        get { return VisitSessionService.sessions; }
    }

    private const int MaxVisitorSessionCountInMemory = 200;//定义最大值 
    public static IVisitSessionProvider Provider = new SqlVisitSessionProvider();
    public static List<VisitSessionHit> GetAllVisitSession()
    {
        return sessions;
    }

    public static event EventHandler<NewVisitingEventArgs> NewVisiting; //访客
    public static event EventHandler<VisitorLeaveEventArgs> VisitorLeave; // 访客离开 

    /// <summary>
    /// 保存一条新访客会话
    /// </summary>
    /// <param name="session"></param>
    public static void NewSession(VisitSession session)
    {
        Trace.WriteLine(string.Format("VisitSessionService.NewSession : {0}", session.ToString()));

        if (GetSessionById(session.SessionId) != null)
        {
            Trace.WriteLine("Error:会话已存在！");
            return;
        }
        sessions.Add(new VisitSessionHit(session));
        Provider.NewSession(session);
        //
        if (NewVisiting != null)
        {
            NewVisiting(null, new NewVisitingEventArgs(VisitorService.GetVisitorById(session.VisitorId), session));
        }

        if (sessions.Count > MaxVisitorSessionCountInMemory)
        {
            for (int i = sessions.Count-1; i >= 0; i--)
            {
                if (sessions[i].Session.Status ==VisitSessionStatus.Leave)
                {
                    sessions.RemoveAt(i);
                    break;
                }
            }
        }
    }

    /// <summary>
    /// 跟据访客会话取一行数据
    /// </summary>
    /// <param name="sessionId"></param>
    /// <returns></returns>
    public static VisitSession GetSessionById(string sessionId)
    {
        Trace.WriteLine(string.Format("VisitSessionService.GetSessionById({0})", sessionId));
        VisitSession vs=null;
        foreach (VisitSessionHit item in sessions)
        {
            if (item.Session.SessionId == sessionId)
            {
                vs=item.Session;
                break;
            }
        }
        if (vs == null)
        {
           vs=Provider.GetSessionById(sessionId);
        }
        if (vs == null)
        {
            Trace.WriteLine(string.Format("Error: VisitSessionService.GetSessionById({0}) 错误 不能在sessions和DB 中找到session",sessionId));
        }
        return vs;
    }

    // TODO: 该方法需要重新设计
    /// <summary>
    /// 查询在这个时候之后新加的访客会话信息
    /// </summary>
    /// <param name="lastCheck">会话ID</param>
    /// <returns>VisitSession对象</returns>
    /// 
    public static List<VisitSession> GetVisitSessionChange(string accountId, long lastCheck)
    {
        Trace.WriteLine(string.Format("{0}({1},{2})", MethodBase.GetCurrentMethod().Name, accountId, lastCheck));
        StringBuilder sb = new StringBuilder();
        List<VisitSession> vss = new List<VisitSession>();
        foreach (VisitSessionHit item in sessions)
        {
            Visitor v = VisitorService.GetVisitorById(item.Session.VisitorId);
            if (v != null && v.AccountId == accountId)
	        {
                vss.Add(v.CurrentSession);
                //sb.AppendFormat("SessionId={0},Status={1},VisitId={2} | ",v.CurrentSessionId,v.CurrentSession.Status.ToString(),v.VisitorId);
	        }
        }
        
        Trace.WriteLine(string.Format("Return {0} : {1}", vss.Count, sb.ToString()));

        return vss;
    }

    /// <summary>
    /// 
    /// </summary>
    public static void MaintanStatus()
    {
        foreach (VisitSessionHit item in sessions)
        {
            if (DateTime.Now > item.LastHitTime.AddSeconds(8) && item.Session.Status != VisitSessionStatus.Leave)
            {
                item.Session.Status = VisitSessionStatus.Leave;
                item.Session.LeaveTime = DateTime.Now;
                
                //VisitorService.GetVisitor(item.Session.VisitorId).CurrentSession = null;
                Trace.WriteLine(string.Format("Session {0} Leave",item.Session.SessionId));
                if (VisitorLeave != null)
                {
                    VisitorLeave(null, new VisitorLeaveEventArgs(item.Session.VisitorId));
                }
            }
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="visitorId"></param>
    public static void Hit(string visitorId)
    {
        Trace.WriteLine(string.Format("VisitorService.Hit(visitorId = {0})", visitorId));
        Visitor v = VisitorService.GetVisitorById(visitorId);
        if (v != null && v.CurrentSession != null)
        {
            if (v.CurrentSession.Status == VisitSessionStatus.Leave)
            {
                v.CurrentSession.Status = VisitSessionStatus.Visiting;
            }
          //  VisitSessionHit h = sessions.Find(sh => sh.Session.SessionId == v.CurrentSessionId);
            foreach (VisitSessionHit item in sessions)
            {
                if (item.Session.SessionId == v.CurrentSessionId)
                {
                    item.LastHitTime = DateTime.Now;
                }
            }
            Trace.WriteLine(string.Format("Session {0} Hit", v.CurrentSessionId));
        }

        
    }

    /// <summary>
    /// 跟据访客ID查询所有的会话信息
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    public static List<VisitSession> GetHistoryVisitSessionByVisitorId(string visitorId)
    {
        return Provider.GetVisitSessionByVisitor(visitorId);
    }

    /// <summary>
    /// 更改VisitSession的状态
    /// </summary>
    /// <param name="sessionId"></param>
    /// <param name="visitSessionStatus"></param>
    public static void SetSessionStatus(string sessionId, VisitSessionStatus visitSessionStatus)
    {
        VisitSession s = GetSessionById(sessionId);
        if (s == null)
        {
            throw new BLLInternalException("VisitSession not found: SessionId=" + sessionId);
        }
        s.Status = visitSessionStatus;
    }
}
