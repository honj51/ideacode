using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using System.IO;
using System.Collections.Generic;



/// <summary>
/// XML Data Layer for Items and Cateogories
/// </summary>
public class XmlCatalogProvider : CatalogProvider
{
    private string _xmlFile;
    private string _xsdFile;


    public XmlCatalogProvider()
    {
        SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        string xmlFile = sec.CatalogProviders[sec.CatalogProviderName].Parameters["dataFile"];
        string xsdFile = sec.CatalogProviders[sec.CatalogProviderName].Parameters["schemaFile"];

        _xmlFile = HttpContext.Current.Request.MapPath("~/App_Data/" + xmlFile);
        _xsdFile = HttpContext.Current.Request.MapPath("~/App_Data/schemas/" + xsdFile);
    }



    /// <summary>
    /// Returns child categories of a given cateogory
    /// If 'parentCategoryId' = null , top level categories are returned
    /// </summary>
    public override List<Category> GetChildCategories(string parentCategoryId)
    {        
        List<Category> list = new List<Category>();
        if (String.IsNullOrEmpty(parentCategoryId)) parentCategoryId = "NULL";
        DataSet dataSet = Util.ReadAndValidateXml(_xmlFile,_xsdFile);
        
        // tables, in order in the dataset: category | childItemId| item
        DataTable categoryTbl = dataSet.Tables[0];
        
        foreach (DataRow r in categoryTbl.Rows)
        {
            if ((string)r["parentCategoryId"] == parentCategoryId) // match found
            {
                if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                    throw new InvalidOperationException(Messages.CategoryRequiredAttributesMissing);

                Category curr = new Category((string)r["id"], Boolean.Parse((string)r["visible"]), (string)r["title"]);
                curr.Description =  (r["description"] is DBNull)? String.Empty : (string)r["description"];
                curr.ImageUrl =     (r["imageUrl"] is DBNull)  ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText = (r["imageAltText"] is DBNull)  ? String.Empty : (string)r["imageAltText"];
                list.Add(curr);
            }
        }
        return list;
    }



    /// <summary>
    /// Returns child items of a given cateogory
    /// Returns empty list if 'parentCategoryId' = null ,
    /// </summary>
    public override List<Item> GetChildItems(string parentCategoryId)
    {
        List<Item> itemList = new List<Item>();
        if (String.IsNullOrEmpty(parentCategoryId)) return itemList;
        DataSet dataSet = Util.ReadAndValidateXml(_xmlFile, _xsdFile);

        // find index correspondig to parentCategorId
        DataTable categoryTbl = dataSet.Tables[0];
        int index=-1;
        int counter =0;
        foreach (DataRow r in categoryTbl.Rows)
        {   
            if ((string)r["id"] == parentCategoryId)
            {
                index = counter;
                break;
            }
            counter++;
        }

        // populate the list of child items ids and then construct Item objects
        DataTable categorizationTbl = dataSet.Tables[1];
        List<String> childItemIds = new List<String>(); 
        foreach (DataRow r in categorizationTbl.Rows)
        {
            if ((int)r["category_Id"] == index)
            {
                childItemIds.Add((string)r["childItemId_Text"]);
            }
        }
            
        DataTable itemsTbl = dataSet.Tables[2];
        Item curr;
        foreach (DataRow r in itemsTbl.Rows)
        {
            if (childItemIds.Contains((string)r["id"]))
            {
                if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                    throw new InvalidOperationException(Messages.ItemRequiredAttributesMissing);
                curr = new Item((string)r["id"],
                                        Boolean.Parse((string)r["visible"]),
                                        (string)r["title"]);
                curr.Description    = (r["description"] is DBNull) ? String.Empty : (string)r["description"];
                curr.Price          = (r["inStock"] is DBNull) ? Double.MinValue : Double.Parse((string)r["price"]);
                curr.InStock        = (r["inStock"] is DBNull) ? true : Boolean.Parse((string)r["inStock"]);
                curr.ImageUrl       = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText   = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];
                itemList.Add(curr);
            }
        }
        return itemList; 
    }

    ///<summary>
    /// Returns item having the id 'itemId'
    ///</summary>
    public override Item GetItem(string itemId)
    {
        if (String.IsNullOrEmpty(itemId)) return null;
        DataSet dataSet = Util.ReadAndValidateXml(_xmlFile, _xsdFile);

        DataTable itemsTbl = dataSet.Tables[2];
        Item curr=null;
        foreach (DataRow r in itemsTbl.Rows)
        {
            if (r["id"] is DBNull )
                throw new InvalidOperationException(Messages.ItemRequiredAttributesMissing);

            if(itemId == (string)r["id"]) 
            {
                // assert: r[id] is not DBNull
                if (r["visible"] is DBNull || r["title"] is DBNull)
                    throw new InvalidOperationException(Messages.ItemRequiredAttributesMissing);

                curr = new Item((string)r["id"],Boolean.Parse((string)r["visible"]),(string)r["title"]);
                curr.Description = (r["description"] is DBNull) ? String.Empty : (string)r["description"];
                curr.Price = (r["price"] is DBNull) ? Double.MinValue : Double.Parse((string)r["price"]);
                curr.InStock = (r["inStock"] is DBNull) ? true : Boolean.Parse((string)r["inStock"]);
                curr.ImageUrl = (r["imageUrl"] is DBNull) ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText = (r["imageAltText"] is DBNull) ? String.Empty : (string)r["imageAltText"];
            }
        }
        return curr;
    }
} 
