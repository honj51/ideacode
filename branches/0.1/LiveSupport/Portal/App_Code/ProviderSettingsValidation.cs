using System;
using System.Configuration;


/// <summary>
// ensures the providerCollection contains a set of ProviderSettings, where each one
// "is a " Provider
/// </summary>
public class ProviderSettingsValidation : ConfigurationValidatorBase {

    public override bool CanValidate(Type type) 
    {
      return type == typeof(ProviderSettingsCollection);
    }

    /// <summary>
    // validate the provider section    
    /// </summary>
    public override void Validate(object value) 
    {
      ProviderSettingsCollection providerCollection = value as ProviderSettingsCollection;
      if (providerCollection != null) 
      {

        foreach (ProviderSettings _provider in providerCollection) 
        {
          if (String.IsNullOrEmpty(_provider.Type)) 
          {
            throw new ConfigurationErrorsException("Type was not defined in the provider");
          }

          Type dataAccessType = Type.GetType(_provider.Type);
          if (dataAccessType == null) 
          {
              throw (new InvalidOperationException("Provider's Type could not be found"));
          }
        }
      }
    }
}
