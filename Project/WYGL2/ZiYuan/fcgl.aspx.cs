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

public partial class ZiYuan_fcgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;

        if (action == "load_data")
        {
            SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.gyy_fc_lb  order by 工业园名称,房产类型,房号 asc");
            Console.WriteLine("111111");
            Console.WriteLine("2222");
            Response.ContentType = "application/json";
            Response.Write(Json.ToJson(r));
            Response.End();
        }
    }
}
