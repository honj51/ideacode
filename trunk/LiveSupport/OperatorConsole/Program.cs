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
using VisualAsterisk.Test.Temp;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
	static class Program
	{
        public static MainForm MainForm;
        public static List<OperatorConsole.LiveChatWS.Visitor> Visitors;
        public static Operator CurrentOperator;
        public static List<ChatForm> ChatForms = new List<ChatForm>();
        public static int ActiveChat = 0;
        public static List<VisitSession> GetMyActiveChatSessions()
        {
            List<VisitSession> sessions = new List<VisitSession>();
            foreach (var item in ChatForms)
            {
                if (item.ChatSession.Status != VisitSessionStatus.Leave)
                {
                    sessions.Add(item.ChatSession);
                }
            }
            return sessions;
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
           //Application.Run(new ListViewGroupsExample());
		}

        static void Application_ThreadException(object sender, System.Threading.ThreadExceptionEventArgs e)
        {
            MessageBox.Show("未捕获异常, 请把这个错误报告给 \r\n: wanwei_ncu@126.com \r\n\r\n错误信息:\r\n\r\n" + e.Exception.Message + "\r\n" + e.Exception.StackTrace, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
	}
}