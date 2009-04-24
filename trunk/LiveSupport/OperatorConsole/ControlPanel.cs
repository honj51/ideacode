using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Media;
using System.IO;
using System.Net;
namespace LiveSupport.OperatorConsole
{
    public partial class ControlPanel : Form
    {
        OperatorWS ws = new OperatorWS();
        private DateTime lastRequestTime = DateTime.Now.AddMinutes(-30);
        private Hashtable currentVisitors = new Hashtable();
        private Hashtable myChats = new Hashtable();
        private bool hasCheckedChatRequests = false;
        private int numberOfChatWaiting = 0;
        private List<TabInfo> chatInfo = new List<TabInfo>();
        private SoundPlayer player = new SoundPlayer();
        private string IsIP = null;

        public ControlPanel()
        {
            InitializeComponent();

            // Simple authentication
            AuthenticationHeader auth = new AuthenticationHeader();
            auth.userName = Properties.Settings.Default.WSUser;
            ws.AuthenticationHeaderValue = auth;
     
            drpChatRequest.DisplayMember = "VisitorIP";
            drpChatRequest.ValueMember = "ChatId";

            playSoundOnChatRequestToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatReq;
            playSoundOnChatMessageToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatMsg;
            whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked = Properties.Settings.Default.GetWebRequestOffline;
        }
        //时间方法
        private void tmrCheckRequests_Tick(object sender, EventArgs e)
        {
            // Disable the timer
            tmrCheckRequests.Enabled = false;

            // if there are un answer chat waiting, warn the operator
            if (drpChatRequest.Items.Count > 0)
                PlayChatReqSound();

            // we get the latest website requests
            RequestInfo[] requests = ws.GetWebSiteRequests(Program.CurrentOperator.AccountId, lastRequestTime);
            if (requests != null && requests.Length > 0)
            {
                // set the last request time
                lastRequestTime = requests[0].RequestTime.AddSeconds(1);

                ListViewItem item;
                for (int i = requests.Length - 1; i >= 0; i--)
                {
                    item = new ListViewItem();
                    if (myChats.ContainsKey(requests[i].VisitorIP))
                    {
                        item.ImageIndex = 2;
                        item.ToolTipText = "Double-click to access chat session";
                    }
                    item.Text = string.Empty;
                    item.SubItems.Add(new ListViewItem.ListViewSubItem(item, requests[i].RequestTime.ToShortTimeString()));
                    item.SubItems.Add(new ListViewItem.ListViewSubItem(item, requests[i].VisitorIP));
                    item.SubItems.Add(new ListViewItem.ListViewSubItem(item, requests[i].PageRequested));
                    ListViewItem.ListViewSubItem imgBrowser = new ListViewItem.ListViewSubItem();
                    if (requests[i].VisitorUserAgent.ToLower().IndexOf("explorer") > -1)
                        imgBrowser.Text = "IE";
                    else
                        imgBrowser.Text = "FF";
                    item.SubItems.Add(imgBrowser);
                    item.SubItems.Add(new ListViewItem.ListViewSubItem(item, requests[i].Referrer));
                    item.SubItems.Add(new ListViewItem.ListViewSubItem(item, requests[i].DomainRequested));

                    item.Tag = requests[i];

                    lstVisitors.Items.Insert(0, item);

                    // Add the visitor to the visitor hashtable
                    if (!currentVisitors.ContainsKey(requests[i].VisitorIP))
                        currentVisitors.Add(requests[i].VisitorIP, requests[i]);
                    else
                        currentVisitors[requests[i].VisitorIP] = requests[i];
                }
            }

            // Should we get the chat requests
            if (!hasCheckedChatRequests)
            {
                hasCheckedChatRequests = true;

                foreach (ChatRequestInfo req in ws.GetChatRequests(Program.CurrentOperator))
                {
                    // Flash the window
                    API.FlashWindowEx(this.Handle);

                    numberOfChatWaiting++;

                    if (!myChats.ContainsKey(req.ChatId) && req.AcceptByOpereratorId != Program.CurrentOperator.Id)
                    {
                        myChats.Add(req.ChatId, req);

                        drpChatRequest.Items.Add(req);

                        // Remove the chat request to avoid multiple operator to getting the chat.
                        ws.RemoveChatRequest(req);

                        // Should we play a sound?
                        PlayChatReqSound();
                    }
                }
            }
            else
            {
                hasCheckedChatRequests = false;
            }

            DisplayStatus();

            // Enable the timer
            tmrCheckRequests.Enabled = true;
        }

        private void DisplayStatus()
        {
            lblCurrentVisitors.Text = "当前访客数: " + currentVisitors.Count.ToString();
            lblVisitorOnChat.Text = "对话中的访客数: n/a";
            lblMyChat.Text = "我的对话数: " + myChats.Count.ToString();
        }

        private void PlayChatReqSound()
        {
            
            if (Properties.Settings.Default.PlaySoundOnChatReq)
            {
                player.Stream = Properties.Resources.newchatreq;
                player.Play();
            }
            
        }

        private void ControlPanel_FormClosing(object sender, FormClosingEventArgs e)
        {
            ws.SetOperatorStatus(Program.CurrentOperator.Id, false);
            Application.Exit();
        }
        //接受请求
        private void btnAccept_Click(object sender, EventArgs e)
        {
            // Accept a new chat request
            if (drpChatRequest.SelectedItem != null)
            {
                player.Stop();

                ChatRequestInfo req = (ChatRequestInfo)drpChatRequest.SelectedItem;
                //string aa = req.AcceptByOpereratorId + "-" + req.AcceptDate + "-" + req.AccountId + "-" + req.ChatId+"-"+req.ClosedDate+"-"+req.RequestDate ;
                //MessageBox.Show(aa);
                
                // Remove the chat request from the combo
                drpChatRequest.Items.Remove(req);
                drpChatRequest.Text = string.Empty;

                // Add a new tab page that will contain the chat session
                TabPage tab = new TabPage(req.VisitorIP);
                LiveChat lc = new LiveChat();
                lc.ChatRequest = req;
                lc.Dock = DockStyle.Fill;
                tab.Controls.Add(lc);
                tabChats.TabPages.Add(tab);
                tab.Focus();

                // Add a new TabInfo control
                TabInfo tabInfo = new TabInfo();
                tabInfo.ChatId = req.ChatId;
                tabInfo.Dock = DockStyle.Fill;



                // Get the request
                if (currentVisitors.ContainsKey(req.VisitorIP))
                {
                    tabInfo.RequestEntity = currentVisitors[req.VisitorIP] as RequestInfo;
                }


                chatInfo.Add(tabInfo);
                RefreshTabInfo();
            }
        }

        public void EndChat(TabPage tab, string chatId)
        {
            if (tab == null)
            {
                LiveChat lc = null;
                // Get the tab page by chat id
                foreach (TabPage t in tabChats.TabPages)
                {
                    lc = t.Controls[0] as LiveChat;
                    if (lc.ChatRequest.ChatId == chatId)
                    {
                        tab = t;
                        break;
                    }
                }
            }

            tabChats.TabPages.Remove(tab);
            myChats.Remove(chatId);

            splitContainer1.Panel1.Controls.Clear();
            for (int i = 0; i < chatInfo.Count; i++)
            {
                if (chatId == chatInfo[i].ChatId)
                {
                    chatInfo.RemoveAt(i);
                    break;
                }
            }
        }

        private void cannedMessagesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            using (CannedMessages f = new CannedMessages())
            {
                f.ShowDialog(this);
            }
        }

        private void presetLinksToolStripMenuItem_Click(object sender, EventArgs e)
        {
            using (PresetLinks f = new PresetLinks())
            {
                f.ShowDialog(this);
            }
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("确定要退出座席终端？", "退出确认", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void disconnectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            connectToolStripMenuItem.Checked = true;
            disconnectToolStripMenuItem.Checked = false;
            ws.SetOperatorStatus(Program.CurrentOperator.Id, false);
        }

        private void connectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            connectToolStripMenuItem.Checked = false;
            disconnectToolStripMenuItem.Checked = true;
            ws.SetOperatorStatus(Program.CurrentOperator.Id, true);
        }

        private void playSoundOnChatRequestToolStripMenuItem_Click(object sender, EventArgs e)
        {
            playSoundOnChatRequestToolStripMenuItem.Checked = !playSoundOnChatRequestToolStripMenuItem.Checked;
            Properties.Settings.Default.PlaySoundOnChatReq = playSoundOnChatRequestToolStripMenuItem.Checked;
            Properties.Settings.Default.Save();
        }

        private void playSoundOnChatMessageToolStripMenuItem_Click(object sender, EventArgs e)
        {
            playSoundOnChatMessageToolStripMenuItem.Checked = !playSoundOnChatMessageToolStripMenuItem.Checked;
            Properties.Settings.Default.PlaySoundOnChatMsg = playSoundOnChatMessageToolStripMenuItem.Checked;
            Properties.Settings.Default.Save();
        }

        private void whenOfflineGetWebsiteRequestsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked = !whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked;
            Properties.Settings.Default.GetWebRequestOffline = whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked;
            Properties.Settings.Default.Save();
        }

        public void PlayMsgSound()
        {
            player.Stream = Properties.Resources.newmsg;
            player.Play();
        }

        private void tabChats_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshTabInfo();
        }

        private void RefreshTabInfo()
        {
            if (tabChats.TabPages.Count > 0)
            {
                TabPage tab = tabChats.TabPages[tabChats.SelectedIndex];
                LiveChat lc = (LiveChat)tab.Controls[0];

                string visitorIP = lc.ChatRequest.VisitorIP;

                if (currentVisitors.ContainsKey(visitorIP))
                {
                    RequestInfo req = currentVisitors[visitorIP] as RequestInfo;

                    // Clear the panel info control
                    splitContainer1.Panel1.Controls.Clear();

                    TabInfo tabInfo = null;
                    foreach (TabInfo t in chatInfo)
                    {
                        if (t.ChatId == lc.ChatRequest.ChatId)
                        {
                            tabInfo = t;
                            tabInfo.RequestEntity = req;
                            tabInfo.Dock = DockStyle.Fill;
                            break;
                        }
                    }

                    splitContainer1.Panel1.Controls.Add(tabInfo);
                }
            }
        }

        private void 邀请对话ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (lstVisitors.SelectedItems.Count>0)
            {
                if (IsIP == lstVisitors.SelectedItems[0].SubItems[2].Text)
                {
                    DialogResult choice = MessageBox.Show("你已向该用户发出请求", "是否重发?", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (choice == DialogResult.OK)
                    {
                        RequestInfo info = this.lstVisitors.SelectedItems[0].Tag as RequestInfo;
                        ChatRequestInfo requestinfo = new ChatRequestInfo();
                        requestinfo.ChatId = Guid.NewGuid().ToString();//chatid
                        requestinfo.AccountId = info.AccoutId.ToString();
                        requestinfo.VisitorIP = lstVisitors.SelectedItems[0].SubItems[2].Text;//IP
                        requestinfo.AcceptByOpereratorId = Program.CurrentOperator.Id; //服务人员
                        requestinfo.RequestDate = DateTime.Now;
                        requestinfo.VisitorName = "";
                        requestinfo.VisitorEmail = "";
                        requestinfo.VisitorUserAgent = lstVisitors.SelectedItems[0].SubItems[4].Text;//浏览器
                        requestinfo.WasAccept = false;
                        ws.TransferChat(requestinfo);
                    }
                }
                else
                {
                    DialogResult choice = MessageBox.Show("是否确认发出邀请", "YesNo?", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (choice == DialogResult.Yes)
                    {
                        RequestInfo info = this.lstVisitors.SelectedItems[0].Tag as RequestInfo;
                        ChatRequestInfo requestinfo = new ChatRequestInfo();
                        requestinfo.ChatId = Guid.NewGuid().ToString();//chatid
                        requestinfo.AccountId = info.AccoutId.ToString();
                        requestinfo.VisitorIP = lstVisitors.SelectedItems[0].SubItems[2].Text;//IP
                        requestinfo.AcceptByOpereratorId = Program.CurrentOperator.Id; //服务人员
                        requestinfo.RequestDate = DateTime.Now;
                        requestinfo.VisitorName = "";
                        requestinfo.VisitorEmail = "";
                        requestinfo.VisitorUserAgent = lstVisitors.SelectedItems[0].SubItems[4].Text;//浏览器
                        requestinfo.WasAccept = false;
                        ws.TransferChat(requestinfo);
                        IsIP = lstVisitors.SelectedItems[0].SubItems[2].Text;
                    }
                }
            }
            else
            {
                MessageBox.Show("你还没有选择跟谁进行对话","请选择",MessageBoxButtons.OK,MessageBoxIcon.Stop);
            }
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog()==DialogResult.OK)
            {
                WebClient myWebClient = new WebClient();
                myWebClient.Credentials = CredentialCache.DefaultCredentials;
                String filename = openFileDialog1.FileName;
                FileStream fs = new FileStream(filename, FileMode.Open);
                byte[] fsbyte=new byte[fs.Length];
                 fs.Read(fsbyte, 0,Convert.ToInt32(fs.Length)); 
                 string fullname=@"c:\1\"+openFileDialog1.SafeFileName;   
                Stream writeStream=myWebClient.OpenWrite(fullname, "PUT");
                if (writeStream.CanWrite)
                { writeStream.Write(fsbyte, 0, Convert.ToInt32(fs.Length)); }
                else
                { MessageBox.Show("对不起，文件上传失败"); }
                fs.Close();
                ChatRequestInfo myChatRequest = new ChatRequestInfo();
                ChatMessageInfo msg = new ChatMessageInfo();
                msg.MessageId = -1;
                msg.ChatId = myChatRequest.ChatId;
                msg.Message = "您可以开始下载文件";
                msg.Name = "UploadOK";
                msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;
                
                ws.AddMessage(msg);
            

                
            }
        }
    }
}