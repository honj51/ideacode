using System;
using System.Data;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using System.IO;
using System.Collections.Generic;
using System.Configuration;

/// <summary>
/// XML Data Layer for Testimonials Page
/// </summary>
public class XmlTestimonialProvider : TestimonialProvider
{
    private string _xmlFile;
    private string _xsdFile;

    /// <summary>
    /// initializes xmlFile and xsdFile paths
    /// </summary>
    public XmlTestimonialProvider()
    {
        SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        string xmlFile = sec.TestimonialsProviders[sec.TestimonialsProviderName].Parameters["dataFile"];
        string xsdFile = sec.TestimonialsProviders[sec.TestimonialsProviderName].Parameters["schemaFile"];

        _xmlFile = HttpContext.Current.Request.MapPath("~/App_Data/" + xmlFile);
        _xsdFile = HttpContext.Current.Request.MapPath("~/App_Data/schemas/" + xsdFile);
    }

    /// <summary>
    /// retrieve the testimonials
    /// </summary>
    public override List<Testimonial> GetAllTestimonials()
    {
        DataSet dataSet = Util.ReadAndValidateXml(_xmlFile, _xsdFile);
        List<Testimonial> list = new List<Testimonial>();
        foreach (DataTable t in dataSet.Tables)
        {   
            foreach (DataRow r in t.Rows)
            {
                Testimonial curr = new Testimonial((string)r["id"], (bool)r["visible"], (string)r["title"], (DateTime)r["date"], (string)r["content"], (string)r["testifier"]);
                curr.TestifierCompany   = (r["testifierCompany"] is DBNull)  ? String.Empty : (string)r["testifierCompany"];
                curr.ImageUrl           = (r["imageUrl"] is DBNull)          ? String.Empty : (string)r["imageUrl"];
                curr.ImageAltText       = (r["imageAltText"] is DBNull)      ? String.Empty : (string)r["imageAltText"];
                list.Add(curr);
            }
        }
        return list;
    }
}

