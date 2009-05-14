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
            return  SqlAccountProvider.CheckAccountByLoginIdAndPwd(loginId, loginPwd);
        }
        /// <summary>
        /// 通过AccountId 修改公司信息
        /// </summary>
        /// <param name="accountId"></param>
        /// <param name="password"></param>
        /// <param name="NickName"></param>
        /// <returns></returns>
        public static int UpdateAccountByAccountId(string accountId, string password, string nickName)
        {
            Account account = SqlAccountProvider.GetAccountByAccountId(accountId);
            account.Password = password;
            account.NickName = nickName;
            return SqlAccountProvider.UpdateAccount(account);
        }
    }
}