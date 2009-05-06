#region Header Comment
#endregion
using System;
using System.Configuration;

/// <summary>
/// Summary description for VisitorServiceSection
/// </summary>
public class VisitSessionServiceSection : ConfigurationSection
{
    [ConfigurationProperty("providers")]
    public ProviderSettingsCollection Providers
    {
        get { return (ProviderSettingsCollection)base["providers"]; }
    }

    [StringValidator(MinLength = 1)]
    [ConfigurationProperty("defaultProvider", DefaultValue = "MemoryVisitSessionrProvider")]
    public string DefaultProvider
    {
        get { return (string)base["defaultProvider"]; }
        set { base["defaultProvider"] = value; }
    }
}