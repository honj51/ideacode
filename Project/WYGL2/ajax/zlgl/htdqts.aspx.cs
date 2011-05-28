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

public partial class ZuLin_htdqts : System.Web.UI.Page
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
                sql = "select * from sq8szxlx.zpgl";
            }
            int c = (int)DBHelper.GetVar("select count(*) as total from sq8szxlx.zpgl");
            ResultObject r = DBHelper.GetResult(sql);
            string data = r.ToJson();

            string result = string.Format("\"success\":true,\"totalProperty\":{0},\"data\":", c);
            result = "{" + result + data + "}";
            Response.Write(result);
            
        }
        Response.End();
    }
}
