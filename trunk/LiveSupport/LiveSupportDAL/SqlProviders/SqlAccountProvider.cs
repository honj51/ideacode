﻿using System;
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
            Account ac = new SqlAccountProvider().CheckCompanyByloginName(account.LoginName);
            if (ac==null)
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

        #region 获得所有公司
        public List<Account> GetAllAccounts()
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
        #endregion

        #region 判断一个公司是否存在此用户名
        public Account CheckCompanyByloginName(string LoginName)
        {
            string sql = string.Format("select * from LiveSupport_Account where LoginName='{0}'", LoginName);
            SqlDataReader data = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    Account account = new Account(data);
                    return account;
                }
                else
                {
                    data.Close();
                    data.Dispose();
                    data = null;
                    return null;
                }
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region 通过Email找回密码
        public Account GetPasswordByLoginNameAndEmail(string loginName, string eamil)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_Account where LoginName='{0}' and Email='{1}'", loginName, eamil);
                SqlDataReader sdr = DBHelper.GetReader(sql);
                if (sdr.Read())
                {
                    Account account = new Account(sdr);
                    sdr.Close();
                    return account;
                }
                else
                {
                    sdr.Close();
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        #endregion
    }
}
   
