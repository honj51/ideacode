using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IAccountProvider
    { 
        int AddAccount(LiveSupport.LiveSupportModel.Account account);
        LiveSupport.LiveSupportModel.Account CheckCompanyByaccountNumber(string accountNumber);
        LiveSupport.LiveSupportModel.Account GetAccountByAccountId(string accountId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Account> GetAllAccounts();
        int UpdateAccount(LiveSupport.LiveSupportModel.Account account);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Account> GetAccountBycondition(string condition,string value);
    }
}
