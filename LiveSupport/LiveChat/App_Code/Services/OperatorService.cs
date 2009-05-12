using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

/// <summary>
/// Summary description for OperatorService
/// </summary>
public class OperatorService
{
    static OperatorService()
    {
        operators = SqlOperatorProvider.GetAllOperators();
    }

    public static List<Operator> GetAllOperators()
    {
        return operators;
    }

    private static List<Operator> operators = new List<Operator>();
    /// <summary>
    ///  �ж��ͷ��Ƿ�����
    /// </summary>
    /// <param name="operatorId">�ͷ�ID</param>
    /// <returns>BOOL</returns>
    public static bool IsOperatorOnline(string operatorId)
    {
        Operator op = operators.Find(o => o.OperatorId == operatorId);
        if (op != null)
        {
            return op.Status != OperatorStatus.Offline;
        }
        return false;
    }
    /// <summary>
    /// ��½
    /// </summary>
    /// <param name="userName">�û���</param>
    /// <param name="password">����</param>
    /// <returns>operator����</returns>
    public static Operator Login(string accountName, string operatorName, string password)
    {
        Account account = AccountService.FindAccountByLoginName(accountName);
        Operator op = null;
        if (account != null)
        {
            op = operators.Find(o => o.AccountId == account.AccountId && o.LoginName == operatorName && o.Password == password);
            op.Status = OperatorStatus.Idle;
        }
        return op;
    }
    /// <summary>
    /// ע�� ��½
    /// </summary>
    /// <param name="operatorId">�ͷ�ID</param>
    internal static void Logout(string operatorId)
    {
        Operator op = operators.Find(o => o.OperatorId == operatorId);
        if (op != null)
        {
            op.Status = OperatorStatus.Offline;
        }
    }

    public static bool GetOperatorStatus(string accountId)
    {
        return true;
    }
}
