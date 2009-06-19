using System;
using System.Data;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
using LiveSupport.BLL.Exceptions;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;
using System.Diagnostics;
/// <summary>
///AccountService 的摘要说明
/// </summary>
public static class AccountService
{
    public static IAccountProvider Provider = new SqlAccountProvider();
    private static List<Account> accounts = new List<Account>();

    public static void Init()
    {   
        accounts = Provider.GetAllAccounts();
    }
    /// <summary>
    /// 根据登录名查询一很记录
    /// </summary>
    /// <param name="name">登录名</param>
    /// <returns>Account对象</returns>
    public static Account FindAccountByAccountNumber(int accountNumber)
    {
        Account ac=null;
        foreach (Account item in accounts)
        {
            if (item.AccountNumber == accountNumber)
            {
                ac=item;
                break;
            }
        }
        if (ac == null)
        {
            foreach (Account item in Provider.GetAllAccounts())
            {
                if (item.AccountNumber == accountNumber)
                {
                    ac = item;
                    accounts.Add(item);
                    break;
                }
            }
        }
       return ac;
    }    
    /// <summary>
    /// 添加一条新的公司帐号
    /// </summary>
    /// <param name="account">account对象</param>
    public static void AddAccount(Account account)
    {
        if (FindAccountByAccountNumber(account.AccountNumber) != null)
        {
            throw new DuplicateAccountException("LoginName exist");
        }
        if (GetAccountById(account.AccountId) != null)
        {
            throw new DuplicateAccountException("AccountId exisit");
        }
        accounts.Add(account);
        Provider.AddAccount(account);
        Trace.WriteLine(string.Format("新增帐号: AccountId={0} LoginName={1}", account.AccountId, account.AccountNumber));
    }
    /// <summary>
    /// 跟据ID查找帐号
    /// </summary>
    /// <param name="accountId"></param>
    /// <returns></returns>
    public static Account GetAccountById(string accountId)
    {
        Account ac = null;
        foreach (Account item in accounts)
        {
            if (item.AccountId == accountId)
            {
                ac = item;
                break;
            }
        }
        if (ac == null)
        {
            foreach (Account item in Provider.GetAllAccounts())
            {
                if (item.AccountId == accountId)
                {
                    accounts.Add(item);
                    ac = item;
                    break;
                }
            }
        }
        return ac;
    }

    public static List<Account> GetAllAccounts()
    {
       accounts = Provider.GetAllAccounts();
       return accounts;
    }
}
