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

public partial class ZiYuan_zrrlb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;

        if (action == "load_data")
        {
            SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.user_zrr");
            Response.ContentType = "application/json";
            Response.Write(Json.ToJson(r));
            Response.End();
        }
        
    }
}
