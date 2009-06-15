using System;
using System.Configuration;

/// <summary>
/// Summary description for VisitorServiceSection
/// </summary>
public class MessageServiceSection : ConfigurationSection
{
    [ConfigurationProperty("providers")]
    public ProviderSettingsCollection Providers
    {
        get { return (ProviderSettingsCollection)base["providers"]; }
    }

    [StringValidator(MinLength = 1)]
    [ConfigurationProperty("defaultProvider", DefaultValue = "MemoryMessageProvider")]
    public string DefaultProvider
    {
        get { return (string)base["defaultProvider"]; }
        set { base["defaultProvider"] = value; }
    }
}