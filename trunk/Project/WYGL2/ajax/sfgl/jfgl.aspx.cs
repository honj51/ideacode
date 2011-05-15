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

public partial class SouFei_jfgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"];
        if (String.IsNullOrEmpty(action)) return;
        Response.ContentType = "application/json";
        Response.ContentEncoding = Encoding.UTF8;

        if (action == "list")
        {
            SqlDataReader r = DBHelper.GetReader("select top 20 * from sq8szxlx.user_sf_zb");
            Response.Write(Json.ToJson(r));
        }
        Response.End();
    }
}
