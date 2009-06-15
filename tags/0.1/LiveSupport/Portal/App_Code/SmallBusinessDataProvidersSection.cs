using System;
using System.Configuration;


public class SmallBusinessDataProvidersSection : ConfigurationSection
{

    [ConfigurationProperty("peopleProviderName", IsRequired = true)]
    public string PeopleProviderName
    {
        get { return (string)this["peopleProviderName"]; }
        set { this["peopleProviderName"] = value; }
    }

    [ConfigurationProperty("testimonialsProviderName", IsRequired = true)]
    public string TestimonialsProviderName
    {
        get { return (string)this["testimonialsProviderName"]; }
        set { this["testimonialsProviderName"] = value; }
    }

    [ConfigurationProperty("newsProviderName", IsRequired = true)]
    public string NewsProviderName
    {
        get { return (string)this["newsProviderName"]; }
        set { this["newsProviderName"] = value; }
    }

    [ConfigurationProperty("catalogProviderName", IsRequired = true)]
    public string CatalogProviderName
    {
        get { return (string)this["catalogProviderName"]; }
        set { this["catalogProviderName"] = value; }
    }


    [ConfigurationProperty("PeopleProviders")]
    [ConfigurationValidatorAttribute(typeof(ProviderSettingsValidation))]
    public ProviderSettingsCollection PeopleProviders
    {
        get { return (ProviderSettingsCollection)this["PeopleProviders"]; }

    }


    [ConfigurationProperty("TestimonialsProviders")]
    [ConfigurationValidatorAttribute(typeof(ProviderSettingsValidation))]
    public ProviderSettingsCollection TestimonialsProviders
    {
        get { return (ProviderSettingsCollection)this["TestimonialsProviders"]; }

    }

    [ConfigurationProperty("NewsProviders")]
    [ConfigurationValidatorAttribute(typeof(ProviderSettingsValidation))]
    public ProviderSettingsCollection NewsProviders
    {
        get { return (ProviderSettingsCollection)this["NewsProviders"]; }

    }

    [ConfigurationProperty("CatalogProviders")]
    [ConfigurationValidatorAttribute(typeof(ProviderSettingsValidation))]
    public ProviderSettingsCollection CatalogProviders
    {
        get { return (ProviderSettingsCollection)this["CatalogProviders"]; }

    }

} // end class
