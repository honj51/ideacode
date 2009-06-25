using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Threading;
using System.Net;
using System.Diagnostics;

namespace LiveSupport.OperatorConsole.Util
{
    public class FtpUpload
    {
        public event EventHandler<FileUploadProgressEventArgs> FileUploadProgress;

        private UploadStatus status;
        private string fileFullPath;
        private string ftpURL;
        private string user;

        public string User
        {
            get { return user; }
            set { user = value; }
        }
        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public FtpUpload(string fileFullPath, string ftpURL) 
        {
            this.fileFullPath = fileFullPath;
            this.ftpURL = ftpURL;
            this.user = Properties.Settings.Default.FtpUser;
            this.password = Properties.Settings.Default.FtpPasssword;
        }

        public void Start()
        {
            Thread t = new Thread(new ThreadStart(FtpFileUpload));
            t.Start();
            status = UploadStatus.Uploading;
        }
        
        public void Cancel()
        {
            status = UploadStatus.Cancel;
        }
        
        private void FtpFileUpload()
        {
            FileInfo fileInfo = new FileInfo(this.fileFullPath);
            try
            {
                //string uri = "ftp://" + Properties.Settings.Default.FtpURL + "/upload/" + fileInfo.Name;
                FtpWebRequest reqFTP;
                // 根据uri创建FtpWebRequest对象
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(ftpURL));
                // ftp用户名和密码
                reqFTP.Credentials = new NetworkCredential(user, password);
                // 默认为true，连接不会被关闭
                // 在一个命令之后被执行
                reqFTP.KeepAlive = false;
                // 指定执行什么命令
                reqFTP.Method = WebRequestMethods.Ftp.UploadFile;
                // 指定数据传输类型
                reqFTP.UseBinary = true;
                reqFTP.UsePassive = true;
                // 上传文件时通知服务器文件的大小
                reqFTP.ContentLength = fileInfo.Length;
                // 缓冲大小设置为2kb
                int buffLength = 2048;
                byte[] buff = new byte[buffLength];
                int contentLen;
                //int byteUploaded = 0;
                // 打开一个文件流 (System.IO.FileStream) 去读上传的文件
                FileStream fs = fileInfo.OpenRead();

                Stream strm = reqFTP.GetRequestStream();
                contentLen = fs.Read(buff, 0, buffLength);

                while (contentLen != 0 && status == UploadStatus.Uploading)
                {
                    //byteUploaded += contentLen;
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
                    }

                    if (FileUploadProgress != null)
                    {
                        FileUploadProgress(this, new FileUploadProgressEventArgs(status, 0,contentLen));
                    }
                }

                if (FileUploadProgress != null)
                {
                    FileUploadProgress(this, new FileUploadProgressEventArgs(UploadStatus.Succeed, 0, 0));
                }
                // 关闭两个流
                strm.Close();
                fs.Close();

            }
            catch (Exception ex)
            {
                Debug.WriteLine("FileUpload exception" + ex.Message);
                if (FileUploadProgress != null)
                {
                    FileUploadProgress(this, new FileUploadProgressEventArgs(UploadStatus.Error, 0, 0));
                }

            }
        }
        
    }
    #region Ftp相关事件&属性

    public class FileUploadProgressEventArgs : EventArgs
    {
        public UploadStatus Status;
        public decimal Speed;
        public int ContentLen;

        public FileUploadProgressEventArgs(UploadStatus status, decimal speed, int contentLen)
        {
            this.Status = status;
            this.Speed = speed;
            this.ContentLen = contentLen;
        }
    }

    public enum UploadStatus
    {
        Uploading, Succeed, Cancel, Error
    }
    #endregion
}
