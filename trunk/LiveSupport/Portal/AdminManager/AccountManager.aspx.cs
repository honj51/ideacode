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
    int pageIndex = 0;
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
        this.repAccount.DataSource = null;
        PagedDataSource pds = new PagedDataSource();
        if (list != null)
        {
            this.ibtnShang.Visible = true;
            this.ibtnXia.Visible = true;
            this.lblMessage.Visible = false;
            pds.DataSource = list;
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = pageIndex;
            if (pds.CurrentPageIndex < 1)
            {
                this.ibtnShang.Enabled = false;
                this.ibtnXia.Enabled = true;
            }
            else if (pds.CurrentPageIndex > pds.PageCount)
            {
                this.ibtnXia.Enabled = false;
                this.ibtnShang.Enabled = true;
            }
            this.repAccount.DataSource = pds;
            this.repAccount.DataBind();
        }
        else
        {
            this.repAccount.DataSource = null;
            this.repAccount.DataBind();
            this.ibtnShang.Visible = false;
            this.ibtnXia.Visible = false;
            this.lblMessage.Visible = true;
        }
    }
    #endregion

    //上一步
    protected void ibtnShang_Click(object sender, ImageClickEventArgs e)
    {
        pageIndex--;
        //List<Account> list = AccountsManager.GetAllAccounts();
        //repAccounts(list);
    }
    //下一步
    protected void ibtnXia_Click(object sender, ImageClickEventArgs e)
    {
        pageIndex++;
        //List<Account> list = AccountsManager.GetAllAccounts();
        //repAccounts(list);
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
        repAccounts(list);
    }
}
