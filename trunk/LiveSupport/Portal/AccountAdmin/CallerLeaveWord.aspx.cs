using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            account = (Account)Session["User"];
            //if (!IsPostBack)
                //DataBindOperator(account.AccountId);
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
        DataBindLeaveWord(account.AccountId, beginDate, endDate + " 23:59:59");
    }

    #region 绑定留言记录
    public void DataBindLeaveWord(string accountId, string beginDate, string endDate)
    {
        List<LeaveWord> list=LeaveWordManager.GetGetLeaveWordByAccountId(accountId,beginDate,endDate);
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
        DataBindLeaveWord(account.AccountId, this.txtBeginDate.Text,this.txtEndDate.Text + " 23:59:59");
    }
}
