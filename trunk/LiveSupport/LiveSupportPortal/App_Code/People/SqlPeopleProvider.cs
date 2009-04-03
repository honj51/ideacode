using System;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;



/// <summary>
/// class  SqlPeopleProvider 
///  Provides access to SqlServer data source
/// </summary>
public class SqlPeopleProvider : PeopleProvider
{
    /// <summary>
    /// retrieves the connection string from the web.config
    /// </summary>
    private string connectionString()
    {
        SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        string connectionStringName = sec.PeopleProviders[sec.PeopleProviderName].Parameters["connectionStringName"];
        return WebConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
    }

    /// <summary>
    /// retrieves all person records
    /// </summary>
    public override List<Person> GetAllPersons()
    {
        List<Person> personList = new List<Person>();
        
        // create a connection, invoke stored procedure
        //
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();            
            SqlCommand cmd = new SqlCommand("GetPeople", con);
            SqlDataReader r = cmd.ExecuteReader();
            Person curr;
            while (r.Read())
            {
                if (r["id"] is DBNull || r["visible"] is DBNull || r["firstName"] is DBNull || r["lastName"] is DBNull)
                    throw new InvalidOperationException(Messages.PersonRequiredAttributesMissing);
                curr = new Person((string)r["id"],(bool)r["visible"],(string)r["firstName"],(string)r["lastName"]);
                curr.MiddleName     = (r["middleName"] is DBNull) ? String.Empty : (string)r["middleName"];
                curr.Title          = (r["title"] is DBNull) ?      String.Empty : (string)r["title"];
                curr.Description    = (r["description"] is DBNull)? String.Empty : (string)r["description"];
                curr.Email          = (r["email"] is DBNull) ?      String.Empty : (string)r["email"];
                curr.Phone          = (r["phone"] is DBNull) ?      String.Empty : (string)r["phone"];
                curr.Fax            = (r["fax"] is DBNull) ?        String.Empty : (string)r["fax"];
                curr.StreetAddress  = (r["streetAddress"] is DBNull) ? String.Empty : (string)r["streetAddress"];
                curr.City           = (r["city"] is DBNull) ?       String.Empty : (string)r["city"];
                curr.State          = (r["state"] is DBNull) ?      String.Empty : (string)r["state"];
                curr.PostalCode     = (r["postalCode"] is DBNull) ? String.Empty : (string)r["postalCode"];
                curr.Country        = (r["country"] is DBNull) ?    String.Empty : (string)r["country"];
                curr.ImageUrl       = (r["imageUrl"] is DBNull) ?   String.Empty : (string)r["imageUrl"];
                curr.ImageAltText   = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];                
                
                personList.Add(curr);                       
            }
        }
        return personList;
    }

} // end class

