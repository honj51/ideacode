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

public partial class Print2 : System.Web.UI.Page
{
    //protected string htbh = "";     //客户编码
    //protected string khmc = "";     //客户名称
    //protected string ssgyy = "";    //所属工业园
    //protected string ssfc = "";     //所属房产
    //protected string htStart = "";  //合同开始时间
    //protected string htEnd = "";    //合同结束时间
    //protected string yue = "";      //月份
    //protected string fy = "";       //费用
    protected string dataUrl = "";  
    protected void Page_Load(object sender, EventArgs e)
    {

        dataUrl = "ajax/zlgl/tj.aspx?action=fltj&" + Request.QueryString;//&nian=2010&yue=12
       
    }
}
