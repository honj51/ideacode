using System;
using System.Data;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
using LiveSupport.LiveSupportDAL.SqlProviders;
/// <summary>
///AccountService 的摘要说明
/// </summary>
public class AccountService
{
    private static List<Account> accounts = new List<Account>();

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
        LiveSupport.LiveSupportDAL.SqlProviders.SqlAccountProvider.AddAccount(account);
    }
}
