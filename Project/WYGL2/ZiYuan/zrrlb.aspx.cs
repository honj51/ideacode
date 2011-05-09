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
using System.Data.SqlClient;

public partial class ZiYuan_zrrlb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.user_zrr");
            
            Response.Write(Json.ToJson(r));

        }
        else if (action == "add")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.user_zrr", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.user_zrr", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}"); 
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.user_zrr where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        Response.End();
    }
}
