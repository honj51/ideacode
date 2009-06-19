using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.BLL;
using System.Text;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    Operator oper;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] != null)
            {
                oper = (Operator)Session["User"];
            }
        }
        this.HiddenField1.Value = oper.AccountId.ToString();

        string html = this.TextBox1.Text;
        string[] s = { "aid=" };

        string[] temp = html.Split(s, System.StringSplitOptions.RemoveEmptyEntries);
        string newstring = temp[0] + "aid=" + this.HiddenField1.Value + temp[1];
        this.TextBox1.Text = newstring;


        string html2 = this.TextBox2.Text;


        string[] temp2 = html2.Split(s, System.StringSplitOptions.RemoveEmptyEntries);
        string newstring2 = temp2[0] + "aid=" + this.HiddenField1.Value + temp2[1];
        this.TextBox2.Text = newstring2;
    }
}
