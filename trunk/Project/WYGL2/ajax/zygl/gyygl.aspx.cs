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
using System.Collections.Generic;
using System.Text;
using System.Web.UI.MobileControls;

public partial class ZiYuan_gyygl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null) throw new SessionLostException();  
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            Response.Write(DBHelper.GetResult("select * from sq8szxlx.gyy_lb").ToJson());    
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
            string id = Request.Form["id"];
            string sql1 = "select 工业园名称 from sq8szxlx.gyy_lb where id=" + id;
            string gyymc = DBHelper.GetVar(sql1).ToString();

            string sql2 = string.Format("delete from sq8szxlx.gyy_fc_lb where 工业园名称='{0}' ", gyymc);

            DBHelper.ExecuteSql(sql2);

            string sql3 = string.Format("delete from sq8szxlx.gyy_lb_fclx_lb_xflx where 工业园名称='{0}' ", gyymc);
            DBHelper.ExecuteSql(sql3);

            string sql4 = string.Format("delete from sq8szxlx.gyy_lb_fclx_lb where 工业园名称='{0}' ", gyymc);
            DBHelper.ExecuteSql(sql4);

            string sql = "delete from sq8szxlx.gyy_lb where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);

            Response.Write("{success: true}");   
        }
        else if (action == "lx_list")
        {   
            string  lx = Request.Params["find_id"];
            string sql = string.Format("select * from sq8szxlx.gyy_lb_fclx_lb where 工业园名称='{0}' ", lx);
            Response.Write(DBHelper.GetResult(sql).ToJson());     
        }
        else if (action == "addlx")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.gyy_lb_fclx_lb", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}"); 
        }
        else if (action == "deletelx")
        {
            string sql = "delete from sq8szxlx.gyy_lb_fclx_lb where id=" + Request.Params["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "updatelx")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.gyy_lb_fclx_lb", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}"); 
        }
        else if (action == "fcxf_list")
        {
            string gyyName = Request.Params["gyyName"];
            string fclx = Request.Params["fclx"];
            string sql = string.Format("select * from sq8szxlx.gyy_lb_fclx_lb_xflx where 工业园名称='{0}' and 房产类型='{1}'", gyyName, fclx);
            Response.Write(DBHelper.GetResult(sql).ToJson()); 
        }
        else if (action == "add_fcxf")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.gyy_lb_fclx_lb_xflx", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "delete_fcxf")
        {
            string sql = "delete from sq8szxlx.gyy_lb_fclx_lb_xflx where id=" + Request.Params["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        
        Response.End();
    }
}
