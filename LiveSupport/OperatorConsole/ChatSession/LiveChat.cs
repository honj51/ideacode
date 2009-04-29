using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Net;
using System.IO;
namespace LiveSupport.OperatorConsole
{
    public partial class LiveChat : UserControl
    {
        private const int MessageType_ToAll = 1;
        private const int MessageType_ToOperator = 2;
        private const int MessageType_ToChatPage = 3;

        OperatorWS ws = new OperatorWS();

        private ChatRequestInfo myChatRequest;

        public ChatRequestInfo ChatRequest
        {
            get { return myChatRequest; }
            set { myChatRequest = value; }
        }

        private long lastCheck = 0;

        public LiveChat()
        {
            InitializeComponent();

            // Simple authentication
            AuthenticationHeader auth = new AuthenticationHeader();
            auth.userName = Properties.Settings.Default.WSUser;
            ws.AuthenticationHeaderValue = auth;

            // We initialize the document
            wb.Navigate("about:Initiating the chat session...");

            // We start the timer that will get the messages
            tmrGetMsg.Enabled = true;

            txtMsg.Focus();
        }
        //获取聊天消息
        private void tmrGetMsg_Tick(object sender, EventArgs e)
        {
            // Prevent from entering multiple times in the event
            tmrGetMsg.Enabled = false;

            // We get the last messages
            if (ws.HasNewMessage(myChatRequest.ChatId, lastCheck))
            {
                ChatMessageInfo[] messages = ws.GetChatMessages(myChatRequest.ChatId, lastCheck);
                if (messages.Length > 0)
                {
                    //for (int i = messages.Length - 1; i >= 0; i--)
                    for (int i = 0; i < messages.Length; i++)
                    {
                        if (messages[i].Type == MessageType_ToAll || messages[i].Type == MessageType_ToOperator)
                        {

                            wb.Document.Write(string.Format("<span style=\"font-family: Arial;color: blue;font-weight: bold;font-size: 12px;\">{0} :</span><span style=\"font-family: Arial;font-size: 12px;\">{1}</span><br />", messages[i].Name, messages[i].Message));
                            lastCheck = messages[i].MessageId;
                        }
                    }

                    // Should we play a sound
                    if (Properties.Settings.Default.PlaySoundOnChatMsg)
                    {
                        ((ControlPanel)this.ParentForm).PlayMsgSound();
                    }

                    //TODO: Make this more flexible
                    wb.Document.Window.ScrollTo(new Point(0, 5000));

                    // Flash the window
                    if (this.ParentForm != null)
                    {
                        API.FlashWindowEx(((ControlPanel)this.ParentForm).Handle);
                    }
                }
            }

            // Check for typing notification
            if (ws.IsTyping(myChatRequest.ChatId, false))
                toollblIsTyping.Text = "The visitor is typing a message...";
            else
                toollblIsTyping.Text = this.Text;

            // Set if the operator is typing
            ws.SetTyping(myChatRequest.ChatId, true, txtMsg.Text.Length > 0);

            tmrGetMsg.Enabled = true;
        }

        private void txtMsg_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape && MessageBox.Show("Are you sure you want to exit the chat session?", "Ending chat session", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                tmrGetMsg.Enabled = false;

                ChatMessageInfo msg = new ChatMessageInfo();
                msg.MessageId = -1;
                msg.ChatId = myChatRequest.ChatId;
                msg.Message = "The operator has left the chat session...";
                msg.Name = "System";
                msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;

                ws.AddMessage(msg);

                ((ControlPanel)this.ParentForm).EndChat((TabPage)this.Parent, myChatRequest.ChatId);
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
        {
            WriteMessage(message, Program.CurrentOperator.Name);
        }
        //写信息
        private void WriteMessage(string message, string From)
        {
            ChatMessageInfo msg = new ChatMessageInfo();
            msg.MessageId = -1;
            msg.ChatId = myChatRequest.ChatId;
            msg.Message = message;
            msg.Name = From;
            msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;
            msg.Type = MessageType_ToAll;//*	
            ws.AddMessage(msg);
        }

        //加载聊天窗口
        private void LiveChat_Load(object sender, EventArgs e)
        {
            // Build the context menu
            if (Properties.Settings.Default.CannedMsg != null)
            {
                foreach (string msg in Properties.Settings.Default.CannedMsg)
                {
                    if (msg.Length > 0)
                        ctxMenu.Items.Add(msg, null, new EventHandler(contextMenu_Click));
                }
            }

            if (ctxMenu.Items.Count > 0)
                ctxMenu.Items.Add(new ToolStripSeparator());

            // Add links
            if (Properties.Settings.Default.PresetLinks != null)
            {
                //TODO: Need to do it in a more friendly way...
                foreach (string link in Properties.Settings.Default.PresetLinks)
                    ctxMenu.Items.Add(link, null, new EventHandler(contextLink_Click));
            }

            // Send accept message
            //WriteMessage("您正在同: " + Program.CurrentOperator.Name + " 进行对话");
        }

        private void contextMenu_Click(object sender, EventArgs e)
        {
            WriteMessage(sender.ToString());
        }

        private void contextLink_Click(object sender, EventArgs e)
        {
            string[] buffer = sender.ToString().Split('|');
            if (buffer.Length == 2)
            {
                WriteMessage(string.Format("<a href=\"javascript:window.opener.document.location.href = '{0}';return false;\">{1}</a>", buffer[1], buffer[0]));
            }
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                WebClient myWebClient = new WebClient();
                myWebClient.Credentials = CredentialCache.DefaultCredentials;
                String filename = openFileDialog1.FileName;
                FileStream fs = new FileStream(filename, FileMode.Open);
                byte[] fsbyte = new byte[fs.Length];
                fs.Read(fsbyte, 0, Convert.ToInt32(fs.Length));
                ws.UploadFile(fsbyte, openFileDialog1.SafeFileName);

                ChatMessageInfo msg = new ChatMessageInfo();
                msg.ChatId = this.ChatRequest.ChatId;
                msg.Message = "<a target='_blank' href=" + "http://localhost/LiveChatService/download/" + openFileDialog1.SafeFileName + ">" + openFileDialog1.SafeFileName + "</a>";
                msg.Name = "UploadOK";
                msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;
                msg.Type = MessageType_ToChatPage;

                ws.AddMessage(msg);
            }
        }

        //关闭
        private void toolStripButton2_Click(object sender, EventArgs e)
        { 
            ws.CloseChat(myChatRequest.ChatId);
            TabControl tc = this.Tag as TabControl;
            tc.TabPages.Remove(tc.SelectedTab);
        }
    }
}
