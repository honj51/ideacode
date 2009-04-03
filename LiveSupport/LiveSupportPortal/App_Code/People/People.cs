using System;
using System.Configuration;
using System.Web.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Web;
///<summary>
/// class People
/// Provides static functions to access 'people' 
/// and serves as abastraction layer between the web Page and
/// actual data providers
///</summary>
  public static class People {

    private static bool _isInitialized = false;
    private static PeopleProvider _provider;
    private static SmallBusinessDataProvidersSection _providersSection;

    public static PeopleProvider Provider {
      get {
        Initialize();
        return _provider;
      }
    }

    public static List<Person> GetAllPersons()
    {
        return Provider.GetAllPersons();
    }


    private static void Initialize() {
      if (!_isInitialized) {
          _providersSection = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
          if (_providersSection == null)
          {
              throw new Exception(Messages.PeopleConfigSectionNotFound);
        }
        
        _provider = ProvidersHelper.InstantiateProvider(_providersSection.PeopleProviders[_providersSection.PeopleProviderName], 
            typeof(PeopleProvider)) as PeopleProvider; 

        if (_provider == null) {
          throw new Exception("People default provider could not be instantiated");
        }
      }
    }

  }
