using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using LiveSupport.LiveSupportModel;
using System.Configuration;
using LiveSupport.BLL;
using LiveSupport.LiveSupportDAL.Providers;
namespace BLLTest
{
    class MyOperatorProvider : IOperatorProvider
    {

        #region IOperatorProvider 成员

        public int DeleteOperatorByid(string operatorId)
        {
            return 0;
        }

        public List<Operator> GetAllOperators()
        {
            return new List<Operator>();
        }

        public List<Operator> GetOperatorByAccountId(string accountId)
        {
            throw new NotImplementedException();
        }

        public Operator GetOperatorByLoginName(string loginName)
        {
            throw new NotImplementedException();
        }

        public Operator GetOperatorByOperatorId(string operatorId)
        {
            throw new NotImplementedException();
        }

        public int NewOperator(Operator op)
        {
            return 0;
        }

        public int UpdateOperator(Operator op)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
    public class OperatorServiceTest
    {

        [Test]
        public void Login()
        {
            LiveSupport.LiveSupportDAL.SqlProviders.DBHelper.ConnectionString = "Server=rd01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False;";
            Account a = new Account();
            a.LoginName = Util.RandLetter(10);
            a.Password = "123";

            AccountsManager.AddAccount(a);
            Operator op=OperatorService.Login(a.LoginName, a.LoginName, a.Password);

            Assert.AreEqual(a.AccountId, op.OperatorId);
            Assert.AreEqual(op.LoginName, a.LoginName);
            Account ac=AccountService.FindAccountByLoginName(a.LoginName);
            Assert.AreEqual(op.AccountId, ac.AccountId);
            Assert.AreEqual(op.Password, a.Password);
            Assert.AreEqual(op.Status, OperatorStatus.Idle);
            
            OperatorService.Logout(op.OperatorId);
            Assert.AreEqual(op.Status, OperatorStatus.Offline);
            op = OperatorService.Login(a.LoginName, a.LoginName, a.Password);
            Assert.AreEqual(a.AccountId, op.OperatorId);
            Assert.AreEqual(op.LoginName, a.LoginName);
            ac = AccountService.FindAccountByLoginName(a.LoginName);
            Assert.AreEqual(op.AccountId, ac.AccountId);
            Assert.AreEqual(op.Password, a.Password);
            Assert.AreEqual(op.Status, OperatorStatus.Idle);
        }

        [Test]
        public void TestLogin2()
        {
            // 测试多个客服端用同一个客服帐号登录
            LiveSupport.LiveSupportDAL.SqlProviders.DBHelper.ConnectionString = "Server=rd01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False;";
            Account a = new Account();
            a.LoginName = Util.RandLetter(10);
            a.Password = "123";

            AccountsManager.AddAccount(a);
            Operator op = OperatorService.Login(a.LoginName, a.LoginName, a.Password);

            Assert.AreEqual(a.AccountId, op.OperatorId);
            Assert.AreEqual(op.LoginName, a.LoginName);
            Account ac = AccountService.FindAccountByLoginName(a.LoginName);
            Assert.AreEqual(op.AccountId, ac.AccountId);
            Assert.AreEqual(op.Password, a.Password);
            Assert.AreEqual(op.Status, OperatorStatus.Idle);

            Operator op2 = OperatorService.Login(a.LoginName, a.LoginName, a.Password);
            Assert.IsNull(op2);

            OperatorService.Logout(op.OperatorId);
            
            op = OperatorService.Login(a.LoginName, a.LoginName, a.Password);
            Assert.IsNotNull(op);
        }

        [Test]
        public void TestLogin3()
        {
            // 测试多个客服端用同一个客服帐号登录
            LiveSupport.LiveSupportDAL.SqlProviders.DBHelper.ConnectionString = "Server=rd01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False;";
            Operator op = OperatorService.Login("user","user2", "123");
            Assert.IsNotNull(op);
            Assert.AreEqual(op.Status, OperatorStatus.Idle);            
            Assert.IsNotNull(OperatorService.GetOperatorById(op.OperatorId));
            Assert.AreSame(op, OperatorService.GetOperatorById(op.OperatorId));
            Assert.IsTrue(OperatorService.IsOperatorOnline(op.OperatorId));
            
            OperatorService.Logout(op.OperatorId);
        }

        [Test]
        public void TestInvite()
        {
            LiveSupport.LiveSupportDAL.SqlProviders.DBHelper.ConnectionString = "Server=rd01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False;";
            OperatorService.Provider = new MyOperatorProvider();
            Account a = TestTool.CreateNewAccount();
            AccountService.AddAccount(a);
            Operator o = TestTool.CreateNewOperator(a.AccountId);
            OperatorService.NewOperator(o);
            Visitor v = TestTool.CreateNewVisitor(a.AccountId);
            VisitorService.NewVisitor(v);
            VisitSessionService.NewSession(v.CurrentSession);

            Operator op = OperatorService.Login(a.LoginName, a.LoginName, a.Password);
            ChatService.OperatorRequestChat(op.OperatorId, v.VisitorId);

            Assert.AreEqual(v.CurrentSession.SessionId, ChatService.GetOperatorInvitation(v.VisitorId));
        }

    }
}
