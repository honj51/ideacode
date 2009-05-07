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
using System.Xml.Linq;
using LiveSupport.DAL.Entity;
using System.Web.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;

/// <summary>
///VisitSessionService 的摘要说明
/// </summary>
public class VisitSessionService
{
    private static List<VisitSession> sessions = new List<VisitSession>();
    private const int maxVisitorSessionCountInMemory = 200;//定义最大值 
    #region DB related
    private static VisitSessionProvider _visitSessionProvider = null;
    private static object _lock = new object();
    public static VisitSessionProvider Provider
    {
        get {
            LoadProvider();
            return VisitSessionService._visitSessionProvider; 
        }
    }
    
    private static void LoadProvider()
    {
        // if we do not have initiated the provider
        if (_visitSessionProvider == null)
        {
            lock (_lock)
            {
                // Do this again to make sure _visitSession is still null
                if (_visitSessionProvider == null)
                {
                    // Get a reference to the <requestService> section
                    sessionserviceSection section = (sessionserviceSection)WebConfigurationManager.GetSection("system.web/visitSessionService");

                    // Load the default provider
                    if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
                        _visitSessionProvider = (VisitSessionProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(VisitSessionProvider));

                    if (_visitSessionProvider == null)
                        throw new ProviderException("Unable to load the VisitorProvider");
                }
            }
        }
    }
    #endregion
    //保存一条新访客会话
    public static void NewSession(VisitSession session)
    {
        sessions.Add(session);
        if (sessions.Count > maxVisitorSessionCountInMemory)
        {
            for (int i = sessions.Count; i > 0; i--)
            {
                if (sessions[i].Status == VisitSessionStatus.Leave)
                {
                    sessions.RemoveAt[i];
                    break;
                }
            }
        }
        Provider.NewSession(session);
    }
    //跟据访客会话取一行数据
    public static VisitSession GetSessionById(string sessionId)
    {
        VisitSession s = sessions.Find(s => s.SessionId = sessionId);
        if (s == null)
        {
            Provider.GetSessionById(sessionId);
        }
        return s;
    }
    //查询在这个时候之后新加的访客会话信息，
    public static List<VisitSession> GetVisitSessionChange(DateTime lastCheck)
    {
        Provider.GetVisitSessionChange(lastCheck);
    }
    //跟据客服ID查还回正在聊天的会话信息
    public static List<VisitSession> GetActiveSessionsByOperatorId(int operatorId)
    {
        return sessions.FindAll(s => s.Operators == operatorId && s.Status == VisitSessionStatus.Chatting);
    }
}
