using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class Default2 : System.Web.UI.Page
{
    Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            account = (Account)Session["User"];
            if(!IsPostBack)
            DataBindOperator(account.AccountId);
        }
        else
        {
            Response.Redirect("../Default.aspx");
        }
    }

    #region 绑定公司客服
    public void DataBindOperator(string accountId)
    {
        List<Operator> list = OperatorsManager.GetOperatorByAccountId(accountId);
        if (list != null)
        {
            this.ddlOperator.DataSource = list;
            this.ddlOperator.DataTextField = "LoginName";
            this.ddlOperator.DataValueField = "OperatorId";
            this.ddlOperator.DataBind();
        }
    }
    #endregion

    #region 绑定聊天会话信息
    public void DataBindChat(string operatorId,string beginDate,string endDate)
    {
        List<Chat> list = ChatManager.GetChatByOperatorId(operatorId,beginDate,endDate);
        if (list != null)
        {
            this.GridViewChat.DataSource = list;
            this.GridViewChat.DataBind();
        }
    }
    #endregion

    #region 时间比较
    public string DateCompare(string beginDate, string endDate)
    {
        TimeSpan dt =  Convert.ToDateTime(endDate)- Convert.ToDateTime(beginDate);
        return Convert.ToDateTime(dt.ToString()).ToString("HH:MM:ss");
    }
    #endregion

    //搜索聊天记录
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        
        string operatorId = this.ddlOperator.SelectedValue;
        DataBindChat(operatorId,this.txtBeginDate.Text,this.txtEndDate.Text);
    }

    //数据库事件
    protected void GridViewChat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string cmdName=e.CommandName.ToString();
        if (cmdName == "cmdDelete")
        {
            if (cmdName != null)
            {
                if (e.CommandArgument != null)
                {
                    bool b=ChatManager.DeleteChatById(e.CommandArgument.ToString());
                    string operatorId = this.ddlOperator.SelectedValue;
                    DataBindChat(operatorId, this.txtBeginDate.Text, this.txtEndDate.Text);
                }
            }
        }
    }
    //GridView分页事件
    protected void GridViewChat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewChat.PageIndex = e.NewPageIndex;
        DataBindChat(this.ddlOperator.SelectedValue, this.txtBeginDate.Text, this.txtEndDate.Text);
    }
    protected void GridViewChat_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#6699ff'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
}
