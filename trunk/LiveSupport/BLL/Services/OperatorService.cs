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
        // 取出管理员客服
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
    ///  判定客服是否在线
    /// </summary>
    /// <param name="operatorId">客服ID</param>
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
               op.Status = OperatorStatus.Idle;//将客服状态改为空闲
            }
        }
        return op;
    }
    /// <summary>
    /// 注销 登陆
    /// </summary>
    /// <param name="operatorId">客服ID</param>
    public static void Logout(string operatorId)
    {

        Operator op = GetOperatorById(operatorId);
        if (op != null)
        {
            op.Status = OperatorStatus.Offline;
        }

    }
    /// <summary>
    /// 判断某公司的客服是否在线
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
    /// 修改密码
    /// </summary>
    /// <param name="operatorId">operatorId</param>
    /// <param name="oldPassword">老密码</param>
    /// <param name="newPassword">新密码</param>
    /// <returns>(int)信息</returns>
    public static int ChangPassword(string operatorId, string oldPassword, string newPassword)
    {
        Operator op = GetOperatorById(operatorId);

        if (op == null)
        {
            if (op.Password == oldPassword)
            {
                op.Password = newPassword;
                UpdateOperator(op);
                return 0;//成功
            }
            else
            {
                return -1;//用户名或密码错误
            }
        }
        return -3;//用户不存在
    }
    /// <summary>
    /// 更新客服信息
    /// </summary>
    /// <param name="op">Operator对象</param>
    public static void UpdateOperator(Operator op)
    {
        Provider.UpdateOperator(op);
    }
    /// <summary>
    /// 判断用用户名是否存在
    /// </summary>
    /// <param name="loginName">登录名</param>
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
    /// 访客上传文件给客服 
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="fileName"></param>
    public static void SendFile(string chatId, string fileName)
    {
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        Message m = new Message();
        m.ChatId = chatId;
        m.Text = string.Format("访客已给您发送文件 {0}<a target='_blank' href='{1}/UploadFile/{2}'>点击保存</a>", fileName, homeRootUrl, fileName);
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
