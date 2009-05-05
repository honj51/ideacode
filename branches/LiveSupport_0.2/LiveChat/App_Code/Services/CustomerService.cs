using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Configuration.Provider;

/// <summary>
/// CustomerService 的摘要说明
/// </summary>
public class CustomerService
{
    private static CustomerProvider _provider = null;
    private static object _lock = new object();

    public CustomerProvider Provider
    {
        get { return _provider; }
    }
    
    private static void LoadProvider()
    {
        // if we do not have initiated the provider
        if (_provider == null)
        {
            lock (_lock)
            {
                // Do this again to make sure _provider is still null
                if (_provider == null)
                {
                    // Get a reference to the <requestService> section
                    OperatorServiceSection section = (OperatorServiceSection)WebConfigurationManager.GetSection("system.web/operatorService");

                    // Load the default provider
                    if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
                        _provider = (CustomerProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(OperatorProvider));

                    if (_provider == null)
                        throw new ProviderException("Unable to load the OperatorProvider");
                }
            }
        }
    }
    public CustomerService()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
}
