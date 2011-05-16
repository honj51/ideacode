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
using System.Text;
using System.Web.Script.Serialization;

public partial class SouFei_sjlr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;
        Response.ContentType = "application/json";
        Response.ContentEncoding = Encoding.UTF8;
            
        if (action == "list")
        {
            // 1. 拼Sql子语句
            string select = string.Format(@"select top {0} z.*,u.录入状态,u.缴费状态,(u.日期年+'/'+u.日期月) as 录入月份", Request["limit"]);
            string from = " from sq8szxlx.user_sf_zb u left join sq8szxlx.zpgl z on z.编码=u.合同编号 ";
            string where = string.Format(@"where u.日期年='{0}' and u.日期月='{1}' ", Request.Form["nian"], Request.Form["yue"]);
            if (!string.IsNullOrEmpty(Request.Params["mc"]))
            {
                where += string.Format(" and z.客户名称='{0}'", Request.Params["mc"]);
            }
            if (!string.IsNullOrEmpty(Request.Params["gyy"]))
            {
                where += string.Format(" and z.所属工业园='{0}'", Request.Params["gyy"]);
            }
            if (!string.IsNullOrEmpty(Request.Params["gyy_lx"]))
            {
                where += string.Format(" and z.房产类型='{0}'", Request.Params["gyy_lx"]);
            }
            if (!string.IsNullOrEmpty(Request.Params["hm"]))
            {
                where += string.Format(" and z.编码='{0}'", Request.Params["hm"]);
            }
            // 2. 获取总数
            SqlDataReader c = DBHelper.GetReader("select count(*) " + from + where);
            if (!c.Read()) return;
            // 3. 获取数据
            string sql = string.Format(@"{0} {1} {2} and u.id not in (select top {3} u.id {1} {2}) order by u.日期年,u.日期月,日期日",
                select, from, where, Request.Params["start"]);
            SqlDataReader exclude = DBHelper.GetReader(sql);
            SqlDataReader r = DBHelper.GetReader(sql);
            // 4. 拼装结果
            string data = Json.ToJson(r);
            string result = string.Format("success:true,totalProperty:{0},data:", c.GetInt32(0), sql);
            result = "{" + result + data + "}";
            Response.Write(result);
        }
        else if (action == "list_zb")
        {
            SqlDataReader r = DBHelper.GetReader(string.Format(@"select * from sq8szxlx.user_sf_zb where 合同编号='{0}'",Request.Form["htbh"]));            
            Response.Write(Json.ToJson(r));

            //
            r = DBHelper.GetReader(string.Format(@"select * from sq8szxlx.zpgl where 编码='{0}'", Request.Form["htbh"]));
            int year1 = r.GetInt32(r.GetOrdinal("合同开始时间_年"));
            int year2 = r.GetInt32(r.GetOrdinal("合同结束时间_年"));
            int month1 = r.GetInt32(r.GetOrdinal("合同开始时间_月"));
            int month2 = r.GetInt32(r.GetOrdinal("合同结束时间_月"));
            
            for (int i = year1; i <= year2; i++)
            {
                int j = 1;
                if (i == year1) j = month1;
                int j_max = 12;
                if (i == year2) j_max = month2;

                for (; j <= j_max; j++)
                {
                    JSONObject jo = new JSONObject();
                    
                }
            }
        }
        else if (action == "list_lb")
        {
            SqlDataReader r = DBHelper.GetReader(@"select top 10 * from sq8szxlx.user_sf_lb where 合同编号='ht2011391549226637' and 日期年='2010' and 日期月='3'");
            Response.Write(Json.ToJson(r));
        }
        Response.End();
    }

}
