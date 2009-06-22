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
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    //当前对话
    protected void ddlChat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.ddlChat.SelectedValue == "list")
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
        else if (this.ddlChat.SelectedValue == "ContactName" || this.ddlChat.SelectedValue == "accountId")
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
    //当前在线客服
    protected void ddlOnline_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.ddlOnline.SelectedValue == "list")
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
        else if (this.ddlOnline.SelectedValue == "ContactName" || this.ddlOnline.SelectedValue == "accountId")
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

    #region 获取所有公司
    private List<Account> getAccounts()
    {
        return AccountsManager.GetAllAccounts();
    }
    #endregion
}
