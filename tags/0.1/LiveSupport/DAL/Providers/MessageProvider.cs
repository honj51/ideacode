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
    public abstract List<Message> GetMessages(string SessionId, DateTime lastCheck);////跟据对话id,和最后发送时间后面新添的消息
}
