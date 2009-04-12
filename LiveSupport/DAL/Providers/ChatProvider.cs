#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Chat Provider
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;

/// <summary>
/// Summary description for ChatRequestProvider
/// </summary>
public abstract class ChatProvider  : ProviderBase
{
	public abstract string RequestChat(ChatRequestInfo request);
	public abstract void AddChatMessage(ChatMessageInfo msg);
	public abstract List<ChatMessageInfo> GetMessages(string chatId, long lastCheck);
    public abstract List<ChatRequestInfo> GetChatRequests(Operator op);
	public abstract void RemoveChatRequest(ChatRequestInfo req);
    public abstract bool HasNewMessage(string chatId, long lastMessageId);
}
