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
using LiveSupport.OperatorConsole.Controls;

namespace LiveSupport.OperatorConsole
{
	static class Program
	{
        public static MainForm MainForm;
        public static List<ChatForm> ChatForms = new List<ChatForm>();
        public static IOperatorServiceAgent OperaterServiceAgent;
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
            OperaterServiceAgent = OperatorServiceAgent.Default;
            LoginForm f = new LoginForm();
            f.OperatorServiceAgent = OperatorServiceAgent.Default;
            Application.Run(f);
            //TestFileUploadControl();
           // TestOptionForm();
		}

        static void TestOptionForm()
        {
            OptionsForm f = new OptionsForm();
            f.ShowDialog();
        }

        static void TestFileUploadControl()
        {
            Form f = new Form();
            FileUploadControl c = new FileUploadControl("c:\\a.exe", "");
            c.Dock = DockStyle.Top;
            c = new FileUploadControl("c:\\a.exe", Properties.Settings.Default.FtpURL);
            f.Controls.Add(c);
            //c = new FileUploadControl("c:\\a.exe", Properties.Settings.Default.FtpURL);
            //c.Dock = DockStyle.Top;
            //f.Controls.Add(c);
            Application.Run(f);
        }

        static void Test()
        {
            OperaterServiceAgent.Login("100000", "user1", "123");
            Chat chat = new Chat();
            ChatForm chatform = new ChatForm(OperatorServiceAgent.Default, chat);

            Snipping sp = new Snipping();
            sp.Show();
            Application.Run();
        }

        static void Application_ThreadException(object sender, System.Threading.ThreadExceptionEventArgs e)
        {
            ErrorCaptureUtils.SendError(e.Exception, "", "", Assembly.GetExecutingAssembly().GetName().Version.ToString(), Properties.Settings.Default.FtpURL,true, Properties.Settings.Default.FtpUser, Properties.Settings.Default.FtpPasssword);
            Application.Restart();
        }
	}
}