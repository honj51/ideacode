using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;

namespace LiveSupport.DAL
{
    /// <summary>
    ///AccountProvider 的摘要说明
    /// </summary>
    public abstract class AccountsProvider : ProviderBase
    {
        public abstract List<Account> GetAllAccounts();
        public abstract Account FindAccountByAdminUserName(string name);
        public abstract Account CreateAccount(string adminUserName);
    }
}