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
using LiveSupport.BLL;
using System.Text;
using LiveSupport.DAL.Entity;

public partial class AccountAdmin_SetupInstructions : System.Web.UI.Page
{
    Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] != null)
            {
                account = (Account)Session["User"];
            }
            //else
            //{
                //Response.Redirect("../Default.aspx");
            //}
        }
        this.HiddenField1.Value = account.Id.ToString();

        string html = this.TextBox1.Text;
        string[] s={"aid="};
       
        string[] temp = html.Split(s,System.StringSplitOptions.RemoveEmptyEntries);
        string newstring = temp[0] + "aid="+this.HiddenField1.Value + temp[1];
        this.TextBox1.Text = newstring;


        string html2 = this.TextBox2.Text;
        

        string[] temp2 = html2.Split(s, System.StringSplitOptions.RemoveEmptyEntries);
        string newstring2 = temp2[0] + "aid=" + this.HiddenField1.Value + temp2[1];
        this.TextBox2.Text = newstring2;
    }
   

    



}
