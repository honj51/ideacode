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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            pnlNoOperator.Visible = pnlChat.Visible = pnlRequest.Visible = false;
            
            if (Request.QueryString["aid"] != null)
            {
                string accountId;
                if (Request.QueryString["aid"]!=null)
                {
                    accountId = Request.QueryString["aid"].ToString();
                    if (OperatorService.HasOnlineOperator(accountId))
                    {

                        if (Request.QueryString["chatid"].ToString() != "")

                        {
                            pnlChat.Visible = true;
                            //this.dialog();
                           
                        }
                        else
                        {
                            pnlRequest.Visible = true;
                        }
                      
                    }
                    else
                    {
                      pnlNoOperator.Visible = true;
                    }                    
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
                        //if (messages[i].Type == MessageType.ChatMessage_OperatorToVisitor || messages[i].Type == MessageType.SystemMessage_ToVisitor
                        //    || messages[i].Type == MessageType.SystemMessage_ToBoth)
                        //{
                        //    if (messages[i].Type == MessageType.SystemMessage_ToVisitor || messages[i].Type == MessageType.SystemMessage_ToBoth)
                        //    {
                        //        litChat.Text += string.Format("<span class=\"chatName\">{0}</span>", CutStr(messages[i].Text, 100));
                        //    }
                        //    else
                        //    {
                        //        litChat.Text += string.Format("<span class=\"chatName\">{0}:</span>{1}<br />", messages[i].Source, CutStr(messages[i].Text, 100));
                        //    }
                        //}
                        if (LiveSupport.LiveSupportModel.Message.FromSystem(messages[i]))
                        {
                            litChat.Text += string.Format("<span style=\"color: #FF9933\" class=\"chatName\">{0}</span>", CutStr(messages[i].Text, 100));                           
                        }
                        if (messages[i].Type == MessageType.ChatMessage_OperatorToVisitor)
                        {
                            litChat.Text += string.Format("<span class=\"chatName\">{0}:</span>{1}<br />", messages[i].Source, CutStr(messages[i].Text, 100));
                        }
                        else if (messages[i].Type == MessageType.ChatMessage_VistorToOperator)
                        {
                            litChat.Text += string.Format("<span class=\"chatName\">{0}:</span>{1}<br />", "��˵", CutStr(messages[i].Text, 100));
                        }

                        // TODO: is this correct?
                        lastCheck = messages[i].SentDate.Ticks;

                    }

                    // set the lastId
                    Response.Cookies[chatId + "_lastCheck"].Value = lastCheck.ToString();

                }
            }
        }
    }

    public string CutStr(string str, int len)
    {
        string s = "";

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
            auth.userName = ConfigurationManager.AppSettings["WSUser"].ToString();
            ws.Authentication = auth;


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
        auth.userName = ConfigurationManager.AppSettings["WSUser"].ToString();
        ws.Authentication = auth;

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
    public static void UpdateCloseDate(string chtID)
    {
        //ChatService.UpdateCloseDate(chtID);
    }

    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        
        Response.Write("<script>alert('dfasfasdfasdf');</script>");
            Response.End();
        // we send an email to the configured email on the web.config
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(txtSendBy.Text);
        mail.To.Add(new MailAddress(ConfigurationManager.AppSettings["Email"].ToString()));
        mail.Subject = "Message from your LiveChat application";
        mail.Body = txtComment.Text;

        SmtpClient mailer = new SmtpClient(ConfigurationManager.AppSettings["SMTPServer"].ToString());
        mailer.Send(mail);

        lblConfirmation.Visible = true;
        lblConfirmation.Text = "Thank you, we will answer your email as soon as possible.";
    }
    //��ʼ�Ի�
    protected void btnStarChat_Click(object sender, EventArgs e)
    {
        string visitorId = Request.Cookies["VisitorId"].Value;
        if (string.IsNullOrEmpty(visitorId) || VisitorService.GetVisitor(visitorId) == null || VisitorService.GetVisitor(visitorId).CurrentSessionId == null)
        {
            return;
        }

        string chatId = VisitorService.GetVisitor(visitorId).CurrentSessionId;
        if (Request.Cookies["chatId"] != null)
        {
            Response.Cookies["chatId"].Value = chatId;
        }
        else
        {
            HttpCookie cookie = new HttpCookie("chatId", chatId);
            Response.Cookies.Add(cookie);
        }

        if (Request.Cookies[chatId + "_lastCheck"] != null)
        {
            Response.Cookies[chatId + "_lastCheck"].Value = "0";
        }
        else
        {
            HttpCookie cookie = new HttpCookie(chatId + "_lastCheck", "0");
            Response.Cookies.Add(cookie);
        }

        LiveSupport.LiveSupportModel.Chat chatRequest = new LiveSupport.LiveSupportModel.Chat();
        chatRequest.AccountId = Request.QueryString["aid"];
        chatRequest.ChatId = chatId;
        chatRequest.CreateTime = DateTime.Now;
        chatRequest.Status = LiveSupport.LiveSupportModel.ChatStatus.Requested;
        chatRequest.VisitorId = visitorId;
        VisitSessionService.RequestChat(chatRequest);       

        //lblOp.Text = msg.Message;
        // we set the visitor name in the ViewState
        Visitor v = VisitorService.GetVisitor(visitorId);
        if (!string.IsNullOrEmpty(txtName.Text))
        {
            v.Name = txtName.Text;
        }
        if (!string.IsNullOrEmpty(txtEmail.Text))
        {
            v.Email = txtEmail.Text;
        }
        VisitorName = v.Name;
        VName = v.Name;
       
        pnlChat.Visible = true;
        pnlRequest.Visible = false;
    }

    // ҳ��ͬ��ͷ��ĶԻ���������
    //public void dialog()
    //{
    //    string chatId = Request.QueryString["chatid"].ToString();
    //    int AccountId=int.Parse(Request.QueryString["aid"].ToString());
    //    if (Request.Cookies["chatId"] != null)
    //    {
    //        Response.Cookies["chatId"].Value = chatId;
    //    }
    //    else
    //    {
    //        HttpCookie cookie = new HttpCookie("chatId", chatId);
    //        Response.Cookies.Add(cookie);
    //    }

    //    if (Request.Cookies[chatId + "_lastCheck"] != null)
    //    {
    //        Response.Cookies[chatId + "_lastCheck"].Value = "0";
    //    }
    //    else
    //    {
    //        HttpCookie cookie = new HttpCookie(chatId + "_lastCheck", "0");
    //        Response.Cookies.Add(cookie);
    //    }
    //    VName = "��˵";
    //    ChatService.AddSystemMessage(chatId, AccountId);
    //}
    protected void CutLBtn_Click(object sender, EventArgs e)
    {
        string aaa = Server.MapPath("Download\\11.exe");
        System.Diagnostics.Process.Start(aaa);
    }

   

    
//�ļ�����
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //��֤�ļ�·��
        //try
        //{
            
        //    if (Request.Cookies["chatId"] != null)
        //    {
        //        string chatId = Request.Cookies["chatId"].Value.ToString();
        //        OperatorWS ow = new OperatorWS();
        //        bool b=ow.GetOperatorIDByChatID(chatId);
        //        if (b)
        //        {
        //            string file = this.fuFile.FileName.ToString();
        //            if (file.Trim().Length == 0)//��֤�ϴ��ļ�
        //            {
        //                this.Response.Write("<script>alert('��ѡ���͵��ļ�');</script>");
        //                return;
        //            }
        //            if (this.fuFile.FileContent.Length >= 4180560)
        //            {
        //                this.Response.Write("<script>alert('���͵��ļ�����');</script>");
        //                return;
        //            }

        //            ChatMessageInfo msg = new ChatMessageInfo(chatId, VisitorName, "<a href='#'>" + file + "</a>�ļ����ڴ��� ...",3);
        //            ChatService.AddMessage(msg);//���������Ϣ 

        //            string path = Server.MapPath("UploadFile/" + file.Trim().ToString());
        //            this.fuFile.PostedFile.SaveAs(path);

        //            ChatMessageInfo msg2 = new ChatMessageInfo(chatId, VisitorName, "<a href='#'>" + file + "</a>�ļ����ͳɹ�!",3);
        //            ChatService.AddMessage(msg2);//���������Ϣ

        //            ChatMessageInfo msg3 = new ChatMessageInfo(chatId, VisitorName, "<a href='UploadFile/" + file + "'>����</a>",2);
        //            ChatService.AddMessage(msg3);//���������Ϣ
        //        }
        //    }

        //}
        //catch (Exception ex)
        //{
        //    this.Response.Write("<script>alert('�ļ�����ʧ��,����" + ex.ToString() + "');</script>");
        //}
    }

}
