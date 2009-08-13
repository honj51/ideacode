using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;

public partial class operatortest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/App_Data");
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        this.GridView5.DataSource = AccountService.getAllaccount();
        this.GridView1.DataSource = OperatorService.GetAllOperators();
        this.GridView2.DataSource = ChatService.GetAllChat();
        LiveSupport.BLL.Utils.Util.SysDateStates li = LiveSupport.BLL.Utils.Util.GetSysInfo();
        this.Label4.Text = li.StartApplicationDate.ToString();
        this.Label5.Text = li.StartSessionDate.ToString();
        DataBind();
    }
    /// <summary>
    /// 跟据公司ID查询公司名
    /// </summary>
    /// <param name="aid"></param>
    /// <returns></returns>
    public string getAccountName(string aid)
    {
       return AccountService.GetAccountById(aid).CompanyName.ToString();
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public string cutString(string str)
    {
        if (str.Length > 15)
        {
            return str.Substring(0, 15).ToString() ;
        }
        else
            return str;
    }
}
