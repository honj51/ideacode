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

public partial class ZuLin_zphtgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action =Request.Params["action"];
        if (String.IsNullOrEmpty(action)) return;

        Response.ContentType = "application/json";

        if (action == "list")
        {
            SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.zpgl");          
            Response.Write(Json.ToJson(r));
            
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
            string sql = "select distinct 工业园名称 from sq8szxlx.gyy_lb_fclx_lb ";
            SqlDataReader r = DBHelper.GetReader(sql);
            Response.Write(Json.ToJson(r));
        }
        else if (action == "find_gyy_fclx")
        {
            string gyy = Request.Params["gyy"];
            string sql = string.Format("select 房产类型 from sq8szxlx.gyy_lb_fclx_lb where 工业园名称='{0}'", gyy);
            SqlDataReader r = DBHelper.GetReader(sql);
            Response.Write(Json.ToJson(r));
        }
        Response.End();
    }
}