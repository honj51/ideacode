#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/24
 * Comment		: 
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Collections.Generic;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Diagnostics;
using VisualAsterisk.ExceptionManagement;
using System.Reflection;

namespace LiveSupport.OperatorConsole
{
	static class Program
	{
        public static MainForm MainForm;
        public static List<NotifyForm> NotifyForms = new List<NotifyForm>();
        public static List<ChatForm> ChatForms = new List<ChatForm>();
        
        public static List<Visitor> Visitors;
        public static List<Chat> Chats = new List<Chat>();
        public static Operator CurrentOperator;        
        public static List<QuickResponseCategory> quickResponseCategory = new List<QuickResponseCategory>();
        
        public static List<Chat> GetMyActiveChatSessions()
        {
            List<Chat> chats = new List<Chat>();
            foreach (var item in ChatForms)
            {
                if (item.Chat.Status != ChatStatus.Closed)
                {
                    chats.Add(item.Chat);
                }
            }
            return chats;
        }
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main()
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
            Application.ThreadException += new System.Threading.ThreadExceptionEventHandler(Application_ThreadException);
            Application.Run(new Login());
		}

        static void Application_ThreadException(object sender, System.Threading.ThreadExceptionEventArgs e)
        {
            ErrorCaptureUtils.SendError(e.Exception, "", "", Assembly.GetExecutingAssembly().GetName().Version.ToString(), Properties.Settings.Default.FtpURL,true, Properties.Settings.Default.FtpUser, Properties.Settings.Default.FtpPasssword);
            Application.Restart();
        }
	}
}