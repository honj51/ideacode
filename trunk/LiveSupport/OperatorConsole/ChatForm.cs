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
                if (API.FromSystem(message))
                {
                    wb.Document.Write(string.Format("<span style='color: #FF9933; FONT-SIZE: 13px'>{0}</span><br />", message.Text));
                }
                if (message.Type == MessageType.ChatMessage_VistorToOperator)
                {
                    wb.Document.Write(string.Format("<span style='font-family: Arial;color:#008040;font-weight: bold;font-size: 12px;'>{0} </span><br/><span style='font-family: Arial;font-size: 12px;'>{1}</span><br />", message.Source + "&nbsp;&nbsp;&nbsp;" + message.SentDate.ToString("hh:mm:ss"), message.Text));
                }
                if(message.Type==MessageType.ChatMessage_OperatorToVisitor)
                {
                    wb.Document.Write(string.Format("<span style='font-family: Arial;color:blue;font-weight: bold;font-size: 12px;'>{0} </span><br/><span style='font-family: Arial;font-size: 12px;'>{1}</span><br />", message.Source + "&nbsp;&nbsp;&nbsp;" + message.SentDate.ToString("hh:mm:ss"), message.Text));
                }
                wb.Document.Window.ScrollTo(wb.Document.Body.ScrollRectangle.Left, wb.Document.Body.ScrollRectangle.Height);
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
        

        public ChatForm(IOperatorServiceAgent agent,Chat chat)
            : this(agent, chat, false)
        {           
        }

        public ChatForm(IOperatorServiceAgent agent, Chat chat, bool invite)
        {
         //   Application.StartupPath.ToString() + "/" +
            Directory.CreateDirectory(chat.ChatId);
            this.operatorServiceAgent = agent;
            InitializeComponent();
            this.chat = chat;

            if (!invite)
            {
                acceptChatRequestResult = operatorServiceAgent.AcceptChatRequest(chat.ChatId);
                if (acceptChatRequestResult == -1) 
                {
                    wb.Navigate("about:该访客对话请求已被其他客服接受"); 
                    receiveMessage = false;
                    return;
                }
                if (acceptChatRequestResult == -3)
                {
                    wb.Navigate("about:服务器错误");
                    receiveMessage = false;
                }
            }
            
            wb.Navigate("about:初始会话...");

            Visitor item = operatorServiceAgent.GetVisitorById(chat.VisitorId);
            this.Text = "与 " + item.Name + " 对话中";
            this.visitorNameLabel.Text += item.Name;
            this.visitorCompanyLabel.Text += item.Company;
            this.remarkLabel.Text += item.Remark;
            this.visitCountLabel.Text += item.VisitCount.ToString();
            this.visitorLocationLabel.Text += item.CurrentSession.Location;
            txtMsg.Focus();
            this.operatorServiceAgent.NewMessage += new EventHandler<NewMessageEventArgs>(operatorServiceAgent_NewMessage);
        }

        void operatorServiceAgent_NewMessage(object sender, NewMessageEventArgs e)
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
                if (this.tabPage3 != null&&this.tabPage3.Controls.Count>=2)
                {

                    wb.Document.Write("<span style='color: #FF9933; FONT-SIZE: 15px'>你上传的文件的次数过多！</span><br />");
                    return;
                }

                String filename = uploadOpenFileDialog.FileName;
                FileStream fs = new FileStream(filename, FileMode.Open);
                if (fs.Length >= 2097152)
                {
                    wb.Document.Write("<span style='color: #FF9933; FONT-SIZE: 13px'>你上传的文件过大！仅限 2M</span><br />");
                    return;
                }
                fs.Close();
               // byte[] fsbyte = new byte[fs.Length];
                //fs.Read(fsbyte, 0, Convert.ToInt32(fs.Length));
                addTabPage(filename);
               // operatorServiceAgent.UploadFile(fsbyte, uploadOpenFileDialog.SafeFileName, Chat.ChatId);
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
                WriteMessage(txtMsg.Text);
                txtMsg.Clear();
            }
        }

        //写信息
        private void WriteMessage(string message)
        { //
            WriteMessage(message,operatorServiceAgent.CurrentOperator.NickName);
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
            operatorServiceAgent.SendMessage(msg);
            wb.Document.Write(string.Format("<span style=\"font-family: Arial;color:blue;font-weight: bold;font-size: 12px;\">{0} :</span><br/><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", From + "&nbsp;&nbsp;&nbsp;" + msg.SentDate.ToString("hh:mm:ss"), message));
            wb.Document.Window.ScrollTo(wb.Document.Body.ScrollRectangle.Left, wb.Document.Body.ScrollRectangle.Height);
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

            //IntPtr dc1 = CreateDC("DISPLAY", null, null, (IntPtr)null);
            ////创建显示器的DC 
            //Graphics g1 = Graphics.FromHdc(dc1);
            ////由一个指定设备的句柄创建一个新的Graphics对象 
            //Bitmap MyImage = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height, g1);
            ////根据屏幕大小创建一个与之相同大小的Bitmap对象 
            //Graphics g2 = Graphics.FromImage(MyImage);
            ////获得屏幕的句柄 
            //IntPtr dc3 = g1.GetHdc();
            ////获得位图的句柄 
            //IntPtr dc2 = g2.GetHdc();
            ////把当前屏幕捕获到位图对象中 
            //BitBlt(dc2, 0, 0, Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height, dc3, 0, 0, 13369376);
            ////把当前屏幕拷贝到位图中 
            //g1.ReleaseHdc(dc3);
            ////释放屏幕句柄 
            //g2.ReleaseHdc(dc2);
            ////释放位图句柄 
            //if (cutSaveFileDialog.ShowDialog() == DialogResult.OK)
            //{
            //    MyImage.Save(cutSaveFileDialog.FileName, ImageFormat.Bmp);
            //    MessageBox.Show("已经把当前屏幕保存！");
            //   // wb.Document.Write(string.Format("<img src='{0}'/>", ));  
               
            //    this.Show();
            //}
        }

        private void ChatForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            
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

            this.operatorServiceAgent.NewMessage -= new EventHandler<NewMessageEventArgs>(operatorServiceAgent_NewMessage);
            if (acceptChatRequestResult == 0)
            {
                operatorServiceAgent.CloseChat(this.Chat.ChatId);
            }
            Directory.Delete(Application.StartupPath.ToString() +"/"+chat.ChatId, true);
            Program.ChatForms.Remove(this);
        }

        private bool exitConfirm()
        {
            DialogResult result = MessageBox.Show("正在对话中，您确定要关闭？", "提示信息", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            return result == DialogResult.Yes ? true : false;
        }

        private void ChatForm_Load(object sender, EventArgs e)
        {
            setTalkTreeView.Nodes[0].Nodes.Clear();
            if (operatorServiceAgent.QuickResponseCategory != null)
            {
                for (int i = 0; i < operatorServiceAgent.QuickResponseCategory.Count; i++)
                {
                    setTalkTreeView.Nodes[0].Nodes.Add(operatorServiceAgent.QuickResponseCategory[i].Name);
                    if (operatorServiceAgent.QuickResponseCategory[i].Responses.Length == 0) continue;
                    foreach (var item in operatorServiceAgent.QuickResponseCategory[i].Responses)
                    {
                        if (item.ToString() == "") continue;
                        setTalkTreeView.Nodes[0].Nodes[i].Nodes.Add(item.ToString());
                    }
                }

            }
            setTalkTreeView.ExpandAll();
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
            string imageName = chat.ChatId+createImageName();
            string saveUrl = chat.ChatId + "/" + imageName + ".bmp";
            bitmap.Save(saveUrl, System.Drawing.Imaging.ImageFormat.Bmp);
            string imageUrl = Application.StartupPath.ToString() + "/"+ saveUrl;
            operatorServiceAgent.UploadFile(toByte((Image)bitmap), imageName+".bmp", chat.ChatId);
            wb.Document.Write(string.Format("<span style=\"font-family: Arial;color:blue;font-weight: bold;font-size: 12px;\">{0} :</span><br/><span style=\"font-family: Arial;font-size: 12px;\"><img src='{1}' /></span><br />", operatorServiceAgent.CurrentOperator.NickName + "&nbsp;&nbsp;&nbsp;" + DateTime.Now.ToString("hh:mm:ss"), imageUrl));
            wb.Document.Window.ScrollTo(wb.Document.Body.ScrollRectangle.Width, wb.Document.Body.ScrollRectangle.Height);    
        }

        private void addTabPage(string fileName) 
        {
            FileUploadControl fileUpload = null;
            if (!this.tabControl1.Controls.Contains(this.tabPage3))
            {
                createTabPage();
            }
            
            fileUpload = new FileUploadControl(fileName);
            fileUpload.FileUploadCompleted += new EventHandler<FileUploadEventArgs>(fileUpload_FileUploadCompleted);
           
            if (this.tabPage3.Controls.Count == 0 && this.tabPage3 != null)
            {
                this.tabPage3.Controls.Add(fileUpload);
            }
            else
            {
                this.tabPage3.Controls.Add(fileUpload);
                fileUpload.Location = new System.Drawing.Point(4, fileUpload.Height + 10);
            }
        
        }

        delegate void UpdateUI();

        void fileUpload_FileUploadCompleted(object sender, FileUploadEventArgs e)
        {
            this.Invoke(new UpdateUI(delegate()
            {
                if (e.Status == UploadStatus.Cancel)
                {
                    //wb.Document.Write(string.Format("<span style='font-family: Arial;font-size: 12px;'>{1}</span><br />", message.Source + "&nbsp;&nbsp;&nbsp;" + message.SentDate.ToString("hh:mm:ss"), message.Text));
                }
                else if (e.Status == UploadStatus.Succeed)
                {      
                }
                else if (e.Status == UploadStatus.Error)
                {

                }
                this.tabPage3.Controls.Remove(e.FileUploadControl);
                if (this.tabPage3.Controls.Count == 0)
                {
                    this.tabPage3.Parent.Controls.Remove(this.tabPage3);
                }
                else
                {
                    foreach (Control item in this.tabPage3.Controls)
                    {
                        if (item.Location == new System.Drawing.Point(4, e.FileUploadControl.Height + 10))
                        {
                            item.Location = new System.Drawing.Point(4, 21);

                        }

                    }
                }
            }));
        }

        private void createTabPage() 
        {
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.tabPage3.AutoScroll = true;
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabPage3.Location = new System.Drawing.Point(4, 21);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(220, 298);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "文件传输";
            this.tabPage3.UseVisualStyleBackColor = true;
        }
    }
}
