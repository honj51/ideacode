using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;

public partial class ajax_zygl_tj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;
        Response.ContentType = "application/json";
        Response.ContentEncoding = Encoding.UTF8;

        if (action == "fltj")
        {
            fltj();
        }
        else if (action == "xxtj")
        {
            xxtj();
        }

        Response.End();
    }

    private void xxtj()
    {
        string sql = string.Format(@"select u.*,z.编码,z.客户名称,z.所属工业园,z.所属房产,z.合同开始时间,z.合同结束时间 from sq8szxlx.user_sf_zb u left join sq8szxlx.zpgl z on 
	        u.合同编号=z.编码 where u.缴费状态='已缴费' and not (z.所属工业园 is null)");
        ResultObject user_sf_zb = DBHelper.GetResult(sql);
        JSONArray ja = new JSONArray();
        for (int i = 0; i < user_sf_zb.Count; i++)
        {
            RowObject row = user_sf_zb[i];
            JSONObject jo = new JSONObject();
            jo.Add("序号", i + 1);
            jo.Add("编码", row["编码"].ToString());
            jo.Add("客户名称", row["客户名称"].ToString());
            jo.Add("所属工业园", row["所属工业园"].ToString());
            jo.Add("所属房产", row["所属房产"].ToString());
            jo.Add("合同开始时间", row["合同开始时间"].ToString());
            jo.Add("合同结束时间", row["合同结束时间"].ToString());
            jo.Add("月份", row["日期月"].ToString());
            jo.Add("费用", row["总费用"].ToString());
            ja.Add(jo);
        }
        Response.Write(JSONConvert.SerializeArray(ja));
    }

    private void fltj()
    {
        // 1. 查询工业园
        string sql = string.Format("select * from sq8szxlx.gyy_lb");
        ResultObject gyy_lb = DBHelper.GetResult(sql);

        JSONArray ja = new JSONArray();
        for (int i = 0; i < gyy_lb.Count; i++)
        {
            RowObject row = gyy_lb[i];
            string gyy_mc = row["工业园名称"].ToString();
            string fclx = "全部";
            string xfxm = "全部";
            string yf = "全部";
            
            // 2. 查询合同
            string sql_sf = string.Format(@"select sum(u.总费用) as total from sq8szxlx.user_sf_zb u left join sq8szxlx.zpgl z on 
	            u.合同编号=z.编码 where z.所属工业园='{0}'", gyy_mc);
            string total = DBHelper.GetRow(sql_sf)["total"].ToString();
            JSONObject jo = new JSONObject();
            jo.Add("序号",i+1);
            jo.Add("工业园名称",gyy_mc);
            jo.Add("房产类型", fclx);
            jo.Add("消费项目", xfxm);
            jo.Add("月份",yf);
            jo.Add("费用",total);
            ja.Add(jo);
        }
        Response.Write(JSONConvert.SerializeArray(ja));
    }
}
