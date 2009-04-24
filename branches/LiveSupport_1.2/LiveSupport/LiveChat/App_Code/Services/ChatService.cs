#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/17
 * Comment		: Chat Provider Helper
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;

/// <summary>
/// Chat Service
/// </summary>
/// 存储对话请求。
/// 
public class ChatService
{
	private static ChatProvider _provider = null;
	private static object _lock = new object();

	public ChatProvider Provider
	{
		get { return _provider; }
	}

	public static void RequestChat(ChatRequestInfo request)
	{
		// Load the provider
		LoadProvider();

		_provider.RequestChat(request);
	}

    //添加聊天信息
	public static void AddMessage(ChatMessageInfo msg)
	{
		// Load the provider
		LoadProvider();
		_provider.AddChatMessage(msg);
	}
    //获取聊天信息
	public static List<ChatMessageInfo> GetMessages(string chatId, long lastCheck)
	{
		// Load the provider
		LoadProvider();

		return _provider.GetMessages(chatId, lastCheck);
	}

    public static List<ChatRequestInfo> GetRequests(Operator op)
    {
        // Load the provider
        LoadProvider();

        return _provider.GetChatRequests(op);
    }
    //页面调用查询是否有消息
    public static string GetRequestsByAidandIP(int AccountId, string ip)
    {
        LoadProvider();
        List<ChatRequestInfo> li = _provider.GetRequestsByAidandIP(AccountId, ip);
        if (li.Count > 0)
        {
            UpIsShowRequestsByAidandIP(AccountId, ip, "2");
            return "ok";
        }
        else
        {
            return "no";
        }
    }
    //更新IsShow的显示
    public static void UpIsShowRequestsByAidandIP(int AccountId, string ip, string IsShow)
    {
        _provider.UpIsShowRequestsByAidandIP(AccountId, ip, IsShow);
    }
    public static void RemoveChatRequest(ChatRequestInfo req)
    {
        // Load the provider
        LoadProvider();
         
        _provider.RemoveChatRequest(req);
    }

    public static bool HasNewMessage(string chatId, long lastMessageId)
    {
        // Load the provider
        LoadProvider();

        return _provider.HasNewMessage(chatId, lastMessageId);
    }
     
	private static void LoadProvider()
	{
		// if we do not have initiated the provider
		if (_provider == null)
		{
			lock (_lock)
			{
				// Do this again to make sure _provider is still null
				if (_provider == null)
				{
					// Get a reference to the <requestService> section
					ChatServiceSection section = (ChatServiceSection)WebConfigurationManager.GetSection("system.web/chatService");

					// Load the default provider
					if (section.Providers.Count > 0 && !string.IsNullOrEmpty(section.DefaultProvider) && section.Providers[section.DefaultProvider] != null)
						_provider = (ChatProvider)ProvidersHelper.InstantiateProvider(section.Providers[section.DefaultProvider], typeof(ChatProvider));

					if (_provider == null)
						throw new ProviderException("Unable to load the ChatProvider");
				}
			}
		}
	}
    //通过用户编号获得客户编号
    public static bool getOperatorIDByChatID(string chatId)
    {
        return _provider.getOperatorIDByChatID(chatId);
    }
     //通过ChatId修改客服人员ID
    public static void UpdateOperatorIDByChatID(string chatId, int operatorId)
    {
        _provider.UpdateOperatorIDByChatID(chatId, operatorId);
    }
}
