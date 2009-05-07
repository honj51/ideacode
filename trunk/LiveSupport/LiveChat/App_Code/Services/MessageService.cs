using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;
using LiveSupport.BLL;
using LiveSupport.DAL.Properties;
/// <summary>
///MessageService 的摘要说明
/// </summary>
public class MessageService
{
    private static MessageProvider _messageProvider = null;

    public static MessageProvider MessageProvider
    {
        get {
            LoadProvider();
            return MessageService._messageProvider; }
    }

    private static object _lock = new object();

    private static void LoadProvider()
    {
        // if we do not have initiated the provider
        if (_messageProvider == null)
        {
            lock (_lock)
            {
                // Do this again to make sure _visitor is still null
                if (_messageProvider == null)
                {
                    // Get a reference to the <requestService> section
                    MessageServiceSection section = (MessageServiceSection)WebConfigurationManager.GetSection("system.web/messageService");

                    // Load the default provider
                    if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
                        _messageProvider = (MessageProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(MessageProvider));

                    if (_messageProvider == null)
                        throw new ProviderException("Unable to load the VisitorProvider");
                }
            }
        }
    }
    public MessageService()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
}
