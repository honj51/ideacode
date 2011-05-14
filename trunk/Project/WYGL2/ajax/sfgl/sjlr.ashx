<%@ WebHandler Language="C#" Class="sjlr" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class sjlr : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");

        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;

        if (action == "load_data")
        {
            SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.zpgl");
            Response.ContentType = "application/json";
            Response.ContentEncoding = Encoding.UTF8;
            Response.Write(Json.ToJson(r));
            Response.End();
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}