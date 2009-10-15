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
using LiveSupport.LiveSupportModel;
using System.Diagnostics;
using VisualAsterisk.ExceptionManagement;
using System.Reflection;
using LiveSupport.OperatorConsole.Controls;
using System.IO;
using System.Xml;
using System.Net;
using System.Text;

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
        static void Main(string[] args)
		{
            foreach (var item in args)
            {
                if (item.StartsWith("/dv"))
                {
                    dumpVersionFile();
                    return;
                }
                else if (item.StartsWith("/us"))
                {
                    upgradeSettings();
                    return;
                }
            }

          //  Test();
           // return;

			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
            Application.ThreadException += new System.Threading.ThreadExceptionEventHandler(Application_ThreadException);
            TextWriterTraceListener listener1 = new TextWriterTraceListener("MyListener.log");
            listener1.TraceOutputOptions = TraceOptions.DateTime | TraceOptions.ThreadId;
            Trace.Listeners.Add(listener1);
            Trace.AutoFlush = true;
            OperaterServiceAgent = OperatorServiceAgent.Default;
            //OperaterServiceAgent = new OperatorServiceAgentMock();
            OperaterServiceAgent.ProductVersion = Assembly.GetExecutingAssembly().GetName().Version.ToString();
            LoginForm f = new LoginForm();
            f.OperatorServiceAgent = OperaterServiceAgent;

            Application.Run(f);
            
            
                OperaterServiceAgent.Logout();
           
            //
            //TestFileUploadControl();
            //TestOptionForm();
		}

        #region test
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
            ChatMessageViewerControl c = new ChatMessageViewerControl();
            //c.ResetContent("Hello");
            c.AddInformation("Hello Again");
            c.Dock = DockStyle.Fill;
            Form f = new Form();
            f.Controls.Add(c);
            //OperaterServiceAgent = OperatorServiceAgent.Default;
            //OperaterServiceAgent.Login("100000", "user1", "123");
            f.Show();
            c.AddInformation("www");
            Application.Run(f);
        }
        #endregion

        private static void upgradeSettings()
        {
            try
            {
                Properties.Settings.Default.Upgrade();
            }
            catch (Exception)
            {
            }
        }

        private static void dumpVersionFile()
        {
            string v = Assembly.GetExecutingAssembly().GetName().Version.ToString();

            XmlDocument doc = new XmlDocument();
            XmlNode node = doc.CreateNode(XmlNodeType.XmlDeclaration, "", "");
            doc.AppendChild(node);
            XmlElement e = doc.CreateElement("LatestVersionNumber");
            e.InnerText = v;
            doc.AppendChild(e);
            doc.Save("OperatorConsoleDeploy.xml");
        }

        static void Application_ThreadException(object sender, System.Threading.ThreadExceptionEventArgs e)
        {
            if (e.Exception is WebException)
            {
                MessageBox.Show(e.Exception.Message);
            }
            else
            {
                string errorID = Guid.NewGuid().ToString();
                ErrorCaptureUtils.SendError(errorID, e.Exception, "", "", Assembly.GetExecutingAssembly().GetName().Version.ToString(), Properties.Settings.Default.FtpURL + "/BugReports", true, Properties.Settings.Default.FtpUser, Properties.Settings.Default.FtpPasssword);
                ErrorCaptureUtils.SendLogFile(errorID, "MyListener.log", Properties.Settings.Default.FtpURL + "/BugReports", Properties.Settings.Default.FtpUser, Properties.Settings.Default.FtpPasssword);
            }
        }
	}
}