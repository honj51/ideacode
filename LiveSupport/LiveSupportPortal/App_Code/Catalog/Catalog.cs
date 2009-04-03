using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Configuration;

///<summary>
/// class Catalog
/// Provides static functions to access items & categories 
/// and serves as abastraction layer between the web Page and
/// actual data providers
///</summary>
public static class Catalog
{
    private static bool _isInitialized = false;    
    private static CatalogProvider _provider;
    private static SmallBusinessDataProvidersSection _providersSection;
    
    ///<summary>
    /// returns the current items data provider
    ///</summary>    
    public static CatalogProvider Provider
    {
        get
        {
            Initialize();
            return _provider;
        }
    }
    

    ///<summary>
    /// Returns item belonging to the category having id: 'parentCategoryId' 
    ///</summary>
    public static List<Item> GetChildItems(string categoryId)
    {
        return Provider.GetChildItems(categoryId);
    }



    ///<summary>
    /// Returns subcategories under the category having id: 'parentCategoryId'
    ///</summary>
    public static List<Category> GetChildCategories(string parentCategoryId)
    {
        return Provider.GetChildCategories(parentCategoryId);
    }

    ///<summary>
    /// Returns item having the id 'itemId'
    ///</summary>
    public static Item GetItem(string itemId)
    {
        return Provider.GetItem(itemId);
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
}

