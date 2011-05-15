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
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {       
            string sql = "";
            string iField = Request.Params["iField"];
            if (Request.Params["start"] != null && Request["limit"] != null)
            {
                sql = string.Format("select top {0} * from sq8szxlx.user_zrr where id not in (select top {1} id from sq8szxlx.user_zrr)",
                    Request["limit"], Request.Params["start"]);
            }
            else if (iField != null)
            {
                sql = string.Format("select * from sq8szxlx.user_zrr where 名称 like '%{0}%' ", iField);
            }
            else
            {
                sql = "select * from sq8szxlx.user_zrr";
            }
            SqlDataReader c = DBHelper.GetReader(string.Format("select count(*) as total from sq8szxlx.user_zrr where 名称 like '%{0}%' ", iField));
            if (!c.Read()) return;
            SqlDataReader r = DBHelper.GetReader(sql);
            string data = Json.ToJson(r);
            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", c.GetInt32(0));
            result = "{" + result + data + "}";
            Response.Write(result);

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

        //搜索
        
        //if (iField!=null)
        //{
        //    string sql = string.Format("select * from sq8szxlx.user_zrr where 名称 like '%{0}%' ",iField);

        //    SqlDataReader c = DBHelper.GetReader(string.Format("select count(*) as total from sq8szxlx.user_zrr where 名称 like '%{0}%' ", iField));
        //    if (!c.Read()) return;
        //    SqlDataReader r = DBHelper.GetReader(sql);
        //    string data = Json.ToJson(r);
        //    string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", c.GetInt32(0));
        //    result = "{" + result + data + "}";
        //    Response.Write(result);
        //}

        Response.End();
    }
}
