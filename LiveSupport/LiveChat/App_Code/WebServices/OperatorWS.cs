#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Service called by the operator's console
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Web.Caching;
using LiveSupport.LiveSupportModel;
using System.IO;
using System.Diagnostics;
using System.Text;
using System.Configuration;
    /// <summary>
    /// Contains all functionality for an operator to maintain
    /// a chat session with a client.
    /// </summary>
[WebService(Namespace = "http://www.LiveSupport.cn/LiveSupportService/2009/04")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]

public class OperatorWS : System.Web.Services.WebService
{
    public class QuickResponseCategory
    {
        public string Name;
        public List<string> Responses;        
    }
    /// <summary>
    /// 版本信息
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
    /// 定义一个类
    /// </summary>
    public class NewChangesCheckResult
    {
        public List<Operator> Operators; // 客服状态更新
        public List<Visitor> NewVisitors; // 新访客
        public List<VisitSession> VisitSessionChange; // 访问会话状态更新
        public List<MessageCheckResult> Messages; // // 消息更新
        public long NewVisitorCheckTime;

        public string ToString()
        {
            StringBuilder sb = new StringBuilder();

             sb.AppendFormat("Operators为{0}个 ",Operators == null ? 0: Operators.Count);
             sb.AppendFormat("NewVisitors为{0}个 ", NewVisitors == null ? 0 : NewVisitors.Count);
             sb.AppendFormat("VisitSessionChange为{0}个 ", VisitSessionChange == null ? 0 : VisitSessionChange.Count);
             sb.AppendFormat("Messages为{0}个 ", Messages == null ? 0 : Messages.Count);
             sb.AppendFormat("NewVisitorCheckTime={0}", NewVisitorCheckTime);
             return sb.ToString();
           // foreach (var item in NewVisitors)
           // {
                //sb.AppendFormat("VisitorId:",item.VisitorId,item.Name,
            //}
            //sb.AppendFormat("NewVisitorCheckTime:{0} | NewVisitors []"
        }
    }

    public AuthenticationHeader Authentication;
    public OperatorWS()
	{
		//Uncomment the following line if using designed components 
		//InitializeComponent(); 
	}

    private void checkAuthentication()
    {
        if (Authentication == null || OperatorService.GetOperatorById(Authentication.OperatorId) == null 
            || !OperatorService.IsOperatorOnline(Authentication.OperatorId))
        {
            throw new AccessViolationException("CheckAuthentication Failed");
        }
    }
    /// <summary>
    /// 登陆
    /// </summary>
    /// <param name="userName">用户名</param>
    /// <param name="password">密码</param>
    /// <returns>operator对象</returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public Operator Login(string accountName, string operatorName, string password)
    {
        return OperatorService.Login(accountName, operatorName, password);
    }
    /// <summary>
    /// 注销
    /// </summary>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void Logout()
    {
        OperatorService.Logout(Authentication.OperatorId);
    }

    /// <summary>
    /// 取所有该公司的在线客服
    /// </summary>
    /// <param name="accountId">公司ID</param>
    /// <returns></returns>
    [SoapHeader("Authentication")]
    [WebMethod]
    public List<Visitor> GetAllVisitors(string accountId)
    {
        checkAuthentication();
        return VisitorService.GetAllOnlineVisitors(accountId);
    }

    [SoapHeader("Authentication")]
    [WebMethod]
    public NewChangesCheckResult CheckNewChanges(NewChangesCheck check)
    {
        checkAuthentication();
        Operator op = OperatorService.GetOperatorById(Authentication.OperatorId);
        NewChangesCheckResult checkResult = new NewChangesCheckResult();
        
        // 新访客
        checkResult.NewVisitors = VisitorService.GetNewVisitors(op.AccountId, check.NewVisitorLastCheckTime);

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
        //result.Messages = new List<ChatSessionMessages>();
        //foreach (var item in visitSessions)
        //{
        //    ChatSessionMessages ms = new ChatSessionMessages();
        //    ms.messages = MessageService.GetMessagesForOperator(item.SessionId,
        //    //result.Messages.AddRange(MessageService.GetMessagesForOperator(item.SessionId, lastCheck));
        //}
        //Debug.WriteLine(string.Format("CheckNewChanges({0}) MessageCount={1})",lastCheck.Ticks,result.Messages.Count));
        checkResult.Operators = OperatorService.GetAllOperators();
        // 客服状态更新
        Debug.WriteLine(string.Format("ChecknewChanges(OperatorId={0},NewChangesCheck={{1}},NewChangesCheckResult={{2}}", Authentication.OperatorId, check.ToString(),checkResult.ToString()));
        return checkResult;
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool IsTyping(string chatId, bool isOperator)
    {
        //checkAuthentication(); // chatpage can't call this method
        bool retVal = false;
        HttpContext ctx = HttpContext.Current;
        if (ctx != null)
        {
            string who = isOperator ? "op" : "visitor";
            if (ctx.Application[chatId + "_" + who + "_typing"] != null)
                retVal = (bool)ctx.Application[chatId + "_" + who + "_typing"];

            // Clean up application variables
            DateTime lastCleanUp = DateTime.Now;
            DateTime now = DateTime.Now;
            if (ctx.Application["lastCleanUp"] != null)
                lastCleanUp = (DateTime)ctx.Application["lastCleanUp"];
            else
                ctx.Application.Add("lastCleanUp", DateTime.Now);

            TimeSpan duration = now - lastCleanUp;

            if (duration.Seconds > 45)
            {
                List<string> keyNames = new List<string>();
                foreach (string key in ctx.Application.Keys)
                    keyNames.Add(key);

                foreach (string key in keyNames)
                {
                    if (key.EndsWith("_typing"))
                        ctx.Application.Remove(key);
                }
                ctx.Application["lastCleanUp"] = DateTime.Now;
            }

        }
        return retVal;
    }
    /// <summary>
    /// 上传文件
    /// </summary>
    /// <param name="bs"></param>
    /// <param name="filename"></param>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void UploadFile(byte[] bs, string fileName, string chatId)
    {
        checkAuthentication();
        MemoryStream mo = new MemoryStream(bs);
        FileStream fs = new FileStream(Server.MapPath("~/Download/") + fileName, FileMode.Create);
        mo.WriteTo(fs);
        mo.Close();
        fs.Close();

        LiveSupport.LiveSupportModel.Message m = new LiveSupport.LiveSupportModel.Message();
        m.ChatId = chatId;
        m.Text = string.Format("客服已给您发送文件 {0} <a href=\"Download/{1}\">点击保存</a>", fileName, fileName);
        m.Type = MessageType.SystemMessage_ToVisitor;
        ChatService.SendMessage(m);

        m = new LiveSupport.LiveSupportModel.Message();
        m.ChatId = chatId;
        m.Text = string.Format("文件 {0} 发送成功!  ...", fileName);
        m.Type = MessageType.SystemMessage_ToOperator;
        ChatService.SendMessage(m);
    }
    /// <summary>
    /// 客服发送一条信息给访客
    /// </summary>
    /// <param name="msg">消息对像</param>
    /// <returns>bool</returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool SendMessage(Message msg)
    {
        checkAuthentication();
        if (msg.Type == MessageType.ChatMessage_OperatorToVisitor)
        {
            MessageService.AddMessage(msg);
            return true;
        }
        else
            return false;
    }
    /// <summary>
    /// 修改密码
    /// </summary>
    /// <param name="oldPassword">老密码</param>
    /// <param name="newPassword">新密码</param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public int ChangePassword(string oldPassword, string newPassword)
    {
        checkAuthentication();
        return ChatService.ChangPassword(Authentication.OperatorId,oldPassword,newPassword); 
    }
    /// <summary>
    /// 重置座席密码
    /// </summary>
    /// <param name="loginName">登录名</param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public int ResetOperatorPassword(string loginName)
    {
        checkAuthentication();
        return ChatService.ResetOperatorPassword(loginName);
    }
    /// <summary>
    /// 关闭对话
    /// </summary>
    /// <param name="chatId">chatid</param>
    /// <returns>int</returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool CloseChat(string chatId)
    {
        checkAuthentication();
        return ChatService.CloseChat(chatId, OperatorService.GetOperatorById(Authentication.OperatorId).NickName);
    }
    /// <summary>
    /// 获取聊天历史记录
    /// </summary>
    /// <param name="visitorId">会话ID</param>
    /// <param name="begin">开始时间</param>
    /// <param name="end">结束时间</param>
    /// <returns>消息集合</returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
    {
        List<VisitSession> li = VisitSessionService.GetVisitSessionByVisitor(visitorId);
        List<Message> list = new List<Message>();
        foreach(VisitSession m in li)
        {
            list.AddRange(MessageService.GetHistoryChatMessage(m.SessionId, begin, end));
        }
        return list;
    }
    /// <summary>
    /// 获取网站页面访问历史记录
    /// </summary>
    /// <param name="visitorId">访客ID</param>
    /// <param name="begin">开始时间</param>
    /// <param name="end"> 结束时间</param>
    /// <returns>Pagerequest集合</returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
    {
        List<VisitSession> li = VisitSessionService.GetVisitSessionByVisitor(visitorId);
        List<PageRequest> list = new List<PageRequest>();
        foreach(VisitSession m in li)
        {
           list.AddRange(PageRequestService.GetHistoryPageRequests(m.SessionId, begin, end));
        }
        return list;
    }
    /// <summary>
    /// 接受对话请求
    /// </summary>
    /// <param name="chatId"></param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public int AcceptChatRequest(string chatId)
    {
        return ChatService.AcceptChatRequest(Authentication.OperatorId, chatId);
    }    /// <summary>
    /// 主动邀请对话
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public int InviteChat(string visitorId)
    {        
       return ChatService.OperatorRequestChat(Authentication.OperatorId, visitorId);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void UpdateQuickResponse(List<QuickResponseCategory> response)
    {
        
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<QuickResponseCategory> GetQuickResponse()
    {
        return null;

    }
    /// <summary>
    /// 系统信息提示
    /// </summary>
    /// <param name="versionNumber"></param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<SystemAdvertise> GetSystemAdvertise(string versionNumber)
    {
        string homeRootUrl = ConfigurationManager.AppSettings["HomeRootUrl"].ToString();
        string LatestVersionNumber = ConfigurationManager.AppSettings["LatestOperatorConsoleVersionNumber"].ToString();
        string LatestUrl= ConfigurationManager.AppSettings["LatestOperatorConsoleUrl"].ToString();
        List<SystemAdvertise> li = new List<SystemAdvertise>();
        if (versionNumber != LatestVersionNumber)
        {
            SystemAdvertise sysinfo = new SystemAdvertise();
            sysinfo.AdvertiseUrl = homeRootUrl+LatestUrl;
            sysinfo.AdvertiseMessage = "你的版本信息过低请及时更新";
            li.Add(sysinfo);
        }
        else
        {
            SystemAdvertise sysinfo = new SystemAdvertise();
            sysinfo.AdvertiseUrl = homeRootUrl+LatestUrl;
            sysinfo.AdvertiseMessage = "你现在使用的是最新版本";
            li.Add(sysinfo);
        }
        return li;
    }
}