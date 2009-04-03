using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using System.IO;
using System.Collections.Generic;



/// <summary>
/// XML Data Layer for People
/// </summary>
public class XmlPeopleProvider : PeopleProvider
{
    private string _xmlFile; 
    private string _xsdFile; 


    public XmlPeopleProvider()
    {
        SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        string xmlFile = sec.PeopleProviders[sec.PeopleProviderName].Parameters["dataFile"];
        string xsdFile = sec.PeopleProviders[sec.PeopleProviderName].Parameters["schemaFile"];

        _xmlFile = HttpContext.Current.Request.MapPath("~/App_Data/" + xmlFile);
        _xsdFile = HttpContext.Current.Request.MapPath("~/App_Data/schemas/" + xsdFile);

    }


    public override List<Person> GetAllPersons()
    {
        DataSet dataSet = Util.ReadAndValidateXml(_xmlFile, _xsdFile);
        List<Person> personList = new List<Person>();
        
        foreach (DataTable t in dataSet.Tables)
        {
            foreach (DataRow r in t.Rows)
            {
                if (r["id"] is DBNull || r["visible"] is DBNull || r["firstName"] is DBNull || r["firstName"] is DBNull)
                    throw new InvalidOperationException(Messages.PersonRequiredAttributesMissing);
                //(string)r["visible"]
                Person curr = new Person((string)r["id"], (bool)r["visible"], (string)r["firstName"], (string)r["lastName"]);
                curr.MiddleName     = (r["middleName"] is DBNull)     ? String.Empty : (string)r["middleName"];
                curr.Title          = (r["title"] is DBNull)          ? String.Empty : (string)r["title"];
                curr.Description    = (r["description"] is DBNull)    ? String.Empty : (string)r["description"];
                curr.Email          = (r["email"] is DBNull)          ? String.Empty : (string)r["email"];
                curr.Phone          = (r["phone"] is DBNull)          ? String.Empty : (string)r["phone"];
                curr.Fax            = (r["fax"] is DBNull)            ? String.Empty : (string)r["fax"];
                curr.StreetAddress  = (r["streetAddress"] is DBNull)  ? String.Empty : (string)r["streetAddress"];
                curr.City           = (r["city"] is DBNull)           ? String.Empty : (string)r["city"];
                curr.State          = (r["state"] is DBNull)          ? String.Empty : (string)r["state"];
                curr.PostalCode     = (r["postalCode"] is DBNull)     ? String.Empty : (string)r["postalCode"];
                curr.Country        = (r["country"] is DBNull)        ? String.Empty : (string)r["country"];
                curr.ImageUrl       = (r["imageUrl"] is DBNull)       ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText   = (r["imageAltText"] is DBNull)   ? String.Empty : (string)r["imageAltText"];                
                
                personList.Add(curr);
            }
        }
        return personList;
    }
} 

