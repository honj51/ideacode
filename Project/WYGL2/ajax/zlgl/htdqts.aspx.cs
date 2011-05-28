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

public partial class ZuLin_htdqts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;
        Response.ContentType = "application/json";

        string select = string.Format(@"select top {0} * ", Request["limit"]);
        string from = " from sq8szxlx.zpgl ";
        string where = " where 1=1 ";
        if (!string.IsNullOrEmpty(Request.Params["iFieldName"]))
        {
            where += string.Format(" and 客户名称 like '%{0}%' ", Request.Params["iFieldName"]);
        }
        if (!string.IsNullOrEmpty(Request.Params["iFieldNo"]))
        {
            where += string.Format(" and 编码 like '%{0}%' ", Request.Params["iFieldNo"]);
        }
        if (!string.IsNullOrEmpty(Request.Params["gyy"]))
        {
            where += string.Format(" and 所属工业园='{0}' ", Request.Params["gyy"]);
        }
        if (!string.IsNullOrEmpty(Request.Params["leix"]))
        {
            where += string.Format(" and 房产类型='{0}' ", Request.Params["leix"]);
        }

        // 2. 获取总数
        string count = DBHelper.GetVar("select count(*) " + from + where).ToString();
        if (count == null) return;

        string sql = string.Format(@"{0} {1} {2} and id not in (select top {3} id {1} {2})",
            select, from, where, Request.Params["start"]);
        // 4. 拼装结果
        string data = DBHelper.GetResult(sql).ToJson();

        string result = string.Format("success:true,totalProperty:{0},data:", count, sql);
        result = "{" + result + data + "}";
        Response.Write(result);

        Response.End();
    }
}
