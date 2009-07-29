using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    Operator oepr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            oepr = (Operator)Session["User"];
            if (!IsPostBack)
            {
                //DataBindOperator(account.AccountId);
                string nowdate = DateTime.Now.ToString("yyyy-MM-dd");
                this.txtBeginDate.Text = nowdate;
                this.txtEndDate.Text = nowdate;
                loadDomainName();
            }
        }
        else
        {
            Response.Redirect("../Login.aspx");
        }
    }

    //搜索
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        string beginDate = this.txtBeginDate.Text;
        string endDate = this.txtEndDate.Text;
        string domainName=null;
        if (ddlDomainName.SelectedIndex>0)
        {
            domainName=ddlDomainName.SelectedItem.Value.ToString();
        }
        DataBindLeaveWord(oepr.Account.AccountId, domainName, beginDate, endDate + " 23:59:59");
    }

    protected void loadDomainName()
    {
        foreach (WebSite item in WebSiteManager.GetAllWebSiteByRegisterId(oepr.Account.AccountId))
        {
            ddlDomainName.Items.Add(new ListItem(item.DomainName, item.DomainName));  
        }
    }

    #region 绑定留言记录
    public void DataBindLeaveWord(string accountId, string domainName, string beginDate, string endDate)
    {
        List<LeaveWord> list = null;
        if (domainName==null)
        {
          list= LeaveWordManager.GetLeaveWordByAccountId(accountId,beginDate, endDate);
        }
        else
        list = LeaveWordManager.GetLeaveWordByAccountIdAndDomainName(accountId, domainName, beginDate, endDate);
        
        if (list != null)
        {
            this.gvLeaveWord.DataSource = list;
            this.gvLeaveWord.DataBind();
        }
    }
    #endregion

    protected void gvLeaveWord_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != null && e.CommandName=="cmdView" && e.CommandArgument!=null)
        {
            this.Response.Redirect("ViewLeaveWord.aspx?id="+e.CommandArgument.ToString());
        }
    }
    protected void gvLeaveWord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvLeaveWord.PageIndex = e.NewPageIndex;
        DataBindLeaveWord(oepr.Account.AccountId, ddlDomainName.SelectedItem.Value.ToString(), this.txtBeginDate.Text, this.txtEndDate.Text + " 23:59:59");
    }
}
