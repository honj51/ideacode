using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace IC.AutoUpdate
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
            string productCode, productInstallFileUrl, productInstallFileSavePath;

            Application.Run(new Form1());
        }
    }
}
