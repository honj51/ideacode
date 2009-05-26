using System;
using System.Data;
using System.Configuration;
using System.Web;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Web.Security;
namespace LiveSupport.BLL
{
    /// <summary>
    ///Account 的摘要说明
    /// </summary>
    public class AccountsManager
    {
        //验证
        public static Account Login(string loginId, string loginPwd)
        {

            return SqlAccountProvider.Default.CheckAccountByLoginIdAndPwd(loginId, loginPwd);
        }
        /// <summary>
        /// 通过AccountId 修改公司信息
        /// </summary>
        /// <param name="accountId"></param>
        /// <param name="password"></param>
        /// <param name="NickName"></param>
        /// <returns></returns>
        public static bool UpdateAccountByAccountId(string accountId, string password, string nickName)
        {
            Account account = SqlAccountProvider.Default.GetAccountByAccountId(accountId);
            account.Password = password;
            account.NickName = nickName;
            int i = 0;
            i=SqlAccountProvider.Default.UpdateAccount(account);
            if (i != 0)
                return true;
            else
                return false;
        }
        //修改公司信息
        public static bool UpdateAccount(Account account)
        {
            int i = 0;
            i = SqlAccountProvider.Default.UpdateAccount(account);
            if (i != 0)
                return true;
            else
                return false;
        }
                /// <summary>
        /// 添加一条新的公司帐号
        /// </summary>
        /// <param name="account">account对象</param>
        public static bool AddAccount(Account account)
        {
            int i = 0;
            i = SqlAccountProvider.Default.AddAccount(account);
            if (i != 0)
                return true;
            else
                return false;
        }
        public static Account GetAccountByAccountId(string accountId)
        {
            return SqlAccountProvider.Default.GetAccountByAccountId(accountId);
        }
    }
}