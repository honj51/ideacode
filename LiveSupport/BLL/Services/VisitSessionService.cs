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

    private const int maxVisitorSessionCountInMemory = 200;//定义最大值 
    public static IVisitSessionProvider Provider = new SqlVisitSessionProvider();
    /// <summary>
    /// 保存一条新访客会话
    /// </summary>
    /// <param name="session"></param>
    public static void NewSession(VisitSession session)
    {
        Debug.WriteLine(string.Format("NewSession : {0}", session.ToString()));

    //    if (sessions.Find(s => s.Session.SessionId == session.SessionId) != null)
        foreach (VisitSessionHit item in sessions)
        {
            if (item.Session.SessionId == session.SessionId)
            {
                Debug.WriteLine("Session Found, will not add to DB");
                return;
            }
        }

        sessions.Add(new VisitSessionHit(session));
        if (sessions.Count > maxVisitorSessionCountInMemory)
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
        Provider.NewSession(session);
    }

    /// <summary>
    /// 跟据访客会话取一行数据
    /// </summary>
    /// <param name="sessionId"></param>
    /// <returns></returns>
    public static VisitSession GetSessionById(string sessionId)
    {
       // VisitSessionHit s = sessions.Find(a => a.Session.SessionId == sessionId);3.0
        foreach (VisitSessionHit item in sessions)
        {
            if (item.Session.SessionId == sessionId)
            {
                return item.Session;
            }
        }
        return Provider.GetSessionById(sessionId);
    }
    /// <summary>
    /// 查询在这个时候之后新加的访客会话信息
    /// </summary>
    /// <param name="lastCheck">会话ID</param>
    /// <returns>VisitSession对象</returns>
    public static List<VisitSession> GetVisitSessionChange(string accountId, long lastCheck)
    {
        Trace.WriteLine(string.Format("{0}({1},{2})", MethodBase.GetCurrentMethod().Name, accountId, lastCheck));
        StringBuilder sb = new StringBuilder();
        List<VisitSession> vss = new List<VisitSession>();
        foreach (VisitSessionHit item in sessions)
        {
            Visitor v = VisitorService.GetVisitor(item.Session.VisitorId);
            if (v != null && v.AccountId == accountId)
	        {
                vss.Add(v.CurrentSession);
                //sb.AppendFormat("SessionId={0},Status={1},VisitId={2} | ",v.CurrentSessionId,v.CurrentSession.Status.ToString(),v.VisitorId);
	        }
        }
        
        Trace.WriteLine(string.Format("Return {0} : {1}", vss.Count, sb.ToString()));
        Trace.Flush();

        return vss;
        //return LiveSupport.LiveSupportDAL.SqlProviders.SqlVisitSessionProvider.GetVisitSessionChange(lastCheck);
    }
    /// <summary>
    /// 跟据客服ID查还回正在聊天的会话信息
    /// </summary>
    /// <param name="operatorId"></param>
    /// <returns></returns>
    public static List<VisitSession> GetActiveSessionsByOperatorId(string operatorId)
    {
        List<VisitSession> ss = new List<VisitSession>();
        foreach (VisitSessionHit item in sessions)
        {
            if (item.Session.OperatorId == operatorId && item.Session.Status == VisitSessionStatus.Chatting)
            {
                ss.Add(item.Session);
            }
        }
        return ss;
    }
    /// <summary>
    /// 邀请客服对话
    /// </summary>
    /// <param name="chatRequest"></param>
    public static void RequestChat(Chat chatRequest)
    {
        foreach (VisitSessionHit item in sessions)
        {
            if (item.Session.SessionId == chatRequest.ChatId)
            {
                item.Session.Status = VisitSessionStatus.ChatRequesting;
                ChatService.ChatPageRequestChat(chatRequest);
            }
        }
    }

    public static void MaintanStatus()
    {
        foreach (VisitSessionHit item in sessions)
        {
            if (DateTime.Now > item.LastHitTime.AddSeconds(8) && item.Session.Status != VisitSessionStatus.Leave)
            {
                item.Session.Status = VisitSessionStatus.Leave;
                item.Session.LeaveTime = DateTime.Now;
                
                //VisitorService.GetVisitor(item.Session.VisitorId).CurrentSession = null;
                Debug.WriteLine(string.Format("Session {0} Leave",item.Session.SessionId));
            }
        }
    }

    public static void Hit(string visitorId)
    {
        // we should find the new session form visitor instance
        Visitor v = VisitorService.GetVisitor(visitorId);
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
        }

        Debug.WriteLine(string.Format("Session {0} Hit", v.CurrentSessionId));
    }
    /// <summary>
    /// 跟据访客ID查询所有的话话信息
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    public static List<VisitSession> GetVisitSessionByVisitor(string visitorId)
    {
        return Provider.GetVisitSessionByVisitor(visitorId);
    }
}
