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

public partial class XiTong_jsqx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.role");
            Response.Write(Json.ToJson(r));

        }
        else if (action == "add")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.role", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.role", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.role where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "set")
        {
            string role_name = Request.Params["role_name"];
            string sql = string.Format("select * from sq8szxlx.role_lb where role_name='{0}' ", role_name);
            SqlDataReader r = DBHelper.GetReader(sql);

            if (r.Read())
            {
                string data = "{";
                for (int i = 0; i < r.FieldCount; i++)
                {
                    string name = r.GetName(i);
                    string value = r.GetValue(i).ToString();
                    data += name + ":'" + value + "',";
                }
                data = data.Substring(0, data.Length - 1);
                data += "}";
                Response.Write(string.Format("{{ success:true,data: {0} }}", data));
            }
            else
            {
                Response.Write("{ success:false,errorMessage: 'data not found' }");
            }
        }
        Response.End();
    }
}
