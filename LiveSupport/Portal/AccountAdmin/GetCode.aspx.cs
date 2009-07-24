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
    private int DefaultBannerStyleCount=2;
    private int DefaultInviteStyleCount=2;
    private int DefaultChatPageStyleCount=1;
    private Operator  oper;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["User"] != null)
            {
                oper = (Operator)Session["User"];
                List<WebSite> li = new List<WebSite>(); 
                WebSite ws = new WebSite();
                List<WebSite> list = WebSiteManager.GetAllWebSiteByRegisterId(oper.Account.AccountId);
                if (Request.QueryString["domain"] != null)
                {
                    ws.DomainName = Request.QueryString["domain"].ToString();
                    foreach (WebSite item in list)
                    {
                        if (item.DomainName == Request.QueryString["domain"].ToString())
                        {
                            ws = item;
                            li.Remove(item);
                        }
                    }
                    AddIcoLocation(ws.IcoLocation);
                    AddBannerStyle(ws.IconStyle);
                    AddInviteStyle(ws.InviteStyle);
                    AddChatStyle(ws.ChatStyle);

                }
                else
                {
                    ws.DomainName = "请选择域名";
                }
                li.Add(ws);
                
                li.AddRange(list);
                if (li != null)
                {
                    this.drpDomainName.DataSource = li;
                    this.drpDomainName.DataTextField = "DomainName";
                    this.drpDomainName.DataValueField = "DomainName";
                    this.drpDomainName.DataBind();
                }
            }
            else
            {
                Response.Redirect("../Default.aspx");
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
       Label1.Visible = false;
       string online = this.FileUpload2.FileName;
       string offline = this.FileUpload1.FileName;
       if (string.IsNullOrEmpty(online) || string.IsNullOrEmpty(offline))
       {
           Label1.Visible = true;
           Label1.Text = "请选择上传图片";
           this.ModalPopupExtender1.Show();
           return;
       }
       if (!string.IsNullOrEmpty(LoadImageType(online, "jpg")))
       {
           Label1.Visible = true;
           Label1.Text ="在线旗子,"+LoadImageType(online, "jpg");
           this.ModalPopupExtender1.Show();
           return;
       }
       if (!string.IsNullOrEmpty(LoadImageType(offline, "jpg")))
       {
           Label1.Visible = true;
           Label1.Text = "离线旗子," + LoadImageType(offline, "jpg");
           this.ModalPopupExtender1.Show();
           return;
       }
       WebSite wst = WebSiteManager.GetWebSiteByDomainName(this.drpDomainName.SelectedValue);
       if (wst != null)
       {
           string aa = Guid.NewGuid().ToString();
           FileUpload1.SaveAs(ConfigurationManager.AppSettings["UserDefinedPath"] + "\\offline" + aa + ".jpg");
           FileUpload2.SaveAs(ConfigurationManager.AppSettings["UserDefinedPath"] + "\\online" + aa + ".jpg");
           wst.IconStyle = aa;
           WebSiteManager.Update(wst);
           AddIcoLocation(wst.IcoLocation);
           AddBannerStyle(wst.IconStyle);
           AddInviteStyle(wst.InviteStyle);
           AddChatStyle(wst.ChatStyle);
       }
       else {
           Response.Write("<script>alert('请选择上传到那个域名！');</script>");
       }
    }
    public string LoadImageType(string file,string type)
    {
        string ext = Path.GetExtension(file);
        if (!(string.IsNullOrEmpty(type) || ext.ToLower() == "."+type))
        {
            return "请上传格式为" + type + "图片";
        }
        else
        {
            return "";
        }
    }
    //上传主动邀请图片
    protected void Button5_Click(object sender, EventArgs e)
    {
        Label2.Visible = false;
        string bgStyle = this.FileUpload3.FileName;
        string okbtn = this.FileUpload4.FileName;
        string nobtn = this.FileUpload5.FileName;
        if (string.IsNullOrEmpty(bgStyle) || string.IsNullOrEmpty(okbtn)||string.IsNullOrEmpty(nobtn))
        {
            Label2.Visible = true;
            Label2.Text = "请选择上传图片";
            this.ModalPopupExtender2.Show();
            return;
        }
        if (!string.IsNullOrEmpty(LoadImageType(bgStyle, "gif")))
        {
            Label2.Visible = true;
            Label2.Text ="背景图片，"+ LoadImageType(bgStyle, "gif");
            this.ModalPopupExtender2.Show();
            return;
        }
        if (!string.IsNullOrEmpty(LoadImageType(okbtn, "jpg")))
        {
            Label2.Visible = true;
            Label2.Text ="确定按扭，"+ LoadImageType(okbtn, "jpg");
            this.ModalPopupExtender2.Show();
            return;
        }
        if (!string.IsNullOrEmpty(LoadImageType(nobtn, "jpg")))
        {
            Label2.Visible = true;
            Label2.Text ="忽略按扭，"+ LoadImageType(nobtn, "jpg");
            this.ModalPopupExtender2.Show();
            return;
        }
        WebSite wst = WebSiteManager.GetWebSiteByDomainName(this.drpDomainName.SelectedValue);
        if (wst != null)
        {
            string aa = Guid.NewGuid().ToString();
            FileUpload3.SaveAs(ConfigurationManager.AppSettings["UserDefinedPath"] + "\\invite_bg" + aa + ".jpg");
            FileUpload4.SaveAs(ConfigurationManager.AppSettings["UserDefinedPath"] + "\\btn_ok" + aa + ".jpg");
            FileUpload5.SaveAs(ConfigurationManager.AppSettings["UserDefinedPath"] + "\\btn_no" + aa + ".jpg");
            wst.InviteStyle = aa;
            WebSiteManager.Update(wst);
            AddIcoLocation(wst.IcoLocation);
            AddBannerStyle(wst.IconStyle);
            AddInviteStyle(wst.InviteStyle);
            AddChatStyle(wst.ChatStyle);
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
        bool esist = true;
        for (int i = 0; i < DefaultBannerStyleCount; i++)
        {

            ListItem li = new ListItem();
            if (i.ToString() == selectItem)
            {
                li.Text = "风格" + i;
                li.Selected = true;
                esist = false;
            }
            else
            {
                li.Text = "风格" + i;
                li.Selected = false;
            }
            li.Value = i.ToString();
            DropDownList1.Items.Add(li);
        }
        if (esist)
        {
            ListItem li = new ListItem();
            li.Text = "自定义";
            li.Value = selectItem;
            li.Selected = true;
            DropDownList1.Items.Add(li);
        }
        ChangeStyle();
    }
    /// <summary>
    /// 添加主动邀请样式
    /// </summary>
    /// <param name="selectItem"></param>
    public void AddInviteStyle(string selectItem)
    {
        DropDownList2.Items.Clear();
        bool esist = true;
        for (int i = 0; i < DefaultInviteStyleCount; i++)
        {

            ListItem li = new ListItem();
            if (i.ToString() == selectItem)
            {
                li.Text = "风格" + i;
                li.Selected = true;
                esist = false;
            }
            else
            {
                li.Text = "风格" + i;
                li.Selected = false;
            }
            li.Value = i.ToString();
            DropDownList2.Items.Add(li);
        }
        if (esist)
        {
            ListItem li = new ListItem();
            li.Text = "自定义";
            li.Value = selectItem;
            li.Selected = true;
            DropDownList2.Items.Add(li);
        }
        ChangeStyle();
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
        bool esist = true;
        for (int i = 0; i < DefaultChatPageStyleCount; i++)
        {

            ListItem li = new ListItem();
            if (i.ToString() == selectItem)
            {
                li.Text = "风格" + i;
                li.Selected = true;
                esist = false;
            }
            else
            {
                li.Text = "风格" + i;
                li.Selected = false;
            }
            li.Value = i.ToString();
            DropDownList3.Items.Add(li);
        }
        if (esist)
        {
            ListItem li = new ListItem();
            li.Text = "自定义";
            li.Value = selectItem;
            li.Selected = true;
            DropDownList3.Items.Add(li);
        }
        ChangeStyle();
    }
    //跟据选择项更改
    public void ChangeStyle()
    {
        string bannerStyle = this.DropDownList1.SelectedValue;
        Image6.ImageUrl = ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/online" + bannerStyle + ".JPG";
        string inviteStyle = this.DropDownList2.SelectedValue;
        Image7.ImageUrl = ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/invite_bg" + inviteStyle + ".gif";
        string chaStyle = this.DropDownList3.SelectedValue;
        Image8.ImageUrl = ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/chat_bg" + chaStyle + ".gif";
    }
    //漂浮旗子样式改变
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ChangeStyle();
        
    }
    //主动邀请样式改变
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ChangeStyle();
    }
    //聊天样式改变
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        ChangeStyle();
    }
    //保存
    protected void Button1_Click(object sender, EventArgs e)
    {
        string domainName = this.drpDomainName.SelectedValue;
        if (domainName == "请选择域名" || string.IsNullOrEmpty(domainName))
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
            }
            else
            {
                return;
            }
            
        }
    }
}
