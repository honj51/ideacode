using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace IC.AutoUpdate
{
    static class Program
    {
        public static string ProductCode = "{D836B538-EA26-4028-8E53-5DFCFCFB5A96}";
        public static string ProductInstallFileUrl;
        public static string ProductInstallFileSavePath = @"setup\OperatorConsole.msi";
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {   
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            foreach (var item in args)
            {
                if (item.StartsWith("/url"))
                {
                    ProductInstallFileUrl = item.Substring(4);
                    MessageBox.Show(ProductInstallFileUrl);
                }
            }

            Application.Run(new Form1());
        }
    }
}
