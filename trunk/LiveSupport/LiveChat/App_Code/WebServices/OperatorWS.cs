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
    public AuthenticationHeader Authentication;
    public OperatorWS()
	{
		//Uncomment the following line if using designed components 
		//InitializeComponent(); 
	}

    private void checkAuthentication()
    {

        if (Authentication == null)
        {
            throw new AccessViolationException("CheckAuthentication Failed, Authentication is null");
        }
        else if (OperatorService.GetOperatorById(Authentication.OperatorId) == null)
        {
            throw new AccessViolationException("CheckAuthentication Failed, Operator:" + Authentication.OperatorId+" not exist");
        }
        else if (!OperatorService.IsOperatorOnline(Authentication.OperatorId))
        {
            throw new AccessViolationException("CheckAuthentication Failed, Operator:" + Authentication.OperatorId + " not online");
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
    public Operator Login(string accountNumber, string operatorName, string password)
    {
        return OperatorService.Login(accountNumber, operatorName, password);
    }
    /// <summary>
    /// 注销
    /// </summary>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void Logout()
    {
        OperatorService.Logout(Authentication.OperatorId, Authentication.OperatorSession);
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
        return OperatorService.CheckNewChanges(Authentication.OperatorId, Authentication.OperatorSession, check);
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

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void SendFile(string fileName, string chatId, object action)
    {
        checkAuthentication();
        string saveFilePath = Server.MapPath("~/upload/" + chatId + "/");
        OperatorService.SendFile(fileName, chatId,saveFilePath, action);
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
        string saveFilePath = Server.MapPath("~/upload/" + chatId + "/");
        OperatorService.UploadFile(bs,fileName,chatId, saveFilePath);
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
            ChatService.SendMessage(msg);            
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
        return OperatorService.ChangPassword(Authentication.OperatorId, oldPassword, newPassword);
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
        return OperatorService.ResetOperatorPassword(Authentication.OperatorId, loginName);
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
        checkAuthentication();
        List<Message> list = new List<Message>();
        List<Chat> chats = ChatService.GetHistoryChatByVisitorId(visitorId);

        foreach (Chat item in chats)
        {
            if (item.CreateTime > begin && item.CreateTime < end)
            {
                list.AddRange(MessageService.GetMessagesByChatId(item.ChatId));
            }
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
        checkAuthentication();
        List<VisitSession> li = VisitSessionService.GetHistoryVisitSessionByVisitorId(visitorId);
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
        checkAuthentication();
        return ChatService.AcceptChatRequest(Authentication.OperatorId, chatId);
    }    /// <summary>
    /// 主动邀请对话
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public Chat InviteChat(string visitorId)
    {
       checkAuthentication();
       return ChatService.OperatorRequestChat(Authentication.OperatorId, visitorId);
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
        Version latestVersion = new Version(ConfigurationManager.AppSettings["LatestOperatorConsoleVersionNumber"].ToString());
        Version versionToCheck = new Version(versionNumber);
        string LatestUrl= ConfigurationManager.AppSettings["LatestOperatorConsoleUrl"].ToString();
        List<SystemAdvertise> li = new List<SystemAdvertise>();
        if (versionToCheck < latestVersion)
        {
            SystemAdvertise sysinfo = new SystemAdvertise();
            //sysinfo.AdvertiseUrl = homeRootUrl+LatestUrl;
            sysinfo.AdvertiseUrl = LatestUrl;
            sysinfo.AdvertiseMessage = "该程序有新版本可用，请点击了解详情";
            li.Add(sysinfo);
        }
        SystemAdvertise a = new SystemAdvertise();
        a.AdvertiseMessage = "欢迎您使用LiveSupport客服交流系统";
        a.AdvertiseUrl = "http://www.zxkefu.cn/";
        li.Add(a);
        return li;
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void SaveQuickResponse(List<QuickResponseCategory> response)
    {
        checkAuthentication();
        OperatorService.SaveQuickResponse(Authentication.OperatorId, response);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<QuickResponseCategory> GetQuickResponse()
    {
        checkAuthentication();
        return OperatorService.GetQuickResponse(Authentication.OperatorId);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<LeaveWord> GetLeaveWord()
    {
        checkAuthentication();
        return LiveSupport.BLL.LeaveWordManager.GetAllLeaveWordByAccountId(OperatorService.GetOperatorById(Authentication.OperatorId).AccountId);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool UpdateLeaveWordById(string sendDate, string name, bool isReplied, string id)
    {
        checkAuthentication();
        return LiveSupport.BLL.LeaveWordManager.UpdateWordProviderById(sendDate,name,isReplied,id);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<LeaveWord> GetLeaveWordNotReplied()
    {
        checkAuthentication();
        return LiveSupport.BLL.LeaveWordManager.GetLeaveWordNotRepliedByAccountId(OperatorService.GetOperatorById(Authentication.OperatorId).AccountId,false);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool DelLeaveWordById(string id)
    {
        checkAuthentication();
        return LiveSupport.BLL.LeaveWordManager.DelLeaveWordById(id);
    }
   
}