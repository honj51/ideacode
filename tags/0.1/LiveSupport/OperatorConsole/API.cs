using System;
using System.Runtime.InteropServices;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
	public class API
	{
		[DllImport("user32.dll")]
		static extern Int32 FlashWindowEx(ref FLASHWINFO pwfi);

		[StructLayout(LayoutKind.Sequential)]
		public struct FLASHWINFO
		{
			public UInt32 cbSize;
			public IntPtr hwnd;
			public UInt32 dwFlags;
			public UInt32 uCount;
			public UInt32 dwTimeout;
		}

		//Stop flashing. The system restores the window to its original state. 
		public const UInt32 FLASHW_STOP = 0;
		//Flash the window caption. 
		public const UInt32 FLASHW_CAPTION = 1;
		//Flash the taskbar button. 
		public const UInt32 FLASHW_TRAY = 2;
		//Flash both the window caption and taskbar button.
		//This is equivalent to setting the FLASHW_CAPTION | FLASHW_TRAY flags. 
		public const UInt32 FLASHW_ALL = 3;
		//Flash continuously, until the FLASHW_STOP flag is set. 
		public const UInt32 FLASHW_TIMER = 4;
		//Flash continuously until the window comes to the foreground. 
		public const UInt32 FLASHW_TIMERNOFG = 12;

		public static bool FlashWindowEx(IntPtr hWnd)
		{
			FLASHWINFO fInfo = new FLASHWINFO();

			fInfo.cbSize = Convert.ToUInt32(Marshal.SizeOf(fInfo));
			fInfo.hwnd = hWnd;
			fInfo.dwFlags = FLASHW_ALL;
			fInfo.uCount = 3;
			fInfo.dwTimeout = 0;

			return (FlashWindowEx(ref fInfo) == 0);
		}


        public static bool FromSystem(Message m) { return m.Type == MessageType.SystemMessage_ToBoth || m.Type == MessageType.SystemMessage_ToOperator || m.Type == MessageType.SystemMessage_ToVisitor; }
        public static bool FromVisitor(Message m) { return m.Type == MessageType.ChatMessage_VistorToOperator; }
        public static bool IsChatMessage(Message m) { return m.Type == MessageType.ChatMessage_VistorToOperator || m.Type == MessageType.ChatMessage_OperatorToVisitor; }
        public static bool IsSystemMessage(Message m) { return !IsChatMessage(m); }

	}
}
