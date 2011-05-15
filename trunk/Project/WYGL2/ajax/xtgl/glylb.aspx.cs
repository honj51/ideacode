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
using System.Collections.Specialized;

public partial class XiTong_glylb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.admin_admin");
            Response.Write(Json.ToJson(r));

        }
        else if (action == "add")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.admin_admin", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            string md5 = Common.makeMD5(Request.Form["admin_pwd"]);
            Request.Form["admin_pwd"] = md5;
            NameValueCollection nvc = new NameValueCollection();
            foreach (var item in Request.Form)
            {
                NameValuePair p = new NameValuePair();
                
            }
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.admin_admin", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.admin_admin where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "updata_self")
        {
            string admin_id = (string)Session["admin_id"];
            string password = Request.Params["admin_pwd"];
            password = Common.makeMD5(password);
            if (admin_id != null)
            {
                string sql = string.Format("update sq8szxlx.admin_admin set admin_pwd='{0}' where admin_id='{1}' ", password, admin_id);
                DBHelper.ExecuteSql(sql);
                Response.Write("{success: true}");

            }            
        }
        Response.End();
    }
}
