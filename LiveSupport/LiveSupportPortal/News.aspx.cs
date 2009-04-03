using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsPage : System.Web.UI.Page
{
    ///<summary>
    /// Shows the Panel dispalaing individual news item 
    /// and hides the Panel that displays the list of news items 
    /// Also hides the image if none is defined
    ///</summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        // show all news or just one item depending on querystring
        string newsItemId = Request.QueryString["newsId"];
        if (newsItemId == null)
        {
            AllNewsPanel.Visible = true;
            NewsDetailPanel.Visible = false;
            GridViewAllNews.DataBind();
        }
        else
        {
            AllNewsPanel.Visible = false;
            NewsDetailPanel.Visible = true;
            DetailsView1.DataBind();
        }
    }


    ///<summary>
    /// Hides rows that have 'invisible' = false
    /// Also hides the image if none is defined
    ///</summary>
    protected void GridViewAllNews_RowCreated(object source, GridViewRowEventArgs e)
    {
        if (e.Row == null) return;

        // display if 'Visible' = true
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.DataItem != null)
        {
            bool visible = (bool)DataBinder.Eval(e.Row.DataItem, "Visible");
            e.Row.Visible = visible;
        }

        // display image if a url is specified
        string imageUrl = (string)DataBinder.Eval(e.Row.DataItem, "ImageUrl");
        if (String.Empty.Equals(imageUrl))
        {
            Image newsImage = (Image)e.Row.FindControl("Image2");
            if (newsImage != null)
                newsImage.Visible = false;
        }
    }


  

}
