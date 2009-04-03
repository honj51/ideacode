using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Configuration;


///<summary>
/// class Testimonials
/// Provides static functions to access testimonials
/// and serves as abastraction layer between the web Page and
/// actual data providers
///</summary>
public static class Testimonials
{
    private static bool _isInitialized = false;
    private static TestimonialProvider _provider;
    private static SmallBusinessDataProvidersSection _providersSection;

    ///<summary>
    /// returns the current Testimonials data provider
    ///</summary> 
    public static TestimonialProvider Provider
    {
        get
        {
            Initialize();
            return _provider;
        }
    }

    ///<summary>
    /// returns all the testimonials
    ///</summary> 
    public static List<Testimonial> GetAllTestimonials()
    {
        return Provider.GetAllTestimonials();
    }


    ///<summary>
    /// Initilialize the _provider instance variable according to the configuration
    ///</summary> 
    private static void Initialize()
    {
        if (!_isInitialized)
        {
            _providersSection = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
            if (_providersSection == null)
            {
                throw new Exception(Messages.TestimonialsConfigSectionNotFound);
            }

            _provider = ProvidersHelper.InstantiateProvider(_providersSection.TestimonialsProviders[_providersSection.TestimonialsProviderName],
                typeof(TestimonialProvider)) as TestimonialProvider;

            if (_provider == null)
            {
                throw new Exception(Messages.TestimonialsProviderInstantiationError);
            }
            _isInitialized = true;
        }
    }

}
