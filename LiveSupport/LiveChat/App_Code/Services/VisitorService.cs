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
    private static VisitorProvider _visitorProvider = null;
    private static object _lock = new object();
    
    public static VisitorProvider Provider
    {
        get {
            LoadProvider();
            return VisitorService._visitorProvider; }
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
    

    public static Visitor GetVisitor(string visitorId)
    {
        return Provider.GetVisitorById(visitorId);
    }

    public static void NewVisit(Visitor visitor, VisitSession session)
    {
        Provider.NewVisitor(visitor);
        VisitSessionService.NewSession(session);
    }

    public static List<Visitor> GetAllOnlineVisitors(int accountId)
    {
        List<Visitor> visitors = Provider.GetAllOnlineVisitors(accountId);
        foreach (var item in visitors)
        {
            item.CurrentSession = VisitSessionService.GetSessionById(item.CurrentSessionId);
        }
        return visitors;
    }
}
