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
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.MobileControls;

public partial class ZiYuan_gyygl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            System.Data.SqlClient.SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.gyy_lb");
            Response.Write(Json.ToJson(r));            
        }
        else if (action == "getbyid")
        {
            string sql = "select * from sq8szxlx.gyy_lb where id=" + Request.Form["id"];
            Response.Write(Json.ToJson(DBHelper.ExecuteSql(sql)));
        }
        else if (action == "add")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.gyy_lb", "id", true);                
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");           
        }
        else if (action == "update")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.gyy_lb", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");            
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.gyy_lb where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");   
        }
        else if (action == "lx_list")
        {   
            string  lx = Request.Params["find_id"];
            string sql = string.Format("select * from sq8szxlx.gyy_lb_fclx_lb where 工业园名称='{0}' ", lx);
            System.Data.SqlClient.SqlDataReader r = DBHelper.GetReader(sql);
            Response.Write(Json.ToJson(r));     
        }
        else if (action == "addlx")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.gyy_lb_fclx_lb", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}"); 
        }
        Response.End();
    }
}
