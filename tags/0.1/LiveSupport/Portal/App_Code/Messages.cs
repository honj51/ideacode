using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Error messages
/// </summary>
public class Messages
{
    public static string ItemConfigNotFound = "Items configuration section could not be found";
    public static string ItemProviderInstantiationError = "Items default provider could not be instantiated";
    public static string CategoryIdUndefined = "Category 'Id' is not defined";
    public static string CategoryTitleUndefined = "Category 'Title' is not defined";
    public static string ItemIdUndefined = "Item 'id' not defined";

    public static string ItemTitleUndefined = "Item 'title' not defined";
    public static string ItemTitleIsNull = "Title must be a non null, non-empty string";
    public static string ItemRequiredAttributesMissing = "Some of the required attributes of Item are NULL in the Items table";
    public static string CategoryRequiredAttributesMissing = "Some of the required attributes of Category are NULL in the Category table";
    public static string NewsConfigSectionNotFound = "News configuration section could not be found";

    public static string NewsProviderInstantiationError = "News default provider could not be instantiated";
    public static string NewsItemIdUndefined = "NewsItem'id' not defined";
    public static string NewsItemTitleUndefined = "NewsItem 'title' not defined";
    public static string NewsItemRequiredAttributesMissing = "Some of the required attributes of NewsItem are NULL in the News table";
    public static string PeopleConfigSectionNotFound = "People configuration section could not be found";

    public static string UndefinedId = "Id not defined";
    public static string UndefinedFirstName = "First Name is not defined";
    public static string UndefinedLastName = "Last Name is not defined";
    public static string PersonRequiredAttributesMissing = "Some of the required attributes of Person are NULL in the Persons table";
    public static string TestimonialsRequiredAttributesMissing = "Some of the required fields of Testimonial are NULL in the Testimonials table";
    // 20 
    public static string TestimonialsIdUndefined = "Testimonial Id not defined";
    public static string TestimonialsTitleUndefined = "Testimonial Title is not defined";
    public static string TestimonialsDateUndefined = "Testimonial Date is not defined";
    public static string TestimonialsContentUndefined = "Testimonial Content is not defined";
    public static string TestimonialsTestifierUndefined = "Testimonial Testifier is not defined";
//25
    public static string TitleUndefined = "title must be a non null, non-empty string";
    public static string ContentIsNull = "content must be a non null, non-empty string";
    public static string TestimonialsConfigSectionNotFound = "Testimonials configuration section could not be found";
    public static string TestimonialsProviderInstantiationError = "Testimonials default provider could not be instantiated";
  

  
	
}
