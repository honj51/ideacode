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

public partial class ZiYuan_gyygl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.HttpMethod != "POST")
        {
            return;
        }
        Response.ContentType = "application/json";

        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;


        if (action == "load_data")
        {
            System.Data.SqlClient.SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.gyy_lb");
            Response.Write(Json.ToJson(r));
            Response.End();
        }
        else if (action == "add")
        {
            string a = Request.Params["p"];
            string sql = jsonToSql(a);
            DBHelper.ExecuteSql(sql);
            string b = string.Format("{{success: true, msg: '{0}' }}", a);
            Response.Write(b);
            Response.End();
        }
    }

    private string jsonToSql(string a)
    {
        a = "{succes: ture, msg:'hello'}";
        JavaScriptSerializer s = new  JavaScriptSerializer();
        object o = s.DeserializeObject(a);
        
    }

}
