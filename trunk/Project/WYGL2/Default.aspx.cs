using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Script.Serialization;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{

    protected void Page_Load(object sender, EventArgs e)
    {        
       
        //SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.gyy_fc_lb");

        //Page.Response.Write(Json.ToJson(r));

        string sql = "update sq8szxlx.gyy_fc_lb set 描述='122' where id=25";
        DBHelper.ExecuteSql(sql);
    }
}
