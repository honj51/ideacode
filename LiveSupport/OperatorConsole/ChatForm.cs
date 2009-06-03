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

        private SoundPlayer player = new SoundPlayer();
        
        OperatorWS ws = new OperatorWS();
        //private VisitSession chatSession;
        private Chat chat;
        private long lastCheckTime = DateTime.Now.Ticks;
        private List<Operator> onlineOperators = new List<Operator>();

        public Chat Chat
        {
            get { return chat; }
            set { chat = value; }
        }

        public List<Operator> OnlineOperators
        {
            get { return onlineOperators; }
            set { onlineOperators = value; }
        } 
 
        public long LastCheckTime
        {
            get { return lastCheckTime; }
            set { lastCheckTime = value; }
        }

        //public VisitSession ChatSession
        //{
        //    get { return chatSession; }
        //    set { chatSession = value; }
        //}



        public void RecieveMessage(LiveSupport.OperatorConsole.LiveChatWS.Message message)
        {
            if (chat.Status != ChatStatus.Closed) 
            {
                Program.CurrentOperator.Status = OperatorStatus.Idle;
            
            }
            if (!this.IsDisposed && receiveMessage&&message.SentDate.Ticks>lastCheckTime)
            {
                //WriteMessage(message.Text, message.Source);

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
                wb.Document.Window.ScrollTo(wb.Document.Body.ScrollRectangle.Width, wb.Document.Body.ScrollRectangle.Height);

                
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
        public void RecieveOperator(List<Operator> Operators)
        {

            //operatorPannel1.RecieveOperator(Operators);
            //operatorPannel1.chatId = Chat.ChatId;
        
        }
        string getOperatorsStatusText(OperatorStatus os)
        {
            string status;
            switch (os)
            {
                case OperatorStatus.Idle:
                    status = "空闲";
                    break;
                case OperatorStatus.Away:
                    status = "离开";
                    break;
                case OperatorStatus.Chatting:
                    status = "对话中";
                    break;
                case OperatorStatus.BeRightBack:
                    status = "一会回来";
                    break;
                case OperatorStatus.Offline:
                    status = "离线";
                    break;
                default:
                    status = "离线";
                    break;

            }
            return status;

        }

        private bool receiveMessage = true;
        public ChatForm(Chat chat)
            : this(chat, false)
        {           
        }

        private int acceptChatRequestResult = 0;
        public ChatForm(Chat chat, bool invite)
        {
            InitializeComponent();
            this.chat = chat;
            // Simple authentication
            AuthenticationHeader auth = new AuthenticationHeader();
            auth.OperatorId = Program.CurrentOperator.OperatorId;
            ws.AuthenticationHeaderValue = auth;

            if (!invite)
            {
                acceptChatRequestResult = ws.AcceptChatRequest(chat.ChatId);
                if (acceptChatRequestResult == -1) 
                {
                    wb.Navigate("about:该访客对话请求已被其他客服接受"); 
                    receiveMessage = false;
                    //wb.Document.Write(string.Format("<span style=\"color: #FF9933\">{0}</span><br />","该访客对话请求已被其他客服接受"));
                    
                    return;
                }
                if (acceptChatRequestResult == -3)
                {
                    wb.Navigate("about:服务器错误");
                    receiveMessage = false;
                
                }

            }
            // We initialize the document
            wb.Navigate("about:初始会话...");
          
            foreach (Visitor item in Program.Visitors)
            {
                if (item.VisitorId == chat.VisitorId)
               {
                    this.Text = "与 " + item.Name + " 对话中";
                    this.visitorNameLabel.Text += item.Name;
                    this.visitorCompanyLabel.Text += item.Company;
                    this.remarkLabel.Text += item.Remark;
                    this.visitCountLabel.Text += item.VisitCount.ToString() ;
                    this.visitorLocationLabel.Text += item.CurrentSession.Location;
                    break;
               }
            
            }
            
            
            // We start the timer that will get the messages
            tmrGetMsg.Enabled = true;
            
            txtMsg.Focus();
          
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
                //WebClient myWebClient = new WebClient();
                //myWebClient.Credentials = CredentialCache.DefaultCredentials;
                String filename = uploadOpenFileDialog.FileName;
                FileStream fs = new FileStream(filename, FileMode.Open);
                byte[] fsbyte = new byte[fs.Length];
                fs.Read(fsbyte, 0, Convert.ToInt32(fs.Length));
                ws.UploadFile(fsbyte, uploadOpenFileDialog.SafeFileName, Chat.ChatId);
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
            if (e.KeyCode == Keys.Escape && MessageBox.Show("Are you sure you want to exit the chat session?", "Ending chat session", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                tmrGetMsg.Enabled = false;

                LiveSupport.OperatorConsole.LiveChatWS.Message msg = new LiveSupport.OperatorConsole.LiveChatWS.Message();
                msg.ChatId = Chat.ChatId;                
                msg.SentDate = DateTime.Now;

                wb.Document.Write(string.Format("<span style=\"font-family: Arial;color: blue;font-weight: bold;font-size: 12px;\">{0} </span><br/><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", "System", "The operator has left the chat session..."));
               
               //ws.AddMessage(msg);

                //((MainForm)this.ParentForm).EndChat((TabPage)this.Parent, myChatRequest.ChatId);
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
            WriteMessage(message,Program.CurrentOperator.NickName);
        }
        //写信息
        private void WriteMessage(string message, string From)
        {
            LiveSupport.OperatorConsole.LiveChatWS.Message msg = new LiveSupport.OperatorConsole.LiveChatWS.Message();
            msg.ChatId = Chat.ChatId; 
            //msg.ChatId = myChatRequest.ChatId;
            msg.Text = message;
            msg.Source = From;
            msg.SentDate = DateTime.Now;
            msg.Type = MessageType.ChatMessage_OperatorToVisitor;

            ws.SendMessage(msg);
            wb.Document.Write(string.Format("<span style=\"font-family: Arial;color:blue;font-weight: bold;font-size: 12px;\">{0} :</span><br/><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", From + "&nbsp;&nbsp;&nbsp;" + msg.SentDate.ToString("hh:mm:ss"), message));
            wb.Document.Window.ScrollTo(wb.Document.Body.ScrollRectangle.Width, wb.Document.Body.ScrollRectangle.Height);
            //msg.Type = MessageType_ToAll;//*	
            //ws.AddMessage(msg);
        }

      

        /// <summary>
        /// 截图
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cutToolStripButton_Click(object sender, EventArgs e)
        {
            IntPtr dc1 = CreateDC("DISPLAY", null, null, (IntPtr)null);
            //创建显示器的DC 
            Graphics g1 = Graphics.FromHdc(dc1);
            //由一个指定设备的句柄创建一个新的Graphics对象 
            Bitmap MyImage = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height, g1);
            //根据屏幕大小创建一个与之相同大小的Bitmap对象 
            Graphics g2 = Graphics.FromImage(MyImage);
            //获得屏幕的句柄 
            IntPtr dc3 = g1.GetHdc();
            //获得位图的句柄 
            IntPtr dc2 = g2.GetHdc();
            //把当前屏幕捕获到位图对象中 
            BitBlt(dc2, 0, 0, Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height, dc3, 0, 0, 13369376);
            //把当前屏幕拷贝到位图中 
            g1.ReleaseHdc(dc3);
            //释放屏幕句柄 
            g2.ReleaseHdc(dc2);
            //释放位图句柄 
            if (cutSaveFileDialog.ShowDialog() == DialogResult.OK)
            {
                MyImage.Save(cutSaveFileDialog.FileName, ImageFormat.Bmp);
                MessageBox.Show("已经把当前屏幕保存！");
               // wb.Document.Write(string.Format("<img src='{0}'/>", ));  
               
                this.Show();
            }
        }

        private void ChatForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            
        }

        private void ChatForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            
            if (chat.Status != ChatStatus.Closed)
            {
                if (MessageBox.Show("正在对话中，您确定要关闭？", "提示信息", MessageBoxButtons.YesNo, MessageBoxIcon.Question).Equals(DialogResult.No))
                {
                    e.Cancel = true;
                    return;
                }
            }
              if(Program.CurrentOperator.Status!= OperatorStatus.Offline)
              {
                  if (acceptChatRequestResult == 0)
                  {
                      ws.CloseChat(this.Chat.ChatId);
                  }
                  Program.ChatForms.Remove(this);                  
                  
              }
              else
                Program.ChatForms.Remove(this);


             
                     
        }

        private void ChatForm_Load(object sender, EventArgs e)
        {
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


       

    

     
        

       
    }
}
