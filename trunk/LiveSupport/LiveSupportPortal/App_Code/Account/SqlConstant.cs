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
///SqlConstant 的摘要说明
/// </summary>
public class SqlDataAccessConstant
{
    // store procedure
    public const string SP_LiveSupport_Accounts_CreateAccount = "LiveSupport_Accounts_CreateAccount";
    public const string SP_LiveSupport_Operators_CreateOperator = "LiveSupport_Operators_CreateOperator";
    public const string SP_LiveSupport_Operators_GetOperatorsByAccountId = "LiveSupport_Operators_GetOperatorsByAccountId";
}
