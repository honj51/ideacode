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

/// <summary>
///VisitSessionService 的摘要说明
/// </summary>
public class VisitSessionService
{
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
                    VisitorServiceSection section = (VisitorServiceSection)WebConfigurationManager.GetSection("system.web/visitSessionService");

                    // Load the default provider
                    if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
                        _visitSessionProvider = (VisitSessionProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(VisitSessionProvider));

                    if (_visitSessionProvider == null)
                        throw new ProviderException("Unable to load the VisitorProvider");
                }
            }
        }
    }



    internal static void NewSession(VisitSession session)
    {
        // TODO: 没有数据库
        
    }

    internal static VisitSession GetSessionById(string sessionId)
    {
        // TODO: 没有数据库

        // Test only

        VisitSession s = new VisitSession();
        s.SessionId = sessionId;

        return s;
        //return null;
    }
}
