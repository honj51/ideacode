using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Configuration;


///<summary>
/// class News
/// Provides static functions to access News
/// and serves as abastraction layer between the web Page and
/// actual data providers
///</summary>
public static class News
{

    private static bool _isInitialized = false;
    private static NewsProvider _provider;
    private static SmallBusinessDataProvidersSection _providersSection;
    
    
    public static NewsProvider Provider
    {
        get
        {
            Initialize();
            return _provider;
        }
    }

    public static List<NewsItem> GetAllNews()
    {
        return Provider.GetAllNews();
    }

    public static NewsItem GetNewsItem(string newsItemId)
    {
        return Provider.GetNewsItem(newsItemId);
    }
    
    private static void Initialize()
    {
        if (!_isInitialized)
        {
            _providersSection = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
            if (_providersSection == null)
            {
                throw new InvalidOperationException(Messages.NewsConfigSectionNotFound);
            }

            _provider = ProvidersHelper.InstantiateProvider(_providersSection.NewsProviders[_providersSection.NewsProviderName],
                typeof(NewsProvider)) as NewsProvider;

            if (_provider == null)
            {
                throw new InvalidOperationException(Messages.NewsProviderInstantiationError);
            }
            _isInitialized = true;
        }
    }
} // end class

