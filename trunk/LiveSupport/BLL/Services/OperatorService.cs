using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;

/// <summary>
/// Summary description for OperatorService
/// </summary>
public static class OperatorService
{
    private static IOperatorProvider Provider = new SqlOperatorProvider();

    public static List<Operator> GetAllOperators()
    {
        return operators;
    }

    public static void Init()
    {
        getOperatorsFromDB();        
    }

    private static void getOperatorsFromDB()
    {
        operators = Provider.GetAllOperators();
        // ȡ������Ա�ͷ�
        List<Account> accounts = AccountService.GetAllAccounts();
        foreach (var item in accounts)
        {
            Operator op = new Operator();
            op.OperatorId = item.AccountId;
            op.Email = item.Email;
            op.AVChatStatus = OperatorStatus.Offline.ToString();
            op.AccountId = item.AccountId;
            op.NickName = item.NickName;
            op.LoginName = item.LoginName;
            op.Password = item.Password;
            op.IsAdmin = true;
            op.Status = OperatorStatus.Offline;
            operators.Add(op);
        }
    }

    private static List<Operator> operators = new List<Operator>();
    /// <summary>
    ///  �ж��ͷ��Ƿ�����
    /// </summary>
    /// <param name="operatorId">�ͷ�ID</param>
    /// <returns>BOOL</returns>
    public static bool IsOperatorOnline(string operatorId)
    {
        Operator op = GetOperatorById(operatorId);
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
                    break;
                }                
            }
            if (op == null)
            {
                getOperatorsFromDB();
                foreach (Operator item in operators)
                {
                    if (item.AccountId == account.AccountId && item.LoginName == operatorName && item.Password == password)
                    {
                        op = item;
                    }
                }
            }
            if (op != null)
            {
                if (op.Status != OperatorStatus.Offline)
                {
                    return null;
                }
               op.Status = OperatorStatus.Idle;//���ͷ�״̬��Ϊ����
            }
        }
        return op;
    }
    /// <summary>
    /// ע�� ��½
    /// </summary>
    /// <param name="operatorId">�ͷ�ID</param>
    public static void Logout(string operatorId)
    {

        Operator op = GetOperatorById(operatorId);
        if (op != null)
        {
            op.Status = OperatorStatus.Offline;
        }

    }
    /// <summary>
    /// �ж�ĳ��˾�Ŀͷ��Ƿ�����
    /// </summary>
    /// <param name="accountId"></param>
    /// <returns></returns>
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
                 break;
             }
         }
         if (op == null)
         {
             getOperatorsFromDB();
             foreach (Operator item in operators)
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
        Operator op = GetOperatorById(operatorId);

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
        Provider.UpdateOperator(op);
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
            op = Provider.GetOperatorByLoginName(loginName);
            if (op != null)
            {
                operators.Add(op);
                return op;
            }
            else
            {
                return null;
            }
        }
    }


    /// <summary>
    /// �ÿ��ϴ��ļ����ͷ� 
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="fileName"></param>
    public static void SendFile(string chatId, string fileName)
    {
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        Message m = new Message();
        m.ChatId = chatId;
        m.Text = string.Format("�ÿ��Ѹ��������ļ� {0}<a target='_blank' href='{1}/UploadFile/{2}'>�������</a>", fileName, homeRootUrl, fileName);
        m.Type = MessageType.SystemMessage_ToOperator;
        ChatService.SendMessage(m);
    }

    public static List<Operator> GetAllOperatorsByAccountId(string accountId)
    {
        List<Operator> ops = new List<Operator>();
        foreach (Operator item in operators)
        {
            if (item.AccountId == accountId)
            {
                ops.Add(item);
            }
        }
        return ops;
    }
}
