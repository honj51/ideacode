using System;
using System.Collections.Generic;
using System.Text;
using NUnit.Framework;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

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
            at.LoginName = "ddee";
            at.Password = "eee";
            at.NickName = "eeeee";
            return at;
        }
        [Test]
        public void TestAddAccount()
        {
            DBHelper.ConnectionString = "Server=rd01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False;";
            
            Account account = createAccount(1111);
            AccountService.AddAccount(account);
            Assert.AreSame(AccountService.FindAccountByLoginName(account.LoginName), account);
        }
    }
}
