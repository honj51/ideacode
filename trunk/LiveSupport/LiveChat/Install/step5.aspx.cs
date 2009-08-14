using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using LiveSupport.BLL.Utils;

public partial class Install_step5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    ///  下一步
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void BtnNext_Click(object sender, EventArgs e)
    {
        bool i = true;
        try
        {
            if (i) { i = Util.SetappSettings("ftpServerName", ftpServer.Text, "add"); }
            if (i) { i = Util.SetappSettings("ftpAccounts", ftpAccounts.Text, "add"); }
            if (i) { i = Util.SetappSettings("ftpPassWord", ftpPassWord.Text, "add"); }
        }
        catch (Exception)
        {
            i = false;
        }
        if (!i)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('保存失败');</script>");
            return;
        }
        Response.Redirect("succeed.aspx");
    }
}
