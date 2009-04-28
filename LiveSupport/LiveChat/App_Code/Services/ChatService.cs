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
using LiveSupport.BLL;

/// <summary>
/// Chat Service
/// </summary>
/// �洢�Ի�����
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
        //���ϵͳ��ʾ��Ϣ
        
        ChatMessageInfo msg = new ChatMessageInfo(request.ChatId, Consts.ChatSystemName, 
            "��ӭ����"+AccountsManager.GetAccountId(int.Parse(request.AccountId)).Name+",���Ժ�...", Consts.MessageType_ToChatPage);
        AddMessage(msg);        
	}

    //���������Ϣ
	public static void AddMessage(ChatMessageInfo msg)
	{
		// Load the provider
		LoadProvider();
		_provider.AddChatMessage(msg);
	}
    //��ȡ������Ϣ
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
    //ҳ����ò�ѯ�Ƿ�����Ϣ
    public static string GetRequestsByAidandIP(int AccountId, string ip)
    {
        LoadProvider();
        List<ChatRequestInfo> li = _provider.GetRequestsByAidandIP(AccountId, ip);
        if (li.Count > 0)
        {
            string aa = null;
            foreach (ChatRequestInfo c in li)
            {
                aa = c.ChatId;
            }
            UpIsShowRequestsByAidandIP(AccountId, ip, "2");
            return aa;
        }
        else
        {
            return "no";
        }
    }
    //����IsShow����ʾ
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
    //ͨ���Ի���Ż�ÿͻ����
    public static bool getOperatorIDByChatID(string chatId)
    {
        return _provider.getOperatorIDByChatID(chatId);
    }
     //ͨ��ChatId�޸Ŀͷ���ԱID
    public static void UpdateOperatorIDByChatID(string chatId, int operatorId)
    {
        _provider.UpdateOperatorIDByChatID(chatId, operatorId);
    }
}
