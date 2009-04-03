using System;
using System.Configuration;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;


 /// <summary>
 ///Provides access to SqlServer data source 
 /// </summary>
public class SqlCatalogProvider : CatalogProvider
{

    private string connectionString()
    {
        SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        string connectionStringName = sec.CatalogProviders[sec.CatalogProviderName].Parameters["connectionStringName"];
        return WebConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
    }

    ///<summary>
    ///  Returns item belonging to the category having id: 'parentCategoryId'
    ///  if price is not specified Double.MinValue is returned
    /// </summary>
    public override List<Item> GetChildItems(string parentCategoryId)
    {
        List<Item> list = new List<Item>();
        if (String.IsNullOrEmpty(parentCategoryId)) return list;

        // connect to the database
        using (SqlConnection con = new SqlConnection(connectionString()))
        { 
            con.Open();
            SqlCommand cmd = new SqlCommand("GetChildItems", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@categoryId", SqlDbType.NVarChar);            
            cmd.Parameters["@categoryId"].Value = parentCategoryId;

            SqlDataReader r = cmd.ExecuteReader();
            Item curr;

            while (r.Read())
            {
                if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                    throw new InvalidOperationException(Messages.ItemRequiredAttributesMissing);

                curr = new Item((string) r["id"],
                                (Boolean)r["visible"],
                                (string) r["title"]);
                curr.Description = (r["description"] is DBNull) ? String.Empty : (string)r["description"];
                curr.Price = (r["price"] is DBNull) ? Double.MinValue : (double)r["price"];
                curr.InStock = (r["inStock"] is DBNull) ? true : (Boolean)r["inStock"];
                curr.ImageUrl = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];
                list.Add(curr);
            }
        }
        return list;
    }

    ///<summary>
    /// Returns subcategories under the category having id: 'parentCategoryId'    
    ///</summary>
    public override List<Category> GetChildCategories(string parentCategoryId)
    {   
        List<Category> list       = new List<Category>();        
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd;
            if( String.IsNullOrEmpty(parentCategoryId))
            {
                cmd = new SqlCommand("GetRootCategories", con);
            }
            else
            {
                cmd = new SqlCommand("GetNonRootCategories ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@categoryId", SqlDbType.NVarChar);
                cmd.Parameters["@categoryId"].Value = parentCategoryId;
            }
            
            SqlDataReader r = cmd.ExecuteReader();
            Category curr;
            while (r.Read())
            {
                if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                    throw new InvalidOperationException(Messages.CategoryRequiredAttributesMissing);

                curr = new Category((string)r["id"],(Boolean)r["visible"],(string)r["title"]);
                curr.Description = (r["description"] is DBNull) ? String.Empty : (string)r["description"];
                curr.ImageUrl = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];
                list.Add(curr);
            }
        }
        return list;
    }


    ///<summary>
    /// Returns item having the id 'itemId'
    ///</summary>
    public override Item GetItem(string itemId)
    {
        if (String.IsNullOrEmpty(itemId)) return null;
        // connect to the database
        Item curr;
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("GetItem", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@itemId", SqlDbType.NVarChar);
            cmd.Parameters["@itemId"].Value = itemId;

            SqlDataReader r = cmd.ExecuteReader();
            r.Read();
            
            if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                throw new InvalidOperationException(Messages.ItemRequiredAttributesMissing);

            curr = new Item((string)r["id"],
                            (Boolean)r["visible"],
                            (string)r["title"]);
            curr.Description = (r["description"] is DBNull) ? String.Empty : (string)r["description"];
            curr.Price = (r["price"] is DBNull) ? Double.MinValue : (double)r["price"];
            curr.InStock = (r["inStock"] is DBNull) ? true : (Boolean)r["inStock"];
            curr.ImageUrl = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
            curr.ImageAltText = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];
        }
        return curr;
    
    }
} 
