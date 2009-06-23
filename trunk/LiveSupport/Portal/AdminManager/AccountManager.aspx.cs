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
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;

public partial class AdminManager_AccountManager : System.Web.UI.Page
{
    AdminUser user;
    static int pageIndex = 0;

    public static int PageIndex
    {
        get { return AdminManager_AccountManager.pageIndex; }
        set { AdminManager_AccountManager.pageIndex = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUser"] != null)
        {
            user = Session["adminUser"] as AdminUser;
            if (!IsPostBack)
            {
                List<Account> list = AccountsManager.GetAllAccounts();
                repAccounts(list);
            }
        }
        else
        {
            this.Response.Write("<script>alert('登陆超时,请从新登陆...');window.location='Default.aspx';</script>");
            return;
        }
    }
    #region 绑定公司信息
    public void repAccounts(List<Account> list)
    {
        PagedDataSource pds = new PagedDataSource();
        if (list != null && list.Count>0)
        {          
            this.PanelAccountDown.Visible = true;
            this.lblMessage.Visible = false;
            pds.DataSource = list;
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = PageIndex;
            if (pds.CurrentPageIndex == 0)
            {
                this.ibtnShang.Enabled = false;
            }
            else
            {
                this.ibtnShang.Enabled = true;
            }
            if (pds.CurrentPageIndex == pds.PageCount - 1)
            {
                this.ibtnXia.Enabled = false;
            }
            else
            {
                this.ibtnXia.Enabled = true;
            }
            this.lblpageIndex.Text = PageIndex + 1 + "";
            this.lblpageIndexCount.Text = pds.PageCount + "";
            this.repAccount.DataSource = pds;
            this.repAccount.DataBind();
        }
        else
        {
            this.repAccount.DataSource = null;
            this.repAccount.DataBind();
            this.lblMessage.Visible = true;
            this.PanelAccountDown.Visible = false;
        }
    }
    #endregion

    //上一步
    protected void ibtnShang_Click(object sender, ImageClickEventArgs e)
    {
        PageIndex--;
        List<Account> list = AccountsManager.GetAllAccounts();
        repAccounts(list);
    }
    //下一步
    protected void ibtnXia_Click(object sender, ImageClickEventArgs e)
    {
        pageIndex++;
        List<Account> list = AccountsManager.GetAllAccounts();
        repAccounts(list);
    }
    //搜索
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtValue.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('关键字不能为空!');</script>");
            return;
        }
        List<Account> list=AccountsManager.GetAccountBycondition(this.ddlKind.SelectedValue, this.txtValue.Text);
        PageIndex = 0;
        repAccounts(list);
    }
}
