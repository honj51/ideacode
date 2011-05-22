﻿using System;
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
using System.Diagnostics;

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
                        Request.Params["htbh"],i,j));
                    jo.Add("年份月份", string.Format("{0}/{1}", i, j));
                    if (r.Read())
                    {
                        jo.Add("单据编号", r.GetString(r.GetOrdinal("单据编号")));
                        jo.Add("总费用", r.GetDecimal(r.GetOrdinal("总费用")));
                        jo.Add("缴费金额", r.GetDecimal(r.GetOrdinal("缴费金额")));
                        jo.Add("余额", r.GetDecimal(r.GetOrdinal("余额")));
                        jo.Add("录入状态", r.GetString(r.GetOrdinal("录入状态")));
                        jo.Add("缴费状态", r.GetString(r.GetOrdinal("缴费状态")));
                    }
                    else
                    {
                        jo.Add("单据编号", "-");
                        jo.Add("总费用", "-");
                        jo.Add("缴费金额", "-");
                        jo.Add("余额", "-");
                        if (i > DateTime.Now.Year || (i == DateTime.Now.Year && j > DateTime.Now.Month))
                        {
                            jo.Add("录入状态", "不能录入");
                            jo.Add("缴费状态", "不能缴费");
                        }
                        else {
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
        else if (action == "list_lb")
        {
            JSONArray ja = new JSONArray();
            // 根据单据编号查询收费项目列表
            string sql_lb = string.Format(@"select ROW_NUMBER() OVER (ORDER BY id) as 序号,* from sq8szxlx.user_sf_lb 
                where 单据编号='{0}' and not (收费项目 is null)", Request.Params["djbh"]);
            Debug.WriteLine(string.Format("sql_lb={0}",sql_lb));
            SqlDataReader r = DBHelper.GetReader(sql_lb);
            int preNo = int.Parse(Request.Params["djbh"].Split('_')[1])-1;
            while (r.Read())
            {
                // 查询上月收费项目
                string sql_pre_lb = string.Format(@"select * from sq8szxlx.user_sf_lb where 单据编号='{0}_{1}' and 收费项目='{2}'",
                    r.GetString(r.GetOrdinal("合同编号")), preNo, r.GetString(r.GetOrdinal("收费项目")));
                Debug.WriteLine(string.Format("sql_pre_lb={0}", sql_pre_lb));
                SqlDataReader r2 = DBHelper.GetReader(sql_pre_lb);
                double syds = -1;
                if (r2.Read())
                {
                    syds = r2.GetDouble(r2.GetOrdinal("读数"));
                }
                JSONObject jo = new JSONObject();
                jo.Add("序号", r.GetInt64(r.GetOrdinal("序号")));
                string sflx = r.GetString(r.GetOrdinal("收费类型"));
                double sh = r.GetDouble(r.GetOrdinal("损耗"));
                double bl = r.GetDouble(r.GetOrdinal("倍率"));
                double byds = r.GetDouble(r.GetOrdinal("读数"));
                
                jo.Add("收费项目", r.GetString(r.GetOrdinal("收费项目")));
                if (sflx == "动态" && syds>-1) jo.Add("上月读数", syds); else jo.Add("上月读数", "-");
                if (sflx == "动态" || sflx == "单价") jo.Add("本月读数", byds); else jo.Add("本月读数", "-");
                jo.Add("倍率", bl);

                //损耗
                if (sflx == "动态") jo.Add("损耗", sh); else jo.Add("损耗", "-");                  

                //总量
                string zl = "-"; 
                if (bl == 0)
                {
                    if (sflx == "动态" && syds>-1)
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
                    if (sflx == "动态" && syds>-1)
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
                jo.Add("值", r.GetDouble(r.GetOrdinal("值")));
                jo.Add("滞纳金", r.GetDouble(r.GetOrdinal("滞纳金")));
                jo.Add("费用", r.GetDecimal(r.GetOrdinal("费用")));
                ja.Add(jo);
            }
            string ret = JSONConvert.SerializeArray(ja);
            Response.Write(ret);
        }
        else if (action == "list_lr") // 录入  http://www.szxlxtz.com/sfgl/sjlr_xq_lb.asp?id=129&ny=2010&yy=6&xh=5&page=6
        {

        }
        else if (action == "lr_tj")  // 录入提交
        {

        }
        else if (action == "list_jf") // 缴费 http://www.szxlxtz.com/sfgl/jf_xq_lb.asp?id=113&ny=2011&yy=2&xh=3&page=1
        {

        }
        // 缴费提交
        // 提交页面: http://rd02:81/wygl/sfgl/jf_xq_lb.asp?action=tj&Operation=tj&id=113&xh=3&uid=806&page=1
        // 提交成功后返回 http://rd02:81/wygl/sfgl/jfxq.asp?id=113&ny=2011&yy=2&xh=3&page=1
        else if (action == "lr_tj") 
        {
            int jfje = int.Parse(Request.Params["缴费金额"]);
            int zfy = int.Parse(Request.Params["总费用"]);
            int ye = int.Parse(Request.Params["余额"]);
            if (jfje-zfy-ye<0)
            {
                Response.Write("{success:false, errorMessage:'缴费金额不对'}");
                Response.End();
                return;
            }


        }
        Response.End();
    }

}
