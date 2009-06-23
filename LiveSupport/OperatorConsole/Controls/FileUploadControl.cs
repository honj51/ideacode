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

namespace LiveSupport.OperatorConsole.Controls
{
    public partial class FileUploadControl : UserControl
    {
        public event EventHandler<FileUploadEventArgs> FileUploadCompleted;
        string fileName;
        string fileFullPath;

        UploadStatus status = UploadStatus.Uploading;

        public FileUploadControl()
        {
            InitializeComponent();
        }

        public FileUploadControl(string fileFullPath)
        {
            InitializeComponent();
            this.fileFullPath = fileFullPath;
            this.fileName = fileFullPath.Substring(fileFullPath.LastIndexOf("\\") + 1); ;
            this.pictureBox1.Image = Common.GetFileIcon(fileFullPath).ToBitmap();
            Thread t = new Thread(new ThreadStart(Upload));
            t.Start();
        }

        public FileUploadControl(string fileName,TabPage tabPage) 
        {
            InitializeComponent();
           // this.tabPage = tabPage;
            this.fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            Upload();
        }

        private void FileUploadControl_Load(object sender, EventArgs e)
        {
            this.lblFileName.Text = this.fileName;
            progressBar1.Value = 0;//设置当前值
        }

        private void lblCancel_Click(object sender, EventArgs e)
        {
           
            status = UploadStatus.Cancel;
        }

        private void progressDone()
        {
            progressBar1.Value = progressBar1.Maximum;
           // this.lblProgress.Text = (progressBar1.Value / 1024) + "Kb /" + (10000000/ 1024) + "Kb";
           // timer.Enabled = false;
         if (MessageBox.Show(this.fileName + "已传输完毕","提示") == DialogResult.OK)
         {
             
                    //this.tabPage.Controls.Remove(this);
                    //if (this.tabPage.Controls.Count == 0)
                    //{
                    //    this.tabPage.Parent.Controls.Remove(this.tabPage);
                    //}
                    //else
                    //{
                    //    foreach (Control item in this.tabPage.Controls)
                    //    {
                    //        if (item.Location == new System.Drawing.Point(4, this.Height + 10))
                    //        {
                    //            item.Location = new System.Drawing.Point(4, 21);

                    //        }

                    //    }
                    //}
                }
                  
                
    
        }

        delegate void UpdateUI();

        private void Upload()
        {
            FileInfo fileInf = new FileInfo(this.fileFullPath);
            string uri = "ftp://" + Properties.Settings.Default.FtpURL+"/data/"+fileInf.Name;
            FtpWebRequest reqFTP;
            // 根据uri创建FtpWebRequest对象
            reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(uri));
            // ftp用户名和密码
            reqFTP.Credentials = new NetworkCredential(Properties.Settings.Default.FtpUser,Properties.Settings.Default.FtpPasssword);
            // 默认为true，连接不会被关闭
            // 在一个命令之后被执行
            reqFTP.KeepAlive = false;
            // 指定执行什么命令
            reqFTP.Method = WebRequestMethods.Ftp.UploadFile;
            // 指定数据传输类型
            reqFTP.UseBinary = true;
            reqFTP.UsePassive = true;
            // 上传文件时通知服务器文件的大小
            reqFTP.ContentLength = fileInf.Length;
            // 缓冲大小设置为2kb
            int buffLength = 2048;
            byte[] buff = new byte[buffLength];
            int contentLen;
            int byteUploaded = 0;
            // 打开一个文件流 (System.IO.FileStream) 去读上传的文件
            FileStream fs = fileInf.OpenRead();

            this.Invoke(new UpdateUI(delegate() {
                    progressBar1.Maximum = Convert.ToInt32(fileInf.Length);
                }
            ));

            try
            {
                Stream strm = reqFTP.GetRequestStream();
                contentLen = fs.Read(buff, 0, buffLength);

                while (contentLen != 0 && status != UploadStatus.Cancel)
                {
                    byteUploaded += contentLen;
                    DateTime start = DateTime.Now;

                    strm.Write(buff, 0, contentLen);
                    contentLen = fs.Read(buff, 0, buffLength);

                    DateTime end = DateTime.Now;
                    TimeSpan t = new TimeSpan(end.Ticks - start.Ticks);

                    long seconds = t.Ticks / 10000000;
                    if (seconds != 0)
                    {
                        long bps = contentLen / seconds;
                        decimal speed = bps / 1024;
                        this.Invoke(new UpdateUI(delegate()
                        {
                            this.lblSpeed.Text = Convert.ToDecimal(speed).ToString();

                        }
                        ));
                    }
                    this.Invoke(new UpdateUI(delegate()
                    {
                        this.lblProgress.Text = (byteUploaded / 1024) + "Kb /" + (fileInf.Length / 1024) + "Kb";
                        progressBar1.Value += contentLen;
                    }));

                }
                // 关闭两个流
                strm.Close();
                fs.Close();
                if (status == UploadStatus.Cancel)
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
                        this.lblSpeed.Text = "上传完成";
                    }));
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine("FileUpload exception" + ex.Message);
                status = UploadStatus.Error;
            }
            finally
            {
                if (FileUploadCompleted != null)
                {
                    FileUploadCompleted(this, new FileUploadEventArgs(status,this));
                }                
            }
        }
    }

    public enum UploadStatus
    {
        Uploading, Succeed, Cancel, Error
    }

    public class FileUploadEventArgs : EventArgs
    {
        public UploadStatus Status;
        public FileUploadControl FileUploadControl;
        public FileUploadEventArgs(UploadStatus status, FileUploadControl fileUploadControl)
        {
            this.Status = status;
            this.FileUploadControl = fileUploadControl;
        }
    }
}
