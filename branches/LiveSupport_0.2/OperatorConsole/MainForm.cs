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
using Microsoft.Win32;
namespace LiveSupport.OperatorConsole
{
    public partial class MainForm : Form
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
        private NotifyForm notifyForm = new NotifyForm();
        
        public MainForm(DateTime LoginTime)
        {
            InitializeComponent();

            // Simple authentication
            AuthenticationHeader auth = new AuthenticationHeader();
            auth.userName = Properties.Settings.Default.WSUser;
            ws.AuthenticationHeaderValue = auth;

            this.operatorToolStripStatusLabel.Text = "��¼�ͷ�Ϊ��" + Program.CurrentOperator.Name;
            if (Program.CurrentOperator.IsOnline)
            this.stateToolStripStatusLabel.Text = "Ŀǰ״̬������";
           
            Properties.Settings.Default.OperatorLoginTime = LoginTime;
           
                this.adminToolStripMenuItem.Visible = Program.CurrentOperator.IsAdmin;
                this.rejiggerpasswordToolStripMenuItem.Enabled = !Program.CurrentOperator.IsAdmin;
                if (Program.CurrentOperator.IsAdmin)
                this.powerToolStripStatusLabel.Text = "����Ա";
                else
                    this.powerToolStripStatusLabel.Text = "��ͨ�ͷ�";


                //drpChatRequest.DisplayMember = "VisitorIP";
            //drpChatRequest.ValueMember = "ChatId";

            playSoundOnChatRequestToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatReq;
            playSoundOnChatMessageToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatMsg;
            whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked = Properties.Settings.Default.GetWebRequestOffline;
            autostartToolStripMenuItem.Checked = Properties.Settings.Default.StartWithWindows;
           
        }




        //ʱ�䷽��
        private void tmrCheckRequests_Tick(object sender, EventArgs e)
        {
            // Disable the timer
            tmrCheckRequests.Enabled = false;

            // if there are un answer chat waiting, warn the operator
            //if (drpChatRequest.Items.Count > 0)
            //    PlayChatReqSound();

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
            //�������
            // Should we get the chat requests
            if (!hasCheckedChatRequests)
            {
                hasCheckedChatRequests = true;

                foreach (ChatRequestInfo req in ws.GetChatRequests(Program.CurrentOperator))
                {
                    //����
                    // Flash the window
                    API.FlashWindowEx(this.Handle);

                    numberOfChatWaiting++;

                    if (!myChats.ContainsKey(req.ChatId) && req.AcceptByOpereratorId != Program.CurrentOperator.Id)
                    {
                        myChats.Add(req.ChatId, req);

                        //drpChatRequest.Items.Add(req);

                        // Remove the chat request to avoid multiple operator to getting the chat.
                        //ws.RemoveChatRequest(req);

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
            lblCurrentVisitors.Text = "��ǰ�ÿ���: ";//+ currentVisitors.Count.ToString();
            lblVisitorOnChat.Text = "�Ի��еķÿ���: n/a";
            lblMyChat.Text = "�ҵĶԻ���: " + myChats.Count.ToString();
        }

        private void PlayChatReqSound()
        {
            
            if (Properties.Settings.Default.PlaySoundOnChatReq)
            {
                player.Stream = Properties.Resources.newchatreq;
                player.Play();
            }
            
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            //ws.SetOperatorStatus(Program.CurrentOperator.Id, false);
            Properties.Settings.Default.Save();
            Application.Exit();
        }
        
        //��������
        private void btnAccept_Click(object sender, EventArgs e)
        {
            //if (drpChatRequest.SelectedItem != null)
            //{
            //    //����
            //    player.Stop();
            //    //������Ϣ
            //    ChatRequestInfo req = (ChatRequestInfo)drpChatRequest.SelectedItem;
            //    drpChatRequest.Items.Remove(req);
            //    drpChatRequest.Text = string.Empty;

            //    TabPage tab = new TabPage(req.VisitorIP);
            //    LiveChat lc = new LiveChat();
            //    lc.Tag = tabChats;
            //    lc.ChatRequest = req;
            //    lc.Dock = DockStyle.Fill;
            //    tab.Controls.Add(lc);
            //    tabChats.TabPages.Add(tab);
            //    tab.Focus();

            //    TabInfo tabInfo = new TabInfo();
            //    tabInfo.ChatId = req.ChatId;
            //    tabInfo.Dock = DockStyle.Fill;
            //    if (currentVisitors.ContainsKey(req.VisitorIP))
            //    {
            //        tabInfo.RequestEntity = currentVisitors[req.VisitorIP] as RequestInfo;
            //    }
            //    //���������Ϣ
            //    chatInfo.Add(tabInfo);
            //    RefreshTabInfo();
            //    //�޸Ŀͷ����
            //    ws.AcceptChatRequest(req.ChatId,Program.CurrentOperator.Id);//������Ա
            //}

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

            visitorSessionSplitContainer.Panel1.Controls.Clear();
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
            if (MessageBox.Show("ȷ��Ҫ�˳���ϯ�նˣ�", "�˳�ȷ��", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void disconnectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //connectToolStripMenuItem.Checked = true;
            //disconnectToolStripMenuItem.Checked = false;
            //ws.SetOperatorStatus(Program.CurrentOperator.Id, false);
        }

        private void connectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            connectToolStripMenuItem.Checked = false;
            //disconnectToolStripMenuItem.Checked = true;
            //ws.SetOperatorStatus(Program.CurrentOperator.Id, true);
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
        //
        private void tabChats_SelectedIndexChanged(object sender, EventArgs e)
        {
            //RefreshTabInfo();
        }
        //ȡ��Ϣ
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
                    visitorSessionSplitContainer.Panel1.Controls.Clear();

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

                    visitorSessionSplitContainer.Panel1.Controls.Add(tabInfo);
                }
            }
        }

        private void ����Ի�ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (lstVisitors.SelectedItems.Count>0)
            {
                if (IsIP == lstVisitors.SelectedItems[0].SubItems[2].Text)
                {
                    DialogResult choice = MessageBox.Show("��������û���������", "�Ƿ��ط�?", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (choice == DialogResult.OK)
                    {
                        RequestInfo info = this.lstVisitors.SelectedItems[0].Tag as RequestInfo;
                        ChatRequestInfo requestinfo = new ChatRequestInfo();
                        requestinfo.ChatId = Guid.NewGuid().ToString();//chatid
                        requestinfo.AccountId = info.AccoutId.ToString();
                        requestinfo.VisitorIP = lstVisitors.SelectedItems[0].SubItems[2].Text;//IP
                        requestinfo.AcceptByOpereratorId = Program.CurrentOperator.Id; //������Ա
                        requestinfo.RequestDate = DateTime.Now;
                        requestinfo.VisitorName = "";
                        requestinfo.VisitorEmail = "";
                        requestinfo.VisitorUserAgent = lstVisitors.SelectedItems[0].SubItems[4].Text;//�����
                        requestinfo.WasAccept = false;
                        //��Ϣ��ʾ
                        TabPage tab = new TabPage(requestinfo.VisitorIP);
                        LiveChat lc = new LiveChat();
                        lc.Tag = tabChats;
                        lc.ChatRequest = requestinfo;
                        lc.Dock = DockStyle.Fill;
                        tab.Controls.Add(lc);
                        tabChats.TabPages.Add(tab);
                        tab.Focus();
                        TabInfo tabInfo = new TabInfo();
                        tabInfo.ChatId = requestinfo.ChatId;
                        tabInfo.Dock = DockStyle.Fill;
                        if (currentVisitors.ContainsKey(requestinfo.VisitorIP))
                        {
                            tabInfo.RequestEntity = currentVisitors[requestinfo.VisitorIP] as RequestInfo;
                        }
                        //�޸�������Ϣ
                        chatInfo.Add(tabInfo);
                        RefreshTabInfo();
                        IsIP = lstVisitors.SelectedItems[0].SubItems[2].Text;
                        ws.TransferChat(requestinfo);
                    }
                }
                else
                {
                    DialogResult choice = MessageBox.Show("�Ƿ�ȷ�Ϸ�������", "YesNo?", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (choice == DialogResult.Yes)
                    {
                        RequestInfo info = this.lstVisitors.SelectedItems[0].Tag as RequestInfo;
                        ChatRequestInfo requestinfo = new ChatRequestInfo();
                        requestinfo.ChatId = Guid.NewGuid().ToString();//chatid
                        requestinfo.AccountId = info.AccoutId.ToString();
                        requestinfo.VisitorIP = lstVisitors.SelectedItems[0].SubItems[2].Text;//IP
                        requestinfo.AcceptByOpereratorId = Program.CurrentOperator.Id; //������Ա
                        requestinfo.RequestDate = DateTime.Now;
                        requestinfo.VisitorName = "";
                        requestinfo.VisitorEmail = "";
                        requestinfo.VisitorUserAgent = lstVisitors.SelectedItems[0].SubItems[4].Text;//�����
                        requestinfo.WasAccept = false;
                        ws.TransferChat(requestinfo);
                        IsIP = lstVisitors.SelectedItems[0].SubItems[2].Text;
                        //��Ϣ��ʾ
                        TabPage tab = new TabPage(requestinfo.VisitorIP);
                        LiveChat lc = new LiveChat();
                        lc.Tag = tabChats;
                        lc.ChatRequest = requestinfo;
                        lc.Dock = DockStyle.Fill;
                        tab.Controls.Add(lc);
                        tabChats.TabPages.Add(tab);
                        tab.Focus();
                        TabInfo tabInfo = new TabInfo();
                        tabInfo.ChatId = requestinfo.ChatId;
                        tabInfo.Dock = DockStyle.Fill;
                        if (currentVisitors.ContainsKey(requestinfo.VisitorIP))
                        {
                            tabInfo.RequestEntity = currentVisitors[requestinfo.VisitorIP] as RequestInfo;
                        }
                        //�޸�������Ϣ
                        chatInfo.Add(tabInfo);
                        RefreshTabInfo();
                    }
                }
            }
            else
            {
                MessageBox.Show("�㻹û��ѡ���˭���жԻ�","��ѡ��",MessageBoxButtons.OK,MessageBoxIcon.Stop);
            }
        }
       

        //��������ļ�
        private void button1_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                WebClient myWebClient = new WebClient();
                myWebClient.Credentials = CredentialCache.DefaultCredentials;
                String filename = openFileDialog1.FileName;
                FileStream fs = new FileStream(filename, FileMode.Open);
                byte[] fsbyte = new byte[fs.Length];
                fs.Read(fsbyte, 0, Convert.ToInt32(fs.Length));
                string fullname = @"c:\1\" + openFileDialog1.SafeFileName;
                Stream writeStream = myWebClient.OpenWrite(fullname, "PUT");
                if (writeStream.CanWrite)
                { writeStream.Write(fsbyte, 0, Convert.ToInt32(fs.Length)); }
                else
                { 
                MessageBox.Show("�Բ����ļ��ϴ�ʧ��"); }
                fs.Close();
                ChatRequestInfo myChatRequest = new ChatRequestInfo();
                ChatMessageInfo msg = new ChatMessageInfo();
                msg.MessageId = -1;
                msg.ChatId = myChatRequest.ChatId;
                msg.Message = "�����Կ�ʼ�����ļ�";
                msg.Name = "UploadOK";
                msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;
                msg.Type = 3;//*
                ws.AddMessage(msg);
            }
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            
        }

        private void ��������ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            tabChats.TabPages.Remove(tabChats.SelectedTab);
            
        }

        private void MainForm_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
                showMainForm(false);
        }

        private void showMainForm(bool show)
        {
            this.Visible = show;
            if (show)
            {
                this.WindowState = FormWindowState.Normal;
                this.Activate();
            }
            else
            {
                notifyIcon.ShowBalloonTip(500);
            }
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            showMainForm(!this.Visible);
        }

        private void offlineToolStripMenuItem_Click(object sender, EventArgs e)
        {
            notifyForm.ShowNotifier(false, "��ã�");
        }

        private void beRightBackToolStripMenuItem_Click(object sender, EventArgs e)
        {
            notifyForm.ShowNotifier(true, "��������Ի�!!!");
        }

        private void autostartToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.StartWithWindows = this.autostartToolStripMenuItem.Checked;
            if (Properties.Settings.Default.StartWithWindows)
            {
                RegistryKey run = Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
                run.SetValue("OperatorConsole", Application.ExecutablePath.ToString() + " -hide");
            }
            else
            {
                RegistryKey run = Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
                run.SetValue("OperatorConsole", "");
            }
        }

        private void ����ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ChatForm f = new ChatForm();
            f.Show();
        }

        /// <summary>
        /// �����¼ʱ��
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        private void loginTimer_Tick(object sender, EventArgs e)
        {
            DateTime dtime = DateTime.Now; ;

            this.stickToolStripStatusLabel.Text = DateDiff(Properties.Settings.Default.OperatorLoginTime, dtime);
            
        }

         private string DateDiff(DateTime DateTime1, DateTime DateTime2)
        {
            string dateDiff = null;
            
            TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
            TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
            TimeSpan ts = ts1.Subtract(ts2).Duration();
            dateDiff = ts.Days.ToString()+"��"
                + ts.Hours.ToString()+"Сʱ"
                + ts.Minutes.ToString()+"����"
                + ts.Seconds.ToString()+"��";
            
            return dateDiff;
        }

         private DateTime lastCheck = DateTime.Today;
         private void timer1_Tick(object sender, EventArgs e)
         {
             //Visitor[] visitors = ws.GetAllVisitors(Program.CurrentOperator.AccountId);
             //NewChangesResult result = ws.CheckNewChanges(Program.CurrentOperator.Id, lastCheck);

             //foreach (var item in result.NewVisitors)
             //{

             //}

             //foreach (var item in result.VisitSessionChange)
             //{

             //}

             //foreach (var item in result.Messages)
             //{
                 
             //}

             //foreach (var item in result.Operators)
             //{

             //}

             //lastCheck = result.CheckTime;

             //if (visitors != null && visitors.Length> 0)
             //{
             //    // set the last request time
             //   // lastRequestTime = requests[0].RequestTime.AddSeconds(1);

             //    ListViewItem item;
             //    for (int i = visitors.Length - 1; i >= 0; i--)
             //    {
             //        item = new ListViewItem(visitors[i].Name);

             //        //if (myChats.ContainsKey(visitors[i].CurrentSession.IP))
             //        //{
             //        //    item.ImageIndex = 2;
             //        //    item.ToolTipText = "Double-click to access chat session";
             //        //}
                     
             //        //item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].Name));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.Location));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.Browser));
             //        //ListViewItem.ListViewSubItem imgBrowser = new ListViewItem.ListViewSubItem();
             //        //if (visitors[i].VisitorUserAgent.ToLower().IndexOf("explorer") > -1)
             //        //    imgBrowser.Text = "IE";
             //        //else
             //        //    imgBrowser.Text = "FF";
             //        //item.SubItems.Add(imgBrowser);
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].VisitCount.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.Operators.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.Status.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.VisitingTime.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.LeaveTime.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.ChatRequestTime.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.ChatingTime.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.WaitingDuring.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.ChattingDuring.ToString()));
             //        item.SubItems.Add(new ListViewItem.ListViewSubItem(item, visitors[i].CurrentSession.PageRequestCount.ToString()));
             //        item.Tag = visitors[i];

             //        lstVisitors.Items.Insert(0, item);

             //       //  Add the visitor to the visitor hashtable
             //        //if (!currentVisitors.ContainsKey(visitors[i].VisitorIP))
             //        //    currentVisitors.Add(requests[i].VisitorIP, requests[i]);
             //        //else
             //        //    currentVisitors[requests[i].VisitorIP] = requests[i];
             //    }
             //}
         }

         private void lstVisitors_SelectedIndexChanged(object sender, EventArgs e)
         {
             if (lstVisitors.SelectedItems.Count > 0)
             {
                 Visitor v = lstVisitors.SelectedItems[0].Tag as Visitor;
                 visitorBindingSource.DataSource = v;
             }             
         }


         // ��������
         private void rejiggerpasswordToolStripMenuItem_Click(object sender, EventArgs e)
         {
             RejiggerOperatorPassword rop = new RejiggerOperatorPassword();
             rop.ShowDialog();
         }

         private void resetpasswordToolStripMenuItem_Click(object sender, EventArgs e)
         {
             RejiggerOperatorPassword rop = new RejiggerOperatorPassword();
             rop.ShowDialog();
         }

         
       

  }
}