using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
/// <summary>
///VisitSessionService 的摘要说明
/// </summary>
public class VisitSessionService
{
    private static List<VisitSession> sessions = new List<VisitSession>();
    private const int maxVisitorSessionCountInMemory = 200;//定义最大值 

    /// <summary>
    /// 保存一条新访客会话
    /// </summary>
    /// <param name="session"></param>
    public static void NewSession(VisitSession session)
    {
        if (sessions.Find(s=>s.SessionId == session.SessionId) != null)
        {
            return;
        }

        sessions.Add(session);
        if (sessions.Count > maxVisitorSessionCountInMemory)
        {
            for (int i = sessions.Count; i > 0; i--)
            {
                if (sessions[i].Status ==VisitSessionStatus.Leave)
                {
                    sessions.RemoveAt(i);
                    break;
                }
            }
        }
        LiveSupport.LiveSupportDAL.SqlProviders.SqlVisitSessionProvider.NewSession(session);
    }

    /// <summary>
    /// 跟据访客会话取一行数据
    /// </summary>
    /// <param name="sessionId"></param>
    /// <returns></returns>
    public static VisitSession GetSessionById(string sessionId)
    {
        VisitSession s = sessions.Find(a => a.SessionId == sessionId);
        if (s == null)
        {
          return LiveSupport.LiveSupportDAL.SqlProviders.SqlVisitSessionProvider.GetSessionById(sessionId);
        }
        return s;
    }
    /// <summary>
    /// 查询在这个时候之后新加的访客会话信息
    /// </summary>
    /// <param name="lastCheck">会话ID</param>
    /// <returns>VisitSession对象</returns>
    public static List<VisitSession> GetVisitSessionChange(string accountId, DateTime lastCheck)
    {
        List<VisitSession> vss = new List<VisitSession>();
        foreach (var item in sessions)
        {
            Visitor v = VisitorService.GetVisitor(item.VisitorId);
            if (v != null && v.AccountId == accountId)
	        {
                vss.Add(v.CurrentSession);
	        }
        }
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
        return sessions.FindAll(s => s.OperatorId == operatorId && s.Status == VisitSessionStatus.Chatting);
    }

    public static void RequestChat(Chat chatRequest)
    {
        VisitSession session = sessions.Find(s => s.SessionId == chatRequest.ChatId);
        if (session != null)
        {
            session.Status = VisitSessionStatus.ChatRequesting;
            ChatService.ChatPageRequestChat(chatRequest);
        }
    }

}
