using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlAccountProvider : IAccountProvider
    {
        private static SqlAccountProvider _default;

        #region 创建SqlAccountProvider实例
        public static SqlAccountProvider Default
        {
            get {
                if (_default == null)
                    _default = new SqlAccountProvider();
                return _default; 
            }

        }
        #endregion

        #region 添加一条新的公司帐号
        public int AddAccount(Account account)
        {
            try
            {
                Account ac = new SqlAccountProvider().CheckCompanyByaccountNumber(account.AccountNumber);
                if (ac == null)
                {
                    string sql = string.Format(
                     "INSERT INTO [LiveSupport].[dbo].[LiveSupport_Account]"
                      + " ([AccountId]"
                      + " ,[AccountNumber]"
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
                      + " VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}',{9},'{10}','{11}','{12}','{13}','{14}')",
                      account.AccountId, account.AccountNumber, account.CompanyName, account.Industry, account.Email, account.ContactName, account.Phone, account.Url, account.Domain, account.OperatorCount, account.Province, account.City, account.RegisterDate, account.Remark, account.PaymentId);
                    return DBHelper.ExecuteCommand(sql);
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }

        }
        #endregion

        #region 获得所有公司
        public List<Account> GetAllAccounts()
        {
            try
            {
                string sql = "select * from LiveSupport_Account";
                List<Account> accounts = new List<Account>();
                using (SqlDataReader r = DBHelper.GetReader(sql))
                {
                    while (r.Read())
                    {
                        accounts.Add(new Account(r));
                    }
                    return accounts;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region 登录
        public Account CheckCompanyByaccountNumber(string accountNumber)
        {
            string sql = string.Format("select * from dbo.LiveSupport_Account where accountNumber='{0}'", accountNumber);
            SqlDataReader data = null;
            Account account = null;
            try
            {
                using (data = DBHelper.GetReader(sql))
                {
                    if (data.Read())
                    {
                        account = new Account(data);
                    }
                    return account;
                }
            }
            catch(Exception ex)
            {
                return null;
            } 
        }
        #endregion

        #region 据据AccountID更新数据
        public int UpdateAccount(Account account)
        {
            try
            {
                string sql = string.Format(
                   "UPDATE [LiveSupport].[dbo].[LiveSupport_Account]"
                   + " SET [AccountNumber] = '{0}'"
                   + " ,[CompanyName] ='{1}'"
                   + " ,[Industry] ='{2}'"
                   + "  ,[Email] ='{3}'"
                   + " ,[ContactName] ='{4}'"
                   + " ,[Phone] ='{5}'"
                   + " ,[URL] ='{6}'"
                   + " ,[Domain] ='{7}'"
                   + "  ,[OperatorCount] ={8}"
                   + " ,[Province] ='{9}'"
                   + " ,[City] ='{10}'"
                   + "  ,[RegisterDate] ='{11}'"
                   + " ,[Remark] ='{12}'"
                   + " ,[PaymentId] ='{13}'"
                   + "  WHERE [AccountId] ='{14}'"
                   , account.AccountNumber, account.CompanyName, account.Industry, account.Email, account.ContactName, account.Phone, account.Url, account.Domain, account.OperatorCount, account.Province, account.City, account.RegisterDate, account.Remark, account.PaymentId, account.AccountId);
                return DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
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
                using (data = DBHelper.GetReader(sql))
                {
                    if (data.Read())
                    {
                        account = new Account(data);
                    }
                    return account;
                }
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region 判断一个公司是否存在此用户名
        public Account CheckCompanyByloginName(string accountNumber)
        {
            string sql = string.Format("select * from LiveSupport_Account where AccountNumber='{0}'", accountNumber);
            SqlDataReader data = null;
            Account account = null;
            try
            {
                using (data = DBHelper.GetReader(sql))
                {
                    if (data.Read())
                    {
                       account = new Account(data);
                    }
                    return account;
                }
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region 通过条件查找公司
        public List<Account> GetAccountBycondition(string condition,string value)
        {
            
            try
            {
                string sql = "select * from LiveSupport_Account where " + condition + "=" + "'" + value + "'";
                List<Account> accounts = new List<Account>() ;
                using (SqlDataReader r = DBHelper.GetReader(sql))
                {
                    while (r.Read())
                    {
                        accounts.Add(new Account(r));
                    }
                    return accounts;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion
    }
}
   
