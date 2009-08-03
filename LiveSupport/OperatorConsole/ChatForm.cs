using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.IO;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Media;
using System.Drawing.Imaging;
using System.Collections;
using LiveSupport.OperatorConsole.Controls;
using LiveSupport.OperatorConsole.Util;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Web;


namespace LiveSupport.OperatorConsole
{
    public partial class ChatForm : Form
    {
        #region 截图相关代码


        private System.Windows.Forms.SaveFileDialog cutSaveFileDialog;

     


        //调用动态链接库gdi32.dll 
        [System.Runtime.InteropServices.DllImportAttribute("gdi32.dll")]
        private static extern bool BitBlt(
        IntPtr hdcDest, //目标设备的句柄 
        int nXDest, // 目标对象的左上角的X坐标 
        int nYDest, // 目标对象的左上角的X坐标 
        int nWidth, // 目标对象的矩形的宽度 
        int nHeight, // 目标对象的矩形的长度 
        IntPtr hdcSrc, // 源设备的句柄 
        int nXSrc, // 源对象的左上角的X坐标 
        int nYSrc, // 源对象的左上角的X坐标 
        System.Int32 dwRop // 光栅的操作值 
        );

        //调用动态链接库gdi32.dll 
        [System.Runtime.InteropServices.DllImportAttribute("gdi32.dll")]
        private static extern IntPtr CreateDC(
        string lpszDriver, // 驱动名称 
        string lpszDevice, // 设备名称 
        string lpszOutput, // 无用，可以设定位"NULL" 
        IntPtr lpInitData // 任意的打印机数据 
        );

        private void button1_Click(object sender, System.EventArgs e)
        {
            
            
        } 


        #endregion
        private Controls.FileUploadControl fileUploadControl;
        private System.Windows.Forms.TabPage tabPage3;
        private IOperatorServiceAgent operatorServiceAgent;
        private bool receiveMessage = true;
        private int acceptChatRequestResult = 0;
        private SoundPlayer player = new SoundPlayer();
        private Chat chat;
        private Visitor visitor;
        //private UserControlMessage ucm=null;
        private string uploadURL;

        private List<FtpUpload> uploadTasks = new List<FtpUpload>();

        public IOperatorServiceAgent OperatorServiceAgent
        {
            get { return operatorServiceAgent; }
            set { operatorServiceAgent = value; }
        }
        public Chat Chat
        {
            get { return chat; }
            set { chat = value; }
        }

        public void RecieveMessage(LiveSupport.OperatorConsole.LiveChatWS.Message message)
        {
           
            if (!this.IsDisposed && receiveMessage)
            {
                chatMessageViewerControl1.AddMessage(message);

                if (!this.ringToolStripMenuItem.Checked)
                {
                    PlayMsgSound();
                }
                if (!this.flashToolStripMenuItem.Checked)
                {
                    API.FlashWindowEx(this.Handle);
                }
            }
        }
        public void SystemMessage(string meg) 
        {
            chatMessageViewerControl1.AddInformation(meg);
        }
        

        public ChatForm(IOperatorServiceAgent agent,Chat chat): this(agent, chat, false)
        {           
        }

        public ChatForm(IOperatorServiceAgent agent, Chat chat, bool invite)
        {
            Directory.CreateDirectory(chat.ChatId);
            this.operatorServiceAgent = agent;
            InitializeComponent();
            this.chat = chat;
            uploadURL = Properties.Settings.Default.FtpURL + "/" + chat.ChatId + "/";

            if (!invite)
            {
                acceptChatRequestResult = operatorServiceAgent.AcceptChatRequest(chat.ChatId);
                if (acceptChatRequestResult == -1) 
                {
                    chatMessageViewerControl1.ResetContent("该访客对话请求已被其他客服接受");
                    receiveMessage = false;
                    return;
                }
                if (acceptChatRequestResult == -3)
                {
                    chatMessageViewerControl1.ResetContent("服务器错误");
                    receiveMessage = false;
                }
            }
            chatMessageViewerControl1.ResetContent("初始会话...");
            //ucm.GetMessage(msgs, "Navigate");

            visitor = operatorServiceAgent.GetVisitorById(chat.VisitorId);
            this.Text = "与 " + visitor.Name + " 对话中";
            this.visitorNameLabel.Text += visitor.Name;
            this.remarkLabel.Text += visitor.Remark;
            this.domainRequestedLabel.Text += visitor.CurrentSession.DomainRequested.ToString();
            this.visitorLocationLabel.Text += visitor.CurrentSession.Location;
            txtMsg.Focus();
            this.operatorServiceAgent.NewMessage += new EventHandler<NewMessageEventArgs>(operatorServiceAgent_NewMessage);
            loadQuickResponse(visitor.CurrentSession.DomainRequested.ToString());
            
        }

        void operatorServiceAgent_NewMessage(object sender, NewMessageEventArgs e)
        {
            try
            {
                this.Invoke(new UpdateUIDelegate(delegate(object obj)
                {
                    NewMessageEventArgs arg = e as NewMessageEventArgs;
                    if (arg.Message.ChatId == this.chat.ChatId)
                    {
                        RecieveMessage(arg.Message);
                    }

                }), e);
            }
            catch (Exception )
            {
                chatMessageViewerControl1.AddInformation("网络出现问题,暂时无法获取及发送消息");
                return;
            }
          
        }

        private void ExitToolStripButton_Click(object sender, EventArgs e)
        {
            this.Close();               
        }

        /// <summary>
        /// 发送文件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void uploadToolStripButton_Click(object sender, EventArgs e)
        {
            if (uploadOpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                string filename = uploadOpenFileDialog.FileName;

                foreach (FtpUpload item in uploadTasks)
	           {
		         if(item.fileFullPath==filename)
                 {
                     chatMessageViewerControl1.AddFloatInformation("文件" + filename.Substring(filename.LastIndexOf("\\") + 1) + "正在上传中,不能发送相同文件");
                     return;
                   
                 }
	           }
                try
                {
                    addTabPage(filename);
                    operatorServiceAgent.SendFile(filename, this.chat.ChatId, "start");
                }
                catch (Exception sfe)
                {
                    Debug.WriteLine("sendFile exception:" + sfe.Message);
                    chatMessageViewerControl1.AddInformation("网络出现问题,暂时无法获取及发送消息");
                    return;
                }
                
            }
        }
      

        /// <summary>
        /// 有新信息提示音
        /// </summary>
        public void PlayMsgSound()
        {
            player.Stream = Properties.Resources.newmsg;
            player.Play();
           
        }

        private void txtMsg_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }
        }

        private void txtMsg_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((int)e.KeyChar == 13 && txtMsg.Text.Length > 0)
            {
                e.Handled = true;
                string Text= HttpUtility.HtmlEncode(txtMsg.Text);
                WriteMessage(Text);
                txtMsg.Clear();
            }
        }

        //文本框接受数据
        private void txtMsg_DragDrop(object sender, DragEventArgs e)
        {
            int i;
            String s;

            // Get start position to drop the text.
            i = txtMsg.SelectionStart;
            s = txtMsg.Text.Substring(i);
            txtMsg.Text = txtMsg.Text.Substring(0, i);

            // Drop the text on to the txtMsg.
            txtMsg.Text = txtMsg.Text +
               e.Data.GetData(DataFormats.Text).ToString();
            txtMsg.Text = txtMsg.Text + s;


        }
        //数据拖入文本框，文本框检测数据内容
        private void txtMsg_DragEnter(object sender, DragEventArgs e)
        {
            // 如果文件被拖入, 显示“允许拖入”鼠标指针
            if (e.Data.GetDataPresent(DataFormats.Text))
                e.Effect = DragDropEffects.Copy;
            else
                e.Effect = DragDropEffects.None;

        }
        //写信息
        private void WriteMessage(string message)
        {
            WriteMessage(message,operatorServiceAgent.CurrentOperator !=null ?operatorServiceAgent.CurrentOperator.NickName :null );
        }
        //写信息
        private void WriteMessage(string message, string From)
        {
            LiveSupport.OperatorConsole.LiveChatWS.Message msg = new LiveSupport.OperatorConsole.LiveChatWS.Message();
            msg.ChatId = Chat.ChatId; 
            msg.Text = message;
            msg.Source = From;
            msg.SentDate = DateTime.Now;
            msg.Type = MessageType.ChatMessage_OperatorToVisitor;
            try
            {
                operatorServiceAgent.SendMessage(msg); 
            }
            catch (WebException wmg)
            {
                Debug.WriteLine("sendMessage exception:" + wmg.Message);
                string text = "<span style='color: #cccccc; FONT-SIZE: 15px'>"+msg.SentDate+"\r\n\r\n可能由于网络原因“" + msg.Text + "”消息发送失败。</span><br />";
                chatMessageViewerControl1.AddText(text);
                return;
            }
            //string msgs= string.Format("<span style=\"font-family: Arial;color:blue;font-weight: bold;font-size: 12px;\">{0} :</span><br/><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", From + "&nbsp;&nbsp;&nbsp;" + msg.SentDate.ToString("hh:mm:ss"), message);
            //ucm.GetMessage(msgs, " ");
            chatMessageViewerControl1.AddMessage(msg);
        }

        /// <summary>
        /// 截图
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cutToolStripButton_Click(object sender, EventArgs e)
        {
            Snipping snipping = new Snipping();
            snipping.Owner = this;
            snipping.Show();
        }

        private void ChatForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (chat.Status != ChatStatus.Closed)
            {
                if (!exitConfirm())
                {
                    e.Cancel = true;
                    return;
                }
            }
            foreach (var item in uploadTasks)
            {
                if (item == null)
                {
                    continue;
                }
                item.Cancel();
            }
            this.operatorServiceAgent.NewMessage -= new EventHandler<NewMessageEventArgs>(operatorServiceAgent_NewMessage);
            if (acceptChatRequestResult == 0)
            {
                try
                {
                    operatorServiceAgent.CloseChat(this.Chat.ChatId);
                }
                catch (WebException wex)
                {
                    
                    
                }
                
            }
            try
            {
                Directory.Delete(Application.StartupPath.ToString() + "/" + chat.ChatId, true);
            }
            catch
            {
            } 
            Program.ChatForms.Remove(this);
        }

        private bool exitConfirm()
        {
            DialogResult result = MessageBox.Show("正在对话中，您确定要关闭？", "提示信息", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            return result == DialogResult.Yes ? true : false;
        }

        private void ChatForm_Load(object sender, EventArgs e)
        {
            
        }

        private void setTalkTreeView_NodeMouseDoubleClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if(e.Node.Nodes.Count==0)
            {
                txtMsg.Text= e.Node.Text.ToString();
                this.txtMsg.Focus();
            }
        }


        private string createImageName()
        {
            Random rd = new Random();
            string imageName = rd.Next(100000).ToString();
            return imageName;
        }

        private byte[] toByte(Image imageData)
        {
            MemoryStream Ms = new MemoryStream();
            imageData.Save(Ms, System.Drawing.Imaging.ImageFormat.Bmp);//把图像数据序列化到内存
            byte[] imgByte = new byte[Ms.Length];
            Ms.Position = 0;
            Ms.Read(imgByte, 0, Convert.ToInt32(Ms.Length));//反序列，存放在字节数组里
            Ms.Close();

            return imgByte;
        }

        public void sendImage(Bitmap bitmap)
        {
            try
            {
                string fileName = createImageName() + ".jpg";
                string imageFilePath = Application.StartupPath.ToString() + "/" + chat.ChatId + "/" + fileName;
                bitmap.Save(imageFilePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                FtpUpload ftpUpload = new FtpUpload(imageFilePath, uploadURL + "/" + fileName);
                operatorServiceAgent.SendFile(fileName, chat.ChatId, "start");
                string msg = string.Format("<span style=\"font-family: Arial;color:blue;font-weight: bold;font-size: 12px;\">{0} :</span><br/><span style=\"font-family: Arial;font-size: 12px;\"><img src='{1}' /></span><br />", operatorServiceAgent.CurrentOperator.NickName + "&nbsp;&nbsp;&nbsp;" + DateTime.Now.ToString("hh:mm:ss"), imageFilePath);
                chatMessageViewerControl1.AddText(msg);
                uploadTasks.Add(ftpUpload);
                ftpUpload.FileUploadProgress += new EventHandler<FileUploadProgressEventArgs>(ftpUpload_FileUploadProgress);
                ftpUpload.Start();
            }
            catch (ExternalException eex)
            {
                Debug.WriteLine("sendImage ExternalException:" + eex.Message);
                chatMessageViewerControl1.AddInformation("网络出现问题,暂时无法获取及发送消息");
                return;
            }
            catch (Exception ex)
           {
                Debug.WriteLine("sendImage exception:" + ex.Message);
                chatMessageViewerControl1.AddInformation("网络出现问题,暂时无法获取及发送消息");
                return;
           }
        }

        void ftpUpload_FileUploadProgress(object sender, FileUploadProgressEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
            {
                FileUploadProgressEventArgs arg = e as FileUploadProgressEventArgs;
                displayUploadStatusMessage(e.Status, e.FileName);

                if (e.Status != UploadStatus.Uploading)
                {
                    uploadTasks.Remove(sender as FtpUpload);
                }

                if (e.Status == UploadStatus.Succeed)
                {
                    operatorServiceAgent.SendFile(e.FileName, chat.ChatId, "complete");
                }

            }), e);

        }

        private void addTabPage(string fileName) 
        {
            FileInfo file = new FileInfo(fileName);
            if (file.Length >= 2097152)
            {
                chatMessageViewerControl1.AddInformation("你上传的文件过大！仅限 2M");
                return;
            }

            FileUploadControl fileUpload = null;
            if (!this.tabControlVideo.Controls.Contains(this.tabPage3))
            {
                createTabPage();
            }

            fileUpload = new FileUploadControl(fileName,uploadURL);
            fileUpload.FileUploadCompleted += new EventHandler<FileUploadEventArgs>(fileUpload_FileUploadCompleted);
            
            this.uploadTasks.Add(fileUpload.FtpUpload);
               
            this.tabPage3.Controls.Add(fileUpload);

            fileUpload.Dock = DockStyle.Top;
          
           
        }

        void fileUpload_FileUploadCompleted(object sender, FileUploadEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
            {
                FileUploadEventArgs arg = e as FileUploadEventArgs;
                
                 this.tabPage3.Controls.Remove(e.FileUploadControl);
                if (this.tabPage3.Controls.Count == 0)
                {
                    this.tabPage3.Parent.Controls.Remove(this.tabPage3);
                }

                UploadStatus  status = arg.Status;
                string fileName = arg.FileName;

                displayUploadStatusMessage(status, fileName);

            }), e);

           
            this.uploadTasks.Remove(e.FileUploadControl.FtpUpload);

            if (e.Status == UploadStatus.Succeed)
            {
                operatorServiceAgent.SendFile(e.FileName, this.chat.ChatId, "complete"); 
            }
        }

        private void displayUploadStatusMessage(UploadStatus status, string fileName)
        {
            string msg = string.Empty;
            if (status == UploadStatus.Cancel)
            {
                msg = "文件" + fileName + "发送已被取消!";
                chatMessageViewerControl1.AddFloatInformation(msg);
            }
            else if (status == UploadStatus.Succeed)
            {
                //msg = "文件" + fileName + "发送成功!";
            }
            else if (status == UploadStatus.Error)
            {
                msg = "文件" + fileName + "发送失败!";
            }

            if (status != UploadStatus.Uploading)
            {
                chatMessageViewerControl1.AddInformation(msg);
            }
        }

        private void createTabPage() 
        {
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.tabPage3.AutoScroll = true;
            this.tabControlVideo.Controls.Add(this.tabPage3);
            this.tabPage3.Location = new System.Drawing.Point(4, 21);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(220, 298);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "文件传输";
            this.tabPage3.UseVisualStyleBackColor = true;
            this.tabControlVideo.SelectedTab = tabPage3;
        }
        private void loadQuickResponse(string doMainName) 
        {
            operatorServiceAgent.QuickResponseCategory.Clear();
            try
            {
                operatorServiceAgent.QuickResponseCategory = operatorServiceAgent.GetQuickResponseByDomainName(doMainName);
                setTalkTreeView.Nodes.Clear();
                if (operatorServiceAgent.QuickResponseCategory != null)
                {
                    for (int i = 0; i < operatorServiceAgent.QuickResponseCategory.Count; i++)
                    {
                        setTalkTreeView.Nodes.Add(operatorServiceAgent.QuickResponseCategory[i].Name);
                        if (operatorServiceAgent.QuickResponseCategory[i].Responses.Length == 0) continue;
                        foreach (var item in operatorServiceAgent.QuickResponseCategory[i].Responses)
                        {
                            if (item.ToString() == "") continue;
                            setTalkTreeView.Nodes[i].Nodes.Add(item.ToString());
                        }
                    }
                }
                setTalkTreeView.ExpandAll();
            }
            catch (WebException)
            {
                setTalkTreeView.Nodes[0].Text = "网络中断,请稍候重试";
                return;
            }
        
        }

        private void toolStripSplitButton2_ButtonClick(object sender, EventArgs e)
        {

        }

        //刷新快速回复
        private void restartToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            setTalkTreeView.Nodes.Clear();
            loadQuickResponse(visitor.CurrentSession.DomainRequested.ToString());
        }

    }
}
