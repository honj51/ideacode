using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Web.Caching;
using LiveSupport.LiveSupportModel;
using System.IO;

/// <summary>
/// Contains all functionality for an operator to maintain
/// a chat session with a client.
/// </summary>
[WebService(Namespace = "http://www.LiveSupport.cn/LiveSupportService/2009/04")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]
/// <summary>
///ServiceConnectWS 的摘要说明
/// </summary>
public class ServiceConnectWS : System.Web.Services.WebService
{
    public ServiceConnectWS()
    {
    }
    /// <summary>
    /// 得新加载一次客服信息
    /// </summary>
    [WebMethod]
    public void ReloadOperators()
    {
        OperatorService.getOperatorsFromDB();
    }
    /// <summary>
    /// 重新加载公司信息
    /// </summary>
    [WebMethod]
    public void ReloadAccounts()
    {
        AccountService.GetAllAccountsFromDB();
    }

}
