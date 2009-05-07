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
using LiveSupport.DAL.Entity;
using System.IO;

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

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public Operator LogIn(string userName, string password)
	{
        checkAuthentication();

		return OperatorService.LogIn(userName, password, Authentication.userName);
	}
   

    
     [WebMethod]
     [SoapHeader("Authentication", Required = true)]
     public void UploadFile(byte[] bs, string filename)
     {
         checkAuthentication();
         MemoryStream mo = new MemoryStream(bs);
         FileStream fs = new FileStream(Server.MapPath("~/Download/") +filename,FileMode.Create);
         mo.WriteTo(fs);
         mo.Close();
         fs.Close();
     }
    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public List<RequestInfo> GetWebSiteRequests(int accountId, DateTime lastRequestTime)
	{
        checkAuthentication();
        return RequestService.GetRequest(accountId, lastRequestTime);
	}
    
    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public void SetOperatorStatus(int operatorId, bool isOnline)
	{
        checkAuthentication();
        OperatorService.UpdateStatus(operatorId, isOnline);
	}

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public List<ChatRequestInfo> GetChatRequests(Operator op)
	{
        checkAuthentication();
        return OperatorService.GetChatRequests(op);
	}

    
    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public void AddMessage(ChatMessageInfo msg)
	{
        checkAuthentication();
        msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;
		ChatService.AddMessage(msg);
	}

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void RemoveChatRequest(ChatRequestInfo req)
    {
        checkAuthentication();
        ChatService.RemoveChatRequest(req);
    }

    [SoapHeader("Authentication", Required = true)]
	[WebMethod]
	public List<ChatMessageInfo> GetChatMessages(string chatId, long lastCheck)
	{
        checkAuthentication();
        return ChatService.GetMessages(chatId, lastCheck);
	}

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool IsTyping(string chatId, bool isOperator)
    {
        checkAuthentication();
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

            if ( duration.Seconds > 45 )
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
    public void SetTyping(string chatId, bool isOperator, bool typing)
    {
        //if (Authentication.userName != System.Configuration.ConfigurationManager.AppSettings["WSUser"].ToString())
        //    throw new AccessViolationException("invalid user");
        HttpContext ctx = HttpContext.Current;
        if (ctx != null)
        {
            string who = isOperator ? "op" : "visitor";
            if (ctx.Application[chatId + "_" + who + "_typing"] != null)
                ctx.Application[chatId + "_" + who + "_typing"] = typing;
            else
                ctx.Application.Add(chatId + "_" + who + "_typing", typing);
        }
     }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public List<Operator> GetOnlineOperator()
    {
        checkAuthentication();
        return OperatorService.GetOnlineOperator();
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public void TransferChat(ChatRequestInfo chatRequest)
    {
        checkAuthentication();
        ChatService.OperatorRequestChat(chatRequest);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool HasNewMessage(string chatId, long lastMessageId)
    {
        checkAuthentication();
        return ChatService.HasNewMessage(chatId, lastMessageId);
    }

    [SoapHeader("Authentication", Required = true)]
    [WebMethod]
    public bool Invite(RequestInfo info)
    {
        checkAuthentication();
        return true;
    }

    [WebMethod]
    //����IsShow����ʾ
    public void UpIsShowRequestsByAidandIP(int AccountId, string ip, string IsShow)
    {
        checkAuthentication();
        ChatService.UpdateIsShowRequestsByAidandIP(AccountId, ip, IsShow);
    }
    private void checkAuthentication()
    {
        //if (Authentication.userName != System.Configuration.ConfigurationManager.AppSettings["WSUser"].ToString())
        //    throw new AccessViolationException("invalid user");
    }

    [WebMethod] 
    //ͨ���û���Ż�ÿͻ����
    public bool GetOperatorIDByChatID(string chatId)
    {
       return ChatService.GetOperatorIDByChatID(chatId);
    }

    [WebMethod]
    //ͨ��ChatId�޸Ŀͷ���ԱID
    public void AcceptChatRequest(string chatId, int operatorId)
    {
        ChatService.UpdateOperatorIDByChatID(chatId, operatorId);
        ChatMessageInfo msg = new ChatMessageInfo(chatId, Consts.ChatSystemName, 
            "�����ں�"+OperatorService.GetOperatorById(operatorId).Name+"�Ի�", Consts.MessageType_ToChatPage);
        ChatService.AddMessage(msg);


        msg = new ChatMessageInfo(chatId,Consts.ChatSystemName ,"�����ںͿͻ��Ի�", Consts.MessageType_ToOperator);
        ChatService.AddMessage(msg);
    }

    [WebMethod]
    public void CloseChat(string chatId)
    {
        //���öԻ��ر�ʱ��
        ChatService.UpdateCloseDate(chatId);
        // ���Ϳͷ��ر���Ϣ
        ChatMessageInfo msg = new ChatMessageInfo(chatId, Consts.ChatSystemName,
            "�ͷ��ѹرոöԻ�", Consts.MessageType_ToChatPage);
        ChatService.AddMessage(msg);
    }

    [WebMethod]
    public List<Visitor> GetAllVisitors(int accountId)
    {
        return VisitorService.GetAllOnlineVisitors(accountId);
    }
//�±�ķ���

    [WebMethod]
    public NewChangesResult CheckNewChanges(int operatorId, DateTime lastCheck)
    {
        NewChangesResult result = new NewChangesResult();
        // �·ÿ�
        result.NewVisitors = VisitorService.GetNewVisitors(lastCheck);

        // ���ʻỰ״̬����
        result.VisitSessionChange = VisitSessionService.GetVisitSessionChange(lastCheck);

        // ��Ϣ����
        List<VisitSession> visitSessions = VisitSessionService.GetActiveSessionsByOperatorId(operatorId);
        result.Messages = new List<Message>();
        foreach (var item in visitSessions)
        {
            result.Messages.Add(MessageService.GetMessages(item.SessionId, lastCheck));
        }
        // �ͷ�״̬����
        result.CheckTime = DateTime.Now;
        return result;
    }


//����һ����
    public class NewChangesResult
    {
        // �ͷ�״̬����
        private List<Operator> operators;

        public List<Operator> Operators
        {
            get { return operators; }
            set { operators = value; }
        }

        // �·ÿ�
        private List<Visitor> newVisitors;

        public List<Visitor> NewVisitors
        {
            get { return newVisitors; }
            set { newVisitors = value; }
        }

        // ���ʻỰ״̬����
        private List<VisitSession> visitSessionChange;

        public List<VisitSession> VisitSessionChange
        {
            get { return visitSessionChange; }
            set { visitSessionChange = value; }
        }

        // ��Ϣ����
        private List<Message> messages;

        public List<Message> Messages
        {
            get { return messages; }
            set { messages = value; }
        }


        private DateTime checkTime;

        public DateTime CheckTime
        {
            get { return checkTime; }
            set { checkTime = value; }
        }
    }
}