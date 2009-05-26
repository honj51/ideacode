using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlAccountProvider : LiveSupport.LiveSupportDAL.Providers.ISqlAccountProvider
    {
<<<<<<< .mine
        private static SqlAccountProvider _default;

        public static SqlAccountProvider Default
        {
            get {
                if (_default == null)
                    _default = new SqlAccountProvider();
                return _default; 
            }
            
        }
        /// <summary>
        /// 添加一条新的公司帐号
        /// </summary>
        /// <param name="account">account对象</param>
=======

        #region 添加管理员
>>>>>>> .r678
        public int AddAccount(Account account)
        {
            bool b = CheckCompanyByloginName(account.LoginName);
            if (b)
            {
                string sql = string.Format(
                 "INSERT INTO [LiveSupport].[dbo].[LiveSupport_Account]"
                  + " ([AccountId]"
                  + " ,[LoginName]"
                  + " ,[Password]"
                  + " ,[NickName]"
                  + " ,[CompanyName]"
                  + " ,[Industry]"
                  + ",[Email]"
                  + " ,[ContactName]"
                  + " ,[Phone]"
                  + " ,[URL]"
                  + ",[Domain]"
                  + " ,[OperatorCount]"
                  + " ,[Province]"
                  + " ,[City]"
                  + " ,[RegisterDate]"
                  + " ,[Remark]"
                  + " ,[PaymentId])"
                  + " VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}',{11},'{12}','{13}','{14}','{15}','{16}')",
                  account.AccountId, account.LoginName, account.Password, account.NickName, account.CompanyName, account.Industry, account.Email, account.ContactName, account.Phone, account.Url, account.Domain, account.OperatorCount, account.Province, account.City, account.RegisterDate, account.Remark, account.PaymentId);
                return DBHelper.ExecuteCommand(sql);
            }
            else
            {
                return 0;
            }

        }
        #endregion

<<<<<<< .mine
        public List<Account> GetAllAccounts()
=======
        #region 获得所有的管理员
        public static List<Account> GetAllAccounts()
>>>>>>> .r678
        {

            string sql = "select * from LiveSupport_Account";
            List<Account> accounts = new List<Account>();
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                accounts.Add(new Account(r));

            }
            r.Close();
            r.Dispose();
            r = null;
            return accounts;
        }
        #endregion

        #region 登录
        public Account CheckAccountByLoginIdAndPwd(string loginName, string loginPwd)
        {
            string sql = string.Format("select * from dbo.LiveSupport_Account where LoginName='{0}' and Password='{1}'", loginName, loginPwd);
            SqlDataReader data = null;
            Account account = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    account = new Account(data);
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return account;
        }
        #endregion

        #region 据据AccountID更新数据
        public int UpdateAccount(Account account)
        {
            string sql = string.Format(
               "UPDATE [LiveSupport].[dbo].[LiveSupport_Account]"
               + " SET [LoginName] = '{0}'"
               + "      ,[Password] = '{1}'"
               + "  ,[NickName] ='{2}'"
               + " ,[CompanyName] ='{3}'"
               + " ,[Industry] ='{4}'"
               + "  ,[Email] ='{5}'"
               + " ,[ContactName] ='{6}'"
               + " ,[Phone] ='{7}'"
               + " ,[URL] ='{8}'"
               + " ,[Domain] ='{9}'"
               + "  ,[OperatorCount] ='{10}'"
               + " ,[Province] ='{11}'"
               + " ,[City] ='{12}'"
               + "  ,[RegisterDate] ='{13}'"
               + " ,[Remark] ='{14}'"
               + " ,[PaymentId] ='{15}'"
               + "  WHERE [AccountId] ='{16}'"
               , account.LoginName, account.Password, account.NickName, account.CompanyName, account.Industry, account.Email, account.ContactName, account.Phone, account.Url, account.Domain, account.OperatorCount, account.Province, account.City, account.RegisterDate, account.Remark, account.PaymentId,account.AccountId);
           return DBHelper.ExecuteCommand(sql);
        }
        #endregion

        #region 据据accountId查询一行数据
        public Account GetAccountByAccountId(string accountId)
        {
            string sql = string.Format("select * from [LiveSupport].[dbo].[LiveSupport_Account] where  AccountId='{0}'",accountId);
            SqlDataReader data = null;
            Account account = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    account = new Account(data);
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return account;
        }
<<<<<<< .mine

        #region ISqlAccountProvider 成员

        int LiveSupport.LiveSupportDAL.Providers.ISqlAccountProvider.AddAccount(Account account)
        {
            throw new NotImplementedException();
        }

        Account LiveSupport.LiveSupportDAL.Providers.ISqlAccountProvider.CheckAccountByLoginIdAndPwd(string loginName, string loginPwd)
        {
            throw new NotImplementedException();
        }

        Account LiveSupport.LiveSupportDAL.Providers.ISqlAccountProvider.GetAccountByAccountId(string accountId)
        {
            throw new NotImplementedException();
        }

        List<Account> LiveSupport.LiveSupportDAL.Providers.ISqlAccountProvider.GetAllAccounts()
        {
            throw new NotImplementedException();
        }

        int LiveSupport.LiveSupportDAL.Providers.ISqlAccountProvider.UpdateAccount(Account account)
        {
            throw new NotImplementedException();
        }

        #endregion
=======
        #endregion

        #region 判断一个公司是否存在此客服
        public static bool CheckCompanyByloginName(string LoginName)
        {
            string sql = string.Format("select * from LiveSupport_Account where LoginName='{0}'",LoginName);
            SqlDataReader data = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    data.Close();
                    data.Dispose();
                    data = null;
                    return false;
                }
                else
                {
                    data.Close();
                    data.Dispose();
                    data = null;
                    return true;
                }
            }
            catch
            {
                throw;
            }
        }
        #endregion
>>>>>>> .r678
    }
}
   
