using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;

/// <summary>
/// Summary description for ChatRequestProvider
/// </summary>
public abstract class MessageProvider : ProviderBase
{
    public List<Message> GetMessages(string SessionId, DateTime lastCheck);
}
