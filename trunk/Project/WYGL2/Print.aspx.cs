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
    protected void Page_Load(object sender, EventArgs e)
    {
        user = (string)Session["admin_id"];
        dt = DateTime.Now.ToShortDateString();
        dataUrl = "ajax/sfgl/sjlr.aspx?action=list_lb&djbh=" + Request.Params["djbh"];
    }
}
