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
using LiveSupport.BLL;
using LiveSupport.DAL.Entity;

/// <summary>
/// Summary description for OperatorService
/// </summary>
public class OperatorService
{
    //private static OperatorProvider _provider = null;
	private static object _lock = new object();

    //public OperatorProvider Provider
    //{
    //    get { return _provider; }
    //}

	public static void UpdateStatus(int operatorId, bool isOnline)
	{
        OperatorsManager.UpdateStatus(operatorId, isOnline);
	}

	public static bool GetOperatorStatus(int accountId)
	{
		// Load the provider
        //LoadProvider();

        return OperatorsManager.GetOperatorStatus(accountId);
	}

	public static Operator LogIn(string userName, string password, string customerName)
	{
		// Load the provider
        //LoadProvider();

        //return _provider.LogIn(userName, password, customerName);
        return OperatorsManager.LoginOperator(userName, password, customerName);
	}

	public static List<ChatRequestInfo> GetChatRequests(Operator op)
	{
		// Load the provider
        //LoadProvider();

		//return OperatorsManager.GetChatRequest(operatorId);
        return ChatService.GetRequests(op);
	}

    public static List<Operator> GetOnlineOperator()
    {
        // Load the provider
        //LoadProvider();

        return OperatorsManager.GetOnlineOperator();
    }

    public static Operator GetOperatorById(int id)
    {
        return OperatorsManager.GetOperatorById(id);
    }

    //private static void LoadProvider()
    //{
    //    // if we do not have initiated the provider
    //    if (_provider == null)
    //    {
    //        lock (_lock)
    //        {
    //            // Do this again to make sure _provider is still null
    //            if (_provider == null)
    //            {
    //                // Get a reference to the <requestService> section
    //                OperatorServiceSection section = (OperatorServiceSection)WebConfigurationManager.GetSection("system.web/operatorService");

    //                // Load the default provider
    //                if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
    //                    _provider = (OperatorProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(OperatorProvider));

    //                if (_provider == null)
    //                    throw new ProviderException("Unable to load the OperatorProvider");
    //            }
    //        }
    //    }
    //}
}
