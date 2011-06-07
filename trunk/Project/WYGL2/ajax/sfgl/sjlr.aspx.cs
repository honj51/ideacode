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
            list2();
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

    private void list2()
    {
        // 1. 拼Sql子语句
        string select = string.Format("select top {0} * ", Request["limit"]);
        string from = " from sq8szxlx.zpgl ";
        string where = " where 合同开始时间< getdate() and 合同结束时间>getdate() ";
        string order = " order by 所属工业园,房产类型,所属房产 asc ";
        if (Common.hasValue(Request.Params["mc"]))
        {
            where += string.Format(" and 客户名称 like '%{0}%'", Request.Params["mc"]);
        }
        if (Common.hasValue(Request.Params["gyy"]))
        {
            where += string.Format(" and 所属工业园='{0}'", Request.Params["gyy"]);
        }
        if (Common.hasValue(Request.Params["gyy_lx"]))
        {
            where += string.Format(" and 房产类型='{0}'", Request.Params["gyy_lx"]);
        }
        if (Common.hasValue(Request.Params["hm"]))
        {
            where += string.Format(" and 编码 like '%{0}%'", Request.Params["hm"]);
        }
        // 2. 获取总数
        string count = DBHelper.GetVar("select count(*) " + from + where).ToString();
        if (count == null) return;

        // 3. 获取数据
        string sql = string.Format(@"{0} {1} {2} and id not in (select top {3} id {1} {2} {4}) {4}",
            select, from, where, Request.Params["start"], order);
        // 4. 拼装结果
        ResultObject ro = DBHelper.GetResult(sql);
        foreach (RowObject row in ro)
        {
            row["房产类型"] = row["所属房产"];
            row["合同结束时间"] = row["合同结束时间"] is DBNull ? "未签订合同" : row["合同结束时间"];
            row["录入月份"] = Request.Form["nian"] + "/" + Request.Form["yue"];

            sql = string.Format("select * from sq8szxlx.user_sf_zb where 合同编号='{0}' and 日期年='{1}' and 日期月='{2}'",row["编码"], Request.Form["nian"], Request.Form["yue"]);
            RowObject row2 = DBHelper.GetRow(sql);
            if (row2 != null)
            {
                row["录入状态"] = "已录入";
            }
            else
            {
                row["录入状态"] = "未录入";
            }
            if (row2 != null)
            {
                row["缴费状态"] = row2["缴费状态"];
            }
            else
            {
                row["缴费状态"] = "未缴费";
            }
            
        }
        string data = ro.ToJson();
        
        string result = string.Format("success:true,totalProperty:{0},data:", count, sql);
        result = "{" + result + data + "}";
        Response.Write(result);         
    }

    private void list_zb()
    {
        //取得合同开始结束时间
        RowObject r = DBHelper.GetRow(string.Format(@"select * from sq8szxlx.zpgl where 编码='{0}'", Request.Params["htbh"]));
        if (r==null)
        {
            Response.Write("success:false");
            Response.End();
            return;
        }

        int year1 = Int32.Parse(r["合同开始时间_年"].ToString());
        int year2 = Int32.Parse(r["合同结束时间_年"].ToString());
        int month1 = Int32.Parse(r["合同开始时间_月"].ToString());
        int month2 = Int32.Parse(r["合同结束时间_月"].ToString());
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
                string sql = string.Format(@"select * from sq8szxlx.user_sf_zb where 合同编号='{0}' and 日期年='{1}' and 日期月='{2}' order by id desc",
                    Request.Params["htbh"], i, j);
                r = DBHelper.GetRow(sql);
                jo.Add("年份月份", string.Format("{0}/{1}", i, j));
                if (r != null)
                {                    
                    jo.Add("id", r["id"]);
                    jo.Add("单据编号", r["单据编号"]);
                    jo.Add("总费用", (r["总费用"] is DBNull)?0: Math.Round(Convert.ToDecimal(r["总费用"]), 0));
                    jo.Add("缴费金额", r["缴费金额"]);
                    jo.Add("余额", r["余额"]);
                    jo.Add("录入状态", r["录入状态"]);
                    jo.Add("缴费状态", r["缴费状态"]);
                }
                else
                {
                    jo.Add("单据编号", "-");
                    jo.Add("总费用", "-");
                    jo.Add("缴费金额", "-");
                    jo.Add("余额", "-");
                    if (i == DateTime.Now.Year && j == DateTime.Now.Month)
                    {
                        jo.Add("录入状态", "未录入");
                        jo.Add("缴费状态", "未缴费");
                    }
                    else if (i > DateTime.Now.Year || (i == DateTime.Now.Year && j > DateTime.Now.Month))
                    {
                        jo.Add("录入状态", "不能录入");
                        jo.Add("缴费状态", "不能缴费");
                    }
                    else
                    {
                        jo.Add("录入状态", "未录入");
                        jo.Add("缴费状态", "未缴费");
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
            jo.Add("说明", row["说明"].ToString());
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
        result.Add("总金额", Math.Round(Convert.ToDecimal(user_sf_zb["总费用"]), 0));
        result.Add("上次结余", user_sf_zb["余额"]);
        result.Add("需要交费金额", Math.Round((zfy - ye), 0));
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

        ResultObject zpgl_lx_lb = DBHelper.GetResult(sql);
        int xh = int.Parse(Request.Params["xh"]);
        for (int i = 0; i < zpgl_lx_lb.Count; i++)
        {
            JSONObject jo = new JSONObject();
            RowObject row = zpgl_lx_lb[i];
            row["编号"] = i + 1;
            if (row["消费类型"].ToString() != "动态")
            {
                row["损耗"] = "-";
            }            

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

            if (pre_user_sf_zb["缴费状态"].ToString() == "已缴费" || pre_user_sf_zb["缴费状态"].ToString() == "不要交费")
            {
                row["滞纳金"] = 0;
            }
            row["上月读数"] = row["消费类型"].ToString() == "动态" ? pre_user_sf_lb["读数"] : "-";

            if (row["消费类型"].ToString() == "动态" || row["消费类型"].ToString() == "单价")
            {
                if (user_sf_lb !=null)
                {
                    row["读数"] = user_sf_lb["读数"];
                }
                else {
                    row["读数"] = "";                    
                }
            }
            else {
                row["读数"] = "-";                
            }
            row["读数输入"] = (user_sf_lb != null && user_sf_lb["录入状态"].ToString() == "已录入") ? "√" : "×";            
        }
        Response.Write(zpgl_lx_lb.ToJson());

    }

    private bool hasNumber(object o)
    {
        if (o == null || o.ToString() == "" || o.ToString() == "-")
        {
            return false;
        }
        return true;
    }

    private void lr_tj()
    {
        JArray ja1 = JArray.Parse(Request.Form["data"]);
        string year = Request.Params["year"];
        string month = Request.Params["month"];
        string responseError = "{success: false}";

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
        double zfy = 0;
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
            JToken jo = ja1[i]; // TODO: 要确定ja是否和查出数据一一对应
            string xflx = jo["消费类型"].ToString();

            RowObject item = zpgl_lx_lb[i];
            
            // user_sf_lb
            Dictionary<string, object> nv2 = new Dictionary<string, object>();
            nv2.Add("合同编号", htbh);
            nv2.Add("单据编号", htbh +"_"+ Request.Params["xh"]);
            nv2.Add("客户编号", khbm);
            nv2.Add("日期年", year);
            nv2.Add("日期月", month);
            nv2.Add("日期日", DateTime.Now.Day);
            nv2.Add("日期", DateTime.Now.ToShortDateString());
            nv2.Add("收费项目", jo["消费项目"].ToString());
            nv2.Add("收费类型", jo["消费类型"].ToString());
            nv2.Add("值", jo["值"].ToString());
            nv2.Add("录入状态", (xflx == "动态" && jo["读数"].ToString() == "") ? "未录入" : "已录入");// TODO: 正确?
            nv2.Add("缴费状态", "未缴费");

            nv2.Add("损耗", xflx == "动态" ? jo["损耗"] : 0);
            nv2.Add("读数", (xflx == "动态" || xflx == "单价") ? jo["读数"].ToString() : "0");
            nv2.Add("倍率", jo["倍率"]);
            nv2.Add("滞纳金", jo["滞纳金"]);
            //// 查询上月收费项目
            string sql_pre_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh - 1, item["消费项目"]);
            RowObject pre = DBHelper.GetRow(sql_pre_lb);
            double ds_sy = (pre != null && pre["读数"].ToString() != "-") ? Convert.ToDouble(pre["读数"].ToString()) : 0;
            double ds = hasNumber(jo["读数"]) ?  Convert.ToDouble(jo["读数"].ToString()):0;            
            double zi = hasNumber(jo["值"]) ?   Convert.ToDouble(jo["值"].ToString()):0;
            double znj = hasNumber(jo["滞纳金"]) ?  Convert.ToDouble(jo["滞纳金"].ToString()):0;
            double sh = hasNumber(jo["损耗"]) ?  Convert.ToDouble(jo["损耗"].ToString()):0;
            double bl = hasNumber(jo["倍率"]) ?  Convert.ToDouble(jo["倍率"].ToString()):0;
            double fy = -1;
            if (bl != 0)
            {
                if (xflx == "动态")
                {
                    fy = (ds - ds_sy) * zi * (1 +znj/100) * (1 + sh/100) * bl;
                }
                else if (xflx == "单价")
                {
                    fy = ds_sy * zi * (1+znj/100) * bl;
                }
                else if (xflx == "固定")
                {
                    fy = zi * (1+znj/100) * bl;
                }
                else if (xflx == "递增")
                {
                    fy = ( zi * (xh - 1)) * (1+znj/100) * bl;
                }
            }
            else
            {
                if (xflx == "动态")
                {
                    fy = (ds - ds_sy) * zi * (1+znj/100) * (1 - (-sh) / 100);
                }
                else if (xflx == "单价")
                {
                    fy = ds * zi * (1+znj/100);
                }
                else if (xflx == "固定")
                {
                    fy = zi * (1+znj/100);
                }
                else if (xflx == "递增")
                {
                    fy = ((zi)) * (xh - 1) * (1+znj/100);
                }
            }
            zfy += fy;
            nv2.Add("费用", fy == -1 ? '-' : fy);            
            nv2.Add("金额", 0);
            string sql4 = SqlBuilder.NameValueToSql(nv2, "sq8szxlx.user_sf_lb", "id", true);
            Debug.WriteLine(sql4);
            DBHelper.ExecuteSql(sql4);            
        }

        // user_sf_zb        
        Dictionary<string, object> nv3 = new Dictionary<string, object>();
        nv3.Add("合同编号", htbh);
        nv3.Add("单据编号", htbh + "_" + Request.Params["xh"]);
        nv3.Add("客户编号", khbm);
        nv3.Add("日期年", year);
        nv3.Add("日期月", month);
        nv3.Add("日期日", DateTime.Now.Day);
        nv3.Add("日期", DateTime.Now.ToShortDateString());
        nv3.Add("总费用", zfy);
        nv3.Add("缴费金额", 0);
        // 查询上月收费项目
        string sql5 = string.Format("select * from sq8szxlx.user_sf_zb where 单据编号='{0}_{1}'", htbh, int.Parse(Request.Params["xh"]) - 1);
        RowObject user_sf_zb = DBHelper.GetRow(sql5);
        nv3.Add("余额", user_sf_zb["余额"]);
        nv3.Add("录入状态", "已录入");
        nv3.Add("缴费状态", "未缴费");
        string sql6 = SqlBuilder.NameValueToSql(nv3, "sq8szxlx.user_sf_zb", "id", true);
        Debug.WriteLine(sql6);
        DBHelper.ExecuteSql(sql6);

        Response.Write("{success:true}");
    }

    private void jf_tj()
    {
        double jfje = double.Parse(Request.Params["缴费金额"]);
        double zfy = double.Parse(Request.Params["总费用"]);
        double syye = int.Parse(Request.Params["上次余额"]);
        int id = int.Parse(Request.Params["zbid"]);
        double ye = jfje - (zfy - syye);
        if (ye < 0)
        {
            Response.Write("{success:false, errorMessage:'缴费金额不对'}");
            Response.End();
            return;
        }
        string sql = string.Format("update sq8szxlx.user_sf_zb set 缴费金额={0},余额={1},缴费状态='已缴费' where id={2}", jfje, ye, id);
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

        // 本月消费总表
        sql1 = string.Format("select * from sq8szxlx.user_sf_zb where 单据编号='{0}_{1}'", zpgl["编码"], Request.Params["xh"]);
        RowObject user_sf_zb = DBHelper.GetRow(sql1);

        // 消费类型列表
        sql1 = string.Format("select * from sq8szxlx.zpgl_lx_lb where 合同编号='{0}' order by id asc", zpgl["编码"]);
        ResultObject zpgl_lx_lb = DBHelper.GetResult(sql1);
        int xh = int.Parse(Request.Params["xh"]);
        for (int i = 0; i < zpgl_lx_lb.Count; i++)
        {
            RowObject row = zpgl_lx_lb[i];
            row["编号"] = i + 1;
            row["收费项目"] = row["消费项目"];
            row["收费类型"] = row["消费类型"];                        
            row["损耗"] = row["消费类型"].ToString() == "动态" ? row["损耗"] : "-";
            
            // 查询收费列表
            string sql_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh, row["消费项目"]);
            RowObject user_sf_lb = DBHelper.GetRow(sql_lb);
            if (user_sf_lb == null) continue; // 没有收费该项目
            
            // 查询上月收费项目
            string sql_pre_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                zpgl["编码"], xh - 1, row["消费项目"]);
            RowObject r2 = DBHelper.GetRow(sql_pre_lb);
            row["上月读数"] = (row["消费类型"].ToString() == "动态" && r2 !=null)? r2["读数"] : "-";
            row["读数"]  = (row["消费类型"].ToString() == "动态" || row["消费类型"].ToString() == "单价") ? user_sf_lb["读数"] : "-";
            row["费用"] = user_sf_lb["费用"];            
        }        
        double zfy = Convert.ToDouble(user_sf_zb["总费用"]);
        double ye = Convert.ToDouble(user_sf_zb["余额"]);
        //JObject jo = new JObject(new JProperty("success","true"),
        //    new JProperty("data",zpgl_lx_lb),
        //    new JProperty("总金额",Math.Round(Convert.ToDecimal(user_sf_zb["总费用"]), 1)),
        //    new JProperty("上次结余",user_sf_zb["余额"]),
        //    new JProperty("需要交费金额",Math.Round((zfy - ye), 1)));
        //JSONObject result = new JSONObject();
        //result.Add("success", "true");
        //result.Add("data", zpgl_lx_lb);
        //result.Add("总金额", Math.Round(Convert.ToDecimal(user_sf_zb["总费用"]), 1));
        //result.Add("上次结余", user_sf_zb["余额"]);
        //result.Add("需要交费金额", Math.Round((zfy - ye), 1));
        //Response.Write(JSONConvert.SerializeObject(result));

        StringBuilder sb = new StringBuilder();
        sb.Append("{");
        sb.AppendFormat("success: true,");
        sb.AppendFormat("data:{0}," , zpgl_lx_lb.ToJson());
        sb.AppendFormat("总金额:{0},", Math.Round(Convert.ToDecimal(user_sf_zb["总费用"]), 0));
        sb.AppendFormat("上次结余:{0},", user_sf_zb["余额"]);
        sb.AppendFormat("需要交费金额:{0}", Math.Round((zfy - ye), 0));
        sb.Append("}");
        Response.Write(sb.ToString());        
    }

}
