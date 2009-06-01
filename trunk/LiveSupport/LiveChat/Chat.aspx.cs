using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Net.Mail;
using System.Web.Services;
using System.Xml;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using LiveSupport.LiveSupportModel;
using System.Windows.Forms;
using System.Windows;
using System.Net;

public partial class Chat : System.Web.UI.Page
{
    public string VisitorName
    {
        get
        {
            if (ViewState["__visitorName"] != null)
                return ViewState["__visitorName"].ToString();
            else
                return string.Empty;
        }
        set
        {
            if (ViewState["__visitorName"] != null)
                ViewState["__visitorName"] = value;
            else
                ViewState.Add("__visitorName", value);
        }
    }
    public static string VName
    {

        get
        {
            HttpContext ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Request.Cookies["VisitorName"] != null)
                    return ctx.Request.Cookies["VisitorName"].Value.ToString();
                else
                    return string.Empty;
            }
            else
                return "nocontext";
        }
        set
        {
            HttpContext ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Request.Cookies["VisitorName"] != null)
                    ctx.Response.Cookies["VisitorName"].Value = value;
                else
                {
                    HttpCookie c = new HttpCookie("VisitorName", value);
                    ctx.Response.Cookies.Add(c);
                }
            }
        }
    }
    public Account CurrentAccount
    {
        get 
        {
            if (Request.QueryString["aid"] == null || AccountService.GetAccountById(Request.QueryString["aid"].ToString()) == null)
            {
                return null;
            }
            else
                return AccountService.GetAccountById(Request.QueryString["aid"].ToString()); 
        }
    }

    public Visitor CurrentVisitor
    {
        get
        {
            string visitorId = Request.QueryString["vid"];
            if (string.IsNullOrEmpty(visitorId) || VisitorService.GetVisitor(visitorId) == null || VisitorService.GetVisitor(visitorId) == null)
                return null;
            else
                return VisitorService.GetVisitor(visitorId);
        }
    }

    public LiveSupport.LiveSupportModel.Chat CurrentChat
    {
        get
        {
            if (Request.Cookies["chatId"] == null || ChatService.GetChatById(Request.Cookies["chatId"].Value.ToString()) == null)
            {
                return null;
            }
            else
                return ChatService.GetChatById(Request.Cookies["chatId"].Value.ToString()); 
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.welcomeLabel.Text = "��ӭ���� "+ CurrentAccount.CompanyName + " �ͷ�����";
            pnlNoOperator.Visible = pnlChat.Visible = pnlRequest.Visible = false;

            if (CurrentAccount == null || CurrentVisitor == null || CurrentVisitor.CurrentSession == null)
            {
                return;
            }

            // �Ƿ�ͷ�����ĶԻ�
            if (Request.QueryString["chatid"] != null && !string.IsNullOrEmpty(Request.QueryString["chatid"].ToString()))
            {
                // ��������
                pnlChat.Visible = true;
                setCookie(Request.QueryString["chatid"].ToString());
            }
            else
            {
                // �ж�ĳ��˾�Ŀͷ��Ƿ�����
                if (OperatorService.HasOnlineOperator(CurrentAccount.AccountId))
                {
                    pnlRequest.Visible = true;
                }
                else
                {
                    pnlNoOperator.Visible = true;
                }
            }
        }
    }
    //��ȡ������Ϣ
    protected void timerRefresh_Tick(object sender, EventArgs e)
    {
        if (Request.Cookies["chatId"] != null)
        {
            string chatId = Request.Cookies["chatId"].Value.ToString();
            if (Request.Cookies[chatId + "_lastCheck"] != null)
            {
                long lastCheck = long.Parse(Request.Cookies[chatId + "_lastCheck"].Value.ToString());
                List<LiveSupport.LiveSupportModel.Message> messages = MessageService.GetMessagesForChatPage(chatId, lastCheck);//*

                if (messages.Count > 0)
                {
                    for (int i = 0; i < messages.Count; i++)
                    {
                        
                        if (LiveSupport.LiveSupportModel.Message.FromSystem(messages[i]))
                        {
                            litChat.Text += string.Format("<div id='chatSts'><img  src='Images/BlueBar001.png'/>&nbsp;&nbsp;{0}</div>", messages[i].Text);
                        }
                        if (messages[i].Type == MessageType.ChatMessage_OperatorToVisitor)
                        {
                            litChat.Text += string.Format("<div id='chatTitle1'><strong>{0}</strong></div><div id='chatText' ><span>{1}</span></div>", messages[i].Source + "&nbsp;&nbsp;" + messages[i].SentDate.ToString("hh:mm:ss"), messages[i].Text);
                        }
                        if (messages[i].Type == MessageType.ChatMessage_VistorToOperator)
                        {
                            litChat.Text += string.Format("<div id='chatTitle'><strong>��˵&nbsp;&nbsp;{0}</strong></div><div id='chatText' ><span>{1}</span></div>", messages[i].SentDate.ToString("hh:mm:ss"), messages[i].Text);
                        }
                        // TODO: is this correct?
                        lastCheck = Math.Max(lastCheck, messages[i].SentDate.Ticks);
                        //lastCheck = messages[i].SentDate.Ticks;
                    }
                    // set the lastId
                    Response.Cookies[chatId + "_lastCheck"].Value = lastCheck.ToString();
                }
            }
        }
    }

    // TODO: Bug: strΪһ���ַ�ʱ���ؿ�
    public string CutStr(string str, int len)
    {
        string s = "";
        if (str.Length < len)
        {
            s = str;

        }
        else
        {
            for (int i = 0; i < str.Length; i++)
            {
                int r = i % len;
                int last = (str.Length / len) * len;
                if (i != 0 && i <= last)
                {

                    if (r == 0)
                    {
                        s += str.Substring(i - len, len) + "<br>";
                    }

                }
                else if (i > last)
                {
                    s += str.Substring(i - 1);
                    break;
                }

            }
        }
        return s;
    } 


    [System.Web.Services.WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string CheckTypingNotification(string chatId)
    {
        if (!string.IsNullOrEmpty(chatId))
        {
            OperatorWS ws = new OperatorWS();
            AuthenticationHeader auth = new AuthenticationHeader();
            
            if (ws.IsTyping(chatId, true))
                return "�ͷ���������... ";
            else // no one typing...
                return "";
        }
        else return string.Empty;
    }

    [System.Web.Services.WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string SetTypingNotification(string chatId, string msg)
    {
        OperatorWS ws = new OperatorWS();
        AuthenticationHeader auth = new AuthenticationHeader();
        //auth.userName = ConfigurationManager.AppSettings["WSUser"].ToString();
        //ws.Authentication = auth;

        //ws.SetTyping(chatId, false, msg.Length > 0);
        return string.Empty;
    }

    //����������Ϣ
    [System.Web.Services.WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string SendMsg(string msg, string chtID)
    {
        if (chtID != null && msg.Length > 0)
        {
            // Add a new message to the discussion
            string chatId = chtID;
            //����һ��������Ϣʵ��
            LiveSupport.LiveSupportModel.Message m = new LiveSupport.LiveSupportModel.Message();
            m.ChatId = chatId;
            m.Source = VName;
            m.Text = msg;
            m.Type = MessageType.ChatMessage_VistorToOperator;
            ChatService.SendMessage(m);

            //OperatorWS ws = new OperatorWS();
            //ws.SetTyping(chatId, false, false);
        }
        return "";

    }

    [System.Web.Services.WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static void CloseChat(string chtID)
    {        
        ChatService.CloseChat(chtID, VName);
    }
    /// <summary>
    /// ����ʱ�����ʼ�
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(ConfigurationManager.AppSettings["Email"].ToString());
        mail.To.Add(new MailAddress(CurrentAccount.Email));
        mail.Subject = "LiveSupport ϵͳ - �ͻ�����";
        string emailBody = "�����Կͻ�Email:" + txtSendBy.Text + "\r\n\r\n" + txtComment.Text;
        mail.Body = emailBody;

        SmtpClient mailer = new SmtpClient(ConfigurationManager.AppSettings["SMTPServer"].ToString());
        mailer.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
        mailer.Send(mail);
        lblConfirmation.Visible = true;
        lblConfirmation.Text = "лл�������ԣ�";
    }
    //��ʼ�Ի�
    protected void btnStarChat_Click(object sender, EventArgs e)
    {
        if (CurrentVisitor == null)
        {
            return;
        }
        string chatId = CurrentVisitor.CurrentSessionId;

        if (CurrentChat == null || CurrentChat.Status == ChatStatus.Closed)
        {
            LiveSupport.LiveSupportModel.Chat chatRequest = new LiveSupport.LiveSupportModel.Chat();
            chatRequest.AccountId = Request.QueryString["aid"];
            chatRequest.ChatId = chatId;
            chatRequest.CreateTime = DateTime.Now;
            chatRequest.Status = LiveSupport.LiveSupportModel.ChatStatus.Requested;
            chatRequest.VisitorId = CurrentVisitor.VisitorId;
            VisitSessionService.RequestChat(chatRequest);
            if (!string.IsNullOrEmpty(txtName.Text))
            {
                CurrentVisitor.Name = txtName.Text;
            }
            if (!string.IsNullOrEmpty(txtEmail.Text))
            {
                CurrentVisitor.Email = txtEmail.Text;
            }
            VisitorName = CurrentVisitor.Name;
            VName = CurrentVisitor.Name;
            setCookie(chatId);
        }
        
        pnlChat.Visible = true;
        pnlRequest.Visible = false;
    }

    private void setCookie(string chatId)
    {
        if (Request.Cookies["chatId"] != null)
        {
            Response.Cookies["chatId"].Value = chatId;
        }
        else
        {
            HttpCookie cookie = new HttpCookie("chatId", chatId);
            Response.Cookies.Add(cookie);
        }

        string lastCheck = ChatService.GetChatById(chatId).CreateTime.Ticks.ToString();
        if (Request.Cookies[chatId + "_lastCheck"] != null)
        {
            Response.Cookies[chatId + "_lastCheck"].Value = lastCheck;
        }
        else
        {
            HttpCookie cookie = new HttpCookie(chatId + "_lastCheck", lastCheck);
            Response.Cookies.Add(cookie);
        }
    }


    protected void CutLBtn_Click(object sender, EventArgs e)
    {
        string aaa = Server.MapPath("Download\\11.exe");
        System.Diagnostics.Process.Start(aaa);
    }
    
    //�ļ�����
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //��֤�ļ�·��
        try
        {
            if (CurrentChat == null || CurrentChat.Status != ChatStatus.Accepted)
            {
                return;
            }

            string fileName = this.fuFile.FileName.ToString();
            if (fileName.Trim().Length == 0)//��֤�ϴ��ļ�
            {
                this.Response.Write("<script>alert('��ѡ���͵��ļ�');</script>");
                return;
            }
            if (this.fuFile.FileContent.Length >= 4180560)
            {
                this.Response.Write("<script>alert('���͵��ļ�����');</script>");
                return;
            }
            LiveSupport.LiveSupportModel.Message m = new LiveSupport.LiveSupportModel.Message();
            m.ChatId = CurrentChat.ChatId;
            m.Text = string.Format("���ڴ����ļ� {0} ...",fileName);
            m.Type = MessageType.SystemMessage_ToVisitor;
            ChatService.SendMessage(m);

            string path = Server.MapPath("UploadFile/" + fileName.Trim().ToString());
            this.fuFile.PostedFile.SaveAs(path);

            m = new LiveSupport.LiveSupportModel.Message();
            m.ChatId = CurrentChat.ChatId;
            m.Text = string.Format("�ļ� {0} ���ͳɹ�!  ...", fileName);
            m.Type = MessageType.SystemMessage_ToVisitor;
            ChatService.SendMessage(m);
            OperatorService.SendFile(m.ChatId, fileName);

        }
        catch (Exception ex)
        {
            this.Response.Write("<script>alert('�ļ�����ʧ��,����" + ex.ToString() + "');</script>");
        }
    }

}
