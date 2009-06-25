using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.IO;
using System.Threading;
using System.Diagnostics;
using LiveSupport.OperatorConsole.Util;

namespace LiveSupport.OperatorConsole.Controls
{
    public partial class FileUploadControl : UserControl
    {
        public event EventHandler<FileUploadEventArgs> FileUploadCompleted;
        Common common = new Common();
        FtpUpload ftpUpload;
        string fileName;
        string fileFullPath;
        long fileSize;
        string ftpURL;

        public FtpUpload FtpUpload
        {
            get { return ftpUpload; }
        }

        UploadStatus status;

        public FileUploadControl()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 上传文件控件
        /// </summary>
        /// <param name="fileFullPath">上传的文件全路径</param>
        /// <param name="saveURL">需要上传到Ftp目录URL</param>
        public FileUploadControl(string fileFullPath, string saveURL)
        {
            InitializeComponent();
            this.lblSpeed.Text = "正在传输...";
            this.fileFullPath = fileFullPath;
            this.fileName = fileFullPath.Substring(fileFullPath.LastIndexOf("\\") + 1);
            this.ftpURL = saveURL.EndsWith("/")? saveURL + fileName : saveURL + "/" + fileName;
            this.pictureBox1.Image = Common.GetFileIcon(fileFullPath).ToBitmap();
            FileInfo fileInfo = new FileInfo(this.fileFullPath);
            fileSize = fileInfo.Length;
            progressBar1.Maximum = (int)fileSize;
        }

        private void FileUploadControl_Load(object sender, EventArgs e)
        {
            this.lblFileName.Text = this.fileName;
            progressBar1.Value = 0;//设置当前值

            ftpUpload = new FtpUpload(this.fileFullPath, ftpURL);
            ftpUpload.FileUploadProgress += new EventHandler<FileUploadProgressEventArgs>(ftpUpload_FileUploadProgress);
            ftpUpload.Start();
        }

        private void lblCancel_Click(object sender, EventArgs e)
        {
            ftpUpload.Cancel();

            status = UploadStatus.Cancel;
        }

        delegate void UpdateUI();


        void ftpUpload_FileUploadProgress(object sender, FileUploadProgressEventArgs e)
        {
            status = e.Status;
            //decimal speed = e.UploadChange.Speed;
            this.Invoke(new UpdateUI(delegate()
             {
                 progressBar1.Value += e.ContentLen;
                 this.lblProgress.Text = (progressBar1.Value / 1024) + "Kb /" + (fileSize / 1024) + "Kb";
             }));

            if (status == UploadStatus.Uploading)
            {
                return;
            }
            else if (status == UploadStatus.Error)
            {
                this.Invoke(new UpdateUI(delegate()
                {
                    this.lblSpeed.Text = "上传失败";
                }));
            }
            else if (status == UploadStatus.Cancel)
            {
                this.Invoke(new UpdateUI(delegate()
                {
                    this.lblSpeed.Text = "上传被取消";
                }));
            }
            else
            {
                status = UploadStatus.Succeed;
                this.Invoke(new UpdateUI(delegate()
                {
                    this.lblSpeed.Text = "上传成功";
                }));
            }

            if (FileUploadCompleted != null)
            {
                FileUploadCompleted(this, new FileUploadEventArgs(status, this, this.fileName));
            }
        }
    }

   
    public class FileUploadEventArgs : EventArgs
    {
        public UploadStatus Status;
        public FileUploadControl FileUploadControl;
        public string FileName;
        public FileUploadEventArgs(UploadStatus status, FileUploadControl fileUploadControl,string fileName)

        {
            this.FileName = fileName;
            this.Status = status;
            this.FileUploadControl = fileUploadControl;
        }
    }
}
