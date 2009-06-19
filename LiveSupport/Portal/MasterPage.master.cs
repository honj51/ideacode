
using LiveSupport.LiveSupportModel;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (Session["User"] != null)
        {
            Operator oper = (Operator)Session["User"];
            this.lblUserName.Text = oper.NickName;
            this.PanelShow.Visible = true;
            this.PanelLogin.Visible = false;
        }
        else
        {
            this.PanelLogin.Visible = true;
            this.PanelShow.Visible = false;
            
        }
    }
    //°²È«ÍË³ö 
    protected void LinkButton1_Click(object sender, System.EventArgs e)
    {
        Session["User"] = null;
        this.Response.Redirect("~/Login.aspx");
        this.PanelLogin.Visible = true;
    }
}
