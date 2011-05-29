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

public partial class ZiYuan_fcgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;
        Response.ContentType = "application/json";

        if (action == "list")
        {
            string sql = "";
            if (Request.Params["start"] != null && Request["limit"] != null)
            {
                sql = string.Format("select top {0} * from sq8szxlx.gyy_fc_lb where id not in(select top {1} id from sq8szxlx.gyy_fc_lb)",
                    Request["limit"],Request.Params["start"]);
            }
            else
            {
                sql = "select * from sq8szxlx.gyy_fc_lb";   
            }
            sql += " order by id desc ";
            int count = (int)DBHelper.GetVar("select count(*) as total from sq8szxlx.gyy_fc_lb");
            string data = DBHelper.GetResult(sql).ToJson();
            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", count);
            result = "{" + result + data + "}";
            Response.Write(result);    
        }else if (action == "add")
        {
            Dictionary<string, object> dict = Common.CopyFormToDict(Request.Form);
            dict["状态"] = "未租";
            dict["业主"] = "无";
            dict["create_date"] = DateTime.Now;

            string sql = SqlBuilder.NameValueToSql(dict, "sq8szxlx.gyy_fc_lb", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.gyy_fc_lb", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");   
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.gyy_fc_lb where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }

        Response.End();
    }
}
