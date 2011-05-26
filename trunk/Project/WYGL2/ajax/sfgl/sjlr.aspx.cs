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
using System.Diagnostics;
using System.Collections.Generic;
using Newtonsoft.Json.Linq;
using System.Collections.Specialized;

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
            list();
        }
        else if (action == "list_zb")
        {
            list_zb();
        }
        else if (action == "list_lb")
        {
            list_lb();
        }
        else if (action == "list_lr") // 录入  http://www.szxlxtz.com/sfgl/sjlr_xq_lb.asp?id=129&ny=2010&yy=6&xh=5&page=6
        {
            list_lr();
        }
        else if (action == "lr_tj")  // 录入提交
        {
            lr_tj();
        }
        else if (action == "list_jf") // 缴费 http://www.szxlxtz.com/sfgl/jf_xq_lb.asp?id=113&ny=2011&yy=2&xh=3&page=1
        {
            list_jf();
        }
        // 缴费提交
        // 提交页面:     http://rd02:81/wygl/sfgl/jf_xq_lb.asp?action=tj&Operation=tj&id=113&xh=3&uid=806&page=1
        // 提交成功后返回 http://rd02:81/wygl/sfgl/jfxq.asp?id=113&ny=2011&yy=2&xh=3&page=1
        else if (action == "jf_tj") 
        {
            jf_tj();
        }
        Response.End();
    }

    private void list()
    {
        // 1. 拼Sql子语句
        string select = string.Format(@"select top {0} z.*,uz.联系电话,uz.联系地址,u.录入状态,u.缴费状态,(u.日期年+'/'+u.日期月) as 录入月份", Request["limit"]);
        string from = " from sq8szxlx.user_sf_zb u left join sq8szxlx.zpgl z on z.编码=u.合同编号 left join sq8szxlx.user_zrr uz on u.客户编号=uz.编码 ";
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
        Debug.WriteLine("sjlr.aspx: list sql=" + sql);
        SqlDataReader exclude = DBHelper.GetReader(sql);
        SqlDataReader r = DBHelper.GetReader(sql);
        // 4. 拼装结果
        string data = Json.ToJson(r);
        string result = string.Format("success:true,totalProperty:{0},data:", c.GetInt32(0), sql);
        result = "{" + result + data + "}";
        Response.Write(result);
    }

    private void list_zb()
    {
        //取得合同开始结束时间
        SqlDataReader r = DBHelper.GetReader(string.Format(@"select * from sq8szxlx.zpgl where 编码='{0}'", Request.Params["htbh"]));
        if (!r.Read())
        {
            Response.Write("success:false");
            Response.End();
            return;
        }

        int year1 = Int32.Parse(r.GetString(r.GetOrdinal("合同开始时间_年")));
        int year2 = Int32.Parse(r.GetString(r.GetOrdinal("合同结束时间_年")));
        int month1 = Int32.Parse(r.GetString(r.GetOrdinal("合同开始时间_月")));
        int month2 = Int32.Parse(r.GetString(r.GetOrdinal("合同结束时间_月")));
        int no = 1;
        JSONArray ja = new JSONArray();
        for (int i = year1; i <= year2; i++)
        {
            int j = 1;
            if (i == year1) j = month1;
            int j_max = 12;
            if (i == year2) j_max = month2;

            for (; j <= j_max; j++)
            {
                JSONObject jo = new JSONObject();
                jo.Add("序号", no);
                no++;
                // 读取总表数据
                r = DBHelper.GetReader(string.Format(@"select * from sq8szxlx.user_sf_zb 
                            where 合同编号='{0}' and 日期年='{1}' and 日期月='{2}'",
                    Request.Params["htbh"], i, j));
                jo.Add("年份月份", string.Format("{0}/{1}", i, j));
                if (r.Read())
                {
                    jo.Add("id", r.GetInt32(r.GetOrdinal("id")));
                    jo.Add("单据编号", r.GetString(r.GetOrdinal("单据编号")));
                    jo.Add("总费用", r.GetDecimal(r.GetOrdinal("总费用")));
                    jo.Add("缴费金额", r.GetDecimal(r.GetOrdinal("缴费金额")));
                    jo.Add("余额", r.GetDecimal(r.GetOrdinal("余额")));
                    jo.Add("录入状态", r.GetString(r.GetOrdinal("录入状态")));
                    jo.Add("缴费状态", r.GetString(r.GetOrdinal("缴费状态")));
                }
                else
                {
                    jo.Add("id", "-");
                    jo.Add("单据编号", "-");
                    jo.Add("总费用", "-");
                    jo.Add("缴费金额", "-");
                    jo.Add("余额", "-");
                    if (i > DateTime.Now.Year || (i == DateTime.Now.Year && j > DateTime.Now.Month))
                    {
                        jo.Add("录入状态", "不能录入");
                        jo.Add("缴费状态", "不能缴费");
                    }
                    else
                    {
                        jo.Add("录入状态", "-");
                        jo.Add("缴费状态", "-");
                    }
                }
                ja.Add(jo);
            }
        }
        string ret = JSONConvert.SerializeArray(ja);
        Response.Write(ret);
    }

    private void list_lb()
    {
        JSONArray ja = new JSONArray();
        // 根据单据编号查询收费项目列表
        string sql_lb = string.Format(@"select ROW_NUMBER() OVER (ORDER BY u.id) as 序号,u.*,z.说明 
            from sq8szxlx.user_sf_lb u left join sq8szxlx.zpgl_lx_lb z on 
            (u.合同编号=z.合同编号 and z.消费项目=u.收费项目 and z.消费类型=u.收费类型)
                where u.单据编号='{0}' and not (u.收费项目 is null)", Request.Params["djbh"]);
        Debug.WriteLine(string.Format("sql_lb={0}", sql_lb));
        ResultObject r = DBHelper.GetResult(sql_lb);

        // 本月消费总表
        string sql1 = string.Format("select * from sq8szxlx.user_sf_zb where 单据编号='{0}'", Request.Params["djbh"]);
        RowObject user_sf_zb = DBHelper.GetRow(sql1);
        int preNo = int.Parse(Request.Params["djbh"].Split('_')[1]) - 1;
        // 合同信息
        sql1 = string.Format("select * from sq8szxlx.zpgl where 编码='{0}'", user_sf_zb["合同编号"]);
        RowObject zpgl = DBHelper.GetRow(sql1);

        for (int i = 0; i < r.Count; i++)
        {
            RowObject row = r[i];
            // 查询上月收费项目
            string sql_pre_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                row["合同编号"], preNo, row["收费项目"]);
            Debug.WriteLine(string.Format("sql_pre_lb={0}", sql_pre_lb));
            RowObject row2 = DBHelper.GetRow(sql_pre_lb);
            double syds = -1;
            if (row2 != null)
            {                
                syds = Convert.ToDouble(row2["读数"]);
            }
            JSONObject jo = new JSONObject();
            jo.Add("序号", row["序号"]);
            string sflx = row["收费类型"].ToString();
            double sh = Convert.ToDouble(row["损耗"]);
            double bl = Convert.ToDouble(row["倍率"]);
            double byds = Convert.ToDouble(row["读数"]);

            jo.Add("收费项目", row["收费项目"]);
            if (sflx == "动态" && syds > -1) jo.Add("上月读数", syds); else jo.Add("上月读数", "-");
            if (sflx == "动态" || sflx == "单价") jo.Add("本月读数", byds); else jo.Add("本月读数", "-");
            jo.Add("倍率", bl);

            //损耗
            if (sflx == "动态") jo.Add("损耗", sh); else jo.Add("损耗", "-");

            //总量
            string zl = "-";
            if (bl == 0)
            {
                if (sflx == "动态" && syds > -1)
                {
                    double dsc = byds - syds;
                    zl = (dsc * (1 - (-bl / 100))).ToString();
                }
                else if (sflx == "单价")
                {
                    zl = byds.ToString();
                }
            }
            else
            {
                if (sflx == "动态" && syds > -1)
                {
                    double dsc = byds - syds;
                    zl = (dsc * (1 - (-bl / 100)) * bl).ToString();
                }
                else if (sflx == "单价")
                {
                    zl = (byds * bl).ToString();
                }
            }
            jo.Add("总量", zl);
            jo.Add("值", row["值"]);
            jo.Add("滞纳金", row["滞纳金"]);
            jo.Add("费用", row["费用"]);
            jo.Add("说明", row["说明"]);
            ja.Add(jo);
        }
        
        JSONObject result = new JSONObject();
        double zfy = Convert.ToDouble(user_sf_zb["总费用"]);
        double ye = Convert.ToDouble(user_sf_zb["余额"]);
        result.Add("success", "true");
        result.Add("data", ja);
        // 合同信息
        result.Add("合同编号", user_sf_zb["合同编号"]);
        result.Add("客户编码", zpgl["客户编码"]);
        result.Add("客户名称", zpgl["客户名称"]);
        result.Add("所属工业园", zpgl["所属工业园"]);
        result.Add("房产类型", zpgl["房产类型"]);
        result.Add("所属房产", zpgl["所属房产"]);
        // 收费信息
        result.Add("总金额", user_sf_zb["总费用"]);
        result.Add("上次结余", user_sf_zb["余额"]);
        result.Add("需要交费金额", zfy - ye);
        Response.Write(JSONConvert.SerializeObject(result));
    }

    private void list_lr()
    {
        string responseError = "{success: false}";
        string sql1 = string.Format("select * from sq8szxlx.zpgl where id='{0}'", Request.Params["id"]);
        RowObject zpgl = DBHelper.GetRow(sql1);
        if (zpgl == null)
        {
            Response.Write(responseError);
            Response.End();
            return;
        }
        string sql = string.Format("select * from sq8szxlx.zpgl_lx_lb where 合同编号='{0}' order by id asc", zpgl["编码"]);
        JSONArray ja = new JSONArray();

        ResultObject zpgl_lx_lb = DBHelper.GetResult(sql);
        int xh = int.Parse(Request.Params["xh"]);
        for (int i = 0; i < zpgl_lx_lb.Count; i++)
        {
            JSONObject jo = new JSONObject();
            RowObject row = zpgl_lx_lb[i];
            jo.Add("编号", i + 1);
            jo.Add("消费项目", row["消费项目"]);
            jo.Add("消费类型", row["消费类型"]);
            jo.Add("值", row["值"]);
            jo.Add("倍率", row["倍率"]);
            jo.Add("损耗", row["消费项目"] == "动态" ? row["损耗"] : "-");

            // 查询收费列表
            string sql_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh, row["消费项目"]);
            RowObject user_sf_lb = DBHelper.GetRow(sql_lb);

            // 查询上月消费总表
            string sql_pre_zb = string.Format("select * from sq8szxlx.user_sf_zb where 单据编号='{0}_{1}'", zpgl["编码"], xh - 1);
            RowObject pre_user_sf_zb = DBHelper.GetRow(sql_pre_zb);
            // 查询上月收费列表
            string pre_sql_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh - 1, row["消费项目"]);
            RowObject pre_user_sf_lb = DBHelper.GetRow(pre_sql_lb);

            jo.Add("滞纳金", (pre_user_sf_zb["缴费状态"] == "已缴费" || pre_user_sf_zb["缴费状态"] == "不要交费") ? 0 : row["滞纳金"]);
            jo.Add("上月读数", row["消费类型"] == "动态" ? pre_user_sf_lb["读数"] : "-");
            jo.Add("读数", (row["消费类型"] == "动态" || row["消费类型"] == "单价") ? row["读数"] : "");
            jo.Add("说明", row["说明"]);
            jo.Add("读数输入", user_sf_lb["录入状态"] == "已录入" ? "√" : "×");
            ja.Add(jo);
        }
        Response.Write(JSONConvert.SerializeArray(ja));

    }

    private void lr_tj()
    {
        JArray ja1 = JArray.Parse(Request.Form["data"]);
        string responseError = "{success: false}";

        //JSONArray ja = JSONConvert.DeserializeArray(Request.Form["data"]);
        string sql1 = string.Format("select * from sq8szxlx.zpgl where id='{0}'", Request.Params["htid"]);
        RowObject zpgl = DBHelper.GetRow(sql1);
        if (zpgl == null)
        {
            Response.Write(responseError);
            Response.End();
            return;
        }

        string gyy_mc = zpgl["所属工业园"].ToString();
        string fclx = zpgl["房产类型"].ToString();
        string ssfc = zpgl["所属房产"].ToString();
        string htbh = zpgl["编码"].ToString();
        string khbm = zpgl["客户编码"].ToString();
        string khmc = zpgl["客户名称"].ToString();
        int xh = Convert.ToInt32(Request.Params["xh"]);
        // 清除数据
        sql1 = string.Format("delete from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}'", htbh, xh);
        DBHelper.ExecuteSql(sql1);
        sql1 = string.Format("delete from sq8szxlx.user_sf_zb where 单据编号='{0}_{1}'", htbh, xh);
        DBHelper.ExecuteSql(sql1);
        // 新增数据
        string sql2 = string.Format("select * from sq8szxlx.zpgl_lx_lb where 合同编号='{0}' order by id asc", zpgl["编码"]);
        ResultObject zpgl_lx_lb = DBHelper.GetResult(sql2);
        for (int i = 0; i < zpgl_lx_lb.Count; i++)
        {
            //JSONObject jo = (JSONObject)ja[i];                
            JToken jo = ja1[i]; // TODO: 要确定ja是否和查出数据一一对应
            string xflx = jo["消费类型"].ToString();

            RowObject item = zpgl_lx_lb[i];

            // user_sf_lb
            Dictionary<string, object> nv2 = new Dictionary<string, object>();
            nv2.Add("合同编号", htbh);
            nv2.Add("单据编号", htbh + Request.Params["xh"]);
            nv2.Add("客户编号", khbm);
            nv2.Add("日期年", Request.Params["ny"]);
            nv2.Add("日期月", Request.Params["yy"]);
            nv2.Add("日期日", Request.Params["ny"]);
            nv2.Add("日期", DateTime.Now.ToShortDateString());
            nv2.Add("收费项目", Request.Params["消费项目"]);
            nv2.Add("收费类型", Request.Params["消费类型"]);
            nv2.Add("值", Request.Params["值"]);
            nv2.Add("录入状态", (xflx == "动态" && jo["读数"].ToString() == "") ? "未录入" : "已录入");// TODO: 正确?
            nv2.Add("缴费状态", "未缴费");

            nv2.Add("损耗", xflx == "动态" ? jo["损耗"] : 0);
            nv2.Add("读数", (xflx == "动态" || xflx == "单价") ? jo["读数"].ToString() : "0");
            nv2.Add("倍率", jo["倍率"]);
            nv2.Add("滞纳金", jo["滞纳金"]);
            //// 查询上月收费项目
            string sql_pre_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh - 1, item["消费类型"]);
            RowObject pre = DBHelper.GetRow(sql_pre_lb);
            double ds = Convert.ToDouble(jo["读数"].ToString());
            double ds_sy = Convert.ToDouble(pre["读数"].ToString());
            double zi = Convert.ToDouble(jo["值"].ToString());
            double znj = Convert.ToDouble(jo["滞纳金"].ToString());
            double sh = Convert.ToDouble(jo["损耗"].ToString());
            double bl = Convert.ToDouble(jo["倍率"].ToString());
            double fy = -1;
            if (bl != 0)
            {
                if (xflx == "动态")
                {
                    fy = (ds - ds_sy) * zi * (1 - (-znj) / 100) * (1 - (-sh) / 100) * bl;
                }
                else if (xflx == "单价")
                {
                    fy = ds_sy * zi * (1 - (-znj) / 100) * bl;
                }
                else if (xflx == "固定")
                {
                    fy = zi * (1 - (-znj) / 100) * bl;
                }
                else if (xflx == "递增")
                {
                    fy = (Convert.ToDouble(item["费用"]) - (-zi) * (xh - 1)) * (1 - (-znj) / 100) * bl;
                }
            }
            else
            {
                if (xflx == "动态")
                {
                    fy = (ds - Convert.ToDouble(item["读数"])) * zi * (1 - (-znj) / 100) * (1 - (-sh) / 100);
                }
                else if (xflx == "单价")
                {
                    fy = Convert.ToDouble(item["读数"]) * zi * (1 - (-znj) / 100);
                }
                else if (xflx == "固定")
                {
                    fy = zi * (1 - (-znj) / 100);
                }
                else if (xflx == "递增")
                {
                    fy = (Convert.ToDouble(item["费用"]) - (-zi)) * (xh - 1) * (1 - (-znj) / 100);
                }
            }
            nv2.Add("费用", fy == -1 ? '-' : fy);
            int zfy = Convert.ToInt32(item["费用"]); // TODO:
            nv2.Add("金额", 0);
            string sql4 = SqlBuilder.NameValueToSql(nv2, "sq8szxlx.user_sf_lb", "id", true);
            DBHelper.ExecuteSql(sql4);
            // user_sf_zb
            Dictionary<string, object> nv3 = new Dictionary<string, object>();
            nv3.Add("合同编号", htbh);
            nv3.Add("单据编号", htbh + Request.Params["xh"]);
            nv3.Add("客户编号", khbm);
            nv3.Add("日期年", Request.Params["ny"]);
            nv3.Add("日期月", Request.Params["yy"]);
            nv3.Add("日期日", Request.Params["ny"]);
            nv3.Add("日期", DateTime.Now.ToShortDateString());
            nv3.Add("总费用", zfy);
            nv3.Add("缴费金额", 0);
            // 查询上月收费项目
            sql4 = string.Format("select * from user_sf_zb where 单据编号='{0}_{1}'", htbh, int.Parse(Request.Params["xh"]) - 1);
            RowObject r4 = DBHelper.GetRow(sql4);
            nv3.Add("余额", r4["余额"]);
            nv3.Add("录入状态", "已录入");
            nv3.Add("缴费状态", "未缴费");
            string sql5 = SqlBuilder.NameValueToSql(nv3, "sq8szxlx.user_sf_zb", "id", true);
            DBHelper.ExecuteSql(sql5);
        }

        Response.Write("{success:true}");
    }

    private void jf_tj()
    {
        int jfje = int.Parse(Request.Params["缴费金额"]);
        int zfy = int.Parse(Request.Params["总费用"]);
        int ye = int.Parse(Request.Params["余额"]);
        int id = int.Parse(Request.Params["zbid"]);
        if (jfje - zfy - ye < 0)
        {
            Response.Write("{success:false, errorMessage:'缴费金额不对'}");
            Response.End();
            return;
        }
        string sql = string.Format("update sq8szxlx.user_sf_zb set 缴费金额={0},余额={1},缴费状态='已缴费' where id={2}", jfje, jfje - zfy - ye, id);
        DBHelper.ExecuteSql(sql);
        Response.Write("{success: true}");
    }

    private void list_jf() {
        string responseError = "{success: false}";
        string sql1 = string.Format("select * from sq8szxlx.zpgl where id='{0}'", Request.Params["id"]);
        RowObject zpgl = DBHelper.GetRow(sql1);
        if (zpgl == null)
        {
            Response.Write(responseError);
            Response.End();
            return;
        }
        JSONArray ja = new JSONArray();

        // 本月消费总表
        sql1 = string.Format("select * from sq8szxlx.user_sf_zb where 单据编号='{0}_{1}'", zpgl["编码"], Request.Params["xh"]);
        RowObject user_sf_zb = DBHelper.GetRow(sql1);

        // 消费类型列表
        sql1 = string.Format("select * from sq8szxlx.zpgl_lx_lb where 合同编号='{0}' order by id asc", zpgl["编码"]);
        ResultObject zpgl_lx_lb = DBHelper.GetResult(sql1);
        int xh = int.Parse(Request.Params["xh"]);
        for (int i = 0; i < zpgl_lx_lb.Count; i++)
        {
            JSONObject jo = new JSONObject();
            RowObject row = zpgl_lx_lb[i];
            jo.Add("编号", i + 1);
            jo.Add("收费项目", row["消费项目"]);
            jo.Add("收费类型", row["消费类型"]);
            jo.Add("值", row["值"]);
            jo.Add("倍率", row["倍率"]);
            jo.Add("损耗", row["消费类型"] == "动态" ? row["损耗"] : "-");
            jo.Add("滞纳金", row["滞纳金"]);
            // 查询收费列表
            string sql_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh, row["消费项目"]);
            RowObject user_sf_lb = DBHelper.GetRow(sql_lb);

            // 查询上月收费项目
            string sql_pre_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh - 1, row["消费类型"]);
            RowObject r2 = DBHelper.GetRow(sql_pre_lb);
            jo.Add("上月读数", row["消费类型"] == "动态" ? r2["读数"] : "-");
            jo.Add("读数", (row["消费类型"] == "动态" || row["消费类型"] == "单价") ? user_sf_lb["读数"] : "-");
            jo.Add("费用", user_sf_lb["费用"]);
            jo.Add("说明", row["说明"]);
            ja.Add(jo);
        }
        JSONObject result = new JSONObject();
        double zfy = Convert.ToDouble(user_sf_zb["总费用"]);
        double ye = Convert.ToDouble(user_sf_zb["余额"]);
        result.Add("success", "true");
        result.Add("data", ja);
        result.Add("总金额", user_sf_zb["总费用"]);
        result.Add("上次结余", user_sf_zb["余额"]);
        result.Add("需要交费金额", zfy - ye);
        Response.Write(JSONConvert.SerializeObject(result));
    }

}
