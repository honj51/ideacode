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
            string sql = "";
            string where = getWhere("u.");
            if (Request.Params["start"] != null && Request["limit"] != null)
            {
                sql = string.Format(@"select top {0} z.*,u.录入状态,u.缴费状态 from sq8szxlx.user_sf_zb u
                    left join sq8szxlx.zpgl z on z.编码=u.合同编号 where {1} and u.id not in (select top {2} id from sq8szxlx.user_sf_zb where {3})",
                    Request["limit"], where, Request.Params["start"], getWhere(""));
            }
            else
            {
                sql = string.Format(@"select top 20 z.*,u.录入状态,u.缴费状态 from sq8szxlx.zpgl z
                    left join sq8szxlx.user_sf_zb u on z.编码=u.合同编号 where {0}",where);
            }
            SqlDataReader c = DBHelper.GetReader("select count(*) as total from sq8szxlx.zpgl");
            if (!c.Read()) return;
            SqlDataReader r = DBHelper.GetReader(sql);
            string data = Json.ToJson(r);
            string result = string.Format("success:true,totalProperty:{0},data:", c.GetInt32(0), sql);
            result = "{" + result + data + "}";
            Response.Write(result);
        }
        else if (action == "list_zb")
        {
            SqlDataReader r = DBHelper.GetReader(@"select * from sq8szxlx.user_sf_zb where 合同编号='ht2011391549226637'");
            Response.Write(Json.ToJson(r));
        }
        else if (action == "list_lb")
        {
            SqlDataReader r = DBHelper.GetReader(@"select top 10 * from sq8szxlx.user_sf_lb where 合同编号='ht2011391549226637' and 日期年='2010' and 日期月='3'");
            Response.Write(Json.ToJson(r));
        }
        Response.End();
    }

    private string getWhere(string prefix)
    {

        return string.Format(" {0}日期年='2011' and {0}日期月='5' ",prefix);
    }
}
