using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;

/// <summary>
///OperatorsManager 的摘要说明
/// </summary>
public static class OperatorsManager
{
    private static bool _isInitialized = false;
    private static OperatorsProvider _provider;

    ///<summary>
    /// returns the current accounts data provider
    ///</summary>    
    public static OperatorsProvider Provider
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
            _provider = new SqlOperatorsProvider();
            _isInitialized = true;
        }
    }

    public static List<Operator> FindOperatorsByAccountId(int accountId)
    {
        return Provider.FindOperatorsByAccountId(accountId);
    }

    public static Operator GetOperatorById(int operatorId)
    {
        return null;
    }

    public static Operator CreateOperator(int accountId)
    {
        //return Provider.CreateAccount(adminUserName);
        return  new Operator(0, accountId);
    }

    public static void SaveOperator(Operator op)
    {
    }
}
