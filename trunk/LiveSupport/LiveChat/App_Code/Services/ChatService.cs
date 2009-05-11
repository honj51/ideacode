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
using LiveSupport.BLL;
using LiveSupport.LiveSupportDAL.SqlProviders;

public class ChatService
{
    public static bool HasNewMessage(string chatId, long lastCheck)
    {
        throw new NotImplementedException();
    }
}
