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

public partial class AdminManager_Main : System.Web.UI.Page
{
    AdminUser user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUser"] != null)
        {
            user =Session["adminUser"] as AdminUser;
            if (!IsPostBack)
            {
                initData(user);
            }
        }
        else
        {
            this.Response.Write("<script>alert('登陆超时,请从新登陆...');window.location='Default.aspx';</script>");
            return;
        }
    }

    private void initData(AdminUser  user)
    {
        this.RealName.Text = user.AdminName;
        this.LoginCount.Text = user.LoginCount + "";
        this.LastLoginIP.Text = user.LoginIP;
        this.LastLoginTime.Text = user.LoginDate + "";
        this.ManagePower.Text = "产品与服务管理,新闻管理,关于我们,联系我们,成功案例管理,公司账户管理,系统信息统计管理,系统实时状态监控管理,服务器状态";
        this.ModulePower.Text = "基本信息管理,Portal 管理,LiveChat管理,软件信息管理,软件日志管理,数据文件管理";
    }
}
