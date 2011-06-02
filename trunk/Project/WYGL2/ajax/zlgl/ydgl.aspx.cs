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
using System.Collections.Generic;
using System.Diagnostics;

public partial class ZuLin_ydgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            string sql = "";
            if (Request.Params["start"] != null && Request["limit"] != null)
            {
                sql = string.Format("select top {0} * from sq8szxlx.zpgl where id not in(select top {1} id from sq8szxlx.zpgl)",
                    Request["limit"], Request.Params["start"]);
            }
            else
            {
                sql = "select * from sq8szxlx.zpgl where 1=1";
            }
            
            string where = " and 合同结束时间_年 is null ";
            sql += where + " order by 客户名称 asc ";

            int count = (int)DBHelper.GetVar("select count(*) as total from sq8szxlx.zpgl where 1=1 " + where);            

            ResultObject ro = DBHelper.GetResult(sql);
            foreach (RowObject row in ro)
            {
                row["所属房产"] = row["房产类型"].ToString() + "-" + row["所属房产"].ToString();
            }
            string data = ro.ToJson();

            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", count);

            
            result = "{" + result + data + "}";
            Response.Write(result);    
        }
        else if (action == "add" || action == "update")
        {
            Dictionary<string, object> dict = Common.CopyFormToDict(Request.Form);
            if (dict["编码"].ToString() == "自动产生")
            {
                string dt = DateTime.Now.ToString("yyyyMMddhhmmssffff");
                dict["编码"] = "ht" + dt;
            }
            string fc = dict["所属房产"].ToString();
            string[] fcl = fc.Split('-');
            dict["房产类型"] = fcl[0];
            dict["所属房产"] = fcl[1];

            DateTime dt1 = DateTime.Parse(dict["合同开始时间"].ToString());
            dict.Add("合同开始时间_年", dt1.Year);
            dict.Add("合同开始时间_月", dt1.Month);
            dict.Add("合同开始时间_日", dt1.Day);
            string sql = SqlBuilder.NameValueToSql(dict, "sq8szxlx.zpgl", "id", action == "add");
            DBHelper.ExecuteSql(sql);

            // 修改房产状态
            string yezu = Common.getKhbh(dict["客户名称"].ToString());
            Common.updateFCZT(dict["所属工业园"].ToString(), dict["房产类型"].ToString(), dict["所属房产"].ToString(), yezu, "预定");
            Response.Write("{success: true}");
        }
        else if (action == "change")
        {
            string sql = "update sq8szxlx.zpgl set 合同结束时间_年='' where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
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
        Response.End();
    }
}
