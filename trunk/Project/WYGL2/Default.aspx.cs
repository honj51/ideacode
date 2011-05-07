using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.gyy_fc_lb");
        while (r.Read())
        {
            object[] objs = new object[r.FieldCount];
            r.GetValues(objs);
            foreach (object item in objs)
            {
                Page.Response.Write(item.ToString());
            }
            
        }

    }
}
