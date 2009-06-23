using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
using LiveSupport.BLL;

public partial class AdminManager_LiveSupportWatch : System.Web.UI.Page
{

    static int cpageIndex=0;

    public int CpageIndex
    {
        get { return cpageIndex; }
        set { cpageIndex = value; }
    }
    static int opageIndex=0;

    public int OpageIndex
    {
        get { return opageIndex; }
        set { opageIndex = value; }
    }
    List<Chat> chatList = null;
    List<Operator> operatorList = null;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        chatList = ChatManager.LookupChat("", "", "");
        operatorList = OperatorsManager.GetLiveSupportOnlineOperator("", "", "");

    }
    #region 绑定公司
    protected void ddlChat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.ddlChat.SelectedValue == "accountList")
        {
            this.ddlAccount2.Visible = true;
            List<Account> list = getAccounts();
            if (list != null)
            {
                this.ddlAccount2.DataSource = list;
                this.ddlAccount2.DataTextField = "companyName";
                this.ddlAccount2.DataValueField = "accountId";
                this.ddlAccount2.DataBind();
            }
            this.txtChat.ReadOnly = true;
            this.txtChat.Text = "";
        }
        else if (this.ddlChat.SelectedValue == "accountNumber")
        {
            this.ddlAccount2.Visible = false;
            this.txtChat.ReadOnly = false;
        }
        else
        {
            this.ddlAccount2.Visible = false;
            this.txtChat.ReadOnly = true;
            this.txtChat.Text = "";
        }
    }
    #endregion 

    #region 当前在线客服索引发生改变的时候绑定公司信息
    protected void ddlOnline_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.ddlOnline.SelectedValue == "accountList")
        {
            this.ddlAccount1.Visible = true;
            List<Account> list = getAccounts();
            if (list != null)
            {
                this.ddlAccount1.DataSource = list;
                this.ddlAccount1.DataTextField = "companyName";
                this.ddlAccount1.DataValueField = "accountId";
                this.ddlAccount1.DataBind();
            }
            this.txtOnline.ReadOnly = true;
            this.txtOnline.Text = "";
        }
        else if (this.ddlOnline.SelectedValue == "accountNumber")
        {
            this.ddlAccount1.Visible = false;
            this.txtOnline.ReadOnly = false;
        }
        else
        {
            this.ddlAccount1.Visible = false;
            this.txtOnline.ReadOnly = true;
            this.txtOnline.Text = "";
        }
    }
    #endregion
   
    //搜索当前对话
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        List<Chat> list = ChatManager.LookupChat(this.ddlChat.SelectedValue, this.ddlAccount2.SelectedValue, this.txtChat.Text);
        cpageIndex = 0;
        chatList = list;
        DataBindChat(list);
    }

    #region 获取所有公司
    private List<Account> getAccounts()
    {
        return AccountsManager.GetAllAccounts();
    }
    #endregion

    #region 通过公司Id获取公司名称
    public string GetAccountNameById(string id)
    {
        return AccountsManager.GetAccountByAccountId(id).CompanyName;
    }
    #endregion

    #region 通过客服ID获取客服信息
    public string GetOperatorNameById(string id)
    {
        return OperatorsManager.GetOperatorByOperatorId(id).NickName;
    }
    #endregion

    #region 绑定在线客服信息
    private void DataBindOperator(List<Operator> list)
    {
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = null;
        if (list != null && list.Count>0)
        {
            this.PanelAccountDown.Visible = true;
            this.lblMessage.Visible = false;
            this.lblOpageIndex.Text = OpageIndex + 1 + "";
            pds.DataSource = list;
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = OpageIndex;
            if (OpageIndex == 0)
                this.ibtnOshang.Enabled = false;
            else
                this.ibtnOshang.Enabled = true;
            if (OpageIndex == pds.PageCount - 1)
                this.ibtnOxia.Enabled = false;
            else
                this.ibtnOxia.Enabled = true;
            this.lblOpageIndexCount.Text = pds.PageCount + "";
            this.lblOperatorCount.Text = list.Count+"";
            this.repOperator.DataSource = pds;
            this.repOperator.DataBind();
        }
        else
        {
            this.repOperator.DataSource = null;
            this.repOperator.DataBind();
            this.lblMessage.Visible = true;
            this.PanelAccountDown.Visible = false;
        }
    }
    #endregion

    #region 绑定当前对话信息
    private void DataBindChat(List<Chat> list)
    {
        PagedDataSource pds = new PagedDataSource();
        if (list != null && list.Count > 0)
        {
            this.PanelChatDown.Visible = true;
            this.lblChatMessage.Visible = false;
            this.lblChatIndex.Text = CpageIndex + 1 + "";
            pds.DataSource = list;
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = CpageIndex;
            if (CpageIndex == 0)
                this.ibtnCshang.Enabled = false;
            else
                this.ibtnCshang.Enabled = true;
            if (CpageIndex == pds.PageCount - 1)
                this.ibtnCxia.Enabled = false;
            else
                this.ibtnCxia.Enabled = true;
            this.lblChatIndexCount.Text = pds.PageCount + "";
            this.lblChatCount.Text = list.Count + "";
            this.repChat.DataSource = pds;
            this.repChat.DataBind();


        }
        else
        {
            this.repChat.DataSource = null;
            this.repChat.DataBind();
            this.lblChatMessage.Visible = true;
            this.PanelChatDown.Visible = false;
        }
       
    }
    #endregion

    //搜索在线客服
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        List<Operator> list = OperatorsManager.GetLiveSupportOnlineOperator(this.ddlOnline.SelectedValue, ddlAccount1.SelectedValue, this.txtOnline.Text);
        operatorList = list;
        OpageIndex = 0;
        DataBindOperator(list);
    }
    //上一页
    protected void ibtnOshang_Click(object sender, ImageClickEventArgs e)
    {
        OpageIndex--;
        DataBindOperator(operatorList);
    }
    //下一页
    protected void ibtnOxia_Click(object sender, ImageClickEventArgs e)
    {
        OpageIndex++;
        DataBindOperator(operatorList);
    }
    protected void ibtnCshang_Click(object sender, ImageClickEventArgs e)
    {
        CpageIndex--;
        DataBindChat(chatList);
    }
    protected void ibtnCxia_Click(object sender, ImageClickEventArgs e)
    {
        CpageIndex++;
        DataBindChat(chatList);
    }
}
