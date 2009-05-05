#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Request Provider Helper
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;


/// <summary>
/// Summary description for RequestService
/// </summary>
public class RequestService
{
	private static RequestProvider _provider = null;
	private static object _lock = new object();

	public RequestProvider Provider
	{
		get { return _provider; }
	}

	public static bool LogRequest(RequestInfo req)
	{
		// Load the provider
		LoadProvider();

		return _provider.LogRequest(req);
	}

	public static List<RequestInfo> GetRequest(int accountId, DateTime lastRequest)
	{
		// Load the provider
		LoadProvider();

        return _provider.GetRequest(accountId,lastRequest);
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
					RequestServiceSection section = (RequestServiceSection)WebConfigurationManager.GetSection("system.web/requestService");

					// Load the default provider
					if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
						_provider = (RequestProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(RequestProvider));

					if (_provider == null)
						throw new ProviderException("Unable to load the RequestProvider");
				}
			}
		}
	}
}
