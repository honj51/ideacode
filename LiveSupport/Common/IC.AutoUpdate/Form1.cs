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
using System.Threading;

namespace IC.AutoUpdate
{
    public partial class Form1 : Form
    {
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
            if (e.Error != null)
            {
                label1.Text = "无法连接服务器，下载失败！";
            }
            else
            {
                label1.Text = "下载完成";
                buttonInstall.Enabled = true;
            }
        }

        private void startDownload()
        {
            Directory.CreateDirectory("setup");
            buttonInstall.Enabled = false;
            try
            {
                wc.DownloadFileAsync(new Uri(Program.ProductInstallFileUrl), Program.ProductInstallFileSavePath);
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
            this.buttonInstall.Enabled = false;
            this.buttonCancel.Enabled = false;

            this.progressBar1.Value = 0;
            this.progressBar1.MarqueeAnimationSpeed = 10;
            this.progressBar1.Style = ProgressBarStyle.Marquee;
            label1.Text = "正在处理旧版本程序...";
            Process p = Process.Start(@"C:\WINDOWS\system32\msiexec.exe", "/quiet /x " + Program.ProductCode);
            //uninstallProcess.WaitForExit();
            while (!p.HasExited)
            {
                Application.DoEvents();
                Thread.Sleep(100);
            }
            label1.Text = "正在处更新程序...";
            p = Process.Start(@"C:\WINDOWS\system32\msiexec.exe", "/quiet /i " + Program.ProductInstallFileSavePath);

            while (!p.HasExited)
            {
                Application.DoEvents();
                Thread.Sleep(100);
            }

            label1.Text = "更新程序成功！";
            this.progressBar1.Style = ProgressBarStyle.Blocks;
            this.progressBar1.Value = 100;
            this.buttonCancel.Enabled = true;
            this.buttonCancel.Text = "确定";
            //this.Close();
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            wc.CancelAsync();
            this.Close();
        }
    }
}
