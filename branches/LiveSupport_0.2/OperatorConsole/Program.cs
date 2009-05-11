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

namespace LiveSupport.OperatorConsole
{
	static class Program
	{
		private static OperatorConsole.LiveChatWS.Operator myOperator;
        private static List<ChatForm> chatForms = new List<ChatForm>();

        public static List<ChatForm> ChatForms
        {
            get { return chatForms; }
        }

		public static OperatorConsole.LiveChatWS.Operator CurrentOperator
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
           //Application.Run(new ListViewGroupsExample());
		}

        static void Application_ThreadException(object sender, System.Threading.ThreadExceptionEventArgs e)
        {
            MessageBox.Show("δ�����쳣, ���������󱨸�� \r\n: wanwei_ncu@126.com \r\n\r\n������Ϣ:\r\n\r\n" + e.Exception.Message + "\r\n" + e.Exception.StackTrace, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
	}
}