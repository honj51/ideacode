using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IAccountProvider
    { 
        int AddAccount(LiveSupport.LiveSupportModel.Account account);
        LiveSupport.LiveSupportModel.Account CheckAccountByLoginIdAndPwd(string loginName, string loginPwd);
        LiveSupport.LiveSupportModel.Account GetAccountByAccountId(string accountId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Account> GetAllAccounts();
        int UpdateAccount(LiveSupport.LiveSupportModel.Account account);
    }
}
