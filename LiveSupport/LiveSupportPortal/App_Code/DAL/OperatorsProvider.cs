using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Configuration.Provider;
using System.Collections.Generic;

/// <summary>
///OperatorsProvider 的摘要说明
/// </summary>
public abstract class OperatorsProvider : ProviderBase
{
    public abstract List<Operator> GetAllOperators();
    public abstract List<Operator> FindOperatorsByAccountId(int accountId);
    public abstract Operator CreateOperator(int accountId);
}
