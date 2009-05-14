using System;
using System.Data;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
using LiveSupport.LiveSupportDAL.SqlProviders;
/// <summary>
///AccountService 的摘要说明
/// </summary>
public static class AccountService
{
    static AccountService()
    { 
        // Load all Accounts
        accounts = SqlAccountProvider.GetAllAccounts();
    }

    private static List<Account> accounts = new List<Account>();
    /// <summary>
    /// 根据登录名查询一很记录
    /// </summary>
    /// <param name="name">登录名</param>
    /// <returns>Account对象</returns>
    public static Account FindAccountByLoginName(string name)
    {
        return accounts.Find(a => a.LoginName == name);
    }    
    /// <summary>
    /// 添加一条新的公司帐号
    /// </summary>
    /// <param name="account">account对象</param>
    public static void AddAccount(Account account)
    {
        accounts.Add(account);
        SqlAccountProvider.AddAccount(account);
    }

    public static Account GetAccountById(string accountId)
    {
        return accounts.Find(a => a.AccountId == accountId);
    }
}
