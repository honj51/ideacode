using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Net;
using Microsoft.Win32;
using System.Diagnostics;
using System.Net.Sockets;
using LiveSupport.OperatorConsole.Dialog;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.OperatorConsole
{
    public partial class MainForm : Form
    {
        #region VisitorTreeView_HeaderColumn Index
        private const int VisitorTreeView_HeaderColumn_VisitorName = 1;
        private const int VisitorTreeView_HeaderColumn_DomainRequested = 2;
        private const int VisitorTreeView_HeaderColumn_Location = 3;
        private const int VisitorTreeView_HeaderColumn_Browser = 0;
        private const int VisitorTreeView_HeaderColumn_VisitCount = 4;
        private const int VisitorTreeView_HeaderColumn_Operator = 5;
        private const int VisitorTreeView_HeaderColumn_Status = 6;
        private const int VisitorTreeView_HeaderColumn_VisitTime = 7;
        private const int VisitorTreeView_HeaderColumn_LeaveTime = 8;
        private const int VisitorTreeView_HeaderColumn_ChatRequestTime = 9;
        private const int VisitorTreeView_HeaderColumn_ChatStartTime = 10;
        private const int VisitorTreeView_HeaderColumn_WaitingDuring = 11;
        private const int VisitorTreeView_HeaderColumn_ChattingDuring = 12;
        private const int VisitorTreeView_HeaderColumn_PageRequestCount = 13;
        #endregion

        private Hashtable[] groupTables;// Declare a Hashtable array in which to store the groups.
        int groupColumn = -1;// Declare a variable to store the current grouping column.
        private bool isAllowGroup = true;
        private bool closedByUser = true;
        private DateTime loginTime;
        TestFixture testFixture = new TestFixture();
        private FormWindowState saveWindowState = FormWindowState.Normal;
        private IOperatorServiceAgent operaterServiceAgent;
        private List<SystemAdvertise> systemAdvertises;
        private int currentSystemAdvertiseIndex;
        public IOperatorServiceAgent OperaterServiceAgent
        {
            get { return operaterServiceAgent; }
            set { operaterServiceAgent = value; }
        }

        //#region IOperatorServiceAgent 事件处理
        //void operaterServiceAgent_NewChanges(object sender, NewChangesCheckResultEventArgs e)
        //{
        //    this.Invoke(new UpdateUIDelegate(delegate(object obj)
        //    {
        //       operatorPannel1.RecieveOperator(operaterServiceAgent.Operators);

        //        //Trace.WriteLine(string.Format("lastCheck={0}, result.CheckTime={1}",lastCheck.Ticks,result.CheckTime.Ticks));
        //        changeVisitorListViewItemColor();
        //        displayStatus();
        //    }), e);
        //}

        //void operaterServiceAgent_NewChatRequest(object sender, NewChatRequestEventArgs e)
        //{
        //    this.Invoke(new UpdateUIDelegate(delegate(object obj)
        //    {
        //        NewChatRequestEventArgs arg = obj as NewChatRequestEventArgs;
        //        NotifyForm.ShowNotifier(true, "访客 " + arg.Name + " 请求对话！", arg.Chat);
        //        changeVisitorListViewItemColor();
        //        displayStatus();
        //    }), e);
        //}

        void operaterServiceAgent_VisitorSessionChange(object sender, VisitorSessionChangeEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
            {
                VisitorSessionChangeEventArgs arg = obj as VisitorSessionChangeEventArgs;
                processVisitSessionChange(arg.VisitSession);
                changeVisitorListViewItemColor();
                displayStatus();
            }), e);
        }

        //void operaterServiceAgent_NewVisitor(object sender, NewVisitorEventArgs e)
        //{
        //    this.Invoke(new UpdateUIDelegate(delegate(object obj)
        //    {
        //        NewVisitorEventArgs arg = obj as NewVisitorEventArgs;
        //        processNewVisitor(arg.Visitor);
        //        changeVisitorListViewItemColor();
        //        displayStatus();
        //    }), e);

        //}

        //void operaterServiceAgent_NewLeaveWords(object sender, LeaveWordEventArgs e)
        //{
        //    this.Invoke(new UpdateUIDelegate(delegate(object obj)
        //    {
        //        LeaveWordEventArgs arg = obj as LeaveWordEventArgs;
        //        LeaveWordNotReplied(e.Words);
        //        this.leaveWordBindingSource.DataSource = e.Words;
        //    }), e);

        //}

        //void operaterServiceAgent_NewSystemAdvertise(object sender, SystemAdvertiseEventArgs e)
        //{
        //    systemAdvertises = e.Advertises;
        //    foreach (var item in systemAdvertises)
        //    {
        //        if (item.AdvertiseUrl.Equals("http://www.zxkefu.cn/Download.aspx", StringComparison.InvariantCultureIgnoreCase))
        //        {
        //            if (MessageBox.Show("客户端已有新版本发布,是否更新","程序更新", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
        //            {
        //                Process.Start("IC.AutoUpdate.exe", "/url" + Properties.Settings.Default.UpdateUrl);
        //                closedByUser = false;
        //                Application.Exit();
        //            }

        //        }
        //    }
        //}

        //#endregion

        #region MainForm 构造函数，事件处理
        public MainForm(IOperatorServiceAgent agent, DateTime loginTime)
        {
            InitializeComponent();
            this.loginTime = loginTime;
            this.operaterServiceAgent = agent;
        }

        private void MainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.ExitThread();
        }

        private void initForm()
        {
            this.operatorToolStripStatusLabel.Text = "登录客服为：" + operaterServiceAgent.CurrentOperator.NickName;
            this.stateToolStripStatusLabel.Text = "目前状态：" + Common.GetOperatorsStatusText(operaterServiceAgent.CurrentOperator.Status);
            this.adminToolStripMenuItem.Visible = operaterServiceAgent.CurrentOperator.IsAdmin;
            this.changePasswordToolStripMenuItem.Enabled = !operaterServiceAgent.CurrentOperator.IsAdmin;
            if (operaterServiceAgent.CurrentOperator.IsAdmin)
                this.powerToolStripStatusLabel.Text = "管理员";
            else
                this.powerToolStripStatusLabel.Text = "普通客服";

            autoLoginToolStripMenuItem.Checked = Properties.Settings.Default.AutoLogin;
            playSoundOnChatRequestToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatReq;
            playSoundOnChatMessageToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatMsg;
            whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked = Properties.Settings.Default.GetWebRequestOffline;
            autostartToolStripMenuItem.Checked = Properties.Settings.Default.StartWithWindows;
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            initForm();

            messagebeginDateTimePicker.MaxDate = DateTime.Now;
            messageendDateTimePicker.MaxDate = DateTime.Now;
            requestbeginDateTimePicker.MaxDate = DateTime.Now;
            requestendDateTimePicker.MaxDate = DateTime.Now;

            registerOperatorServiceAgentEventHandler(false);

            operaterServiceAgent.EnablePooling = true;
            loadDomainName();
        }

        private void LeaveWordNotReplied(List<LeaveWord> lwnr)
        {
            List<LeaveWord> lws = lwnr == null ? operaterServiceAgent.GetLeaveWord() : lwnr;
            int num = 0;
            if (lws != null)
            {
                foreach (LeaveWord item in lws)
                {
                    if (!item.IsReplied)
                    {
                        num++;
                    }
                }
            }
            if (num == 0)
            {
                this.tabPage4.Text = "留言列表";
            }
            else
            {
                this.tabPage4.Text = "留言列表:(" + num + ")";
                tabChats.SelectedTab = tabPage4;
                this.tabPage4.ToolTipText = "未回复留言数:" + num;
            }
        }

        private void registerOperatorServiceAgentEventHandler(bool unregister)
        {
            if (!unregister)
            {
                operaterServiceAgent.ConnectionStateChanged +=new EventHandler<ConnectionStateChangeEventArgs>(operaterServiceAgent_ConnectionStateChanged);
                operaterServiceAgent.OperatorStatusChanged += new EventHandler<OperatorServiceInterface.OperatorStatusChangeEventArgs>(operaterServiceAgent_OperatorStatusChanged);
                operaterServiceAgent.VisitorSessionChange += new EventHandler<VisitorSessionChangeEventArgs>(operaterServiceAgent_VisitorSessionChange);
                operaterServiceAgent.NewVisiting += new EventHandler<OperatorServiceInterface.NewVisitingEventArgs>(operaterServiceAgent_NewVisiting);
                operaterServiceAgent.VisitorChatRequest += new EventHandler<OperatorServiceInterface.VisitorChatRequestEventArgs>(operaterServiceAgent_VisitorChatRequest);
                operaterServiceAgent.DataLoadCompleted += new EventHandler<DataLoadCompletedEventArgs>(operaterServiceAgent_DataLoadCompleted);
            }
            else
            {
                operaterServiceAgent.ConnectionStateChanged -= new EventHandler<ConnectionStateChangeEventArgs>(operaterServiceAgent_ConnectionStateChanged);
                operaterServiceAgent.OperatorStatusChanged -= new EventHandler<OperatorServiceInterface.OperatorStatusChangeEventArgs>(operaterServiceAgent_OperatorStatusChanged);
                operaterServiceAgent.VisitorSessionChange -= new EventHandler<VisitorSessionChangeEventArgs>(operaterServiceAgent_VisitorSessionChange);
                operaterServiceAgent.NewVisiting -= new EventHandler<OperatorServiceInterface.NewVisitingEventArgs>(operaterServiceAgent_NewVisiting);
                operaterServiceAgent.VisitorChatRequest -= new EventHandler<OperatorServiceInterface.VisitorChatRequestEventArgs>(operaterServiceAgent_VisitorChatRequest);
                operaterServiceAgent.DataLoadCompleted -= new EventHandler<DataLoadCompletedEventArgs>(operaterServiceAgent_DataLoadCompleted);
            }
        }

        void operaterServiceAgent_DataLoadCompleted(object sender, DataLoadCompletedEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
           {
               switch (e.DataType)
               {
                   case DataLoadEventType.Operators:
                       operatorPannel1.RecieveOperator(operaterServiceAgent.Operators);
                       break;
                   case DataLoadEventType.Visitors:
                       foreach (var item in operaterServiceAgent.Visitors)
                       {
                           processNewVisitor(item);
                       }
                       changeVisitorListViewItemColor();
                       displayStatus();
                       break;
                   case DataLoadEventType.SystemAdvertise:
                       break;
                   case DataLoadEventType.LeaveWord:
                       break;
                   default:
                       break;
               }
           }), e);
        }

        void operaterServiceAgent_VisitorChatRequestAccepted(object sender, OperatorServiceInterface.VisitorChatRequestAcceptedEventArgs e)
        {
            //this.Invoke(new UpdateUIDelegate(delegate(object obj)
            //{
            //    Visitor visitor = operaterServiceAgent.GetVisitorById(e.VisitorChatRequest.VisitorId);
            //    visitor.CurrentSession.Status = VisitSessionStatus.Chatting;
            //    processVisitSessionChange(visitor.CurrentSession);
            //    changeVisitorListViewItemColor();
            //    displayStatus();
            //}), e);
        }

        // 访客请求对话
        void operaterServiceAgent_VisitorChatRequest(object sender, OperatorServiceInterface.VisitorChatRequestEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
           {
               Visitor visitor = operaterServiceAgent.GetVisitorById(e.VisitorId);
               visitor.CurrentSession.Status = VisitSessionStatus.ChatRequesting;
               processVisitSessionChange(visitor.CurrentSession);
               NotifyForm.ShowNotifier(true, "访客 " + visitor.Name + " 请求对话！", e.Chat);
               changeVisitorListViewItemColor();
               displayStatus();
           }), e);
        }

        // 访客离开
        void operaterServiceAgent_VisitorLeave(object sender, OperatorServiceInterface.VisitorLeaveEventArgs e)
        {
            // this.Invoke(new UpdateUIDelegate(delegate(object obj)
            //{
            //    Visitor visitor = operaterServiceAgent.GetVisitorById(e.VisitorId);
            //    if (visitor == null)
            //    {
            //        return;
            //    }
            //    visitor.CurrentSession.Status = VisitSessionStatus.Leave;
            //    processVisitSessionChange(visitor.CurrentSession);
            //    changeVisitorListViewItemColor();
            //    displayStatus();
            //}), e);
        }

        // 新对话
        void operaterServiceAgent_NewChat(object sender, OperatorServiceInterface.NewChatEventArgs e)
        {
            // operaterServiceAgent.Chats.Add(e.Chat);
            //changeVisitorListViewItemColor();
            //displayStatus();
        }

        // 新访客
        void operaterServiceAgent_NewVisiting(object sender, OperatorServiceInterface.NewVisitingEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
            {
                processNewVisitor(e.Visitor);
                processVisitSessionChange(e.Session);
                changeVisitorListViewItemColor();
                displayStatus();
            }), e);
        }

        // 对话状态改变
        void operaterServiceAgent_ChatStatusChanged(object sender, OperatorServiceInterface.ChatStatusChangedEventArgs e)
        {
            //this.Invoke(new UpdateUIDelegate(delegate(object obj)
            //{

            //    Chat chat= operaterServiceAgent.GetChatByChatId(e.ChatId);
            //    Visitor visitor = operaterServiceAgent.GetVisitorById(chat.VisitorId);
            //    if (chat != null & visitor != null)
            //    {
            //        chat.Status = e.Status;
            //        if (chat.Status == ChatStatus.Closed)
            //        {
            //            visitor.CurrentSession.Status = VisitSessionStatus.Visiting;
            //        }
            //        if (chat.Status == ChatStatus.Requested)
            //        {
            //            visitor.CurrentSession.Status = VisitSessionStatus.ChatRequesting;
            //        }
            //        if (chat.Status == ChatStatus.Accepted)
            //        {
            //            visitor.CurrentSession.Status = VisitSessionStatus.Chatting;
            //        }
            //        processVisitSessionChange(visitor.CurrentSession);
            //        changeVisitorListViewItemColor();
            //        displayStatus();
            //    }
            //    else
            //        Trace.WriteLine("ChatId="+e.ChatId+" not exist");
            //}), e);
        }

        // 客服状态改变
        void operaterServiceAgent_OperatorStatusChanged(object sender, OperatorServiceInterface.OperatorStatusChangeEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
            {
                operatorPannel1.RecieveOperator(operaterServiceAgent.Operators);
            }), e);

        }


        void operaterServiceAgent_ConnectionStateChanged(object sender, ConnectionStateChangeEventArgs e)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
            {
                ConnectionStateChangeEventArgs arg = obj as ConnectionStateChangeEventArgs;
                if (arg.State == ConnectionState.Disconnected)
                {
                    //this.Enabled = false;
                    connectionLost(arg.Message);
                }
                else if (arg.State == ConnectionState.Connected)
                {
                    loginTimer.Enabled = true;
                    operaterServiceAgent.EnablePooling = true;
                    notifyIcon.Icon = Properties.Resources.Profile;
                    notifyIcon.Text = "网站客服 - " + "在线";
                }
            }), e);
        }

        private void MainForm_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
                showMainForm(false);
        }

        enum ClosingResult
        {
            Minimize, Close, Cancel
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (closedByUser)
            {
                ClosingResult res = ClosingResult.Cancel;

                // 1 判断是否关闭程序
                if (Properties.Settings.Default.ShowCloseReminder)
                {
                    CloseSettingForm closeSettingForm = new CloseSettingForm();
                    DialogResult result = closeSettingForm.ShowDialog();
                    if (result == DialogResult.Cancel)
                    {
                        res = ClosingResult.Cancel;
                    }
                    else
                    {
                        res = getClosingResult(res);

                    }
                }
                else
                {
                    res = getClosingResult(res);
                }

                // 2.相应处理 
                switch (res)
                {
                    case ClosingResult.Minimize:
                        showMainForm(false);
                        e.Cancel = true;
                        break;
                    case ClosingResult.Close:
                        shutdown();
                        break;
                    case ClosingResult.Cancel:
                        e.Cancel = true;
                        break;
                    default:
                        break;
                }
            }

            Properties.Settings.Default.Save();
        }

        private static ClosingResult getClosingResult(ClosingResult res)
        {
            bool state = Properties.Settings.Default.CloseState; // true: 最小化于任务栏通知区域，false 关闭
            if (state)
            {
                res = ClosingResult.Minimize;
            }
            else
            {
                res = ClosingResult.Close;
                if (Program.ChatForms.Count > 0)
                {
                    if (MessageBox.Show("访客对话存在无法关闭客户端,是否强制关闭？", "系统提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
                    {
                        res = ClosingResult.Cancel;
                    }
                }
            }
            return res;
        }

        private void shutdown()
        {
            registerOperatorServiceAgentEventHandler(true);
            loginTimer.Enabled = false;

            List<ChatForm> forms = new List<ChatForm>(Program.ChatForms);
            foreach (var item in forms)
            {
                item.Close();
            }


        }
        #endregion

        #region 其他函数
        private VisitorListViewItem getSelectedVisitorListViewItem()
        {
            if (lstVisitors.SelectedItems.Count == 0)
            {
                return null;
            }
            VisitorListViewItem vlvi = lstVisitors.SelectedItems[0].Tag as VisitorListViewItem;
            return vlvi;
        }

        private void refreashListViewGroup()
        {
            if (isAllowGroup && lstVisitors.Groups.Count > 0)
            {
                ////groupColumn大于等于0设置分组
                if (groupColumn >= 0)
                {
                    lstVisitors.Groups.Clear();
                    groupTables = new Hashtable[groupColumn + 1];
                    groupTables[groupColumn] = CreateGroupsTable(groupColumn);

                    SetGroups(groupColumn);
                }
            }
        }
        private void changeVisitorListViewItemColor()
        {
            foreach (ListViewItem item in lstVisitors.Items)
            {
                if (item == null) continue;
                VisitorListViewItem v = item.Tag as VisitorListViewItem;
                if (v.VisitSession.Status == VisitSessionStatus.Visiting)
                {
                    item.SubItems[0].ForeColor = Color.Green;
                }
                if (v.VisitSession.Status == VisitSessionStatus.ChatRequesting)
                {
                    item.SubItems[0].ForeColor = Color.Red;
                }
                if (v.VisitSession.Status == VisitSessionStatus.Chatting)
                {
                    item.SubItems[0].ForeColor = Color.Blue;
                }
                if (v.VisitSession.Status == VisitSessionStatus.Leave)
                {
                    item.SubItems[0].ForeColor = Color.Gray;
                }
            }
        }

        /// <summary>
        /// 计算登录时长
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void loginTimer_Tick(object sender, EventArgs e)
        {


            DateTime dtime = DateTime.Now;
            this.stickToolStripStatusLabel.Text = Common.dateDiff(loginTime, dtime);

            if (dtime.Second % 5 == 0)
            {
                SystemAdvertise sa = getNextSysteAdvertise();
                if (sa != null)
                {
                    toolStripStatusLabel1.Text = sa.AdvertiseMessage;
                    toolStripStatusLabel1.Tag = sa.AdvertiseUrl;
                }
            }
        }

        private SystemAdvertise getNextSysteAdvertise()
        {
            if (systemAdvertises == null || systemAdvertises.Count == 0)
            {
                return null;
            }
            if (currentSystemAdvertiseIndex >= systemAdvertises.Count)
            {
                currentSystemAdvertiseIndex = 0;
            }
            SystemAdvertise sa = systemAdvertises[currentSystemAdvertiseIndex];
            currentSystemAdvertiseIndex++;
            return sa;
        }

        private void connectionLost(string message)
        {
            loginTimer.Enabled = false;
            notifyIcon.Icon = Properties.Resources.Profile1;
            notifyIcon.Text = "网站客服 - " + "网络连接中断";
            //if (status == ExceptionStatus.System)
            //{
            //}
            //else
            //{
            //    MessageBox.Show(message + "，需要重新登陆！", "连接错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    restartApp("-r");
            //}
        }

        private void displayStatus()
        {
            int VisitorChatResult = 0;
            int Chatting = 0;
            int Visitors = 0;
            foreach (ListViewItem item in lstVisitors.Items)
            {
                VisitorListViewItem v = item.Tag as VisitorListViewItem;
                if (v.VisitSession.Status == VisitSessionStatus.Chatting)
                {
                    VisitorChatResult++;
                }
                if (v.VisitSession.OperatorId == operaterServiceAgent.CurrentOperator.OperatorId && v.VisitSession.Status == VisitSessionStatus.Chatting)
                {
                    Chatting++;
                }
                if (v.VisitSession.Status != VisitSessionStatus.Leave)
                {
                    Visitors++;
                }
            }
            currentVisitorsToolStripLabel.Text = "当前访客数: " + Visitors;
            visitorOnChatToolStripLabel.Text = "对话中的访客数: " + VisitorChatResult;
            myChatToolStripLabel.Text = "我的对话数: " + Chatting;
        }

        private void restartApp(string args)
        {
            Properties.Settings.Default.AutoLogin = false;
            closedByUser = false;
            shutdown();
            this.Close();
            Process.Start(new ProcessStartInfo(Application.ExecutablePath, args));
            Application.Exit();
        }

        private void showMainForm(bool show)
        {
            this.Visible = show;
            if (show)
            {
                this.WindowState = saveWindowState;
                this.Activate();
            }
            else
            {
                saveWindowState = this.WindowState;
            }
        }
        #endregion

        #region 托盘右键菜单事件处理
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
        #endregion

        #region 处理 NewChangesCheckResult

        private void processNewVisitor(Visitor visitor)
        {
            this.Invoke(new UpdateUIDelegate(delegate(object obj)
           {
               VisitorListViewItem vlvi = new VisitorListViewItem();
               vlvi.Visitor = visitor;
               string browser = Common.GetBrowserShortName(vlvi.VisitSession.Browser);
               string status = Common.GetVisitSessionStatusText(vlvi.VisitSession.Status);
               string visitingTime = vlvi.VisitSession.VisitingTime.Ticks == 0 ? "" : vlvi.VisitSession.VisitingTime.ToString();

               ListViewItem i = new ListViewItem(new string[]{ browser,vlvi.Visitor.Name,vlvi.VisitSession.DomainRequested,vlvi.VisitSession.Location,
                         vlvi.Visitor.VisitCount.ToString(),"暂无接待",status,
                         vlvi.VisitSession.VisitingTime.ToString(), "", "",
                         "","", "",vlvi.VisitSession.PageRequestCount.ToString(), Common.GetSearchEngineName(vlvi.VisitSession.Referrer)
                        });
               if (vlvi.VisitSession.Browser.Contains("MSIE"))
               {
                   i.ImageIndex = 1;
               }
               else if (vlvi.VisitSession.Browser.Contains("Firefox"))
               {
                   i.ImageIndex = 0;
               }
               i.Tag = vlvi;
               lstVisitors.Items.Add(i);

               refreashListViewGroup();

               if (vlvi.VisitSession.Status != VisitSessionStatus.Leave)
               {
                   notifyIcon.ShowBalloonTip(5000, "新的访客", string.Format("访客{0}正在访问页面 \r\n {1}", vlvi.Visitor.Name, vlvi.VisitSession.PageRequested), ToolTipIcon.Info);
               }
           }), visitor);

        }

        private void processVisitSessionChange(VisitSession visitSession)
        {
            ListViewItem lvi = null;
            VisitorListViewItem vlvi = null;
            foreach (ListViewItem item in lstVisitors.Items)
            {
                vlvi = item.Tag as VisitorListViewItem;
                if (vlvi.VisitSession.SessionId == visitSession.SessionId)
                {
                    lvi = item;
                    break;
                }
            }

            string status = Common.GetVisitSessionStatusText(vlvi.VisitSession.Status);
            string leaveTime = vlvi.VisitSession.LeaveTime.Ticks == 0 ? "" : vlvi.VisitSession.LeaveTime.ToString();
            string chatRequestTime = vlvi.VisitSession.ChatRequestTime.Ticks == 0 ? "" : vlvi.VisitSession.ChatRequestTime.ToString();
            string chattingStartTime = vlvi.VisitSession.ChatingTime.Ticks == 0 ? "" : vlvi.VisitSession.ChatingTime.ToString();
            string waitingDuring = vlvi.VisitSession.WaitingDuring.Ticks == 0 ? "" : vlvi.VisitSession.WaitingDuring.ToString();
            string chattingDuring = vlvi.VisitSession.ChattingDuring.Ticks == 0 ? "" : vlvi.VisitSession.ChattingDuring.ToString();
            string OperatorId = vlvi.VisitSession.OperatorId;

            lvi.SubItems[VisitorTreeView_HeaderColumn_ChatRequestTime].Text = chatRequestTime;
            lvi.SubItems[VisitorTreeView_HeaderColumn_ChatStartTime].Text = chattingStartTime;
            lvi.SubItems[VisitorTreeView_HeaderColumn_LeaveTime].Text = leaveTime;
            lvi.SubItems[VisitorTreeView_HeaderColumn_Status].Text = status;
            if (vlvi.VisitSession.Status == VisitSessionStatus.Chatting && !string.IsNullOrEmpty(vlvi.VisitSession.OperatorId))
            {
                lvi.SubItems[VisitorTreeView_HeaderColumn_Operator].Text = operaterServiceAgent.GetOperatorById(vlvi.VisitSession.OperatorId).NickName;
            }
            else if (vlvi.VisitSession.Status == VisitSessionStatus.Leave)
            {
                notifyIcon.ShowBalloonTip(5000, "访客离开", string.Format("访客{0}已离开网站", vlvi.Visitor.Name), ToolTipIcon.Info);
            }
            else
            {
                lvi.SubItems[VisitorTreeView_HeaderColumn_Operator].Text = "暂无接待";
            }

            refreashListViewGroup();

        }

        #endregion

        #region 工具栏事件处理
        // 接受访客请求
        private void acceptToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                acceptToolStripButton.Enabled = false;
                VisitorListViewItem vlvi = getSelectedVisitorListViewItem();
                if (vlvi != null)
                {
                    Chat chat = operaterServiceAgent.GetChatRequest(vlvi.Visitor.VisitorId);
                    if (chat != null && vlvi.VisitSession.Status == VisitSessionStatus.ChatRequesting)
                    {
                        ChatForm cf = new ChatForm(operaterServiceAgent);
                        Program.ChatForms.Add(cf);
                        cf.Accept(chat);
                        cf.Show();
                    }
                    else
                    {
                        MessageBox.Show("该访客暂时还未请求对话");
                    }

                }
            }
            finally
            {
                acceptToolStripButton.Enabled = true;
            }
        }

        //主动邀请访客
        private void inviteToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                inviteToolStripButton.Enabled = false;
                VisitorListViewItem v = getSelectedVisitorListViewItem();
                if (v != null && v.VisitSession.Status == VisitSessionStatus.Visiting)
                {
                    if (!operaterServiceAgent.IsVisitorHasActiveChat(v.Visitor.VisitorId))
                    {
                        ChatForm cf = new ChatForm(operaterServiceAgent);
                        Program.ChatForms.Add(cf);
                        cf.Invite(v.Visitor.VisitorId);
                        cf.Show();
                    }
                }
                else
                {
                    MessageBox.Show("该访客已被其他客服邀请或在对话中");

                }

            }
            finally
            {
                inviteToolStripButton.Enabled = true;
            }
        }
        #endregion

        #region 访客栏事件处理
        /// <summary>
        /// 访客历史页面请求记录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSearchHistoryPageRequests_Click(object sender, EventArgs e)
        {
            try
            {
                btnSearchHistoryPageRequests.Enabled = false;
                lstPageRequest.Items.Clear();
                VisitorListViewItem vlvi = getSelectedVisitorListViewItem();
                if (vlvi == null)
                {
                    MessageBox.Show("请选择访客");
                    return;
                }
                DateTime beginTime = new DateTime(requestbeginDateTimePicker.Value.Year, requestbeginDateTimePicker.Value.Month, requestbeginDateTimePicker.Value.Day, 0, 0, 0);
                DateTime endTime = new DateTime(requestendDateTimePicker.Value.Year, requestendDateTimePicker.Value.Month, requestendDateTimePicker.Value.Day, 23, 59, 59);


                if (beginTime > endTime)
                {
                    MessageBox.Show("日期选择有误！！");
                    return;
                }

                List<PageRequest> pRequest = operaterServiceAgent.GetHistoryPageRequests(vlvi.Visitor.VisitorId, beginTime, endTime);

                if (pRequest != null && pRequest.Count > 0)
                {
                    foreach (PageRequest item in pRequest)
                    {
                        if (item == null) continue;
                        ListViewItem pageRequest = new ListViewItem(new string[]
                         {
                            item.Page, item.RequestTime.ToString(), item.Referrer
                          });
                        pageRequest.Tag = item;
                        lstPageRequest.Items.Add(pageRequest);
                    }
                }
                else
                {
                    MessageBox.Show("该访客暂无访问记录！");
                }

            }
            finally
            {
                btnSearchHistoryPageRequests.Enabled = true;
            }
        }

        /// <summary>
        /// 访客历史聊天记录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSearchHistoryChatMsg_Click(object sender, EventArgs e)
        {
            //lstMessage.Items.Clear();

            btnSearchHistoryChatMsg.Enabled = false;

            try
            {
                VisitorListViewItem vlvi = getSelectedVisitorListViewItem();
                if (vlvi == null)
                {
                    MessageBox.Show("请选择需要查询的访客");
                    return;
                }
                DateTime beginTime = new DateTime(messagebeginDateTimePicker.Value.Year, messagebeginDateTimePicker.Value.Month, messagebeginDateTimePicker.Value.Day, 0, 0, 0);
                DateTime endTime = new DateTime(messageendDateTimePicker.Value.Year, messageendDateTimePicker.Value.Month, messageendDateTimePicker.Value.Day, 23, 59, 59);

                if (beginTime > endTime)
                {
                    MessageBox.Show("选择时间有误,开始时间晚于结束时间");
                    return;
                }

                List<LiveSupport.LiveSupportModel.Message> msg = operaterServiceAgent.GetHistoryChatMessage(vlvi.Visitor.VisitorId, beginTime, endTime);
                if (msg.Count > 0)
                {
                    chatMessageViewerControl1.DataBindMessage(msg);
                }
                else
                {
                    MessageBox.Show("该访客暂无聊天记录！");
                }

            }
            finally
            {
                btnSearchHistoryChatMsg.Enabled = true;
            }
        }
        #endregion

        #region 主菜单事件处理
        private void autostartToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Properties.Settings.Default.StartWithWindows = this.autostartToolStripMenuItem.Checked;
            //if (Properties.Settings.Default.StartWithWindows)
            //{
            //    RegistryKey run = Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
            //    run.SetValue("OperatorConsole", Application.ExecutablePath.ToString() + " -hide");
            //}
            //else
            //{
            //    RegistryKey run = Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
            //    run.SetValue("OperatorConsole", "");
            //}
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("确认退出程序吗？", "确认退出", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                closedByUser = false;
                shutdown();
                this.Close();
            }
        }

        private void OptionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OptionsForm optionForm = new OptionsForm();
            optionForm.ShowDialog();
        }

        private void changeOperatorToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("您确定要退出，更换其他帐号登录吗？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) == DialogResult.Yes)
            {
                restartApp("");
            }
        }

        // 更改密码
        private void changePasswordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ChangePassword rop = new ChangePassword();
            rop.ShowDialog();
        }

        private void resetpasswordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ResetOperatorPasswordForm dlg = new ResetOperatorPasswordForm();
            dlg.ShowDialog();
        }
        private void settalkToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QickResponseEidtor settalk = new QickResponseEidtor();
            settalk.Show();
        }

        private void paymentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("此功能暂未开放");
        }

        private void touchToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://www.zxkefu.cn/contact.aspx");
        }

        private void handBookToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://www.zxkefu.cn/");
        }

        private void homePageToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://www.zxkefu.cn/");
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            About about = new About();
            about.Show();
        }

        private void optionsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Properties.Settings.Default.AutoLogin = autoLoginToolStripMenuItem.Checked;
            //Properties.Settings.Default.PlaySoundOnChatReq = playSoundOnChatRequestToolStripMenuItem.Checked;
            //Properties.Settings.Default.GetWebRequestOffline = whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked;
        }
        #endregion

        #region ListView 分组,事件处理
        private void lstVisitors_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstVisitors.SelectedItems.Count > 0)
            {
                VisitorListViewItem v = lstVisitors.SelectedItems[0].Tag as VisitorListViewItem;
                visitorBindingSource.DataSource = v.Visitor;
            }
        }
        // Sorts ListViewGroup objects by header value.
        private class ListViewGroupSorter : IComparer
        {
            private SortOrder order;

            Dictionary<string, int> status = new Dictionary<string, int>();

            // Stores the sort order.
            public ListViewGroupSorter(SortOrder theOrder)
            {
                order = theOrder;
                status.Add(Common.GetVisitSessionStatusText(VisitSessionStatus.ChatRequesting), 1);
                status.Add(Common.GetVisitSessionStatusText(VisitSessionStatus.Chatting), 2);
                status.Add(Common.GetVisitSessionStatusText(VisitSessionStatus.Visiting), 3);
                status.Add(Common.GetVisitSessionStatusText(VisitSessionStatus.Leave), 4);
            }

            // Compares the groups by header value, using the saved sort
            // order to return the correct value.
            public int Compare(object x, object y)
            {
                //int result = String.Compare(
                //    ((ListViewGroup)x).Header,
                //    ((ListViewGroup)y).Header
                //);
                //if (order == SortOrder.Ascending)
                //{
                //    return result;
                //}
                //else
                //{
                //    return -result;
                //}
                string first = ((ListViewGroup)x).Header;
                string second = ((ListViewGroup)y).Header;
                return status[first] - status[second];

            }
        }


        //单击列名分组
        private void lstVisitors_ColumnClick(object sender, ColumnClickEventArgs e)
        {
            if (lstVisitors.Groups.Count > 0 && e.Column == groupColumn)
            {
                lstVisitors.Groups.Clear();

                isAllowGroup = false;

            }
            else
            {
                if (e.Column.Equals(VisitorTreeView_HeaderColumn_VisitorName) || e.Column.Equals(VisitorTreeView_HeaderColumn_Browser) || e.Column.Equals(VisitorTreeView_HeaderColumn_Operator) || e.Column.Equals(VisitorTreeView_HeaderColumn_Status) || e.Column.Equals(VisitorTreeView_HeaderColumn_DomainRequested))
                {
                    groupTables = new Hashtable[e.Column + 1];
                    groupTables[e.Column] = CreateGroupsTable(e.Column);
                    groupColumn = e.Column;
                    SetGroups(e.Column);
                }
                else
                {
                    MessageBox.Show("该列不适合分组！");
                }
            }
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

            if (column == VisitorTreeView_HeaderColumn_Status)
            {
                Array.Sort(groupsArray, new ListViewGroupSorter(SortOrder.None));
            }

            lstVisitors.Groups.AddRange(groupsArray);

            // Iterate through the items in lstVisitors, assigning each 
            // one to the appropriate group.
            foreach (ListViewItem item in lstVisitors.Items)
            {

                // Retrieve the subitem text corresponding to the column.
                string subItemText = item.SubItems[column].Text;

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
        #endregion

        #region 状态栏事件处理
        private void toolStripStatusLabel1_Click(object sender, EventArgs e)
        {
            if (toolStripStatusLabel1.Tag != null && !string.IsNullOrEmpty(toolStripStatusLabel1.Tag.ToString()))
            {
                Process.Start(toolStripStatusLabel1.Tag.ToString());
            }
        }
        #endregion

        private void loadDomainName()
        {
            cbxDomainName.Items.AddRange(operaterServiceAgent.GetAccountDomains().ToArray());
            cbxDomainName.SelectedIndex = 0;
        }
        private void tabChats_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void btnSend_Click(object sender, EventArgs e)
        {

            LeaveWord lw = this.leaveWordBindingSource.Current as LeaveWord;
            string original = "%0d%0a%0d%0a ----------------------------原始邮件------------------------------%0d%0a%0d%0a" + lw.Content;
            Process.Start("mailto:" + lw.Email + "?Subject=回复:" + lw.Subject + "&Body=" + original);
            if (operaterServiceAgent.UpdateLeaveWordById(DateTime.Now.ToString(), operaterServiceAgent.CurrentOperator.NickName, true, lw.Id))
            {
                this.leaveWordBindingSource.DataSource = operaterServiceAgent.GetLeaveWord();
                LeaveWordNotReplied(null);
            }
        }

        private void leaveWordDataGridView_SelectionChanged(object sender, EventArgs e)
        {
            LeaveWord lw = this.leaveWordBindingSource.Current as LeaveWord;
            if (lw == null)
            {
                this.btnDelLeaveWord.Enabled = false;
                this.btnSend.Enabled = false;
                return;
            }
            else
            {
                this.btnDelLeaveWord.Enabled = true;
                this.btnSend.Enabled = !lw.IsReplied;
            }
        }
        private void restartConnectionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (operaterServiceAgent.CurrentOperator.Status == OperatorStatus.Offline)
            {
                //if (operaterServiceAgent.RestartLogin() != null)
                //{
                //    loginTimer.Enabled = true;
                //    operaterServiceAgent.EnablePooling = true;
                //    notifyIcon.Icon = Properties.Resources.Profile;
                //}
                operaterServiceAgent.RestartLogin();
            }
        }

        private void btnDelLeaveWord_Click(object sender, EventArgs e)
        {
            if (leaveWordDataGridView.SelectedRows.Count > 0)
            {
                LeaveWord lw = this.leaveWordBindingSource.Current as LeaveWord;
                try
                {
                    if (operaterServiceAgent.DelLeaveWordById(lw.Id))
                    {
                        if (cbxDomainName.SelectedIndex > 0)
                        {
                            this.leaveWordBindingSource.DataSource = operaterServiceAgent.GetLeaveWordByDomainName(cbxDomainName.SelectedItem.ToString());
                        }
                        else
                            this.leaveWordBindingSource.DataSource = operaterServiceAgent.GetLeaveWord();

                        LeaveWordNotReplied(null);
                    }
                }
                catch (WebException)
                {
                    MessageBox.Show("网络中断,请稍候再试...", "提示");
                }

            }

        }

        private void lstPageRequest_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstPageRequest.SelectedItems.Count > 0)
            {
                PageRequest pr = lstPageRequest.SelectedItems[0].Tag as PageRequest;
                if (pr != null)
                {
                    this.lstPageRequest.SelectedItems[0].ToolTipText = "引用页面：" + pr.Referrer + "\r\n\r\n 请求页面：" + pr.Page + "\r\n\r\n 请求时间：" + pr.RequestTime;
                }
            }
        }

        private void cbxDomainName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxDomainName.Items.Count <= 1)
            {
                loadDomainName();
            }
            List<LeaveWord> leaveWord = new List<LeaveWord>();
            if (cbxDomainName.SelectedIndex > 0)
            {
                leaveWord = operaterServiceAgent.GetLeaveWordByDomainName(cbxDomainName.SelectedItem.ToString());
            }
            else
                leaveWord = operaterServiceAgent.GetLeaveWord();
            if (leaveWord != null)
            {
                LeaveWordNotReplied(leaveWord);
                this.leaveWordBindingSource.DataSource = leaveWord;
            }


        }

        private void getWebSiteCodeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Program.OperaterServiceAgent.CurrentOperator != null)
            {
                GetWebSiteCodeDialog dlg = new GetWebSiteCodeDialog(Program.OperaterServiceAgent.CurrentOperator.AccountId);
                dlg.ShowDialog();
            }
        }

        private void openBrowser(object sender, EventArgs e)
        {
            try
            {
                ToolStripMenuItem m = sender as ToolStripMenuItem;
                string url = m.Tag as string;
                browserNavigateTo(url + "?operatorsession=" + Program.OperaterServiceAgent.CurrentOperator.OperatorSession);
                //System.Diagnostics.Process.Start(url);
            }
            catch (Exception)
            {
            }
        }

        private void browserNavigateTo(string url)
        {
            try
            {
                splitContainer2.Panel1Collapsed = true;
                webBrowser1.Navigate(url);
            }
            catch (Exception)
            {
            }
        }

        private void myAccountToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Program.OperaterServiceAgent.CurrentOperator != null)
            {
                AccountInfoDialog dlg = new AccountInfoDialog(Program.OperaterServiceAgent.CurrentOperator);
                dlg.ShowDialog();
                if (dlg.GotoModifyAccountInfoPage)
                {
                    browserNavigateTo("http://www.zxkefu.cn/AccountAdmin/OperatorEdit.aspx?operatorId=" + operaterServiceAgent.CurrentOperator.OperatorId);
                }
            }
        }

        private void toolStripButtonReturnToOperator_Click(object sender, EventArgs e)
        {
            splitContainer2.Panel2Collapsed = true;
        }

        private void toolStripButtonRefresh_Click(object sender, EventArgs e)
        {
            webBrowser1.Refresh();
        }

        private void operatorsInfoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            mainSplitContainer1.Panel1Collapsed = !operatorsInfoToolStripMenuItem.Checked;
        }

        private void visitorInfoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            mainSplitContainer2.Panel2Collapsed = !visitorInfoToolStripMenuItem.Checked;
        }

        private void webBrowser1_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {

            HtmlElement btnSubmit = webBrowser1.Document.All["ImageButton1"];
            HtmlElement tbAccountNumber = webBrowser1.Document.All["txtNumber"];
            HtmlElement tbLoginName = webBrowser1.Document.All["UserName"];
            HtmlElement tbPassword = webBrowser1.Document.All["Password"];

            if (tbAccountNumber == null || tbLoginName == null || tbPassword == null || btnSubmit == null)
                return;
            tbAccountNumber.SetAttribute("value", operaterServiceAgent.CurrentOperator.Account.AccountNumber);
            tbLoginName.SetAttribute("value", operaterServiceAgent.CurrentOperator.LoginName);
            tbPassword.SetAttribute("value", operaterServiceAgent.CurrentOperator.Password);

            btnSubmit.InvokeMember("click");
        }

        private void operatorPannel1_Load(object sender, EventArgs e)
        {

        }


    }

    class VisitorListViewItem
    {
        private Visitor visitor;

        public Visitor Visitor
        {
            get { return visitor; }
            set { visitor = value; }
        }

        public VisitSession VisitSession
        {
            get { return Visitor == null ? null : Visitor.CurrentSession; }
        }
        private Chat chat;

        public Chat Chat
        {
            get { return chat; }
            set { chat = value; }
        }
    }
}