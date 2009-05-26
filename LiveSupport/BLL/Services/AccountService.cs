using System;
using System.Data;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
using LiveSupport.BLL.Exceptions;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;
/// <summary>
///AccountService 的摘要说明
/// </summary>
public static class AccountService
{
    public static IAccountProvider Provider = new SqlAccountProvider();

    public static void Init()
    {   
        accounts = Provider.GetAllAccounts();
    }
    private static List<Account> accounts = new List<Account>();
    /// <summary>
    /// 根据登录名查询一很记录
    /// </summary>
    /// <param name="name">登录名</param>
    /// <returns>Account对象</returns>
    public static Account FindAccountByLoginName(string name)
    {
        foreach (Account item in accounts)
        {
            if (item.LoginName == name)
            {
                return item;
            }
        }
        return null;
        //return accounts.Find(a => a.LoginName == name);3.0
    }    
    /// <summary>
    /// 添加一条新的公司帐号
    /// </summary>
    /// <param name="account">account对象</param>
    public static void AddAccount(Account account)
    {
        if (FindAccountByLoginName(account.LoginName) != null || GetAccountById(account.AccountId) != null)
        {
            throw new DuplicateAccountException();
        }
        accounts.Add(account);
        Provider.AddAccount(account);
    }

    public static Account GetAccountById(string accountId)
    {
     //   return accounts.Find(a => a.AccountId == accountId);30.0
        foreach (Account item in accounts)
        {
            if (item.AccountId == accountId)
            {
                return item;
            }
        }
        return null;
    }
}
