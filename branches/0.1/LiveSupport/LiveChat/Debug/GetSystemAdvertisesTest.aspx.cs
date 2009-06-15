using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.MobileControls;
using System.Collections.Generic;

public partial class Debug_GetSystemAdvertisesTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        OperatorWS ws = new OperatorWS();
        List<SystemAdvertise> li = ws.GetSystemAdvertise(this.TextBox1.Text);
        foreach (SystemAdvertise item in li)
        {
           
            Label1.Text += item.AdvertiseMessage+"</BR>";
        }
    }
}
