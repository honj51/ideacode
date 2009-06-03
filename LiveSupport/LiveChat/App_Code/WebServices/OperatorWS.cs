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
        if (Authentication == null || OperatorService.GetOperatorById(Authentication.OperatorId) == null 
            || !OperatorService.IsOperatorOnline(Authentication.OperatorId))
        {
            throw new AccessViolationException("CheckAuthentication Failed");
        }
    }
    /// <summary>
    /// ��½
    /// </summary>
    /// <param name="userName">�û���</param>
    /// <param name="password">����</param>
    /// <returns>operator����</returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public Operator Login(string accountName, string operatorName, string password)
    {
        return OperatorService.Login(accountName, operatorName, password);
    }
    /// <summary>
    /// ע��
    /// </summary>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void Logout()
    {
        OperatorService.Logout(Authentication.OperatorId);
    }

    /// <summary>
    /// ȡ���иù�˾�����߿ͷ�
    /// </summary>
    /// <param name="accountId">��˾ID</param>
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
        return OperatorService.CheckNewChanges(Authentication.OperatorId, check);
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
    /// �ϴ��ļ�
    /// </summary>
    /// <param name="bs"></param>
    /// <param name="filename"></param>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void UploadFile(byte[] bs, string fileName, string chatId)
    {
        checkAuthentication();
        MemoryStream mo = new MemoryStream(bs);
        FileStream fs = new FileStream(Server.MapPath("~/UploadFile/") + fileName, FileMode.Create);
        mo.WriteTo(fs);
        mo.Close();
        fs.Close();

        LiveSupport.LiveSupportModel.Message m = new LiveSupport.LiveSupportModel.Message();
        m.ChatId = chatId;
        string homeRootUrl = System.Configuration.ConfigurationManager.AppSettings["HomeRootUrl"];
        m.Text = string.Format("�ͷ��Ѹ��������ļ� {0} <a target='_blank' href='{1}/UploadFile/{2}\'>�������</a>", fileName,homeRootUrl,fileName);
        m.Type = MessageType.SystemMessage_ToVisitor;
        ChatService.SendMessage(m);

        m = new LiveSupport.LiveSupportModel.Message();
        m.ChatId = chatId;
        m.Text = string.Format("�ļ� {0} ���ͳɹ�!  ...", fileName);
        m.Type = MessageType.SystemMessage_ToOperator;
        ChatService.SendMessage(m);
    }
    /// <summary>
    /// �ͷ�����һ����Ϣ���ÿ�
    /// </summary>
    /// <param name="msg">��Ϣ����</param>
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
    /// �޸�����
    /// </summary>
    /// <param name="oldPassword">������</param>
    /// <param name="newPassword">������</param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public int ChangePassword(string oldPassword, string newPassword)
    {
        checkAuthentication();
        return OperatorService.ChangPassword(Authentication.OperatorId, oldPassword, newPassword);
    }
    /// <summary>
    /// ������ϯ����
    /// </summary>
    /// <param name="loginName">��¼��</param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public int ResetOperatorPassword(string loginName)
    {
        checkAuthentication();
        return OperatorService.ResetOperatorPassword(loginName);
    }
    /// <summary>
    /// �رնԻ�
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
    /// ��ȡ������ʷ��¼
    /// </summary>
    /// <param name="visitorId">�ỰID</param>
    /// <param name="begin">��ʼʱ��</param>
    /// <param name="end">����ʱ��</param>
    /// <returns>��Ϣ����</returns>
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
    /// ��ȡ��վҳ�������ʷ��¼
    /// </summary>
    /// <param name="visitorId">�ÿ�ID</param>
    /// <param name="begin">��ʼʱ��</param>
    /// <param name="end"> ����ʱ��</param>
    /// <returns>Pagerequest����</returns>
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
    /// ���ܶԻ�����
    /// </summary>
    /// <param name="chatId"></param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public int AcceptChatRequest(string chatId)
    {
        return ChatService.AcceptChatRequest(Authentication.OperatorId, chatId);
    }    /// <summary>
    /// ��������Ի�
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public Chat InviteChat(string visitorId)
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
    /// ϵͳ��Ϣ��ʾ
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
            sysinfo.AdvertiseMessage = "��İ汾��Ϣ�����뼰ʱ����";
            li.Add(sysinfo);
        }
        else
        {
            SystemAdvertise sysinfo = new SystemAdvertise();
            sysinfo.AdvertiseUrl = homeRootUrl+LatestUrl;
            sysinfo.AdvertiseMessage = "������ʹ�õ������°汾";
            li.Add(sysinfo);
        }
        return li;
    }
}