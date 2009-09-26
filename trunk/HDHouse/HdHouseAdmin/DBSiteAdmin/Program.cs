using System;
using System.Collections.Generic;
using System.Windows.Forms;
using Microsoft.Win32;

namespace DBSiteAdmin
{
    static class Program
    {
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            MainForm f = new MainForm();
            f.Show();
            foreach (var item in args)
            {
                if (item.StartsWith("-hide"))
                {
                    f.WindowState = FormWindowState.Minimized;
                }
            }
            StarWithWindows();
            Application.Run(f);
        }

        static void StarWithWindows()
        {
            RegistryKey run = Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
            run.SetValue("HdHouseAdmin", Application.ExecutablePath.ToString() + " -hide");
        }
    }
}
