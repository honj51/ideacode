using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class operatortest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        this.GridView1.DataSource = OperatorService.GetAllOperators();
        this.GridView2.DataSource = ChatService.GetAllChat();
        DataBind();
    }
}
