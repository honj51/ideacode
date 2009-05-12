using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

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
    }
   
}