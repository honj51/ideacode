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

public partial class Print : System.Web.UI.Page
{
    protected string dataUrl = "";
    protected string user = "";
    protected string dt = "";
    protected string beizu = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Params["action"]) && Request.Params["action"] == "save_remark")
        {
            string remark = Request.Params["remark"];
            DBHelper.ExecuteSql(string.Format("update config set Value='{0}' where Name='单据备注'",remark));
            Response.End();
            return;
        }

        user = (string)Session["admin_id"];
        dt = DateTime.Now.ToShortDateString();
        Random rand = new Random();        
        dataUrl = string.Format("ajax/sfgl/sjlr.aspx?action=list_lb&djbh={0}&_rand={1}",Request.Params["djbh"],rand.Next());

        beizu = DBHelper.GetVar(string.Format("select Value from config where Name='单据备注'")).ToString();
    }
}
