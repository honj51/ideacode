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
///AccountProvider 的摘要说明
/// </summary>
public abstract class AccountsProvider : ProviderBase
{
    public abstract List<Account> GetAllAccounts();
    public abstract Account FindAccountByAdminUserName(string name);
    public abstract Account CreateAccount(string adminUserName);
}
