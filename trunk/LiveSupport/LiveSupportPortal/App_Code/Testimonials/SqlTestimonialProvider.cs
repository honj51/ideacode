using System;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;

///<summary>
/// Testimonials data Provider for SQL database 
///</summary>
public class SqlTestimonialProvider : TestimonialProvider
{
    private string connectionString()
    {
        SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        string connectionStringName = sec.TestimonialsProviders[sec.TestimonialsProviderName].Parameters["connectionStringName"];
        return WebConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
    }

    public override List<Testimonial> GetAllTestimonials()
    {
        // connect to the database
        List<Testimonial> list = new List<Testimonial>();
        
        using(SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("GetTestimonials", con);
            SqlDataReader r = cmd.ExecuteReader();
            Testimonial curr;

            while (r.Read())
            {
                string imageAltText = r["imageAltText"] == DBNull.Value ? "" : (string)r["imageAltText"];

                if (r["id"] is DBNull || 
                    r["visible"] is DBNull || 
                    r["title"] is DBNull || 
                    r["date"] is DBNull ||
                    r["content"] is DBNull || 
                    r["testifier"] is DBNull )
                    throw new InvalidOperationException(Messages.TestimonialsRequiredAttributesMissing);

                curr = new Testimonial((string)r["id"], (bool)r["visible"], (string)r["title"], (DateTime)r["date"], (string)r["content"], (string)r["testifier"]);
                curr.TestifierCompany = (r["testifierCompany"] is DBNull) ? String.Empty : (string)r["testifierCompany"];
                curr.ImageUrl = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];

                list.Add(curr);
            }
        }
        
        return list;
    }

} // end class

