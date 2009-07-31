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
using System.Net;
using System.IO;
using System.Threading;
using LiveSupport.BLL;

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
                {
                    return HttpUtility.UrlDecode(ctx.Request.Cookies["VisitorName"].Value.ToString()); 
                }
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
                    ctx.Response.Cookies["VisitorName"].Value = HttpUtility.UrlEncode(value);
                else
                {
                    HttpCookie c = new HttpCookie("VisitorName", HttpUtility.UrlEncode(value));
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
            if (string.IsNullOrEmpty(visitorId) || VisitorService.GetVisitorById(visitorId) == null || VisitorService.GetVisitorById(visitorId) == null)
                return null;
            else
                return VisitorService.GetVisitorById(visitorId);
        }
    }

    public LiveSupport.LiveSupportModel.Chat CurrentChat
    {
        get
        {
            if (Request.Cookies["chatId"] == null || ChatService.GetChatById(Request.Cookies["chatId"].Value.ToString()) == null)
            {
                return null;
                ///测试
            }
            else
                return ChatService.GetChatById(Request.Cookies["chatId"].Value.ToString()); 
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.welcomeLabel.Text = "欢迎进入 "+ CurrentAccount.CompanyName + " 客服服务";
            pnlNoOperator.Visible = pnlChat.Visible = pnlRequest.Visible = false;

            if (CurrentAccount == null || CurrentVisitor == null || CurrentVisitor.CurrentSession == null)
            {
                return;
            }

            if (isInvitatation())
            {
                pnlChat.Visible = true;
                setCookie(Request.QueryString["chatid"].ToString());
            }
            else if (chatExist())
            {
                pnlChat.Visible = true;
            }
            else
            {
                // 判断某公司的客服是否在线
                if (OperatorService.HasOnlineOperator(CurrentAccount.AccountId))
                {
                    pnlRequest.Visible = true;
                }
                else
                {
                    pnlNoOperator.Visible = true;
                }
            }
            GetChatPageStyle();
        }
    }

    private bool chatExist()
    {
        return CurrentChat != null && CurrentChat.Status != ChatStatus.Closed;
    }

    // 是否客服邀请的对话
    private bool isInvitatation()
    {
        // 主动邀请
        return Request.QueryString["chatid"] != null && !string.IsNullOrEmpty(Request.QueryString["chatid"].ToString());
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
                            litChat.Text += string.Format("<div id='chatTitle'><strong>您说&nbsp;&nbsp;{0}</strong></div><div id='chatText' ><span>{1}</span></div>", messages[i].SentDate.ToString("hh:mm:ss"), messages[i].Text);
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

    // TODO: Bug: str为一个字符时返回空
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
        //auth.userName = ConfigurationManager.AppSettings["WSUser"].ToString();
        //ws.Authentication = auth;

        //ws.SetTyping(chatId, false, msg.Length > 0);
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
            LiveSupport.LiveSupportModel.Message m = new LiveSupport.LiveSupportModel.Message();
            m.ChatId = chatId;
            m.Source = VName;
            m.Text = HttpUtility.HtmlEncode(msg);
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
        HttpContext.Current.Response.Cookies.Remove("chatId");
        ChatService.CloseChat(chtID, VName);
    }
    /// <summary>
    /// 离线时发送邮件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(this.txt_username.Text)||string.IsNullOrEmpty(txtSendBy.Text))
        {
            return;
        }
        LeaveWord lw = new LeaveWord();
        lw.CallerName = this.txt_username.Text;
        lw.Content = txtComment.Text;
        lw.Email = txtSendBy.Text;
        lw.CallerDate = DateTime.Now.ToString();
        lw.Account =AccountService.GetAccountById(CurrentVisitor.AccountId);
        lw.Id = Guid.NewGuid().ToString();
        lw.Ip = CurrentVisitor.CurrentSession.IP;
        lw.Phone = txtPhone.Text;
        lw.Subject = txtTheme.Text;
        lw.IsReplied = false;
        lw.DomainName = CurrentVisitor.CurrentSession.DomainRequested;
        LiveSupport.BLL.LeaveWordManager.AddWordProvider(lw);
        ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>emailclose();</script>");
    }
    //开始对话
    protected void btnStarChat_Click(object sender, EventArgs e)
    {
        string chatId = CurrentVisitor.CurrentSessionId;
        if (CurrentChat == null || CurrentChat.Status == ChatStatus.Closed)
        {   
            if (!string.IsNullOrEmpty(txtName.Text)&& CurrentVisitor.Name ==VisitSessionService.GetSessionById(CurrentVisitor.CurrentSessionId).IP)
            {
                CurrentVisitor.Name = txtName.Text;
            }
            if (!string.IsNullOrEmpty(txtEmail.Text)&&!string.IsNullOrEmpty(CurrentVisitor.Email))
            {
                CurrentVisitor.Email = txtEmail.Text;
            }
            VisitorName = CurrentVisitor.Name;
            VName = CurrentVisitor.Name;
            chatId = ChatService.ChatPageRequestChat(CurrentVisitor);
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
    
    //文件传送
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //验证文件路径
        try
        {
            if (CurrentChat == null || CurrentChat.Status != ChatStatus.Accepted)
            {
                this.Response.Write("<script>alert('对话未接受');</script>"); 
                return;
            }
            string fileName = this.fuFile.FileName.ToString();
            if (fileName.Trim().Length == 0||fileName==null)//验证上传文件
            {
                this.Response.Write("<script>alert('请选择传送的文件');</script>");
                return;
            }
            if (this.fuFile.FileContent.Length >= 2097152)
            {
                this.Response.Write("<script>alert('传送的文件过大');</script>");
                return;
            }
            else
            {
                LiveSupport.LiveSupportModel.Message m = new LiveSupport.LiveSupportModel.Message();
                m.ChatId = CurrentChat.ChatId;
                m.Text = string.Format("正在传送文件 {0} ...", fileName);
                m.Type = MessageType.SystemMessage_ToVisitor;
                ChatService.SendMessage(m);
                string path = ConfigurationManager.AppSettings["FileUploadPath"] + "\\" + m.ChatId;
                //string path = Server.MapPath("UploadFile/" + m.ChatId);
                Directory.CreateDirectory(path);

                this.fuFile.PostedFile.SaveAs(path + "\\" + fileName.Trim().ToString());

                m = new LiveSupport.LiveSupportModel.Message();
                m.ChatId = CurrentChat.ChatId;
                m.Text = string.Format("文件 {0} 发送成功!  ...", fileName);
                m.Type = MessageType.SystemMessage_ToVisitor;
                ChatService.SendMessage(m);

                OperatorService.SendFile(m.ChatId, fileName);
            }

        }
        catch (Exception ex)
        {
            this.Response.Write("<script>alert('文件传送失败,错误：" + ex.ToString() + "');</script>");
        }
     
    }
    public void GetChatPageStyle()
    {
        LiveSupport.BLL.NewWebSite nwst = WebSiteManager.GetNewWebSiteByDomainName(CurrentVisitor.CurrentSession.DomainRequested);//用堿名取一行数
        if (nwst == null || nwst.chatpage == null)
        {
            return;
        }
        string chatImageUrl = null;
        if (nwst.chatpage.State == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
        {
            chatImageUrl = "Images/" + AccountService.GetAccountById(CurrentVisitor.AccountId).AccountNumber + "/" + nwst.domainName + "/";
        }
        else
        {
            chatImageUrl = "Images/Default/";
        }
        this.ChatPageOfflineTopImage.ImageUrl = chatImageUrl + nwst.chatpage.LeavePageTopImg;
        this.chatPageRightImg.ImageUrl = chatImageUrl + nwst.chatpage.ChatPageRightImg;
    }

  
}
