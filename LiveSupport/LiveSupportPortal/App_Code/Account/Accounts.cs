using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
///Account 的摘要说明
/// </summary>
public static class Accounts
{
    private static bool _isInitialized = false;
    private static AccountsProvider _provider;
    
    ///<summary>
    /// returns the current accounts data provider
    ///</summary>    
    public static AccountsProvider Provider
    {
        get
        {
            Initialize();
            return _provider;
        }
    }

    /// <summary>
    /// Initilizes a concrete data provider based on setting in web.config
    /// InvalidOperationException may be thrown if an actual provider cannot be instantiated
    /// </summary>
    private static void Initialize()
    {
        if (!_isInitialized)
        {
            _providersSection = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
            if (_providersSection == null)
            {
                throw new InvalidOperationException(Messages.ItemConfigNotFound);
            }
            _provider = ProvidersHelper.InstantiateProvider(_providersSection.CatalogProviders[_providersSection.CatalogProviderName],
                typeof(CatalogProvider)) as CatalogProvider;

            if (_provider == null)
            {
                throw new InvalidOperationException(Messages.ItemProviderInstantiationError);
            }
            _isInitialized = true;
        }
    }

	public Accounts()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
}
