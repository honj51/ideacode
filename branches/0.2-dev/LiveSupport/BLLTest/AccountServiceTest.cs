using System;
using System.Collections.Generic;
using System.Text;
using NUnit.Framework;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveChatTest
{
    [TestFixture]
    public class AccountServiceTest
    {
        private Account createAccount(int index)
        {
            Account at = new Account();
            at.CompanyName = "Company"+index;
            at.Url = "http://test/";
            at.Phone = "1111111";
            at.ContactName = "aaa";
            at.Email = "dd";
            at.Province = "dd";
            at.City = "ee";
            at.Industry = "ee";
            at.OperatorCount = 1;
            at.RegisterDate = DateTime.Now;
            at.LoginName = Guid.NewGuid().ToString();
            at.Password = "eee";
            at.NickName = "eeeee";
            return at;
        }

        class MyAccountProvider : IAccountProvider
        {

            #region IAccountProvider 成员

            public int AddAccount(Account account)
            {
                return 0;
            }

            public Account CheckAccountByLoginIdAndPwd(string loginName, string loginPwd)
            {
                throw new NotImplementedException();
            }

            public Account GetAccountByAccountId(string accountId)
            {
                throw new NotImplementedException();
            }

            public List<Account> GetAllAccounts()
            {
                throw new NotImplementedException();
            }

            public int UpdateAccount(Account account)
            {
                throw new NotImplementedException();
            }

            #endregion
        }

        [Test]
        public void TestAddAccount()
        {
            //DBHelper.ConnectionString = "Server=rd01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False;";
            Account account = createAccount(1111);
            AccountService.Provider = new MyAccountProvider();
            AccountService.AddAccount(account);
            Assert.AreSame(AccountService.FindAccountByLoginName(account.LoginName), account);
        }
        [Test]
        public void testGetAccountById()
        {
            DBHelper.ConnectionString = "Server=rd01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False;";
            Account account = createAccount(1111);
            AccountService.AddAccount(account);
            string accountid=AccountService.FindAccountByLoginName(account.LoginName).AccountId;
            Assert.AreSame(AccountService.GetAccountById(accountid),account);
        }
    }
}
