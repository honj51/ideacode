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
        // Declare a Hashtable array in which to store the groups.
        private Hashtable[] groupTables;

        // Declare a variable to store the current grouping column.
        int groupColumn = 0;


        OperatorWS ws = new OperatorWS();
        private DateTime lastRequestTime = DateTime.Now.AddMinutes(-30);
        private Hashtable currentVisitors = new Hashtable();
        public static Hashtable myChats = new Hashtable();
        private bool hasCheckedChatRequests = false;
        private int numberOfChatWaiting = 0;
        private List<TabInfo> chatInfo = new List<TabInfo>();
        private SoundPlayer player = new SoundPlayer();
        private string IsIP = null;
                
        private List<Visitor> visitors = new List<Visitor>();
        private List<Operator> operators = new List<Operator>();

        #region VisitorTreeView_HeaderColumn Index
        private const int VisitorTreeView_HeaderColumn_VisitorName = 0;
        private const int VisitorTreeView_HeaderColumn_Location = 1;
        private const int VisitorTreeView_HeaderColumn_Browser = 2;
        private const int VisitorTreeView_HeaderColumn_VisitCount = 3;
        private const int VisitorTreeView_HeaderColumn_Operator = 4;
        private const int VisitorTreeView_HeaderColumn_Status = 5;
        private const int VisitorTreeView_HeaderColumn_VisitTime = 6;
        private const int VisitorTreeView_HeaderColumn_LeaveTime = 7;
        private const int VisitorTreeView_HeaderColumn_ChatRequestTime = 8;
        private const int VisitorTreeView_HeaderColumn_ChatStartTime = 9;
        private const int VisitorTreeView_HeaderColumn_WaitingDuring = 10;
        private const int VisitorTreeView_HeaderColumn_ChattingDuring = 11;
        private const int VisitorTreeView_HeaderColumn_PageRequestCount = 12;
        #endregion

        public MainForm(DateTime LoginTime)
        {
            InitializeComponent();
          
          
           //// Start with the groups created for the Title column.
          // SetGroups(0);

            // Simple authentication
            AuthenticationHeader auth = new AuthenticationHeader();
            auth.userName = Properties.Settings.Default.WSUser;
            ws.AuthenticationHeaderValue = auth;

            this.operatorToolStripStatusLabel.Text = "登录客服为：" + Program.CurrentOperator.Name;
            if (Program.CurrentOperator.IsOnline)
            this.stateToolStripStatusLabel.Text = "目前状态：在线";
           
            Properties.Settings.Default.OperatorLoginTime = LoginTime;
           
                this.adminToolStripMenuItem.Visible = Program.CurrentOperator.IsAdmin;
                this.rejiggerpasswordToolStripMenuItem.Enabled = !Program.CurrentOperator.IsAdmin;
                if (Program.CurrentOperator.IsAdmin)
                this.powerToolStripStatusLabel.Text = "管理员";
                else
                    this.powerToolStripStatusLabel.Text = "普通客服";


                //drpChatRequest.DisplayMember = "VisitorIP";

            //drpChatRequest.ValueMember = "ChatId";

            playSoundOnChatRequestToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatReq;
            playSoundOnChatMessageToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatMsg;
            whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked = Properties.Settings.Default.GetWebRequestOffline;
            autostartToolStripMenuItem.Checked = Properties.Settings.Default.StartWithWindows;
        }

        //时间方法
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
            //获得请求
            // Should we get the chat requests
            if (!hasCheckedChatRequests)
            {
                hasCheckedChatRequests = true;

                foreach (ChatRequestInfo req in ws.GetChatRequests(Program.CurrentOperator))
                {
                    //闪光
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
            int VisitorChatResult = 0;
         
            foreach(ListViewItem item in lstVisitors.Items)
            {
                if (item.SubItems[VisitorTreeView_HeaderColumn_Status].Text=="Chatting")
                {
                    VisitorChatResult++;
                }
            
            }
           
            lblCurrentVisitors.Text = "当前访客数: "+ currentVisitors.Count.ToString();
            lblVisitorOnChat.Text = "对话中的访客数: " + VisitorChatResult;
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

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            //ws.SetOperatorStatus(Program.CurrentOperator.Id, false);
            Properties.Settings.Default.Save();
            Application.Exit();
        }

        //接受请求
        private void btnAccept_Click(object sender, EventArgs e)
        {
            //if (drpChatRequest.SelectedItem != null)
            //{
            //    //声音
            //    player.Stop();
            //    //请求信息
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
            //    //添加请求信息
            //    chatInfo.Add(tabInfo);
            //    RefreshTabInfo();
            //    //修改客服编号
            //    ws.AcceptChatRequest(req.ChatId,Program.CurrentOperator.Id);//服务人员
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
            if (MessageBox.Show("确定要退出座席终端？", "退出确认", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
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
        //取消息
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

        private void 邀请对话ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (lstVisitors.SelectedItems.Count > 0)
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
                        //信息显示
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
                        //修改请求信息
                        chatInfo.Add(tabInfo);
                        RefreshTabInfo();
                        IsIP = lstVisitors.SelectedItems[0].SubItems[2].Text;
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
                        //信息显示
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
                        //修改请求信息
                        chatInfo.Add(tabInfo);
                        RefreshTabInfo();
                    }
                }
            }
            else
            {
                MessageBox.Show("你还没有选择跟谁进行对话", "请选择", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
        }


        //点击传送文件
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
                    MessageBox.Show("对不起，文件上传失败");
                }
                fs.Close();
                ChatRequestInfo myChatRequest = new ChatRequestInfo();
                ChatMessageInfo msg = new ChatMessageInfo();
                msg.MessageId = -1;
                msg.ChatId = myChatRequest.ChatId;
                msg.Message = "您可以开始下载文件";
                msg.Name = "UploadOK";
                msg.SentDate = DateTime.Now.ToUniversalTime().Ticks;
                msg.Type = 3;//*
                ws.AddMessage(msg);
            }
        }

        private void MainForm_Load(object sender, EventArgs e)
        {

        }

        private void 接受请求ToolStripMenuItem_Click(object sender, EventArgs e)
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
           // NotifyForm.ShowNotifier(false, "你好！");
        }

        private void beRightBackToolStripMenuItem_Click(object sender, EventArgs e)
        {
           // NotifyForm.ShowNotifier(true, "有人请求对话!!!");
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

        private void 空闲ToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }

        /// <summary>
        /// 计算登录时长
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
            dateDiff = ts.Days.ToString() + "天"
                + ts.Hours.ToString() + "小时"
                + ts.Minutes.ToString() + "分钟"
                + ts.Seconds.ToString() + "秒";

            return dateDiff;
        }


        private DateTime lastCheck = DateTime.Today;
        TestFixture testFixture = new TestFixture();
        private void timer1_Tick(object sender, EventArgs e)
        {
            //NewChangesResult result = ws.CheckNewChanges(Program.CurrentOperator.Id, lastCheck);
            NewChangesResult result = testFixture.NewResult();



            foreach (ListViewItem item in lstVisitors.Items)
            {
                Visitor v = item.Tag as Visitor;
                VisitSession local = v.CurrentSession;


                VisitSession remote = null;
                foreach (var c in result.VisitSessionChange)
                {
                    if (c == null)
                    {
                        continue;
                    }
                    else if (c.VisitorId == local.VisitorId && c.Status != local.Status)
                    {
                        remote = c;
                        break;
                    }
                }


                if (remote == null) continue;
                if (remote.Status == VisitSessionStatus.ChatRequesting)
                {
                    // 新的对话请求
                    //NotifyForm.ShowNotifier(true, "访客 " + v.Name + " 请求对话！", item.Index);
                    NotifyForm.ShowNotifier(true, "访客 " + v.Name + " 请求对话！", remote.SessionId);

                }
                local.Status = remote.Status;



                item.SubItems[VisitorTreeView_HeaderColumn_Status].Text = local.Status.ToString();
            }



            if (result.NewVisitors != null)
            {
                foreach (var item in result.NewVisitors)
                {
                    if (item == null) continue;
                    ListViewItem lvi = new ListViewItem(new string[]{ item.Name, item.CurrentSession.Location, item.CurrentSession.Browser,
                     item.VisitCount.ToString(), item.CurrentSession.Operators.ToString(),item.CurrentSession.Status.ToString(),
                     item.CurrentSession.VisitingTime.ToString(), item.CurrentSession.LeaveTime.ToString(), item.CurrentSession.ChatRequestTime.ToString(),
                     item.CurrentSession.ChatingTime.ToString(),item.CurrentSession.WaitingDuring.ToString(), item.CurrentSession.ChattingDuring.ToString(),
                     item.CurrentSession.PageRequestCount.ToString()
                        });
                    visitors.Add(item);
                    lvi.Tag = item;
                    lstVisitors.Items.Add(lvi);


                    // Add the visitor to the visitor hashtable
                    if (!currentVisitors.ContainsKey(item.CurrentSession.IP))
                        currentVisitors.Add(item.CurrentSession.IP, item);
                    else
                        currentVisitors[item.CurrentSession.IP] = item;

                }


                //// Create the groupsTable array and populate it with one 
                //// hash table for each column.
                groupTables = new Hashtable[lstVisitors.Columns.Count];
                for (int column = 0; column < lstVisitors.Columns.Count; column++)
                {
                    // Create a hash table containing all the groups 
                    // needed for a single column.
                    groupTables[column] = CreateGroupsTable(column);
                }        
               
                SetGroups(5);
              
            }

        

            foreach (var item in result.Messages)
            {
                ChatForm form = Program.ChatForms.Find(f => f.ChatId == item.ChatId);
                if (form == null) continue;
                form.RecieveMessage(item);
            }


            if (result.Operators.Length > operators.Count || checkIfOperatorStatusChanges(operators, result.Operators))
            {
                operators.Clear();
                operators.AddRange(result.Operators);
                operatorsTreeView.Nodes[0].Nodes.Clear();
                operatorsTreeView.Nodes[1].Nodes.Clear();
                foreach (var item in operators)
                {
                    if (item.IsOnline)
                    {
                        operatorsTreeView.Nodes[0].Nodes.Add(item.Name).Tag = item;
                    }
                    else
                    {
                        operatorsTreeView.Nodes[1].Nodes.Add(item.Name).Tag = item;
                    }
                }
            }



            lastCheck = result.CheckTime;



            // 播放声音
            if (hasChatRequest())
            {
                PlayChatReqSound();
            }

            DisplayStatus();
        }

        private bool hasChatRequest()
        {
            foreach (var item in visitors)
            {
                if (item.CurrentSession.Status == VisitSessionStatus.ChatRequesting)
                {
                    return true;
                }
            }
            return false;
        }

        private bool checkIfOperatorStatusChanges(List<Operator> operators, Operator[] p)
        {
            return false;
        }

        private void lstVisitors_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstVisitors.SelectedItems.Count > 0)
            {
                Visitor v = lstVisitors.SelectedItems[0].Tag as Visitor;
                visitorBindingSource.DataSource = v;
            }
        }

        // 更改密码
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

        // 接受访客请求
        private void acceptToolStripButton_Click(object sender, EventArgs e)
        {
            // Visitor visitor= lstVisitors.SelectedItems[0] as Visitor;
            //visitor.CurrentSession.IP;
          
            lstVisitors.FullRowSelect = true;

            if (lstVisitors.SelectedItems.Count > 0)
            {

                if (lstVisitors.SelectedItems[0].SubItems[VisitorTreeView_HeaderColumn_Status].Text == "ChatRequesting")
                {

                    if (!myChats.ContainsKey(lstVisitors.SelectedItems[0].Index))
                    {
                        myChats.Add(lstVisitors.SelectedItems[0].Index, Program.CurrentOperator.Id);
                        //MessageBox.Show(lstVisitors.SelectedItems[0].Index.ToString());
                    }
                   //声音
                   player.Stop();
                   // MessageBox.Show(lstVisitors.SelectedItems[0].SubItems[VisitorTreeView_HeaderColumn_Status].Text);

                   ChatForm cf = new ChatForm(lstVisitors.SelectedItems[0].Index);
                    cf.Show();
                }
                else
                {
                    MessageBox.Show("该访客暂时还未请求对话");
                }

            }
            else
            {
                MessageBox.Show("请选择访客");

            }
        }

        //主动邀请访客
        private void inviteToolStripButton_Click(object sender, EventArgs e)
        {
            lstVisitors.FullRowSelect = true;

            if (lstVisitors.SelectedItems.Count > 0)
            {

                if (lstVisitors.SelectedItems[0].SubItems[VisitorTreeView_HeaderColumn_Status].Text == "Visiting")
                {
                    if (!myChats.ContainsKey(lstVisitors.SelectedItems[0].Index))
                    {
                        myChats.Add(lstVisitors.SelectedItems[0].Index, Program.CurrentOperator.Id);
                        //MessageBox.Show(lstVisitors.SelectedItems[0].Index.ToString());
                    }

                    ChatForm cf = new ChatForm(lstVisitors.SelectedItems[0].Index);
                    
                    cf.Show();

                }
                else
                {
                    MessageBox.Show("该访客状态不符合");
                }
            }
            else
            {
                MessageBox.Show("请选择访客");
            }
        }


        // Sorts ListViewGroup objects by header value.
        private class ListViewGroupSorter : IComparer
        {
            private SortOrder order;

            // Stores the sort order.
            public ListViewGroupSorter(SortOrder theOrder)
            {
                order = theOrder;
            }

            // Compares the groups by header value, using the saved sort
            // order to return the correct value.
            public int Compare(object x, object y)
            {
                int result = String.Compare(
                    ((ListViewGroup)x).Header,
                    ((ListViewGroup)y).Header
                );
                if (order == SortOrder.Ascending)
                {
                    return result;
                }
                else
                {
                    return -result;
                }
            }
        }


        //单击列名分组
        private void lstVisitors_ColumnClick(object sender, ColumnClickEventArgs e)
        {
            //// Create the groupsTable array and populate it with one 
            //// hash table for each column.
            groupTables = new Hashtable[lstVisitors.Columns.Count];
            for (int column = 0; column < lstVisitors.Columns.Count; column++)
            {
                // Create a hash table containing all the groups 
                // needed for a single column.
                groupTables[column] = CreateGroupsTable(column);
            }


            // Set the sort order to ascending when changing
            // column groups; otherwise, reverse the sort order.
            if (lstVisitors.Sorting == SortOrder.Descending ||
                (//isRunningXPOrLater && 
                (e.Column != groupColumn)))
            {
                lstVisitors.Sorting = SortOrder.Ascending;
            }
            else
            {
                lstVisitors.Sorting = SortOrder.Descending;
            }
            groupColumn = e.Column;

            // Set the groups to those created for the clicked column.
            // if (isRunningXPOrLater)
            //{
                SetGroups(e.Column);
           // }
        }

        // Sets lstVisitors to the groups created for the specified column.
        //设置组
        private void SetGroups(int column)
        {
            // Remove the current groups.
            lstVisitors.Groups.Clear();
            
            // Retrieve the hash table corresponding to the column.
            Hashtable groups = (Hashtable)groupTables[column];

            // Copy the groups for the column to an array.
            ListViewGroup[] groupsArray = new ListViewGroup[groups.Count];
            groups.Values.CopyTo(groupsArray, 0);

            // Sort the groups and add them to lstVisitors.
            Array.Sort(groupsArray, new ListViewGroupSorter(lstVisitors.Sorting));
            lstVisitors.Groups.AddRange(groupsArray);

            // Iterate through the items in lstVisitors, assigning each 
            // one to the appropriate group.
            foreach (ListViewItem item in lstVisitors.Items)
            {
                // Retrieve the subitem text corresponding to the column.
                string subItemText = item.SubItems[column].Text;

                // For the Title column, use only the first letter.
                if (column == 0)
                {
                    subItemText = subItemText.Substring(0, 1);
                }

                // Assign the item to the matching group.
                item.Group = (ListViewGroup)groups[subItemText];
            }
        }

        // Creates a Hashtable object with one entry for each unique
        // subitem value (or initial letter for the parent item)
        // in the specified column.
        private Hashtable CreateGroupsTable(int column)
        {
            // Create a Hashtable object.
            Hashtable groups = new Hashtable();

            // Iterate through the items in lstVisitors.
            foreach (ListViewItem item in lstVisitors.Items)
            {
                // Retrieve the text value for the column.
                string subItemText = item.SubItems[column].Text;

                // Use the initial letter instead if it is the first column.
               // if (column == 0)
                //{
                //  subItemText = subItemText.Substring(0, 1);
               // }

                // If the groups table does not already contain a group
                // for the subItemText value, add a new group using the 
                // subItemText value for the group header and Hashtable key.
                if (!groups.Contains(subItemText))
                {
                    groups.Add(subItemText, new ListViewGroup(subItemText,
                        HorizontalAlignment.Left));
                }
            }

            // Return the Hashtable object.
            return groups;
        }


    }

}