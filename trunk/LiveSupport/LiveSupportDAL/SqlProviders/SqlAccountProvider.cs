using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlAccountProvider
    {
        /// <summary>
        /// 添加一条新的公司帐号
        /// </summary>
        /// <param name="account">account对象</param>
        public static void AddAccount(Account account)
        {
            string sql = string.Format("INSERT INTO [LiveSupport].[dbo].[LiveSupport_Account] VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}',{11},'{12}','{14}',{14},'{15}','{16}')",account.AccountId, account.LoginName, account.Password, account.NickName, account.CompanyName, account.Industry, account.Email, account.ContactName, account.Phone, account.Url, account.Domain, account.OperatorCount, account.Province, account.City, account.RegisterDate, account.Remark, account.PaymentId);
            DBHelper.ExecuteCommand(sql);
        }

        public static List<Account> GetAllAccounts()
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
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="loginId"></param>
        /// <param name="loginPwd"></param>
        /// <returns></returns>
        public static Account CheckAccountByLoginIdAndPwd(string loginName, string loginPwd)
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
        }
    }
   
