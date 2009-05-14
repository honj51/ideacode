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

    /// <summary>
    /// Contains all functionality for an operator to maintain
    /// a chat session with a client.
    /// </summary>
[WebService(Namespace = "http://www.LiveSupport.cn/LiveSupportService/2009/04")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]

public class OperatorWS : System.Web.Services.WebService
{
    public class MessageCheck
	{
        public string ChatId;
        public long LastCheckTime;
	}  

    public class NewChangesCheck
    {
        public List<MessageCheck> ChatSessionChecks;
        public long NewVisitorLastCheckTime;
    }

    public class MessageCheckResult
    {
        public string ChatId;
        public List<Message> Messages;
    }

    /// <summary>
    /// ����һ����
    /// </summary>
    public class NewChangesCheckResult
    {
        public List<Operator> Operators; // �ͷ�״̬����
        public List<Visitor> NewVisitors; // �·ÿ�
        public List<VisitSession> VisitSessionChange; // ���ʻỰ״̬����
        public List<MessageCheckResult> Messages; // // ��Ϣ����
        public long NewVisitorCheckTime;
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
    public List<Visitor> GetAllVisitors(int accountId)
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
        
        // �·ÿ�
        checkResult.NewVisitors = VisitorService.GetNewVisitors(op.AccountId, check.NewVisitorLastCheckTime);

        // ���ʻỰ״̬����
        checkResult.VisitSessionChange = VisitSessionService.GetVisitSessionChange(op.AccountId, check.NewVisitorLastCheckTime);

        // ��Ϣ����
        //List<VisitSession> visitSessions = VisitSessionService.GetActiveSessionsByOperatorId(Authentication.OperatorId);
        checkResult.Messages = new List<MessageCheckResult>();
        foreach (var item in check.ChatSessionChecks)
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

        // �ͷ�״̬����
        
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
    /// �ϴ��ļ�
    /// </summary>
    /// <param name="bs"></param>
    /// <param name="filename"></param>
    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void UploadFile(byte[] bs, string filename)
    {
        checkAuthentication();
        MemoryStream mo = new MemoryStream(bs);
        FileStream fs = new FileStream(Server.MapPath("~/Download/") + filename, FileMode.Create);
        mo.WriteTo(fs);
        mo.Close();
        fs.Close();
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
        return ChatService.ChangPassword(Authentication.OperatorId,oldPassword,newPassword); 
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
        return ChatService.ResetOperatorPassword(loginName);
    }
    /// <summary>
    /// �رնԻ�
    /// </summary>
    /// <param name="chatId">chatid</param>
    /// <returns>int</returns>
    public bool CloseChat(string chatId)
    {
       return ChatService.CloseChat(chatId, Authentication.userName);

    }
    /// <summary>
    /// ��ȡ������ʷ��¼
    /// </summary>
    /// <param name="visitorId">�ỰID</param>
    /// <param name="begin">��ʼʱ��</param>
    /// <param name="end">����ʱ��</param>
    /// <returns>��Ϣ����</returns>
    public List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end)
    {
       return MessageService.GetHistoryChatMessage(visitorId,begin,end);
    }
    /// <summary>
    /// ��ȡ��վҳ�������ʷ��¼
    /// </summary>
    /// <param name="visitorId">�ÿ�ID</param>
    /// <param name="begin">��ʼʱ��</param>
    /// <param name="end"> ����ʱ��</param>
    /// <returns>Pagerequest����</returns>
    public List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
    {
      return PageRequestService.GetHistoryPageRequests(visitorId,begin,end);
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
    public int InviteChat(string visitorId)
    {
        return 0;
        //TODO:Ŀǰ��ûʵ��
    }
}