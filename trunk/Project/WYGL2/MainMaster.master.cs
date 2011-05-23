using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class MainMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
           /************************************************************************/
           /* 权限控制                                                                     */
           /************************************************************************/

        //string admin_id = (string)Session["admin_id"];
        //string sql = string.Format("select * from sq8szxlx.role_lb where admind_id='{0}'",admin_id);

    }
}
