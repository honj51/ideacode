using System;
using System.Data;
using System.Configuration;
using System.Web;
using LiveSupport.SqlProviders;
using LiveSupport.SqlProviders.Entity;
using System.Web.Security;

namespace LiveSupport.BLL
{
    /// <summary>
    ///Account 的摘要说明
    /// </summary>
    public class AccountsManager
    {
        private static bool _isInitialized = false;
        private static AccountProvider _provider;

        ///<summary>
        /// returns the current accounts data provider
        ///</summary>    
        public static AccountProvider Provider
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
                _provider = new SqlAccountProvider();
                _isInitialized = true;
            }
        }

        public static Account CreateAccount(string adminUserName)
        {
            return Provider.CreateAccount(adminUserName);
        }

        public static Account GetAccountById(string accountId)
        {
            foreach (var item in Provider.GetAllAccounts())
            {
                if (item.AccountId == accountId)
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
        
        
        //添加
        public static bool AddAccount(Account at)
        {
            int i = 0;
            //i = Provider.AddAccount(at);
            if (i > 0)
                return true;
            else
                return false;
        }

        //验证
        public static Account Login(string loginId, string loginPwd)
        {
            return null;
            //return Provider.CheckAccountByLoginIdAndPwd(loginId, loginPwd);
        }
    }
}