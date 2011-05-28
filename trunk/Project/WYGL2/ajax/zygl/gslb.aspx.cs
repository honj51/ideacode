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

public partial class ZiYuan_gslb : System.Web.UI.Page
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
                sql = string.Format("select top {0} * from sq8szxlx.user_gs where id not in(select top {1} id from sq8szxlx.user_gs)",
                    Request["limit"], Request.Params["start"]);
            }
            else if (iField != null)
            {
                sql = string.Format("select * from sq8szxlx.user_gs where 名称 like '%{0}%' ", iField);
            }
            else
            {
                sql = "select * from sq8szxlx.user_gs";
            }
            int count = (int)DBHelper.GetVar("select count(*) as total from sq8szxlx.user_gs");
            string data = DBHelper.GetResult(sql).ToJson();
            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", count);
            result = "{" + result + data + "}";
            Response.Write(result);    
            //SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.user_gs");          
            //Response.Write(Json.ToJson(r));
           
        }
        else if (action == "add")
        {
            //string s = Request.Params["成立日期"];
            //string[] a = s.Split('-');
            //string year = a[0];
            //string mouth = a[1];
            //string date = a[2];
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.user_gs", "id", true);
            //sql += string.Format(" ,成立日期_年='{0}',成立日期_月='{0}',成立日期_日='{0}'",year,mouth,date);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            //string s = Request.Params["成立日期"];
            //string[] a = s.Split('-');
            //string year = a[0];
            //string mouth = a[1];
            //string date = a[2];
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.user_gs", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.user_gs where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }

        Response.End();
    }
}
