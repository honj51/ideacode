using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

public class AccountsServiceSection : ConfigurationSection
{
    [ConfigurationProperty("providers")]
    public ProviderSettingsCollection Providers
    {
        get { return (ProviderSettingsCollection)base["providers"]; }
    }

    [StringValidator(MinLength = 1)]
    [ConfigurationProperty("defaultProvider", DefaultValue = "AccountsChatProvider")]
    public string DefaultProvider
    {
        get { return (string)base["defaultProvider"]; }
        set { base["defaultProvider"] = value; }
    }
}
