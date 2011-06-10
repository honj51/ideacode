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

public partial class ajax_app : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null)
        {
            Response.Write("{'success':true, 'data':{}, errorMessage: 'user not logged in',sessionstatus:'timeout'}"); 
            Response.End(); 
            return;
        }

        bool xglr2 = true;
        string admin_id = (string)Session["admin_id"];
        string sql1 = string.Format("select admin_limit from sq8szxlx.admin_admin where admin_id='{0}'",admin_id);
        string role_name = DBHelper.GetRow(sql1)["admin_limit"].ToString();
        string sql2 = string.Format("select 修改录入 from sq8szxlx.role_lb where role_name='{0}' ", role_name);
        object xglr = DBHelper.GetVar(sql2);
        
        if (xglr ==null || xglr.ToString() == "0") {  xglr2 = false; }
        
        string js = string.Format(@"var permission_xglr={0}", xglr2?"true":"false");
        Response.Write(js);
        Response.End();
    }
}
