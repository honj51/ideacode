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
public static class OperatorService
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
        Operator op = null;
        foreach (Operator item in operators)
        {
            if (item.OperatorId == operatorId)
            {
                op = item;
            }
        }
        if (op == null)
        {
            foreach (Operator item in SqlOperatorProvider.GetAllOperators())
            {
                if (item.OperatorId == operatorId)
                {
                    op = item;
                }
            }
        }
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
            foreach (Operator item in operators)
            {
                if (item.AccountId==account.AccountId&&item.LoginName==operatorName&&item.Password==password)
                {
                    op = item;
                }
                
            }
            if (op == null)
            {
                foreach (Operator item in SqlOperatorProvider.GetAllOperators())
                {
                    if (item.AccountId == account.AccountId && item.LoginName == operatorName && item.Password == password)
                    {
                        op = item;
                    }
                }
            }

           if(op!=null)
           {
             op.Status = OperatorStatus.Idle;
           }
        }
        return op;
    }
    /// <summary>
    /// ע�� ��½
    /// </summary>
    /// <param name="operatorId">�ͷ�ID</param>
    internal static void Logout(string operatorId)
    {
        Operator op = null;
        foreach (Operator item in operators)
        {
            if (item.OperatorId==operatorId)
            {
                op = item;
            }
        }
        if (op == null)
        {
            foreach (Operator item in SqlOperatorProvider.GetAllOperators())
            {
                if (item.OperatorId == operatorId)
                {
                    op = item;
                }
            }
        }
        if (op != null)
        {
            op.Status = OperatorStatus.Offline;
        }

    }

    public static bool HasOnlineOperator(string accountId)
    {
        foreach (Operator item in operators)
        {
            if (item.AccountId == accountId && item.Status != OperatorStatus.Offline)
            {
                return true;
            }
        }
        return false;
    }


    public static Operator GetOperatorById(string operatorId)
    {
         Operator op=null;
         foreach (Operator item in operators)
         {
             if (item.OperatorId == operatorId)
             {
                 op=item;
             }
         }
         if (op == null)
         {
             foreach (Operator item in SqlOperatorProvider.GetAllOperators())
             {
                 if (item.OperatorId == operatorId)
                 {
                     op = item;
                 }
             }
         }
        return op;
    }

    /// <summary>
    /// �޸�����
    /// </summary>
    /// <param name="operatorId">operatorId</param>
    /// <param name="oldPassword">������</param>
    /// <param name="newPassword">������</param>
    /// <returns>(int)��Ϣ</returns>
    public static int ChangPassword(string operatorId, string oldPassword, string newPassword)
    {
        Operator op = null;
        foreach (Operator item in operators)
        {
            if (item.OperatorId == operatorId)
            {
                op = item;
            }
        }
        if (op == null)
        {
            foreach (Operator item in  SqlOperatorProvider.GetAllOperators())
            {
                if (item.OperatorId == operatorId)
                {
                    op = item;
                }
            }
        }
        if (op == null)
        {
            if (op.Password == oldPassword)
            {
                op.Password = newPassword;
                UpdateOperator(op);
                return 0;//�ɹ�
            }
            else
            {
                return -1;//�û������������
            }
        }
        return -3;//�û�������
    }
    /// <summary>
    /// ���¿ͷ���Ϣ
    /// </summary>
    /// <param name="op">Operator����</param>
    public static void UpdateOperator(Operator op)
    {
        SqlOperatorProvider.UpdateOperator(op);
    }
    /// <summary>
    /// �ж����û����Ƿ����
    /// </summary>
    /// <param name="loginName">��¼��</param>
    /// <returns></returns>
    public static Operator GetOperatorByLoginName(string loginName)
    {
        Operator op = null;
        foreach (Operator item in operators)
        {
            if (item.LoginName == loginName)
            {
                op=item;
            }
        }
        if (op != null)
        {
            return op;
        }
        else
        {
            op = null;
            op=SqlOperatorProvider.GetOperatorByLoginName(loginName);
            if (op != null)
            {
                return op;
            }
            else
            {
                return null;
            }
        }
    }

}
