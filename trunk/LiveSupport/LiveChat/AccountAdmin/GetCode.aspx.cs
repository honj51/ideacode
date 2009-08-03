using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;
using System.IO;
using System.Configuration;
public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    private int DefaultBannerStyleCount = 2;
    private int DefaultInviteStyleCount = 2;
    private int DefaultChatPageStyleCount = 1;

    public List<Banner> bannerlist = new List<Banner>();
    public List<Invite> invitelist = new List<Invite>();
    public List<ChatPage> chatpagelist = new List<ChatPage>();

    private Operator oper;
    public Operator Oper
    {
        get { return oper; }
        set { oper = value; }
    }
    #region addstye
    public void AddDefaultStyle()
    {
       
        Banner bnr0 = new Banner();
        bnr0.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
        bnr0.Online = "online0.jpg";
        bnr0.Offline = "offline0.jpg";
        Banner bnr1 = new Banner();
        bnr1.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
        bnr1.Online = "online1.jpg";
        bnr1.Offline = "offline1.jpg";
        bannerlist.Clear();
        bannerlist.Add(bnr0);
        bannerlist.Add(bnr1);

        Invite ivt0 = new Invite();
        ivt0.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
        ivt0.Bgimg = "invite_bg0.gif";
        ivt0.Okimg = "btn_ok0.jpg";
        ivt0.Noimg = "btn_no0.jpg";
        Invite ivt1 = new Invite();
        ivt1.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
        ivt1.Bgimg = "invite_bg1.gif";
        ivt1.Okimg = "btn_ok1.jpg";
        ivt1.Noimg = "btn_no1.jpg";
        Invite ivt2 = new Invite();
        ivt2.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
        ivt2.Bgimg = "invite_bg2.gif";
        ivt2.Okimg = "btn_ok2.jpg";
        ivt2.Noimg = "btn_no2.jpg";
        invitelist.Clear();
        invitelist.Add(ivt0);
        invitelist.Add(ivt1);
        invitelist.Add(ivt2);
        ChatPage cpe = new ChatPage();
        cpe.State = LiveSupport.BLL.WebSiteManager.WebSite_Default;
        cpe.ChatPageBGImg = "chat_bg0.gif";
        cpe.ChatPageRightImg = "right_column_0.jpg";
        cpe.LeavePageTopImg = "topmove1.gif";
        chatpagelist.Clear();
        chatpagelist.Add(cpe);
    }
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        AddDefaultStyle();
        if (!IsPostBack)
        {
            if (Session["User"] != null)
            {
                oper = (Operator)Session["User"];
                List<WebSite> list = WebSiteManager.GetAllWebSiteByRegisterId(oper.Account.AccountId);
                int selectIndex = 0;

                if (Request.QueryString["domain"] != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        if (list[i].DomainName == Request.QueryString["domain"].ToString())
                        {
                            selectIndex = i;
                            break;
                        }
                    }
                }
                this.drpDomainName.DataSource = list;
                this.drpDomainName.DataTextField = "DomainName";
                this.drpDomainName.DataValueField = "DomainName";
                this.drpDomainName.DataBind();
                this.drpDomainName.SelectedIndex = selectIndex;
                this.drpDomainName.SelectedValue = list[selectIndex].DomainName;

                AddIcoLocation(list[selectIndex].IcoLocation);//位置
                AddBannerStyle(list[selectIndex].IconStyle);// 图片
                AddInviteStyle(list[selectIndex].InviteStyle);//主动邀请
                AddChatStyle(list[selectIndex].ChatStyle);//聊天页面
            }
            else
            {
                 Response.Redirect("../Login.aspx?redirect=" + HttpContext.Current.Request.Url.PathAndQuery);
            }
        }
    }
    public string GetAccountId()
    {
        return oper.Account.AccountId;

    }
    //上传漂浮旗子图片
    protected void Button2_Click(object sender, EventArgs e)
    {     
        string online = this.FileUpload2.FileName;
        string offline = this.FileUpload1.FileName;
        if (string.IsNullOrEmpty(online) || string.IsNullOrEmpty(offline))
        {
            Label1.Text = "请选择上传图片";
            this.ModalPopupExtender1.Show();
            return;
        }
        if (!string.IsNullOrEmpty(LoadImageType(online))||!string.IsNullOrEmpty(LoadImageType(offline)))
        {
            Label1.Text = "图片,请上传格式为jpg,gif,png,bmp图片";
            this.ModalPopupExtender1.Show();
            return;
        }
      
        WebSite wst = WebSiteManager.GetWebSiteByDomainName(this.drpDomainName.SelectedValue);
        if (wst != null)
        {
            if (Session["User"] != null)
            {
                oper = (Operator)Session["User"];
                string path = ConfigurationManager.AppSettings["UserDefinedPath"] + "\\" + oper.Account.AccountNumber + "\\" + drpDomainName.SelectedValue;
                Directory.CreateDirectory(path);
                string aa = LiveSupport.BLL.WebSiteManager.WebSite_UserDefined;
                string offlineImg = "offline" + aa + Path.GetExtension(offline);
                string onlineImg = "online" + aa + Path.GetExtension(online);
                FileUpload2.SaveAs(path + "\\"+onlineImg);
                FileUpload1.SaveAs(path + "\\" + offlineImg);
                wst.IconStyle = aa + "|" + onlineImg + "|" + offlineImg;
                WebSiteManager.Update(wst);
                AddIcoLocation(wst.IcoLocation);
                AddBannerStyle(wst.IconStyle);
                AddInviteStyle(wst.InviteStyle);
                AddChatStyle(wst.ChatStyle);
            }
            else
            {
                Response.Redirect("../Index.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('请选择上传到那个域名！');</script>");
        }
    }
    public string LoadImageType(string file)
    {
        string ext = Path.GetExtension(file);
        if (ext.ToLower() == ".jpg" || ext.ToLower() == ".gif" || ext.ToLower() == ".png" || ext.ToLower() == ".bmp")
        {
            return "";
        }
        else
        {
            return "请上传格式为jpg,gif,png,bmp图片";
        }
    }
    //上传主动邀请图片
    protected void Button5_Click(object sender, EventArgs e)
    {
        Label2.Visible = false;
        string bgStyle = this.FileUpload3.FileName;
        string okbtn = this.FileUpload4.FileName;
        string nobtn = this.FileUpload5.FileName;
        if (string.IsNullOrEmpty(bgStyle) || string.IsNullOrEmpty(okbtn) || string.IsNullOrEmpty(nobtn))
        {

            Label2.Text = "请选择上传图片";
            this.ModalPopupExtender2.Show();
            return;
        }
        if (!string.IsNullOrEmpty(LoadImageType(bgStyle)) || !string.IsNullOrEmpty(LoadImageType(okbtn))||!string.IsNullOrEmpty(LoadImageType(nobtn)))
        {
            Label2.Text = "图片,请上传格式为jpg,gif,png,bmp图片";
            this.ModalPopupExtender2.Show();
            return;
        }
        WebSite wst = WebSiteManager.GetWebSiteByDomainName(this.drpDomainName.SelectedValue);
        if (wst != null)
        {
            if (Session["User"] != null)
            {
                oper = (Operator)Session["User"];
                string path = ConfigurationManager.AppSettings["UserDefinedPath"] + "\\" + oper.Account.AccountNumber + "\\" + drpDomainName.SelectedValue;
                Directory.CreateDirectory(path);
                string aa = LiveSupport.BLL.WebSiteManager.WebSite_UserDefined;
                string inviteBGimg = "invite_bg" + aa + Path.GetExtension(bgStyle);
                string inviteOKimg = "btn_ok" + aa + Path.GetExtension(okbtn);
                string inviteNOimg = "btn_no" + aa + Path.GetExtension(nobtn);
                FileUpload3.SaveAs(path + "\\" +inviteBGimg);
                FileUpload4.SaveAs(path + "\\" + inviteOKimg);
                FileUpload5.SaveAs(path + "\\" + inviteNOimg);
                wst.InviteStyle = aa + "|" + inviteBGimg + "|" + inviteOKimg + "|" + inviteNOimg;
                WebSiteManager.Update(wst);
                AddIcoLocation(wst.IcoLocation);
                AddBannerStyle(wst.IconStyle);
                AddInviteStyle(wst.InviteStyle);
                AddChatStyle(wst.ChatStyle);
            }
            else
            {
                Response.Redirect("../Index.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('请选择上传到那个域名！');</script>");
        }
    }
    //上传聊天页面图片
    protected void Button6_Click(object sender, EventArgs e)
    {
        string bgStyle = ConfigurationManager.AppSettings["UserDefinedPath"] + "\\Default\\chat_bg0.gif";
        string rightimg= this.FileUpload7.FileName;
        string topimg = this.FileUpload8.FileName;
        if (string.IsNullOrEmpty(bgStyle) || string.IsNullOrEmpty(rightimg) || string.IsNullOrEmpty(topimg))
        {
            Label3.Text = "请选择上传图片";
            this.ModalPopupExtender3.Show();
            return;
        }
        if (!string.IsNullOrEmpty(LoadImageType(bgStyle)) || !string.IsNullOrEmpty(LoadImageType(rightimg)) || !string.IsNullOrEmpty(LoadImageType(topimg)))
        {
            Label3.Text = "图片,请上传格式为jpg,gif,png,bmp图片";
            this.ModalPopupExtender3.Show();
            return;
        }
        WebSite wst = WebSiteManager.GetWebSiteByDomainName(this.drpDomainName.SelectedValue);
        if (wst != null)
        {
            if (Session["User"] != null)
            {
                oper = (Operator)Session["User"];
                string path = ConfigurationManager.AppSettings["UserDefinedPath"] + "\\" + oper.Account.AccountNumber + "\\" + drpDomainName.SelectedValue;
                Directory.CreateDirectory(path);
                string aa = LiveSupport.BLL.WebSiteManager.WebSite_UserDefined;
                string chatBGimg = "chat_bg" + aa + Path.GetExtension(bgStyle);
                string chatRightimg = "chat_right" + aa + Path.GetExtension(rightimg);
                string leaveTopimg = "leave_top" + aa + Path.GetExtension(topimg);
                File.Copy(bgStyle, path + "\\" + chatBGimg,true);
                FileUpload7.SaveAs(path + "\\" + chatRightimg);
                FileUpload8.SaveAs(path + "\\" + leaveTopimg);
                wst.ChatStyle = aa + "|" + chatBGimg + "|" + chatRightimg + "|" + leaveTopimg;
                WebSiteManager.Update(wst);
                AddIcoLocation(wst.IcoLocation);
                AddBannerStyle(wst.IconStyle);
                AddInviteStyle(wst.InviteStyle);
                AddChatStyle(wst.ChatStyle);
            }
            else
            {
                Response.Redirect("../Index.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('请选择上传到那个域名！');</script>");
        }
    }
    //域名发生改变时
    protected void drpDomainName_SelectedIndexChanged(object sender, EventArgs e)
    {
        WebSite wst = WebSiteManager.GetWebSiteByDomainName(this.drpDomainName.SelectedValue);
        if (wst != null)
        {
            AddIcoLocation(wst.IcoLocation);
            AddBannerStyle(wst.IconStyle);
            AddInviteStyle(wst.InviteStyle);
            AddChatStyle(wst.ChatStyle);

        }

    }
    /// <summary>
    /// 添加旗帜样式
    /// </summary>
    /// <param name="selectItem"></param>
    public void AddBannerStyle(string selectItem)
    {
        DropDownList1.Items.Clear();
        string[] banners = selectItem.Split('|');
        if (banners[0] == LiveSupport.BLL.WebSiteManager.WebSite_Default && banners[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined || string.IsNullOrEmpty(selectItem))
        {
            return;
        }
        for (int i = 0; i < bannerlist.Count; i++)
        {
            ListItem li = new ListItem();
            if (banners[0] == LiveSupport.BLL.WebSiteManager.WebSite_Default && banners[1] == bannerlist[i].Online)
            {
                li.Text = "风格" + i;
                li.Selected = true;
            }
            else
            {
                li.Text = "风格" + i;
                li.Selected = false;
            }
            li.Value = bannerlist[i].State + "|" + bannerlist[i].Online + "|" + bannerlist[i].Offline;
            DropDownList1.Items.Add(li);
        }
        if (banners[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
        {
            ListItem li = new ListItem();
            li.Text = "自定义";
            li.Value = selectItem;
            li.Selected = true;
            DropDownList1.Items.Add(li);
        }
        ChangeStyle(1);
    }
    /// <summary>
    /// 添加主动邀请样式
    /// </summary>
    /// <param name="selectItem"></param>
    public void AddInviteStyle(string selectItem)
    {
        DropDownList2.Items.Clear();
        string[] invites = selectItem.Split('|');
        if (invites[0] == LiveSupport.BLL.WebSiteManager.WebSite_Default && invites[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined || string.IsNullOrEmpty(selectItem))
        {
            return;
        }
        for (int i = 0; i < invitelist.Count; i++)
        {
            ListItem li = new ListItem();
            if (invites[0] == LiveSupport.BLL.WebSiteManager.WebSite_Default && invites[1] == invitelist[i].Bgimg)
            {
                li.Text = "风格" + i;
                li.Selected = true;
            }
            else
            {
                li.Text = "风格" + i;
                li.Selected = false;
            }
            li.Value = invitelist[i].State + "|" + invitelist[i].Bgimg + "|" + invitelist[i].Okimg + "|" + invitelist[i].Noimg;
            DropDownList2.Items.Add(li);
        }
        if (invites[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
        {
            ListItem li = new ListItem();
            li.Text = "自定义";
            li.Value = selectItem;
            li.Selected = true;
            DropDownList2.Items.Add(li);
        }
        ChangeStyle(2);
    }
    public void AddIcoLocation(string icoLocation)
    {
        RadioButton0.Checked = false; RadioButton1.Checked = false; RadioButton2.Checked = false; RadioButton3.Checked = false; RadioButton4.Checked = false; RadioButton5.Checked = false; RadioButton6.Checked = false;
        if (icoLocation == "0") { RadioButton0.Checked = true; }
        if (icoLocation == "1") { RadioButton1.Checked = true; }
        if (icoLocation == "2") { RadioButton2.Checked = true; }
        if (icoLocation == "3") { RadioButton3.Checked = true; }
        if (icoLocation == "4") { RadioButton4.Checked = true; }
        if (icoLocation == "5") { RadioButton5.Checked = true; }
        if (icoLocation == "6") { RadioButton6.Checked = true; }
    }
    /// <summary>
    /// 添加对话样式
    /// </summary>
    /// <param name="selectItem"></param>
    public void AddChatStyle(string selectItem)
    {
        DropDownList3.Items.Clear();
        string[] chatpages = selectItem.Split('|');
        if (chatpages[0] == LiveSupport.BLL.WebSiteManager.WebSite_Default && chatpages[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined||string.IsNullOrEmpty(selectItem))
        {
            return;
        }
        for (int i = 0; i < chatpagelist.Count; i++)
        {
            ListItem li = new ListItem();
            if (chatpages[0] == LiveSupport.BLL.WebSiteManager.WebSite_Default && chatpages[1] == chatpagelist[i].ChatPageBGImg)
            {
                li.Text = "风格" + i;
                li.Selected = true;
            }
            else
            {
                li.Text = "风格" + i;
                li.Selected = false;
            }
            li.Value = chatpagelist[i].State + "|" + chatpagelist[i].ChatPageBGImg + "|" + chatpagelist[i].ChatPageRightImg + "|" + chatpagelist[i].LeavePageTopImg;
            DropDownList3.Items.Add(li);
        }
        if (chatpages[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
        {
            ListItem li = new ListItem();
            li.Text = "自定义";
            li.Value = selectItem;
            li.Selected = true;
            DropDownList3.Items.Add(li);
        }
        ChangeStyle(3);
    }
    public string GetHomeRootUrl()
    {
        if (Session["User"] != null)
        {
            oper = (Operator)Session["User"];
            return ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/" + oper.Account.AccountNumber + "/" + drpDomainName.SelectedValue;
        }
        else
        {
            return null;
        }
    }

    //跟据选择项更改
    public void ChangeStyle(int i)
    {
        string path = ConfigurationManager.AppSettings["HomeRootUrl"];
        string[] bannerStyle = this.DropDownList1.SelectedValue.Split('|');
        if (i==1)
        {
            if (bannerStyle[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
                Image6.ImageUrl = GetHomeRootUrl() + "/" + bannerStyle[1];
            else
                Image6.ImageUrl = ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/Default/" + bannerStyle[1];
        }
        string[] inviteStyle = this.DropDownList2.SelectedValue.Split('|');
        if (i==2)
        {
            if (inviteStyle[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
                Image7.ImageUrl = GetHomeRootUrl() + "/" + inviteStyle[1];
            else
                Image7.ImageUrl = ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/Default/" + inviteStyle[1];
        }
        string[] chatStyle = this.DropDownList3.SelectedValue.Split('|');
        if (i==3)
        {
            if (chatStyle[0] == LiveSupport.BLL.WebSiteManager.WebSite_UserDefined)
                Image8.ImageUrl = GetHomeRootUrl() + "/" + chatStyle[1];
            else
                Image8.ImageUrl = ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/Default/" + chatStyle[1];
        }
    }
    //漂浮旗子样式改变
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ChangeStyle(1);

    }
    //主动邀请样式改变
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ChangeStyle(2);
    }
    //聊天样式改变
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        ChangeStyle(3);
    }
    //保存
    protected void Button1_Click(object sender, EventArgs e)
    {
        string domainName = this.drpDomainName.SelectedValue;
        if (string.IsNullOrEmpty(domainName))
        {
            return;
        }
        else
        {
            WebSite wst = new WebSite();
            wst.DomainName = domainName;
            if (RadioButton0.Checked == true) { wst.IcoLocation = "0"; }
            if (RadioButton1.Checked == true) { wst.IcoLocation = "1"; }
            if (RadioButton2.Checked == true) { wst.IcoLocation = "2"; }
            if (RadioButton3.Checked == true) { wst.IcoLocation = "3"; }
            if (RadioButton4.Checked == true) { wst.IcoLocation = "4"; }
            if (RadioButton5.Checked == true) { wst.IcoLocation = "5"; }
            if (RadioButton6.Checked == true) { wst.IcoLocation = "6"; }
            wst.IconStyle = DropDownList1.SelectedValue;
            wst.InviteStyle = DropDownList2.SelectedValue;
            wst.ChatStyle = DropDownList3.SelectedValue;
            if (Session["User"] != null)
            {
                oper = (Operator)Session["User"];
                wst.RegisterId = oper.Account.AccountId;
                LiveSupport.BLL.WebSiteManager.Update(wst);
                Response.Redirect("DomainName.aspx");
            }
            else
            {
                return;
            }

        }
    }
}
