#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Operator Provider Helper
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
/// Summary description for OperatorService
/// </summary>
public class OperatorService
{
	private static OperatorProvider _provider = null;
	private static object _lock = new object();

	public OperatorProvider Provider
	{
		get { return _provider; }
	}

	public static void UpdateStatus(int operatorId, bool isOnline)
	{
		// Load the provider
		LoadProvider();

		_provider.UpdateStatus(operatorId, isOnline);
	}

	public static bool GetOperatorStatus()
	{
		// Load the provider
		LoadProvider();

		return _provider.GetOperatorStatus();
	}

	public static OperatorInfo LogIn(string userName, string password, string customerName)
	{
		// Load the provider
		LoadProvider();

        return _provider.LogIn(userName, password, customerName);
	}

	public static List<ChatRequestInfo> GetChatRequests(int operatorId)
	{
		// Load the provider
		LoadProvider();

		return _provider.GetChatRequest(operatorId);
	}

    public static List<OperatorInfo> GetOnlineOperator()
    {
        // Load the provider
        LoadProvider();

        return _provider.GetOnlineOperator();
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
						_provider = (OperatorProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(OperatorProvider));

					if (_provider == null)
						throw new ProviderException("Unable to load the OperatorProvider");
				}
			}
		}
	}
}
