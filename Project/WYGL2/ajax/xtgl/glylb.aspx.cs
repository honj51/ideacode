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
            Response.Write(DBHelper.GetResult("select * from sq8szxlx.admin_admin").ToJson());
        }
        else if (action == "add")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.admin_admin", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            NameValueCollection nvc = new NameValueCollection();
            for (int i = 0; i < Request.Form.Count;i++ )
            {
                if (Request.Form.GetKey(i) == "admin_pwd")
                {
                    string md5 = Common.MakeMD5(Request.Form.Get(i));
                    nvc.Add(Request.Form.GetKey(i), md5);
                }
                else
                    nvc.Add(Request.Form.GetKey(i), Request.Form.Get(i));
            }
            string sql = SqlBuilder.NameValueToSql(nvc, "sq8szxlx.admin_admin", "id", false);
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
            password = Common.MakeMD5(password);
            if (admin_id != null)
            {
                string sql = string.Format("update sq8szxlx.admin_admin set admin_pwd='{0}' where admin_id='{1}' ", password, admin_id);
                DBHelper.ExecuteSql(sql);
                Response.Write("{success: true}");

            }            
        }
        else if (action == "glygl_js")
        {
            Response.Write(DBHelper.GetResult("select role_name as js from sq8szxlx.role").ToJson());
        }
        
        Response.End();
    }
}
