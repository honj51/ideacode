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

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        LiveSupport.LiveSupportModel.Content mo = new LiveSupport.LiveSupportModel.Content();
        mo.Id = int.Parse(Request.QueryString["id"]);
        mo.Reply = FCKeditor1.Value;

        ContentManager bll = new ContentManager();
        if (bll.UAddRe(mo))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('回复成功！'); window.location='LiveSupportLeaveWord.aspx';</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('回复不成功！');</script>");
        }
    }
}
