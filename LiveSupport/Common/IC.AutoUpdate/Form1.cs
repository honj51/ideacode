using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;
using System.Net;
using System.IO;

namespace IC.AutoUpdate
{
    public partial class Form1 : Form
    {
        private string productCode = "{D836B538-EA26-4028-8E53-5DFCFCFB5A96}";
        private string productInstallFile = @"setup\OperatorConsole.msi";
        WebClient wc = new WebClient();
        
        public Form1()
        {
            InitializeComponent();
            wc.DownloadProgressChanged += new DownloadProgressChangedEventHandler(wc_DownloadProgressChanged);
            wc.DownloadFileCompleted += new AsyncCompletedEventHandler(wc_DownloadFileCompleted);
            startDownload();
        }

        void wc_DownloadFileCompleted(object sender, AsyncCompletedEventArgs e)
        {
            label1.Text = "下载完成";
            buttonInstall.Enabled = true;
        }

        private void startDownload()
        {
            Directory.CreateDirectory("setup");
            buttonInstall.Enabled = false;
            try
            {
                wc.DownloadFileAsync(new Uri("http://www.zxkefu.cn/download/operatorconsole.msi"), productInstallFile);
            }
            catch (Exception)
            {
            } 
        }

        void wc_DownloadProgressChanged(object sender, DownloadProgressChangedEventArgs e)
        {
            label1.Text = e.ProgressPercentage.ToString()+"%";
            this.progressBar1.Value = e.ProgressPercentage;
        }

        private void buttonInstall_Click(object sender, EventArgs e)
        {
            this.Hide();
            Process uninstallProcess = Process.Start(@"C:\WINDOWS\system32\msiexec.exe", "/x " + productCode);
            
            uninstallProcess.WaitForExit();
            Process.Start(@"C:\WINDOWS\system32\msiexec.exe", "/i " + productInstallFile);
            this.Close();
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            wc.CancelAsync();
            this.Close();
        }

      
      
    }
}
