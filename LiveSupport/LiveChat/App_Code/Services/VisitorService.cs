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
    private static VisitorProvider _visitor = null;
    private static object _lock = new object();
    public static VisitorProvider Visitor
    {
        get { return VisitorService._visitor; }
        set { VisitorService._visitor = value; }
    }
    private static void LoadProvider()
    {
        // if we do not have initiated the provider
        if (_visitor == null)
        {
            lock (_lock)
            {
                // Do this again to make sure _visitor is still null
                if (_visitor == null)
                {
                    // Get a reference to the <requestService> section
                    VisitorServiceSection section = (VisitorServiceSection)WebConfigurationManager.GetSection("system.web/visitorService");

                    // Load the default provider
                    if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
                        _visitor = (VisitorProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(VisitorProvider));

                    if (_visitor == null)
                        throw new ProviderException("Unable to load the VisitorProvider");
                }
            }
        }
    }
    public static List<Visitor> GetVisitorsByStatus(int accoutnId, Visitor.VisitorStatus status)
    {
        LoadProvider();
        return _visitor.GetVistorsByStatus(accoutnId, status);
    }
}
