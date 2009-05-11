using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;

/// <summary>
/// Summary description for OperatorService
/// </summary>
public class OperatorService
{
    private static List<Operator> operators = new List<Operator>();
    /// <summary>
    ///  判定客服是否在线
    /// </summary>
    /// <param name="operatorId">客服ID</param>
    /// <returns>BOOL</returns>
    public static bool IsOperatorOnline(string operatorId)
    {
        Operator op = operators.Find(o => o.OperatorId == operatorId);
        if (op != null)
        {
            return op.Status != Operator.OperatorStatus.Offline;
        }
        return false;
    }
    /// <summary>
    /// 登陆
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="password">密码</param>
    /// <returns>operator对象</returns>
    public static Operator Login(string accountName, string operatorName, string password)
    {
        Account account = AccountService.FindAccountByLoginName(accountName);
        Operator op = null;
        if (account != null)
        {
            op = operators.Find(o => o.AccountId == account.AccountId && o.LoginName == operatorName && o.Password == password);
            op.Status = Operator.OperatorStatus.Idle;
        }
        return op;
    }
    /// <summary>
    /// 注销 登陆
    /// </summary>
    /// <param name="operatorId">客服ID</param>
    internal static void Logout(string operatorId)
    {
        Operator op = operators.Find(o => o.OperatorId == operatorId);
        if (op != null)
        {
            op.Status = Operator.OperatorStatus.Offline;
        }
    }



    //public static List<ChatRequestInfo> GetChatRequests(Operator op)
    //{
    //    return ChatService.GetRequests(op);
    //}

    //public static List<Operator> GetOnlineOperator()
    //{
    //    return OperatorsManager.GetOnlineOperator();
    //}

    //public static Operator GetOperatorById(string id)
    //{
    //    return OperatorsManager.GetOperatorById(id);
    //}
    //public static void UpdateStatus(int operatorId, bool isOnline)
    //{
    //    OperatorsManager.UpdateStatus(operatorId, isOnline);
    //}
    //public static bool GetOperatorStatus(int accountId)
    //{
    //      return OperatorsManager.GetOperatorStatus(accountId);
    //}

    public static bool GetOperatorStatus(int accountId)
    {
        return true;
    }
}
