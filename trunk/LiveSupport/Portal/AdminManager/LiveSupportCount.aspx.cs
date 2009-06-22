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

public partial class AdminManager_LiveSupportCount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string nowdate = DateTime.Now.ToString("yyyy-MM-dd");
            this.txtBeginDate.Text = nowdate;
            this.txtEndDate.Text = nowdate;
            MyDate md = MyDateManager.GetLiveSupportCount("2008-8-8 20:08:08",DateTime.Now.ToString());
            DatabindLiveSupportCount(md);
            
        }
    }
    #region 绑定统计数据
    private void DatabindLiveSupportCount(MyDate md)
    {
        this.lblAccountCount.Text = md.AccountCount + "";
        this.lblVisitorCount.Text = md.VisitorCount + "";
        this.lblChatCount.Text = md.ChatCount + "";
    }
    #endregion

    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        MyDate md = MyDateManager.GetLiveSupportCount(this.txtBeginDate.Text.Trim(), this.txtEndDate.Text.Trim());
        DatabindLiveSupportCount(md);
    }
}
