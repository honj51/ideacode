using System.Configuration.Provider;
using System.Collections.Generic;


/// <summary>
/// base data access class
/// </summary>
public abstract class NewsProvider : ProviderBase
{
    public abstract List<NewsItem> GetAllNews();
    public abstract NewsItem GetNewsItem(string newsItemId);
}

