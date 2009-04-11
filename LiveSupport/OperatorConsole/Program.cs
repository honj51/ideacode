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

namespace LiveChatStarterKit.OperatorConsole
{
	static class Program
	{
		private static OperatorConsole.LiveChatWS.OperatorInfo myOperator;

		public static OperatorConsole.LiveChatWS.OperatorInfo CurrentOperator
		{
			get { return myOperator; }
			set { myOperator = value; }
		}

		private static int activeChat = 0;
		/// <summary>
		/// Number of active chat
		/// </summary>
		public static int ActiveChat
		{
			get { return activeChat = 0; }
			set { activeChat = value; }
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
            MessageBox.Show("未捕获异常, 请把这个错误报告给 \r\n: wanwei_ncu@126.com \r\n\r\n错误信息:\r\n\r\n" + e.Exception.Message + "\r\n" + e.Exception.StackTrace, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
	}
}