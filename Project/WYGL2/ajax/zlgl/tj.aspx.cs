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
using System.Text;
using System.Diagnostics;

public partial class ajax_zygl_tj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["admin_id"] == null) throw new SessionLostException();  
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
        else if (action == "xfxm")
        {
            string gyy = Request.Params["gyy"];
            string fclx = Request.Params["fclx"];
            //string sql = string.Format("select 消费项目 as sfxm from sq8szxlx.gyy_lb_fclx_lb_xflx where 工业园名称='{0}' and 房产类型='{1}' ", gyy, fclx);
            string sql = " select distinct 消费项目 as sfxm from sq8szxlx.zpgl_lx_lb where 房产类型='厂房'";
            Response.Write(DBHelper.GetResult(sql).ToJson());
        }

        Response.End();
    }

    private void xxtj()
    {
//        string sql = string.Format(@"select u.*,z.编码,z.客户名称,z.所属工业园,z.所属房产,z.合同开始时间,z.合同结束时间 from sq8szxlx.user_sf_zb u left join sq8szxlx.zpgl z on 
//	        u.合同编号=z.编码 where u.缴费状态='已缴费' and not (z.所属工业园 is null)");
        string select = "select u.*,z.编码,z.客户名称,z.所属工业园,z.所属房产,z.合同开始时间,z.合同结束时间 ";
        string from = " from sq8szxlx.user_sf_zb u left join sq8szxlx.zpgl z on u.合同编号=z.编码 ";
        string where = string.Format(@" where u.日期年='{0}' and u.日期月='{1}' and u.缴费状态='已缴费' and not (z.所属工业园 is null) ", Request.Params["nian"], Request.Params["yue"]);
        if (Common.hasValue(Request.Params["iField"]))
        {
            where += string.Format(" and z.客户名称 like '%{0}%'", Request.Params["iField"]);
        }
        if (Common.hasValue(Request.Params["gyy"]))
        {
            where += string.Format(" and z.所属工业园='{0}'", Request.Params["gyy"]);    
        }
        if (Common.hasValue(Request.Params["gyy_lx"]))
        {
            where += string.Format(" and z.房产类型='{0}'", Request.Params["gyy_lx"]);
        }
        // 2. 获取总数
        //string count = DBHelper.GetVar("select count(*) " + from + where).ToString();
        //if (count == null) return;
        // 3. 获取数据
        //string sql = string.Format(@"{0} {1} {2} and u.id not in (select top {3} u.id {1} {2}) order by u.日期年,u.日期月,日期日",
         //   select, from, where, Request.Params["start"]);

        string sql = select + from + where;


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
        string gyy = Request.Params["gyy"];
        string gyy_fclx = Request.Params["gyy_lx"];
        string gyy_xfxm = Request.Params["xfxm"];
        string nian = Request.Params["nian"];
        string yue = Request.Params["yue"];
        bool xfxtj = Request.Params["xfxtj"]=="true"?true:false;

        // 1. 查询工业园
        string sql = string.Format("select * from sq8szxlx.gyy_lb ");
        if (Common.hasValue(gyy))
        {
            sql = string.Format("select * from sq8szxlx.gyy_lb where 工业园名称='{0}'", gyy);
        }
        string where_fclx = Common.hasValue(gyy_fclx) ? string.Format(" and z.房产类型='{0}'", gyy_fclx) : "";
        string where_xfxm = Common.hasValue(gyy_xfxm) ? string.Format(" and u.收费项目='{0}'", gyy_xfxm) : "";
        string where_nian = Common.hasValue(nian) ? string.Format(" and u.日期年='{0}'", nian) : "";
        string where_yue = Common.hasValue(yue) ? string.Format(" and u.日期月='{0}'", yue) : "";
        ResultObject gyy_lb = DBHelper.GetResult(sql);

        JSONArray ja = new JSONArray();
        int k = 0;
        for (int i = 0; i < gyy_lb.Count; i++)
        {
            RowObject row = gyy_lb[i];
            string gyy_mc = row["工业园名称"].ToString();
            string fclx =  Common.hasValue(gyy_fclx) ?gyy_fclx:"(全部)";
            string xfxm = Common.hasValue(gyy_xfxm) ? gyy_xfxm : "(全部)";
            string yf = Common.hasValue(yue) ? yue : "(全部)";
            if (xfxtj && !Common.hasValue(gyy_xfxm))
            {
                // 查询工业园所有消费项
                sql = string.Format(" select distinct 消费项目 as sfxm from sq8szxlx.zpgl_lx_lb where 房产类型='厂房' and 所属工业园='{0}'",gyy_mc);
                ResultObject zpgl_lx_lb = DBHelper.GetResult(sql);
                for (int j = 0; j < zpgl_lx_lb.Count; j++)
                {
                    k++;
                    RowObject row2 = zpgl_lx_lb[j];
                    where_xfxm = string.Format(" and u.收费项目='{0}'", row2["sfxm"]);
                    string sql_sf = string.Format(@"select sum(u.费用) as total from sq8szxlx.user_sf_lb u left join sq8szxlx.zpgl z on 
	                u.合同编号=z.编码 where z.所属工业园='{0}' {1} {2} {3} {4}", gyy_mc, where_fclx, where_xfxm, where_nian, where_yue);
                    object total = DBHelper.GetVar(sql_sf);
                    JSONObject jo = new JSONObject();
                    jo.Add("序号", k);
                    jo.Add("工业园名称", gyy_mc);
                    jo.Add("房产类型", fclx);
                    jo.Add("消费项目", row2["sfxm"]);
                    jo.Add("月份", yf);
                    jo.Add("费用", Math.Round(Convert.ToDouble(total), 0));
                    ja.Add(jo);
                }
            }
            else
            {
                // 2. 查询合同
                string sql_sf = string.Format(@"select sum(u.费用) as total from sq8szxlx.user_sf_lb u left join sq8szxlx.zpgl z on 
	                u.合同编号=z.编码 where z.所属工业园='{0}' {1} {2} {3} {4}", gyy_mc, where_fclx, where_xfxm, where_nian, where_yue);  
                object total = DBHelper.GetVar(sql_sf);
                JSONObject jo = new JSONObject();
                jo.Add("序号",i+1);
                jo.Add("工业园名称",gyy_mc);
                jo.Add("房产类型", fclx);
                jo.Add("消费项目", xfxm);
                jo.Add("月份",yf);
                jo.Add("费用", Math.Round(Convert.ToDouble(total), 0));
                ja.Add(jo);
            }

        }
        Response.Write(JSONConvert.SerializeArray(ja));
    }
}
