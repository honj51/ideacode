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

public partial class AccountAdmin_OperatorCreate : System.Web.UI.Page
{
    //private Operator op;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (HttpContext.Current.Request.QueryString["cmd"] != null && HttpContext.Current.Request.QueryString["cmd"] == "cmdEdit")
            {
                this.DetailsView1.DefaultMode = DetailsViewMode.Edit;
                this.DetailsView1.ChangeMode(DetailsViewMode.Edit);
            }
            else if (HttpContext.Current.Request.QueryString["cmd"] != null && HttpContext.Current.Request.QueryString["cmd"] == "cmdInsert")
            {
                this.DetailsView1.DefaultMode = DetailsViewMode.Insert;
                this.DetailsView1.ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                Response.Redirect("AccountHome.aspx");
            }
        }
    }
    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {

    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect("OperatorsManagment.aspx");
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        Response.Redirect("OperatorsManagment.aspx");
    }
}
