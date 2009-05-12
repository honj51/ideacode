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
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

public class ChatService
{
    static ChatService()
    { 
    }

    private static List<Chat> chats = new List<Chat>();

    public static bool HasNewMessage(string chatId, long lastCheck)
    {
        throw new NotImplementedException();
    }

    public static void ChatPageRequestChat(Chat chatRequest)
    {
        chats.Add(chatRequest);

        SqlChatProvider.AddChat(chatRequest);
        Message m = new Message();
        m.ChatId = chatRequest.ChatId;
        m.Text = "正在接入客服，请稍等...";
        m.Type = MessageType.SystemMessage_ToVisitor;
        MessageService.AddMessage(m);
    }

    public static List<Chat> GetAllChatRequest(string accountId)
    {
        return chats.FindAll(c => c.AccountId == accountId);
    }

    public static void SendMessage(Message m)
    {
        MessageService.AddMessage(m);
    }
}
