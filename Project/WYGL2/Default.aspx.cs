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
    JavaScriptSerializer serializer;

    protected void Page_Load(object sender, EventArgs e)
    {        
       
        SqlDataReader r = DBHelper.GetReader("select * from sq8szxlx.gyy_fc_lb");

        Page.Response.Write(Json.ToJson(r));
        ////for (int i=0; i<=r.FieldCount; i++)
        ////{
        ////    Type type = r.GetValue(i).GetType();
            
        ////}

        ////while (r.Read())
        ////{
            
        ////    object[] objs = new object[r.FieldCount];
        ////    r.GetValues(objs);
        ////    foreach (object item in objs)
        ////    {
                
        ////        //serializer.Serialize()
        ////        Page.Response.Write(item.ToString());
        ////    }                                        
        ////}        
    }
}
