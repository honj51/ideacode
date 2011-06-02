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

public partial class ZiYuan_zrrlb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {       
            string sql = "";
            string iField = Request.Params["iField"];
            string order = " order by id desc ";
            if (Request.Params["start"] != null && Request["limit"] != null)
            {
                sql = string.Format("select top {0} * from sq8szxlx.user_zrr where id not in (select top {1} id from sq8szxlx.user_zrr {2})",
                    Request["limit"], Request.Params["start"], order);
            }
            else if (iField != null)
            {
                sql = string.Format("select * from sq8szxlx.user_zrr where 名称 like '%{0}%' ", iField);
            }
            else
            {
                sql = "select * from sq8szxlx.user_zrr";
            }
            sql += order;
            int count = (int)DBHelper.GetVar(string.Format("select count(*) as total from sq8szxlx.user_zrr where 名称 like '%{0}%' ", iField));
            ResultObject ro = DBHelper.GetResult(sql);
            foreach (RowObject row in ro)
            {
                int c = (int)DBHelper.GetVar(string.Format("select count(*) from sq8szxlx.gyy_fc_lb where 业主='{0}'", row["编码"]));
                if (c>0)
                {
                    row["canDelete"] = false;
                }
                else
                {
                    row["canDelete"] = true;
                }
            }
            string data = ro.ToJson();
            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", count);
            result = "{" + result + data + "}";
            Response.Write(result);

        }
        else if (action == "add")
        {
            Dictionary<string, object> dict = Common.CopyFormToDict(Request.Form);

            string birthday = Request.Form["出生日期"];
            string[]bir = birthday.Split('-');
            dict["出生日期_年"] = bir[0];
            dict["出生日期_月"] = bir[1];
            dict["出生日期_日"] = bir[2];

            if (dict["编码"].ToString() == "自动产生")
            {
                string dt = DateTime.Now.ToString("yyyyMMddhhmmssffff");
                dict["编码"] = "zrr" + dt;
            }

            string sql = SqlBuilder.NameValueToSql(dict, "sq8szxlx.user_zrr", "id", true);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "update")
        {
            Dictionary<string, object> dict = Common.CopyFormToDict(Request.Form);

            string birthday = Request.Form["出生日期"];
            string[] bir = birthday.Split('-');
            dict["出生日期_年"] = bir[0];
            dict["出生日期_月"] = bir[1];
            dict["出生日期_日"] = bir[2];

            string sql = SqlBuilder.NameValueToSql(dict, "sq8szxlx.user_zrr", "id", false);
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}"); 
        }
        else if (action == "delete")
        {
            string sql = "delete from sq8szxlx.user_zrr where id=" + Request.Form["id"];
            DBHelper.ExecuteSql(sql);
            Response.Write("{success: true}");
        }
        else if (action == "list_names")
        {
            string data = DBHelper.GetResult("select 编码 as bm,名称 as mc from sq8szxlx.user_zrr").ToJson();
            Response.Write(data);
        }
        //搜索
        
        //if (iField!=null)
        //{
        //    string sql = string.Format("select * from sq8szxlx.user_zrr where 名称 like '%{0}%' ",iField);

        //    SqlDataReader c = DBHelper.GetReader(string.Format("select count(*) as total from sq8szxlx.user_zrr where 名称 like '%{0}%' ", iField));
        //    if (!c.Read()) return;
        //    SqlDataReader r = DBHelper.GetReader(sql);
        //    string data = Json.ToJson(r);
        //    string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", c.GetInt32(0));
        //    result = "{" + result + data + "}";
        //    Response.Write(result);
        //}

        Response.End();
    }
}
