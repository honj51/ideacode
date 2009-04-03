using System.Configuration.Provider;
using System.Collections.Generic;

/// <summary>
/// base data access class
/// </summary>
public abstract class PeopleProvider : ProviderBase
{
    public abstract List<Person> GetAllPersons();
}
    

