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
using LiveSupport.DAL.Entity;
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
                int accountId;
                if (int.TryParse(Request.QueryString["aid"].ToString(), out accountId))
                {
                    if (OperatorService.GetOperatorStatus(accountId))
                    {

                        if (Request.QueryString["chatid"].ToString() != "")

                        {
                            pnlChat.Visible = true;
                            this.dialog();
                           
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
    //获取聊天消息
    protected void timerRefresh_Tick(object sender, EventArgs e)
    {
       
        if (Request.Cookies["chatId"] != null)
        {
            string chatId = Request.Cookies["chatId"].Value.ToString();
            if (Request.Cookies[chatId + "_lastCheck"] != null)
            {
                long lastCheck = long.Parse(Request.Cookies[chatId + "_lastCheck"].Value.ToString());
                if (ChatService.HasNewMessage(chatId, lastCheck))
                {
                    List<ChatMessageInfo> messages = ChatService.GetMessages(chatId, lastCheck);//*
                  
                    if (messages.Count > 0)
                    {
                        for (int i = 0; i < messages.Count; i++)
                        {
                            if (messages[i].Type == Consts.MessageType_ToAll || messages[i].Type == Consts.MessageType_ToChatPage)
                            {

                                litChat.Text += string.Format("<span class=\"chatName\">{0}:</span>{1}<br />", messages[i].Name, CutStr(messages[i].Message, 100));
                            }

                            lastCheck = messages[i].MessageId;

                        }

                        // set the lastId
                        Response.Cookies[chatId + "_lastCheck"].Value = lastCheck.ToString();

                    }
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
                return "客服正在输入... ";
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

        ws.SetTyping(chatId, false, msg.Length > 0);
        return string.Empty;
    }

    //发送聊天信息
    [System.Web.Services.WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string SendMsg(string msg, string chtID)
    {
        if (chtID != null && msg.Length > 0)
        {
            // Add a new message to the discussion
            string chatId = chtID;
            //创建一个聊天消息实例
            ChatMessageInfo mesg = new ChatMessageInfo(chatId, VName, msg,1);
            ChatService.AddMessage(mesg);//添加聊天信息

            OperatorWS ws = new OperatorWS();
            ws.SetTyping(chatId, false, false);
        }
        return "";
    }

    [System.Web.Services.WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static void UpdateCloseDate(string chtID)
    {
        ChatService.UpdateCloseDate(chtID);
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
    //开始对话
    protected void btnStarChat_Click(object sender, EventArgs e)
    {
        // Initiate a chat request
        string chatId = Guid.NewGuid().ToString();
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

        ChatRequestInfo request = new ChatRequestInfo();
        request.AcceptByOpereratorId = -1;
        request.AccountId = Request.QueryString["aid"];
        request.ChatId = chatId;
        request.RequestDate = DateTime.Now;
        request.VisitorEmail = txtEmail.Text;
        if (Request.UserHostAddress != null)
            request.VisitorIP = Request.UserHostAddress.ToString();
        if (txtName.Text != "")
        {
            request.VisitorName = txtName.Text;
        }
        else
        {
            request.VisitorName = "Guest";
        }
        if (Request.ServerVariables["HTTP_USER_AGENT"] != null)
            request.VisitorUserAgent = Request.ServerVariables["HTTP_USER_AGENT"].ToString();
        request.WasAccept = false;

        ChatService.RequestChat(request);
        ChatService.AddSystemMessage(request.ChatId,int.Parse(request.AccountId));

        //lblOp.Text = msg.Message;
        // we set the visitor name in the ViewState
        VisitorName = request.VisitorName;
        VName = request.VisitorName;
       
        pnlChat.Visible = true;
        pnlRequest.Visible = false;
    }
    //会话
    public void dialog()
    {
        string chatId = Request.QueryString["chatid"].ToString();
        int AccountId=int.Parse(Request.QueryString["aid"].ToString());
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
        VName = "Guest";
        ChatService.AddSystemMessage(chatId, AccountId, VName);
        OperatorWS ws = new OperatorWS();
        ws.SetTyping(chatId, false, false);
    }
    protected void CutLBtn_Click(object sender, EventArgs e)
    {
        string aaa = Server.MapPath("Download\\11.exe");
        System.Diagnostics.Process.Start(aaa);
    }

   

    
//文件传送
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //验证文件路径
        try
        {
            
            if (Request.Cookies["chatId"] != null)
            {
                string chatId = Request.Cookies["chatId"].Value.ToString();
                OperatorWS ow = new OperatorWS();
                bool b=ow.GetOperatorIDByChatID(chatId);
                if (b)
                {
                    string file = this.fuFile.FileName.ToString();
                    if (file.Trim().Length == 0)//验证上传文件
                    {
                        this.Response.Write("<script>alert('请选择传送的文件');</script>");
                        return;
                    }
                    if (this.fuFile.FileContent.Length >= 4180560)
                    {
                        this.Response.Write("<script>alert('传送的文件过大');</script>");
                        return;
                    }

                    ChatMessageInfo msg = new ChatMessageInfo(chatId, VisitorName, "<a href='#'>" + file + "</a>文件正在传送 ...",3);
                    ChatService.AddMessage(msg);//添加聊天信息 

                    string path = Server.MapPath("UploadFile/" + file.Trim().ToString());
                    this.fuFile.PostedFile.SaveAs(path);

                    ChatMessageInfo msg2 = new ChatMessageInfo(chatId, VisitorName, "<a href='#'>" + file + "</a>文件发送成功!",3);
                    ChatService.AddMessage(msg2);//添加聊天信息

                    ChatMessageInfo msg3 = new ChatMessageInfo(chatId, VisitorName, "<a href='UploadFile/" + file + "'>保存</a>",2);
                    ChatService.AddMessage(msg3);//添加聊天信息
                }
            }

        }
        catch (Exception ex)
        {
            this.Response.Write("<script>alert('文件传送失败,错误：" + ex.ToString() + "');</script>");
        }
    }

}
