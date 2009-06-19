﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Web.Security;
using System.Collections.Generic;
namespace LiveSupport.BLL
{
    /// <summary>
    ///Account 的摘要说明
    /// </summary>
    public class AccountsManager
    {
        #region 验证
        public static Account Login(int accountNumber)
        {

            return SqlAccountProvider.Default.CheckCompanyByaccountNumber(accountNumber);
        }
        #endregion

        //#region 通过AccountId 修改公司信息
        //public static bool UpdateAccountByAccountId(string accountId, string password, string nickName)
        //{
        //    Account account = SqlAccountProvider.Default.GetAccountByAccountId(accountId);
        //    account.Password = password;
        //    account.NickName = nickName;
        //    int i = 0;
        //    i = SqlAccountProvider.Default.UpdateAccount(account);
        //    if (i != 0)
        //    {
        //        Operator oper = new SqlOperatorProvider().GetPasswordByAccountNameLoginNameAndEmail(account.LoginName, account.LoginName, account.Email);
        //        if (oper != null)
        //        {
        //            oper.Password = password;
        //            new SqlOperatorProvider().UpdateOperator(oper);
        //        }
        //        return true;
        //    }
        //    else
        //        return false;
        //}
        //#endregion

        #region 修改公司信息
        public static bool UpdateAccount(Account account)
        {
            int i = 0;
            i = SqlAccountProvider.Default.UpdateAccount(account);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 添加一条新的公司帐号
        public static bool AddAccount(Account account,string NickName, string loginName, string loginPwd)
        {
            int i = 0;
            int di = 0;
            int oi = 0;
            i = SqlAccountProvider.Default.AddAccount(account);
            if (i != 0)
            {
                //添加默认部门
                Department dt = new Department();
                dt.Account = account;
                dt.DepartmentId = Guid.NewGuid().ToString();
                dt.DepartmentName = "默认部门";
                dt.IsDefault = true;
                dt.AddDate = DateTime.Now.ToString();
                di=new SqlDepartmentProvider().AddDepartment(dt);
                if (di!=0)
                {
                    Operator op = new Operator();
                    op.Account =  account;
                    op.LoginName = loginName;
                    op.Password = loginPwd;
                    op.IsAdmin = true;
                    op.NickName = NickName;
                    op.Department = dt;
                    op.Email = account.Email;
                    op.AVChatStatus = "Idle";
                    op.Status = (OperatorStatus)Enum.Parse((typeof(OperatorStatus)), "Idle");
                    oi=new SqlOperatorProvider().NewOperator(op);
                }
                if (i != 0 && di != 0 && oi != 0)
                {

                    return true;
                }
                else
                    return false;
            }
            else
                return false;
        }
        #endregion

        #region 通过公司ID会的公司信息
        public static Account GetAccountByAccountId(string accountId)
        {
            return SqlAccountProvider.Default.GetAccountByAccountId(accountId);
        }
        #endregion

         #region 通过Email找回密码
        //public static Account GetPasswordByLoginNameAndEmail(string loginName, string eamil)
        //{
        //    return SqlAccountProvider.Default.GetPasswordByLoginNameAndEmail(loginName, eamil);
        //}
        #endregion

        #region 通过AccountNumber获得公司信息
        public static Account CheckCompanyByaccountNumber(int accountNumber)
        {
            return SqlAccountProvider.Default.CheckCompanyByaccountNumber(accountNumber);
        }
        #endregion

        #region 获得所有公司信息
        public static List<Account> GetAllAccounts()
        {
            return SqlAccountProvider.Default.GetAllAccounts();
        }
        #endregion
    }
}