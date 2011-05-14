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

public partial class SouFei_sjlr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;

        if (action == "load_data")
        {
            SqlDataReader r = DBHelper.GetReader(@"select top 10 z.*,u.录入状态 from sq8szxlx.zpgl z 
                left join sq8szxlx.user_sf_zb u on z.编码=u.合同编号");
            Response.ContentType = "application/json";
            Response.ContentEncoding = Encoding.UTF8;
            Response.Write(Json.ToJson(r));
            Response.End();
            
        }
       
    }
}
