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

public partial class ZuLin_zphtgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action =Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            string sql = "";
            string iFieldName = Request.Params["iFieldName"];
            string iFieldNo = Request.Params["iFieldNo"];
            string gyy = Request.Params["gyy"];
            string leix = Request.Params["leix"];

            if (Request.Params["start"] != null && Request["limit"] != null)
            {
                sql = string.Format("select top {0} * from sq8szxlx.zpgl where id not in (select top {1} id from sq8szxlx.zpgl)",
                    Request["limit"], Request.Params["start"]);
            }
            else if (iFieldName != null || iFieldNo != null || gyy != null || leix != null)
            {
                sql = string.Format("select * from sq8szxlx.zpgl where 客户名称 like '%{0}%' and 编码 like '%{1}%' and 所属工业园 like '%{2}%' and 房产类型 like '%{3}%'", iFieldName, iFieldNo, gyy,leix);
            }
            else
            {
                sql = "select * from sq8szxlx.zpgl";
            }
            SqlDataReader c = DBHelper.GetReader(string.Format("select count(*) as total from sq8szxlx.zpgl where 客户名称 like '%{0}%' and 编码 like '%{1}%' and 所属工业园 like '%{2}%' and 房产类型 like '%{3}%' ", iFieldName, iFieldNo, gyy, leix));
            if (!c.Read()) return;                
            SqlDataReader r = DBHelper.GetReader(sql);
            string data = Json.ToJson(r);
            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":",c.GetInt32(0));
            result = "{" + result + data + "}";
            Response.Write(result);
            
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
        else if (action == "fclx_list")
        {
            string sql = "select distinct 工业园名称 as gyyName from sq8szxlx.gyy_lb_fclx_lb ";
            SqlDataReader r = DBHelper.GetReader(sql);
            Response.Write(Json.ToJson(r));
            //string s = "[{\"empId\":\"402881e42986ea4b0129877fdb8e0004\",\"empName\":\"xxx\"},{\"empId\":\"402881e42986ea4b0129877fdb8e00252\",\"empName\":\"yyy\"}]";
            //Response.Write(s);
        }
        else if (action == "find_gyy_fclx")
        {
            string gyy = Request.Params["gyy"];
            string sql = string.Format("select 房产类型 as lx from sq8szxlx.gyy_lb_fclx_lb where 工业园名称='{0}'", gyy);
            SqlDataReader r = DBHelper.GetReader(sql);
            Response.Write(Json.ToJson(r));
        }
        else if (action == "edit_gdxfx") // 编辑固定消费项
        {
            string responseError = "{success: false}";
            string sql1 = string.Format("select * from zpgl where id='{0}'", Request.Params["id"]);
            RowObject r1 = DBHelper.GetRow(sql1);
            if (r1 == null)
            {
                Response.Write(responseError);
                Response.End();
                return;
            }
            string gyy_mc = r1["所属工业园"].ToString();
            string fclx = r1["房产类型"].ToString(); 
            
            string sql2 = string.Format("select * from gyy_lb_fclx_lb_xflx where 工业园名称='{0}' and 房产类型='{1}' order by 序号 asc",
                gyy_mc, fclx);
            ResultObject r2 = DBHelper.GetResult(sql2);
            foreach (var item in r2)
            {
                string htbh = item["编码"].ToString();
                string xfxm = item["消费项目"].ToString();
                string rq = r1["合同开始时间"].ToString();
                string sql3 = string.Format("select * from zpgl_lx_lb where 合同编号='{0}' and 消费项目='{1}'", htbh, xfxm);
                RowObject r3 = DBHelper.GetRow(sql3);
                string sql4 = string.Format("select * from user_sf_lb where 合同编号='{0}' and 收费项目='{1}' and  日期='{2}'", htbh, xfxm, rq);
                RowObject r4 = DBHelper.GetRow(sql4);
               
                
            }
        }
        Response.End();
    }
}
