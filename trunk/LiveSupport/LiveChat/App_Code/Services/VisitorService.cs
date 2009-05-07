using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;
using LiveSupport.BLL;
using LiveSupport.DAL.Properties;

/// <summary>
///VisitorService 的摘要说明
/// </summary>
public class VisitorService
{
    #region DB related
    private static VisitorProvider _visitorProvider = null;
    private static object _lock = new object();
    public static VisitorProvider Provider
    {
        get
        {
            LoadProvider();
            return VisitorService._visitorProvider;
        }
    }

    private static void LoadProvider()
    {
        // if we do not have initiated the provider
        if (_visitorProvider == null)
        {
            lock (_lock)
            {
                // Do this again to make sure _visitor is still null
                if (_visitorProvider == null)
                {
                    // Get a reference to the <requestService> section
                    VisitorServiceSection section = (VisitorServiceSection)WebConfigurationManager.GetSection("system.web/visitorService");

                    // Load the default provider
                    if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
                        _visitorProvider = (VisitorProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(VisitorProvider));

                    if (_visitorProvider == null)
                        throw new ProviderException("Unable to load the VisitorProvider");
                }
            }
        }
    }
    #endregion

    private const int maxVisitorCountInMemory = 200;//定义最大值 

    private static List<Visitor> visitors = new List<Visitor>();

    public static Visitor GetVisitor(string visitorId)
    {
        foreach (var item in visitors)
        {
            if (item.VisitorId == visitorId)
            {
                return item;
            }
        }

        return Provider.GetVisitorById(visitorId);
    }

    public static void NewVisit(Visitor visitor, VisitSession session)
    {
        Provider.NewVisitor(visitor);
        visitors.Add(visitor);

        if (visitors.Count > maxVisitorCountInMemory)
        {
            for (int i = visitors.Count; i > 0 ; i--)
            {
                if (visitors[i].CurrentSession.Status == VisitSessionStatus.Leave)
                {
                    visitors.RemoveAt[i];
                    break;
                }
            }
        }

        VisitSessionService.NewSession(session);
    }

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
