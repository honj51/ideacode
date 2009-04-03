using System;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data;



/// <summary>
/// class  SqlNewsProvider 
/// Provides access to SqlServer data source
/// </summary>
public class SqlNewsProvider : NewsProvider
{
    /// <summary>
    /// Reads xml and xsd file names from the web.config file
    /// </summary>
    private string connectionString()
    {
        SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        string connectionStringName = sec.NewsProviders[sec.NewsProviderName].Parameters["connectionStringName"];
        return WebConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
    }

    // DateTime.MinValue returned if no date is specified
    public override List<NewsItem> GetAllNews()
    {
        
        List<NewsItem> list         = new List<NewsItem>();

        // create a connection, invoke a stored procedure and add results to a list
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("GetNews", con);        
            SqlDataReader r = cmd.ExecuteReader();
            NewsItem curr;
            while (r.Read())
            {
                if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                    throw new InvalidOperationException(Messages.NewsItemRequiredAttributesMissing);
                
                curr = new NewsItem((string)r["id"], (Boolean)r["visible"], (string)r["title"]);
                curr.Date = (r["date"] is DBNull) ? DateTime.MinValue : (DateTime)r["date"];
                curr.Content = (r["content"] is DBNull) ? String.Empty : (string)r["content"];
                curr.ImageUrl = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];
                list.Add(curr);
            }
            con.Close();
        }
        
        return list;
    }

    public override NewsItem GetNewsItem(string newsItemId)
    {

        if (String.IsNullOrEmpty(newsItemId)) return null;

        // connect to the database
        NewsItem curr;
        using (SqlConnection con = new SqlConnection(connectionString()))
        { 
            con.Open();
            SqlCommand cmd = new SqlCommand("GetNewsItem", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", SqlDbType.NVarChar);
            cmd.Parameters["@id"].Value = newsItemId;

            SqlDataReader r = cmd.ExecuteReader();
            
            r.Read();
            
            if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                throw new InvalidOperationException(Messages.NewsItemRequiredAttributesMissing);
            
            curr = new NewsItem((string)r["id"], (Boolean)r["visible"], (string)r["title"]);
            curr.Date = (r["date"] is DBNull) ? DateTime.MinValue : (DateTime)r["date"];
            curr.Content = (r["content"] is DBNull) ? String.Empty : (string)r["content"];
            curr.ImageUrl = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
            curr.ImageAltText = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];
        }
        
        return curr;
    }

} // end class

