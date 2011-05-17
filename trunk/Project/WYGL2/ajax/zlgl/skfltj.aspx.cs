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

public partial class ajax_zlgl_skfltj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string action = Request.Params["action"];
        //if (string.IsNullOrEmpty(action)) return;

        //Response.ContentType = "application/json";

        //if (action == "find_sfxm")
        //{
        //    string sql = "";
        //    string sfxm = Request.Params["sfxm"];
        //    sql = "select 消费项目 as sfxm from sq8szxlx.gyy_lb_fclx_lb_xflx";
        //    SqlDataReader r = DBHelper.GetReader(sql);
        //    Response.Write(Json.ToJson(r));
        //}
        //Response.End();
    }
}
