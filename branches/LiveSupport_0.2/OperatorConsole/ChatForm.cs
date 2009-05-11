﻿using System;
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
        private Hashtable Chats = new Hashtable();
        private int OperatorChatIndex;
        OperatorWS ws = new OperatorWS();
        private string chatId;

        public string ChatId
        {
            get { return chatId; }
            set { chatId = value; }
        }

        public void RecieveMessage(LiveSupport.OperatorConsole.LiveChatWS.Message message)
        {
            if (!this.IsDisposed)
            {
                WriteMessage(message.Text, message.Source);

                if (!this.ringToolStripButton.Checked)
                {
                    PlayMsgSound();
                }
                if (!this.flashToolStripButton.Checked)
                {

                    API.FlashWindowEx(this.Handle);
                }
            }
        }
        
        public ChatForm(int ChatIndex)
        {
            InitializeComponent();

            // Simple authentication
            AuthenticationHeader auth = new AuthenticationHeader();
            auth.userName = Properties.Settings.Default.WSUser;
            ws.AuthenticationHeaderValue = auth;

           
            OperatorChatIndex = ChatIndex;
            
            // We initialize the document
            wb.Navigate("about:Initiating the chat session...");

            // We start the timer that will get the messages
            tmrGetMsg.Enabled = true;

            txtMsg.Focus();
        }

        


        private ChatRequestInfo myChatRequest;

        public ChatRequestInfo ChatRequest
        {
            get { return myChatRequest; }
            set { myChatRequest = value; }
        }      

        private void ExitToolStripButton_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("是否关闭", "提示信息", MessageBoxButtons.YesNo, MessageBoxIcon.Question).Equals(DialogResult.Yes))
            {
                MainForm.myChats.Remove(OperatorChatIndex);
                Program.ChatForms.Remove(this);
                this.Close();               
            }
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
                WebClient myWebClient = new WebClient();
                myWebClient.Credentials = CredentialCache.DefaultCredentials;
                String filename = uploadOpenFileDialog.FileName;
                FileStream fs = new FileStream(filename, FileMode.Open);
                byte[] fsbyte = new byte[fs.Length];
                fs.Read(fsbyte, 0, Convert.ToInt32(fs.Length));
                ws.UploadFile(fsbyte, uploadOpenFileDialog.SafeFileName);
            }
        }
        /// <summary>
        /// 获取聊天信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tmrGetMsg_Tick(object sender, EventArgs e)
        {
            // Prevent from entering multiple times in the event
         //  tmrGetMsg.Enabled = false;

           // We get the last messages
           //if (ws.HasNewMessage(myChatRequest.ChatId, lastCheck))
           //{
          // ChatMessageInfo[] messages =  ws.GetChatMessages(myChatRequest.ChatId, lastCheck);
             //  if(messages.Length > 0)
             //  {
                   //for (int i = messages.Length - 1; i >= 0; i--)
                     //  for (int i = 0; i < messages.Length; i++)
                     //  {
                           //if (messages[i].Type == MessageType_ToAll || messages[i].Type == MessageType_ToOperator)
                           //{

                          //     wb.Document.Write(string.Format("<span style=\"font-family: Arial;color: blue;font-weight: bold;font-size: 12px;\">{0} :</span><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", messages[i].Name,messages[i].Message));
                              // lastCheck = messages[i].MessageId;
                           //}
                    //   }

            // Should we play a sound
            //if (Properties.Settings.Default.PlaySoundOnChatMsg)
            //{
                //if(!this.ringToolStripButton.Checked)
                //{
                //    PlayMsgSound();
                //}
            //}
            //TODO: Make this more flexible
           // wb.Document.Window.ScrollTo(new Point(0, 5000));

            // Flash the window
              
                //if (this.ParentForm != null)
                //{
                    //if(!this.flashToolStripButton.Checked){

                    //    API.FlashWindowEx(this.Handle);
                    // }
                //}
             //  }
           //}

           //// Check for typing notification
           //if (ws.IsTyping(myChatRequest.ChatId, false))
           //    toollblIsTyping.Text = "The visitor is typing a message...";
           //else
           //    toollblIsTyping.Text = this.Text;

           //// Set if the operator is typing
           //ws.SetTyping(myChatRequest.ChatId, true, txtMsg.Text.Length > 0);

             //  tmrGetMsg.Enabled = true;
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

                ChatMessageInfo msg = new ChatMessageInfo();
                msg.MessageId = -1;
                //msg.ChatId = myChatRequest.ChatId;
                msg.Message = "The operator has left the chat session...";
                msg.Name = "System";
                msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;

                wb.Document.Write(string.Format("<span style=\"font-family: Arial;color: blue;font-weight: bold;font-size: 12px;\">{0} :</span><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", "System", "The operator has left the chat session..."));
               
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
            WriteMessage(message,"1号客服");
        }
        //写信息
        private void WriteMessage(string message, string From)
        {
            ChatMessageInfo msg = new ChatMessageInfo();
            msg.MessageId = -1;
            //msg.ChatId = myChatRequest.ChatId;
            msg.Message = message;
            msg.Name = From;
            msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;


            wb.Document.Write(string.Format("<span style=\"font-family: Arial;color: blue;font-weight: bold;font-size: 12px;\">{0} :</span><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", From, message));
                
          
            //msg.Type = MessageType_ToAll;//*	
            //ws.AddMessage(msg);
        }

        private void treeView1_NodeMouseDoubleClick(object sender, TreeNodeMouseClickEventArgs e)
        { 
            if(e.Node.Name!="节点0")
              this.txtMsg.Text=this.treeView1.SelectedNode.Text.ToString();
            this.txtMsg.Focus();
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
            MainForm.myChats.Remove(OperatorChatIndex);
        }

        
        
    }
       
    
}
