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
        if (Session["admin_id"] == null) throw new SessionLostException();  
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            Response.Write(DBHelper.GetResult("select * from sq8szxlx.role").ToJson());
        }
        else if (action == "add")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.role", "id", true);
            DBHelper.ExecuteSql(sql);
            string sql_1 = string.Format("insert into sq8szxlx.role_lb (role_name) values ('{0}')", Request.Form["role_name"]);
            DBHelper.ExecuteSql(sql_1);
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

            RowObject row = DBHelper.GetRow(sql);
            if (row != null)
            {
                Response.Write(string.Format("{{ success:true,data: {0} }}", row.ToJson()));
            }
            else
            {
                Response.Write("{ success:false,errorMessage: 'data not found' }");
            }
        }
        else if (action == "updatePermissions")
        {
            string sql = "update sq8szxlx.role_lb  set ";
            string[] allFields = new string[] { "数据录入", "缴费管理", "工业园管理", "房产管理", "客户管理", "预定管理", "租凭合同管理", "合同到期提示", "收款分类统计", "收款详细统计", "角色权限", "管理员管理", "修改本身密码", "修改录入" };
            foreach (string item in allFields)
	        {
                string value = "0";
                if (Request.Params[item] !=null && Request.Params[item] == "on")
                {
                    value = "1";
                }
                    
                sql += item + "=" + value + ',';
	        }
            sql = sql.Substring(0, sql.Length - 1);
            sql += string.Format(" where id='{0}' and role_name='{1}'",Request.Params["id"],Request.Params["role_name"]);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        Response.End();
    }
}
