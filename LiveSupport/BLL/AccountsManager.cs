using System;
using System.Data;
using System.Configuration;
using System.Web;
using LiveSupport.DAL;
using LiveSupport.DAL.Entity;
using System.Web.Security;

namespace LiveSupport.BLL
{
    /// <summary>
    ///Account 的摘要说明
    /// </summary>
    public class AccountsManager
    {
        private static bool _isInitialized = false;
        private static AccountsProvider _provider;

        ///<summary>
        /// returns the current accounts data provider
        ///</summary>    
        public static AccountsProvider Provider
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
                _provider = new SqlAccountsProvider();
                _isInitialized = true;
            }
        }

        public static Account CreateAccount(string adminUserName)
        {
            return Provider.CreateAccount(adminUserName);
        }

        public static Account GetAccountById(int accountId)
        {
            foreach (var item in Provider.GetAllAccounts())
            {
                if (item.Id == accountId)
                {
                    return item;
                }
            }
            return null;
        }

        public static Account GetAccount()
        {
            MembershipUser user = Membership.GetUser();
            if (user != null)
            {
                return Provider.FindAccountByAdminUserName(user.UserName);
            }
            else
                return null;
        }

        public static Account FindAccountByAdminUserName(string userName)
        {
            return Provider.FindAccountByAdminUserName(userName);
        }
    }
}