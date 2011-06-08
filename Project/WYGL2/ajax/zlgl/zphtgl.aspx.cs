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
using System.Collections.Specialized;
using System.Collections.Generic;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public partial class ZuLin_zphtgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action =Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            string select = string.Format(@"select top {0} * ", Request["limit"]);
            string from = " from sq8szxlx.zpgl ";
            string where = " where 合同结束时间_年 is not null ";
            string order = " order by 所属工业园,房产类型,所属房产 asc ";
            if (Common.hasValue(Request.Params["iFieldName"]))
            {
                where += string.Format(" and 客户名称 like '%{0}%' ", Request.Params["iFieldName"]);
            }
            if (Common.hasValue(Request.Params["iFieldNo"]))
            {
                where += string.Format(" and 编码 like '%{0}%' ", Request.Params["iFieldNo"]);
            }
            if (Common.hasValue(Request.Params["gyy"]))
            {
                where += string.Format(" and 所属工业园='{0}' ", Request.Params["gyy"]);
            }

            if (Common.hasValue(Request.Params["leix"]))
            {
                where += string.Format(" and 房产类型='{0}' ", Request.Params["leix"]);
            }
            // 2. 获取总数
            string count = DBHelper.GetVar("select count(*) " + from + where).ToString();
            if (count == null) return;

            string sql = string.Format(@"{0} {1} {2} and id not in (select top {3} id {1} {2} {4}) {4}",
                select, from, where, Request.Params["start"], order);            
            // 4. 拼装结果
            ResultObject ro = DBHelper.GetResult(sql);
            foreach (RowObject row in ro)
            {
                row["所属房产"] = row["房产类型"].ToString() +"-"+ row["所属房产"].ToString();
            }
            string data = ro.ToJson();
            string result = string.Format("success:true,totalProperty:{0},data:", count, sql);
            result = "{" + result + data + "}";
            Response.Write(result);
            
        }
        else if (action == "update" || action == "add")
        {            
            Dictionary<string, object> dict = Common.CopyFormToDict(Request.Form);
            if (dict["编码"].ToString() == "自动产生")
            {
                string dt = DateTime.Now.ToString("yyyyMMddhhmmssffff");
                dict["编码"] = "ht"+dt;
            }
            string fc = dict["所属房产"].ToString();
            string[] fcl = fc.Split('-');
            dict["房产类型"] = fcl[0];
            dict["所属房产"] = fcl[1];

            DateTime dt1 = DateTime.Parse(dict["合同开始时间"].ToString());
            DateTime dt2 = DateTime.Parse(dict["合同结束时间"].ToString());
            dict.Add("合同开始时间_年", dt1.Year);
            dict.Add("合同开始时间_月", dt1.Month);
            dict.Add("合同开始时间_日", dt1.Day);
            dict.Add("合同结束时间_年", dt2.Year);
            dict.Add("合同结束时间_月", dt2.Month);
            dict.Add("合同结束时间_日", dt2.Day);
            dict.Add("客户编码", Common.getKhbh(dict["客户名称"].ToString()));
            string sql = SqlBuilder.NameValueToSql(dict, "sq8szxlx.zpgl", "id", action=="add");
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "delete")
        {
            RowObject row = DBHelper.GetRow("select * from sq8szxlx.zpgl where id=" + Request.Form["id"]);
            // 修改房产状态            
            Common.updateFCZT(row["所属工业园"].ToString(), row["房产类型"].ToString(), row["所属房产"].ToString(), "无", "未租");

            string sql = "delete from sq8szxlx.zpgl where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "gyy_fc_lb")
        {
            string gyy = Request.Params["gyy"];

            string sql = string.Format("select 房产类型+'-'+房号 as fc from sq8szxlx.gyy_fc_lb where 工业园名称='{0}' and 状态='未租' ", gyy);
            ResultObject r = DBHelper.GetResult(sql);
            Response.Write(r.ToJson());

            
        }            
        else if (action == "fclx_list")
        {
            string sql = "select distinct 工业园名称 as gyyName from sq8szxlx.gyy_lb_fclx_lb ";

            ResultObject r = DBHelper.GetResult(sql);            
            Response.Write(r.ToJson());
        }
        else if (action == "find_gyy_fclx")
        {
            string gyy = Request.Params["gyy"];
            string sql = string.Format("select 房产类型 as lx from sq8szxlx.gyy_lb_fclx_lb where 工业园名称='{0}'", gyy);
            Response.Write(DBHelper.GetResult(sql).ToJson());
        }
        else if (action == "edit_gdxfx") // 编辑固定消费项
        {
            edit_gdxfx2();            
        }
        else if (action == "import_gdxfx") // 导入固定消费项到合同
        {
            string responseError = "{success: false}";
            //JSONArray ja = JSONConvert.DeserializeArray(Request.Form["data"]);            
            JArray ja = JArray.Parse(Request.Form["data"]);            
            string sql1 = string.Format("select * from sq8szxlx.zpgl where id='{0}'", Request.Params["id"]);
            RowObject r1 = DBHelper.GetRow(sql1);
            if (r1 == null)
            {
                Response.Write(responseError);
                Response.End();
                return;
            }
            
            string gyy_mc = r1["所属工业园"].ToString();
            string fclx = r1["房产类型"].ToString();
            string ssfc = r1["所属房产"].ToString();
            string htbh = r1["编码"].ToString();
            string khbm = r1["客户编码"].ToString();
            string khmc = r1["客户名称"].ToString();
            // 清除数据
            sql1 = string.Format("delete from sq8szxlx.zpgl_lx_lb where 合同编号='{0}'", htbh);
            DBHelper.ExecuteSql(sql1);
            sql1 = string.Format("delete from sq8szxlx.user_sf_lb where 单据编号='{0}'", htbh + "_1");
            DBHelper.ExecuteSql(sql1);
            sql1 = string.Format("delete from sq8szxlx.user_sf_zb where 单据编号='{0}'", htbh + "_1");
            DBHelper.ExecuteSql(sql1);
            // 新增数据
            //string sql2 = string.Format("select * from sq8szxlx.gyy_lb_fclx_lb_xflx where 工业园名称='{0}' and 房产类型='{1}' order by 序号 asc",
            //    gyy_mc, fclx);
            //ResultObject r2 = DBHelper.GetResult(sql2);
            //for (int i = 0; i < r2.Count; i++)
            for (int i = 0; i < ja.Count; i++)
            {
                //JSONObject jo = (JSONObject)ja[i];
                JToken jo = ja[i];
                //RowObject item = r2[i];

                // zpgl_lx_lb
                Dictionary<string, object> nv1 = new Dictionary<string, object>();
                nv1.Add("合同编号", htbh);
                nv1.Add("客户编码", khbm);
                nv1.Add("所属工业园", gyy_mc);
                nv1.Add("房产类型", fclx);
                nv1.Add("所属房产", ssfc);
                nv1.Add("客户名称", khmc);
                nv1.Add("消费项目", jo["消费项目"].ToString());
                nv1.Add("消费类型", jo["消费类型"].ToString());
                nv1.Add("值", jo["值"]);
                nv1.Add("损耗", jo["消费类型"].ToString() == "动态" ? jo["损耗"] : 0);
                nv1.Add("倍率", jo["倍率"]);
                nv1.Add("滞纳金", jo["滞纳金"]);
                nv1.Add("说明", jo["说明"]);
                string sql3 = SqlBuilder.NameValueToSql(nv1, "sq8szxlx.zpgl_lx_lb", "id", true);
                DBHelper.ExecuteSql(sql3);
                // user_sf_lb
                Dictionary<string, object> nv2 = new Dictionary<string, object>();
                nv2.Add("合同编号", htbh);
                nv2.Add("单据编号", htbh + "_1");
                nv2.Add("客户编号", khbm);
                nv2.Add("日期年", r1["合同开始时间_年"]);
                nv2.Add("日期月", r1["合同开始时间_月"]);
                nv2.Add("日期日", r1["合同开始时间_日"]);
                nv2.Add("日期", r1["合同开始时间"]);
                nv2.Add("收费项目", jo["消费项目"]);
                nv2.Add("收费类型", jo["消费类型"]);
                nv2.Add("值", jo["值"]);
                nv2.Add("录入状态", (jo["消费类型"].ToString() == "动态" && (jo["前期读数"] == null || jo["前期读数"].ToString() == "-")) ? "未录入" : "已录入");
                nv2.Add("缴费状态", "不要交费");
                nv2.Add("损耗", jo["消费类型"].ToString() == "动态" ? jo["损耗"] : 0);
                if (jo["消费类型"].ToString() == "动态" && (jo["前期读数"] != null && jo["前期读数"].ToString() != "-"))
                    nv2.Add("读数", jo["前期读数"]);
                else
                    nv2.Add("读数", 0);
                
                nv2.Add("倍率", jo["倍率"]);
                nv2.Add("滞纳金", jo["滞纳金"]);
                nv2.Add("费用",0);
                nv2.Add("金额", 0);
                string sql4 = SqlBuilder.NameValueToSql(nv2, "sq8szxlx.user_sf_lb", "id", true);
                DBHelper.ExecuteSql(sql4);
                // user_sf_zb
                Dictionary<string, object> nv3 = new Dictionary<string, object>();
                nv3.Add("合同编号", htbh);
                nv3.Add("单据编号", htbh + "_1");
                nv3.Add("客户编号", khbm);
                nv3.Add("日期年", r1["合同开始时间_年"]);
                nv3.Add("日期月", r1["合同开始时间_月"]);
                nv3.Add("日期日", r1["合同开始时间_日"]);
                nv3.Add("日期", r1["合同开始时间"]);
                nv3.Add("总费用", 0);
                nv3.Add("缴费金额", 0);
                nv3.Add("余额", 0);
                nv3.Add("录入状态", "已录入");
                nv3.Add("缴费状态", "不要交费");
                string sql5 = SqlBuilder.NameValueToSql(nv3, "sq8szxlx.user_sf_zb", "id", true);
                DBHelper.ExecuteSql(sql5);
            }

        }
        else if (action == "delete_xfx")
        {
            string sql = "delete from sq8szxlx.zpgl_lx_lb where id=" + Request.Params["id"];
            DBHelper.ExecuteSql(sql);
        }
        else if (action == "add_fcxf") {
            Dictionary<string, object> dict = Common.CopyFormToDict(Request.Form);
            string aa= Request.Form["所属房产"].ToString();
            string[] a = aa.Split('-');
            dict["所属房产"] = a[1];
            string sql = SqlBuilder.NameValueToSql(dict, "sq8szxlx.zpgl_lx_lb", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        Response.End();
    }

    private void edit_gdxfx2()
    {
        // 1. 查合同信息
        string responseError = "{success: false}";
        string sql = string.Format("select * from sq8szxlx.zpgl where id='{0}'", Request.Params["id"]);
        RowObject r1 = DBHelper.GetRow(sql);
        if (r1 == null)
        {
            Response.Write(responseError);
            Response.End();
            return;
        }
        string gyy_mc = r1["所属工业园"].ToString();
        string fclx = r1["房产类型"].ToString();
        string htbh = r1["编码"].ToString();
        // 2. 查zpgl_lx_lb看是否有记录
        sql = string.Format("select * from sq8szxlx.zpgl_lx_lb where 合同编号='{0}'", htbh);
        ResultObject zpgl_lx_lb = DBHelper.GetResult(sql);
        if (zpgl_lx_lb.Count<=0) // 没有记录则从gyy_lb_fclx_lb_xflx复制一份
        {
            sql = string.Format("select * from sq8szxlx.gyy_lb_fclx_lb_xflx where 工业园名称='{0}' and 房产类型='{1}' order by 序号 asc",
            gyy_mc, fclx);
            ResultObject gyy_lb_fclx_lb_xflx = DBHelper.GetResult(sql);
            foreach (RowObject item in gyy_lb_fclx_lb_xflx)
            {
                NameValueCollection nvc = new NameValueCollection();
                nvc.Add("合同编号",htbh);
                nvc.Add("客户编码", r1["客户编码"].ToString());
                nvc.Add("所属工业园",gyy_mc);
                nvc.Add("房产类型",fclx);
                nvc.Add("所属房产", r1["所属房产"].ToString());
                nvc.Add("客户名称", r1["客户名称"].ToString());
                nvc.Add("消费项目", item["消费项目"].ToString());
                nvc.Add("消费类型", item["消费类型"].ToString());
                nvc.Add("值", item["值"].ToString());
                nvc.Add("倍率", item["倍率"].ToString());
                nvc.Add("损耗", item["损耗"].ToString());
                nvc.Add("滞纳金", item["滞纳金"].ToString());
                nvc.Add("说明", item["说明"].ToString());
                string insertSql = SqlBuilder.NameValueToSql(nvc,"sq8szxlx.zpgl_lx_lb","id",true);
                DBHelper.ExecuteSql(insertSql);                
            }
            zpgl_lx_lb = DBHelper.GetResult(sql);// 重新查询
        }

        // 合成数据       
        int i = 1;
        foreach (RowObject item in zpgl_lx_lb)
        {
            string xfxm = item["消费项目"].ToString();
            string rq = r1["合同开始时间"].ToString();
            sql = string.Format("select * from sq8szxlx.user_sf_lb where 合同编号='{0}' and 收费项目='{1}' and  日期='{2}'", htbh, xfxm, rq);
            RowObject r4 = DBHelper.GetRow(sql);

            item.Add("编号", i);
            item.Add("前期读数", item["消费类型"].ToString() == "动态" ? r4["读数"] : "-");
            item.Add("读数导入", (r4 != null && r4["录入状态"].ToString() == "已录入") ? "√" : "×");
            item.Add("项目导入", (r4 != null && r4["值"] != "") ? "√" : "×");
            i++;
        }
        Response.Write(string.Format("{{'success': true, 'data':{0}}}", JsonConvert.SerializeObject(zpgl_lx_lb)));
    }

    private void edit_gdxfx()
    {
        string responseError = "{success: false}";
        string sql1 = string.Format("select * from sq8szxlx.zpgl where id='{0}'", Request.Params["id"]);
        RowObject r1 = DBHelper.GetRow(sql1);
        if (r1 == null)
        {
            Response.Write(responseError);
            Response.End();
            return;
        }
        string gyy_mc = r1["所属工业园"].ToString();
        string fclx = r1["房产类型"].ToString();
        string htbh = r1["编码"].ToString();

        string sql2 = string.Format("select * from sq8szxlx.gyy_lb_fclx_lb_xflx where 工业园名称='{0}' and 房产类型='{1}' order by 序号 asc",
            gyy_mc, fclx);
        ResultObject r2 = DBHelper.GetResult(sql2);
        JSONArray ja = new JSONArray();
        int i = 1;
        foreach (RowObject item in r2)
        {
            JSONObject jo = new JSONObject();

            string xfxm = item["消费项目"].ToString();
            string rq = r1["合同开始时间"].ToString();
            string sql3 = string.Format("select * from sq8szxlx.zpgl_lx_lb where 合同编号='{0}' and 消费项目='{1}'", htbh, xfxm);
            RowObject r3 = DBHelper.GetRow(sql3);
            string sql4 = string.Format("select * from sq8szxlx.user_sf_lb where 合同编号='{0}' and 收费项目='{1}' and  日期='{2}'", htbh, xfxm, rq);
            RowObject r4 = DBHelper.GetRow(sql4);

            jo.Add("id", item["id"]);
            jo.Add("编号", i);
            jo.Add("消费项目", xfxm);
            jo.Add("消费类型", item["消费类型"]);
            jo.Add("值", (r3 == null) ? item["值"] : r3["值"]);
            jo.Add("倍率", (r3 == null) ? item["倍率"] : r3["倍率"]);
            jo.Add("损耗", (r3 == null) ? item["损耗"] : r3["损耗"]);
            jo.Add("滞纳金", (r3 == null) ? item["滞纳金"] : r3["滞纳金"]);
            jo.Add("前期读数", item["消费类型"].ToString() == "动态" ? r4["读数"] : "-");
            jo.Add("说明", (r3 == null) ? item["说明"] : r3["说明"]);
            jo.Add("读数导入", (r4 != null && r4["录入状态"].ToString() == "已录入") ? "√" : "×");
            jo.Add("项目导入", (r4 != null && r4["值"] != "") ? "√" : "×");
            i++;
            ja.Add(jo);
        }
        Response.Write(string.Format("{{'success': true, 'data':{0}}}", JSONConvert.SerializeArray(ja)));
    }
}
