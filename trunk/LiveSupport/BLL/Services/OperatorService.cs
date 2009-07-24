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
using System.Collections;
using OperatorServiceInterface;


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
/// 定义一个类
/// </summary>
public class NewChangesCheckResult
{
    public enum ReturnCodeEnum { ReturnCode_Success, ReturnCode_SessionInvalid };// 成功,会话已失效(例如同一帐户多处登陆)
    public List<Operator> Operators; // 客服状态更新
    public List<Visitor> NewVisitors; // 新访客
    public List<VisitSession> VisitSessionChange; // 访问会话状态更新
    public List<Chat> Chats;
    public List<MessageCheckResult> Messages; // // 消息更新
    public long NewVisitorCheckTime;
    public ReturnCodeEnum ReturnCode;

    public override string ToString()
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("Operators为{0}个 ", Operators == null ? 0 : Operators.Count);
        sb.AppendFormat("NewVisitors为{0}个 ", NewVisitors == null ? 0 : NewVisitors.Count);
        sb.AppendFormat("VisitSessionChange为{0}个 ", VisitSessionChange == null ? 0 : VisitSessionChange.Count);
        sb.AppendFormat("Messages为{0}个 ", Messages == null ? 0 : Messages.Count);
        sb.AppendFormat("NewVisitorCheckTime={0}", NewVisitorCheckTime);
        return sb.ToString();
    }
}


/// <summary>
/// Summary description for OperatorService
/// </summary>
public static class OperatorService
{
    public static event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;

    public const int ResetOperatorPassword_OK = 0;
    public const int ResetOperatorPassword_PermissionDenied = -1;
    public const int ResetOperatorPassword_OtheError = -2;

    public static IOperatorProvider Provider = new SqlOperatorProvider();
    public static IDBProvider DBProvider = new SqlDBProvider();
    private static List<Operator> operators = new List<Operator>();

    public static List<Operator> GetAllOperators()
    {
        return operators;
    }

    public static void Init()
    {
        GetOperatorsFromDB();        
    }
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
        else
        {
            throw new ArgumentException("Operaotor:"+operatorId+" not exist");
        }
    }
    /// <summary>
    /// 登陆
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="password">密码</param>
    /// <returns>operator对象</returns>
    public static Operator Login(string accountNumber, string operatorName, string password)
    {
        Trace.WriteLine(string.Format("OperatorService.Login(accountNumber = {0},OperatorName={1},Password={2})", accountNumber, operatorName, password));
        Account account = AccountService.FindAccountByAccountNumber(accountNumber);
        if (account == null) return null;

        Operator op = FindOperator(account.AccountId, operatorName, password);
        
        if (op == null)
        {
            GetOperatorsFromDB();
            op = FindOperator(account.AccountId, operatorName, password);
        }
        if (op != null)
        {
            op.HeartBeatTime = DateTime.Now;
            SetOperatorStatus(op.OperatorId, OperatorStatus.Idle);
            //op.Status = OperatorStatus.Idle;//将客服状态改为空闲
            op.OperatorSession = Guid.NewGuid().ToString();
        }
        return op;
    }
    /// <summary>
    /// 注销 登陆
    /// </summary>
    /// <param name="operatorId">客服ID</param>
    public static void Logout(string operatorId, string operatorSession)
    {

        Operator op = GetOperatorById(operatorId);
        if (op != null && op.OperatorSession == operatorSession)
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

    /// <summary>
    /// 跟据OperatorID查询客服
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
             GetOperatorsFromDB();
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

    private static Operator FindOperator(string accountId, string loginName, string password)
    {
        foreach (Operator item in operators)
        {
            if (item.AccountId == accountId && item.LoginName == loginName && item.Password == password)
            {
                return item;
            }
        }
        return null;
    }

    /// <summary>
    /// 重置座席密码
    /// </summary>
    /// <param name="loginName">登录名</param>
    public static int ResetOperatorPassword(string operatorId, string loginName)
    {
        Trace.WriteLine(string.Format("OperatorService.ResetOperatorPassword(LoginName = {0})", loginName));
        Operator op = null;
        op = GetOperatorById(operatorId);
        if (op == null || op.IsAdmin == false)
        {
            return ResetOperatorPassword_OtheError;
        }
        op = GetOperatorByLoginName(loginName);
        if (loginName != null || op != null)
        {
            if (op.Email != null)
            {
                op.Password=Util.RandLetter(8);
                string body = "尊敬的客服 " + op.NickName + " 您好!\n   您的账号为：" + op.LoginName + ",您的密码为：" + op.Password + ",请您牢记,感谢您一直以来对我们公司产品的支持与厚爱!\n \n \n \n \n \n \n \n                                                        如需帮助请浏览我们公司的官方网站 http://www.zxkefu.cn";
                string subject = "密码激活";
                string SMTPServer= ConfigurationManager.AppSettings["SMTPServer"].ToString();
                string emal=ConfigurationManager.AppSettings["Email"].ToString();
                string pwd=ConfigurationManager.AppSettings["Password"].ToString();
                Util.SendEmailAsync(op.Email, emal, pwd, SMTPServer, subject, body);
                UpdateOperator(op);
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
    /// 判断此用户是否存在
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
    /// 修改密码
    /// </summary>
    /// <param name="operatorId">operatorId</param>
    /// <param name="oldPassword">老密码</param>
    /// <param name="newPassword">新密码</param>
    /// <returns>(int)信息</returns>
    public static int ChangPassword(string operatorId, string oldPassword, string newPassword)
    {
        Trace.WriteLine(string.Format("OperatorService.ChangPassword(operatorId = {0},oldPassword={1},Password={2})", operatorId, oldPassword, newPassword));
        Operator op = GetOperatorById(operatorId);
        if (op != null)
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
    /// 访客上传文件给客服 
    /// </summary>
    /// <param name="chatId"></param>
    /// <param name="fileName"></param>
    public static void SendFile(string chatId, string fileName)
    {
        Trace.WriteLine(string.Format("OperatorService.SendFile(ChatId = {0},FileName={1})", chatId,fileName));
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        Message m = new Message();
        m.ChatId = chatId;
        string href = string.Format("{0}/upload/{1}", homeRootUrl, chatId + "/" + fileName.Replace("'","%27"));
        m.Text = string.Format("访客已给您发送文件 {0} <a target='_blank' href='{1}'>点击保存</a>", fileName,href);
        m.Type = MessageType.SystemMessage_ToOperator;
        ChatService.SendMessage(m);
    }
    /// <summary>
    /// 跟据公司ID查询所有客服
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

    public static NewChangesCheckResult CheckNewChanges(string operatorId, string operatorSessionId, NewChangesCheck check)
    {
        Trace.WriteLine(string.Format("OperatorService.CheckNewChanges(operatorId = {0},NewChangesCheck={1})", operatorId, check.ToString()));
        Operator op = OperatorService.GetOperatorById(operatorId);
        op.HeartBeatTime = DateTime.Now;//设置心跳时间
        NewChangesCheckResult checkResult = new NewChangesCheckResult();

        if (op.OperatorSession != operatorSessionId)
        {
            checkResult.ReturnCode = NewChangesCheckResult.ReturnCodeEnum.ReturnCode_SessionInvalid;
            return checkResult;
        }

        // 新访客
        checkResult.NewVisitors = VisitorService.GetNewVisitors(op.AccountId, check.NewVisitorLastCheckTime);

        checkResult.Chats = ChatService.GetAllChatByAccountId(op.AccountId);

        // 访问会话状态更新
        checkResult.VisitSessionChange = VisitSessionService.GetVisitSessionChange(op.AccountId, check.NewVisitorLastCheckTime);

        // 消息更新
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
        checkResult.ReturnCode = NewChangesCheckResult.ReturnCodeEnum.ReturnCode_Success;
        // 客服状态更新
        Trace.WriteLine(string.Format("ChecknewChanges(OperatorId={0},NewChangesCheck={{1}},NewChangesCheckResult={{2}}", operatorId, check.ToString(), checkResult.ToString()));
        return checkResult;

    }
    /// <summary>
    /// 新建一个客服
    /// </summary>
    /// <param name="op"></param>
    public static void NewOperator(Operator op)
    {
        Trace.WriteLine(string.Format("OperatorService.NewOperator(Operator = {0})", op.ToString()));
        if (GetOperatorById(op.OperatorId) != null)
        {
            Trace.WriteLine(string.Format("Error:OperatorService.NewOperator(Operator = {0}) 错误operator已存在", op.ToString()));
            return;
        }
        operators.Add(op);
        Provider.NewOperator(op);
    }

    /// <summary>
    /// 设置客服状态
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
        if (OperatorStatusChange != null)
        {
            OperatorStatusChange(null, new OperatorStatusChangeEventArgs(op.OperatorId, op.Status));
        }
    }

    /// <summary>
    /// 上传文件
    /// </summary>
    /// <param name="bs"></param>
    /// <param name="fileName"></param>
    /// <param name="chatId"></param>
    /// <param name="saveFilePath"></param>
    public static void UploadFile(byte[] bs, string fileName, string chatId, string saveFilePath)
    {
        if (bs.Length >= 2097152)//限制2M
        { return; }
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
       // string UploadFileUrl = homeRootUrl + "/UploadFile/" + chatId;
        try
        {
            Directory.CreateDirectory(saveFilePath);
        }
        catch (Exception)
        {
            throw;
        }
        MemoryStream mo = new MemoryStream(bs);
        FileStream fs = new FileStream(saveFilePath+fileName, FileMode.Create);
        mo.WriteTo(fs);
        mo.Close();
        fs.Close();

        sendUploadFileCompletedMessage(fileName, chatId);
    }

    private static void sendUploadFileCompletedMessage(string fileName, string chatId)
    {
        Message m = new Message();
        m.ChatId = chatId;
        Util util = new Util();
        string httpURL = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"] + "/upload/" + chatId + "/" + fileName.Replace("'","%27");
        if (util.IsImageFile(fileName))
        {
            m.Text = string.Format("客服已给您发送文件 {0}<a target='_blank' href='{1}\'>点击保存</a> <br/><img height='120px'  width='120px'  src='{2}\' />", fileName, httpURL, httpURL);
        }
        else
        {
            m.Text = string.Format("客服已给您发送文件 {0} <a target='_blank' href='{1}'>点击保存</a>", fileName, httpURL);
        }
        m.Type = MessageType.SystemMessage_ToVisitor;
        ChatService.SendMessage(m);

        m = new LiveSupport.LiveSupportModel.Message();
        m.ChatId = chatId;
        m.Text = string.Format("文件 {0} 发送成功!  ...", fileName);
        m.Type = MessageType.SystemMessage_ToOperator;
        ChatService.SendMessage(m);
    }

    public static void SendFile(string fileName, string chatId, string saveFilePath, object action)
    {
        if (action.ToString() == "start")
        {
            try
            {
                Directory.CreateDirectory(saveFilePath);
            }
            catch (Exception)
            {
            }
        }
        else if (action.ToString() == "complete")
        {
            sendUploadFileCompletedMessage(fileName, chatId);            
        }
    }
    /// <summary>
    /// 更新快捷回复
    /// </summary>
    /// <param name="operatorId"></param>
    /// <param name="response"></param>
    public static void SaveQuickResponse(string operatorId, List<QuickResponseCategory> response)
    {
         string accountId=OperatorService.GetOperatorById(operatorId).AccountId;
         DBProvider.DeleteQuickResponseByAccountId(accountId);
         foreach (var item in response)
         {
             QuickResponse qr = new QuickResponse();
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
             DBProvider.NewQuickResponse(qr);
         }
    }
    /// <summary>
    /// 跟据域名更新快捷回复
    /// </summary>
    /// <param name="operatorId"></param>
    /// <param name="response"></param>
    public static void SaveQuickResponseByDomainName(string operatorId, string domainName, List<QuickResponseCategory> response)
    {
        string accountId = OperatorService.GetOperatorById(operatorId).AccountId;
        DBProvider.DeleteQuickResponseByDomainName(domainName);
        foreach (var item in response)
        {
            QuickResponse qr = new QuickResponse();
            qr.DomainName = domainName;
            qr.AccountId = accountId;
            qr.Submenu = item.Name;
            qr.OperatorId = operatorId;
            string node = string.Empty;
            foreach (var n in item.Responses)
            {
                node += n.ToString() + "|";
            }
            if (node.Length > 0 && node[node.Length - 1] == '|')
            {
                node = node.Substring(0, node.Length - 1);
            }
            qr.Node = node;
            DBProvider.NewQuickResponse(qr);
        }
    }
    /// <summary>
    /// 跟据公司查询快捷回复 
    /// </summary>
    /// <param name="accountId"></param>
    /// <returns></returns>
    public static List<QuickResponseCategory> GetQuickResponse(string operatorId)
    {
        string accountId = OperatorService.GetOperatorById(operatorId).AccountId;
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
    /// <summary>
    /// 跟据域名来获取快捷回复
    /// </summary>
    /// <param name="domainName"></param>
    /// <returns></returns>
    public static List<QuickResponseCategory> GetQuickResponseByDomainName(string domainName)
    {
        List<QuickResponse> li = DBProvider.GetQuickResponseByDomainName(domainName);
        List<QuickResponseCategory> qrcli = new List<QuickResponseCategory>();
        foreach (var item in li)
        {
            QuickResponseCategory qrc = new QuickResponseCategory();
            qrc.AccountId = item.AccountId;
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
    /// <summary>
    /// Operators异常退出处理
    /// </summary>
    public static void MaintanStatus()
    {
        foreach ( Operator item in operators)
        {
            if (DateTime.Now > item.HeartBeatTime.AddSeconds(5*60) && item.Status != OperatorStatus.Offline)
            {
                item.Status = OperatorStatus.Offline;
                Trace.WriteLine(string.Format("Operator {0} Leave", item.OperatorId));
            }
        }
    }
    #region 取数据库中的数据
    /// <summary>
    ///更新operator数据从数据库
    /// </summary>
    public static void GetOperatorsFromDB()
    {
        List < Operator > newops = Provider.GetAllOperators();
        foreach (var newop in newops)
        {   
            foreach (var oldop in operators)
            {
                if (newop.OperatorId == oldop.OperatorId)
                {
                    newop.Status = oldop.Status;
                    newop.OperatorSession = oldop.OperatorSession;
                }
            }
        }
        operators = newops;
    }
    #endregion
}
