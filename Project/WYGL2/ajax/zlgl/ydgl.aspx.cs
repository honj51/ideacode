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

public partial class ZuLin_ydgl : System.Web.UI.Page
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
                sql = string.Format("select top {0} * from sq8szxlx.zpgl where id not in(select top {1} id from sq8szxlx.zpgl)",
                    Request["limit"], Request.Params["start"]);
            }
            else
            {
                sql = "select * from sq8szxlx.zpgl where 1=1";
            }

            sql = " and 合同结束时间_年='' order by 客户名称 asc ";

            int count = (int)DBHelper.GetVar("select count(*) as total from sq8szxlx.zpgl");            

            ResultObject ro = DBHelper.GetResult(sql);
            //foreach (RowObject row in ro)
            //{
            //    string sj = row["合同开始时间"].ToString();
            //    sj = sj.Substring(0,sj.IndexOf(" "));

            //    row["合同开始时间"] = sj;
            //}
            string data = ro.ToJson();

            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", count);

            
            result = "{" + result + data + "}";
            Response.Write(result);    
            //SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.zpgl");
            //Response.Write(Json.ToJson(r));
        }
        else if (action == "add")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.zpgl", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            string sql = SqlBuilder.NameValueToSql(Request.Form, "sq8szxlx.zpgl", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.zpgl where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        Response.End();
    }
}
