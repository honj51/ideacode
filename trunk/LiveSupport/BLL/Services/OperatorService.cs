using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;
using System.Text;
using System.Diagnostics;
using LiveSupport.BLL;
using LiveSupport.BLL.Exceptions;
using System.IO;

public class QuickResponseCategory
{
    public int QuickId;
    public string Name;
    public List<string> Responses;
}
/// <summary>
/// �汾��Ϣ
/// </summary>
public class SystemAdvertise
{
    public string AdvertiseUrl;
    public string AdvertiseMessage;
}
#region NewChangeCheck
public class MessageCheck
{
    public string ChatId;
    public long LastCheckTime;
}

public class NewChangesCheck
{
    public List<MessageCheck> ChatSessionChecks;
    public long NewVisitorLastCheckTime;

    public override string ToString()
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendFormat("NewVisitorLastCheckTime={0} ", NewVisitorLastCheckTime);
        if (ChatSessionChecks != null)
        {
            foreach (MessageCheck item in ChatSessionChecks)
            {
                sb.AppendFormat("ChatId={0} ", item.ChatId);
                sb.AppendFormat("LastCheckTime={0} ", item.LastCheckTime);
            }
        }
        return sb.ToString();
    }
}

public class MessageCheckResult
{
    public string ChatId;
    public List<Message> Messages;
}

#endregion
/// <summary>
/// ����һ����
/// </summary>
public class NewChangesCheckResult
{
    public List<Operator> Operators; // �ͷ�״̬����
    public List<Visitor> NewVisitors; // �·ÿ�
    public List<VisitSession> VisitSessionChange; // ���ʻỰ״̬����
    public List<Chat> Chats;
    public List<MessageCheckResult> Messages; // // ��Ϣ����
    public long NewVisitorCheckTime;


    public override string ToString()
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("OperatorsΪ{0}�� ", Operators == null ? 0 : Operators.Count);
        sb.AppendFormat("NewVisitorsΪ{0}�� ", NewVisitors == null ? 0 : NewVisitors.Count);
        sb.AppendFormat("VisitSessionChangeΪ{0}�� ", VisitSessionChange == null ? 0 : VisitSessionChange.Count);
        sb.AppendFormat("MessagesΪ{0}�� ", Messages == null ? 0 : Messages.Count);
        sb.AppendFormat("NewVisitorCheckTime={0}", NewVisitorCheckTime);
        return sb.ToString();
    }
}


/// <summary>
/// Summary description for OperatorService
/// </summary>
public static class OperatorService
{
    public const int ResetOperatorPassword_OK = 0;
    public const int ResetOperatorPassword_PermissionDenied = -1;
    public const int ResetOperatorPassword_OtheError = -2;

    public static IOperatorProvider Provider = new SqlOperatorProvider();
    public static IDBProvider DBProvider = new SqlDBProvider();

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
        //List<Account> accounts = AccountService.GetAllAccounts();
        //foreach (var item in accounts)
        //{
        //    Operator op = new Operator();
        //    op.OperatorId = item.AccountId;
        //    op.Email = item.Email;
        //    op.AVChatStatus = OperatorStatus.Offline.ToString();
        //    op.AccountId = item.AccountId;
        //    op.NickName = item.NickName;
        //    op.LoginName = item.LoginName;
        //    op.Password = item.Password;
        //    op.IsAdmin = true;
        //    op.Status = OperatorStatus.Offline;
        //    operators.Add(op);
        //}
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
        Trace.WriteLine(string.Format("OperatorService.Login(AccountName = {0},OperatorName={1},Password={2})", accountName, operatorName,password));
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

    /// <summary>
    /// ����OperatorID��ѯ�ͷ�
    /// </summary>
    /// <param name="operatorId"></param>
    /// <returns></returns>
    public static Operator GetOperatorById(string operatorId)
    {
         Trace.WriteLine(string.Format("OperatorService.GetOperatorById(operatorId = {0})", operatorId));
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
    /// ������ϯ����
    /// </summary>
    /// <param name="loginName">��¼��</param>
    public static int ResetOperatorPassword(string loginName)
    {
        Trace.WriteLine(string.Format("OperatorService.ResetOperatorPassword(LoginName = {0})", loginName));
        Operator op = GetOperatorByLoginName(loginName);
        if (loginName != null || op != null)
        {
            if (op.Email != null)
            {
                string body = "����������ǣ�" + Util.RandLetter(8);
                string subject = "���뼤��";
                string SMTPServer= ConfigurationManager.AppSettings["SMTPServer"].ToString();
                string emal=ConfigurationManager.AppSettings["Email"].ToString();
                string pwd=ConfigurationManager.AppSettings["Password"].ToString();
                Util.SendEmail(op.Email, emal, pwd, SMTPServer, subject, body);
                return ResetOperatorPassword_OK;
            }
            else
            {
                return ResetOperatorPassword_PermissionDenied;
            }
        }
        else
        {
            return ResetOperatorPassword_OtheError;
        }
    }
    /// <summary>
    /// �жϴ��û��Ƿ����
    /// </summary>
    /// <param name="loginName"></param>
    /// <returns></returns>
    public static bool IsOperatorExsit(string loginName)
    {
        Operator op = OperatorService.GetOperatorByLoginName(loginName);
        if (op != null)
        {
            return true;
        }
        else
            return false;
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
                op = item;
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
    /// �޸�����
    /// </summary>
    /// <param name="operatorId">operatorId</param>
    /// <param name="oldPassword">������</param>
    /// <param name="newPassword">������</param>
    /// <returns>(int)��Ϣ</returns>
    public static int ChangPassword(string operatorId, string oldPassword, string newPassword)
    {
        Trace.WriteLine(string.Format("OperatorService.ChangPassword(operatorId = {0},oldPassword={1},Password={2})", operatorId, oldPassword, newPassword));
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
    /// �ÿ��ϴ��ļ����ͷ� 
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="fileName"></param>
    public static void SendFile(string chatId, string fileName)
    {
        Trace.WriteLine(string.Format("OperatorService.SendFile(ChatId = {0},FileName={1})", chatId,fileName));
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        Message m = new Message();
        m.ChatId = chatId;
        m.Text = string.Format("�ÿ��Ѹ��������ļ� {0}<a target='_blank' href='{1}/UploadFile/{2}'>�������</a>", fileName, homeRootUrl, fileName);
        m.Type = MessageType.SystemMessage_ToOperator;
        ChatService.SendMessage(m);
    }
    /// <summary>
    /// ���ݹ�˾ID��ѯ���пͷ�
    /// </summary>
    /// <param name="accountId"></param>
    /// <returns></returns>
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

    public static NewChangesCheckResult CheckNewChanges(string operatorId, NewChangesCheck check)
    {
        Trace.WriteLine(string.Format("OperatorService.CheckNewChanges(operatorId = {0},NewChangesCheck={1})", operatorId, check.ToString()));
        Operator op = OperatorService.GetOperatorById(operatorId);
        NewChangesCheckResult checkResult = new NewChangesCheckResult();

        // �·ÿ�
        checkResult.NewVisitors = VisitorService.GetNewVisitors(op.AccountId, check.NewVisitorLastCheckTime);

        checkResult.Chats = ChatService.GetAllChatByAccountId(op.AccountId);

        // ���ʻỰ״̬����
        checkResult.VisitSessionChange = VisitSessionService.GetVisitSessionChange(op.AccountId, check.NewVisitorLastCheckTime);

        // ��Ϣ����
        //List<VisitSession> visitSessions = VisitSessionService.GetActiveSessionsByOperatorId(Authentication.OperatorId);
        checkResult.Messages = new List<MessageCheckResult>();
        foreach (MessageCheck item in check.ChatSessionChecks)
        {
            MessageCheckResult mcr = new MessageCheckResult();
            mcr.ChatId = item.ChatId;
            mcr.Messages = MessageService.GetMessagesForOperator(item.ChatId, item.LastCheckTime);
            checkResult.Messages.Add(mcr);
        }
        checkResult.Operators = OperatorService.GetAllOperatorsByAccountId(op.AccountId);
        // �ͷ�״̬����
        Trace.WriteLine(string.Format("ChecknewChanges(OperatorId={0},NewChangesCheck={{1}},NewChangesCheckResult={{2}}", operatorId, check.ToString(), checkResult.ToString()));
        return checkResult;

    }
    /// <summary>
    /// �½�һ���ͷ�
    /// </summary>
    /// <param name="op"></param>
    public static void NewOperator(Operator op)
    {
        Trace.WriteLine(string.Format("OperatorService.NewOperator(Operator = {0})", op.ToString()));
        if (GetOperatorById(op.OperatorId) != null)
        {
            Trace.WriteLine(string.Format("Error:OperatorService.NewOperator(Operator = {0}) ����operator�Ѵ���", op.ToString()));
            return;
        }
        operators.Add(op);
        Provider.NewOperator(op);
    }

    /// <summary>
    /// ���ÿͷ�״̬
    /// </summary>
    /// <param name="operatorId"></param>
    /// <param name="operatorStatus"></param>
    public static void SetOperatorStatus(string operatorId, OperatorStatus operatorStatus)
    {
        Operator op = OperatorService.GetOperatorById(operatorId);
        if (op == null)
        {
            throw new BLLInternalException("Operator not found: OperatorId=" + operatorId);
        }
        op.Status = operatorStatus;
    }


    public static void UploadFile(byte[] bs, string fileName, string chatId, string saveFilePath)
    {
        MemoryStream mo = new MemoryStream(bs);
        FileStream fs = new FileStream(saveFilePath, FileMode.Create);
        mo.WriteTo(fs);
        mo.Close();
        fs.Close();

        Message m = new Message();
        m.ChatId = chatId;
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        m.Text = string.Format("�ͷ��Ѹ��������ļ� {0} <a target='_blank' href='{1}/UploadFile/{2}\'>�������</a>", fileName, homeRootUrl, fileName);
        m.Type = MessageType.SystemMessage_ToVisitor;
        ChatService.SendMessage(m);

        m = new LiveSupport.LiveSupportModel.Message();
        m.ChatId = chatId;
        m.Text = string.Format("�ļ� {0} ���ͳɹ�!  ...", fileName);
        m.Type = MessageType.SystemMessage_ToOperator;
        ChatService.SendMessage(m);
    }
    /// <summary>
    /// ���¿�ݻظ�
    /// </summary>
    /// <param name="operatorId"></param>
    /// <param name="response"></param>
    public static void UpdateQuickResponse(string operatorId, List<QuickResponseCategory> response)
    {
         string accountId=OperatorService.GetOperatorById(operatorId).AccountId;
         foreach (var item in response)
         {
             QuickResponse qr = new QuickResponse();
             qr.QuickId = item.QuickId;
             qr.AccountId = accountId;
             qr.Submenu = item.Name;
             qr.OperatorId = operatorId;
             string node = string.Empty;
             foreach (var n in item.Responses )
             {   
                 node +=n.ToString()+"|";
             }
             if (node.Length > 0 && node[node.Length - 1] == '|')
             {
                 node = node.Substring(0, node.Length - 1);
             }
             qr.Node = node;
             DBProvider.UpdateQuickResponseByAccountId(qr);
         }
    }
    /// <summary>
    /// ���ݹ�˾��ѯ��ݻظ�
    /// </summary>
    /// <param name="accountId"></param>
    /// <returns></returns>
    public static List<QuickResponseCategory> GetQuickResponse(string accountId)
    {
        List<QuickResponse> li = DBProvider.GetQuickResponseByAccountId(accountId);
        List<QuickResponseCategory> qrcli=new List<QuickResponseCategory>();
        foreach (var item in li)
        {
            QuickResponseCategory qrc = new QuickResponseCategory();
            qrc.QuickId = item.QuickId;
            qrc.Name = item.Submenu;
            List<string> rli = new List<string>();
            string[] ss = item.Node.Split('|');
            foreach (var node in ss)
            {
                rli.Add(node);
            }
            qrc.Responses = rli;
            qrcli.Add(qrc);
        }
        return qrcli;
    }
}
