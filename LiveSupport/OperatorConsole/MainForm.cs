using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.IO;
using System.Net;
using Microsoft.Win32;
using System.Diagnostics;
using System.Net.Sockets;
namespace LiveSupport.OperatorConsole
{
    public partial class MainForm : Form
    {
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

        private Hashtable[] groupTables;// Declare a Hashtable array in which to store the groups.
        int groupColumn = -1;// Declare a variable to store the current grouping column.
        private bool isAllowGroup = true;
        private DateTime loginTime;
        TestFixture testFixture = new TestFixture();
        private FormWindowState saveWindowState = FormWindowState.Normal;
        private IOperatorServiceAgent operaterServiceAgent;

        public IOperatorServiceAgent OperaterServiceAgent
        {
            get { return operaterServiceAgent; }
            set { operaterServiceAgent = value; }
        }

        #region IOperatorServiceAgent �¼�����

        void operaterServiceAgent_ConnectionLost(object sender, EventArgs e)
        {
            connectionLost();
        }

        void operaterServiceAgent_VisitorSessionChange(object sender, VisitorSessionChangeEventArgs e)
        {
            processVisitSessionChange(e.VisitSession);
        }


        void operaterServiceAgent_NewVisitor(object sender, NewVisitorEventArgs e)
        {
            processNewVisitor(e.Visitor);
        }
        #endregion

        #region MainForm ���캯�����¼�����
        public MainForm(IOperatorServiceAgent agent, DateTime loginTime)
        {
            this.loginTime = loginTime;
            this.operaterServiceAgent = agent;
            this.operaterServiceAgent.ConnectionLost += new EventHandler<EventArgs>(operaterServiceAgent_ConnectionLost);
            this.operaterServiceAgent.NewVisitor += new EventHandler<NewVisitorEventArgs>(operaterServiceAgent_NewVisitor);
            this.operaterServiceAgent.VisitorSessionChange += new EventHandler<VisitorSessionChangeEventArgs>(operaterServiceAgent_VisitorSessionChange);
            InitializeComponent();
        }

        private void initForm()
        {
            this.operatorToolStripStatusLabel.Text = "��¼�ͷ�Ϊ��" + operaterServiceAgent.CurrentOperator.NickName;
            this.stateToolStripStatusLabel.Text = "Ŀǰ״̬��" + Common.GetOperatorsStatusText(operaterServiceAgent.CurrentOperator.Status);
            this.adminToolStripMenuItem.Visible = operaterServiceAgent.CurrentOperator.IsAdmin;
            this.changePasswordToolStripMenuItem.Enabled = !operaterServiceAgent.CurrentOperator.IsAdmin;
            if (operaterServiceAgent.CurrentOperator.IsAdmin)
                this.powerToolStripStatusLabel.Text = "����Ա";
            else
                this.powerToolStripStatusLabel.Text = "��ͨ�ͷ�";

            autoLoginToolStripMenuItem.Checked = Properties.Settings.Default.AutoLogin;
            playSoundOnChatRequestToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatReq;
            playSoundOnChatMessageToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatMsg;
            whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked = Properties.Settings.Default.GetWebRequestOffline;
            autostartToolStripMenuItem.Checked = Properties.Settings.Default.StartWithWindows;
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            initForm();
            
            messageendDateTimePicker.MaxDate = DateTime.Now;
            messageendDateTimePicker.MaxDate = DateTime.Now;
            requestendDateTimePicker.MaxDate = DateTime.Now;
            requestbeginDateTimePicker.MaxDate = DateTime.Now;
        }

        private void MainForm_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
                showMainForm(false);
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            timer1.Enabled = false;
            loginTimer.Enabled = false;

            if (Program.ChatForms.Count == 0)
            {
                try
                {
                    operaterServiceAgent.Logout();
                }
                catch (Exception ex)
                {
                    Trace.WriteLine("Logout�쳣: " + ex.Message);
                }
            }
            else
            {
                MessageBox.Show("�ÿͶԻ������޷��رտͻ���");
                e.Cancel = true;
                return;

            }
            Properties.Settings.Default.Save();

            Application.Exit();
        }
        #endregion

        #region ��������
        private void refreashListViewGroup()
        {
            if (isAllowGroup && lstVisitors.Groups.Count > 0)
            {
                ////groupColumn���ڵ���0���÷���
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
        /// �����¼ʱ��
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void loginTimer_Tick(object sender, EventArgs e)
        {
            DateTime dtime = DateTime.Now;
            this.stickToolStripStatusLabel.Text = DateDiff(loginTime, dtime);
        }

        private string DateDiff(DateTime DateTime1, DateTime DateTime2)
        {
            string dateDiff = null;

            TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
            TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
            TimeSpan ts = ts1.Subtract(ts2).Duration();
            dateDiff = ts.Days.ToString() + "��"
                + ts.Hours.ToString() + "Сʱ"
                + ts.Minutes.ToString() + "����"
                + ts.Seconds.ToString() + "��";

            return dateDiff;
        }

        private void connectionLost()
        {
            timer1.Enabled = false;
            loginTimer.Enabled = false;
            MessageBox.Show("��������������жϣ���Ҫ���µ�½��", "�����ж�", MessageBoxButtons.OK, MessageBoxIcon.Error);
            restartApp("-r");
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

            lblCurrentVisitors.Text = "��ǰ�ÿ���: " + Visitors;
            lblVisitorOnChat.Text = "�Ի��еķÿ���: " + VisitorChatResult;
            lblMyChat.Text = "�ҵĶԻ���: " + Chatting;
        }

        private void restartApp(string args)
        {
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
                notifyIcon.ShowBalloonTip(500);
            }
        }
        #endregion

        #region �����Ҽ��˵��¼�����
        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            showMainForm(!this.Visible);
        }

        private void offlineToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // NotifyForm.ShowNotifier(false, "��ã�");
        }

        private void beRightBackToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // NotifyForm.ShowNotifier(true, "��������Ի�!!!");
        }
        #endregion

        #region NewChangesCheck ��ʱ���¼�����
        private void timer1_Tick(object sender, EventArgs e)
        {
            NewChangesCheckResult result = operaterServiceAgent.GetNextNewChanges();

            if (result == null) return;
            if (result.ReturnCode == ReturnCodeEnum.ReturnCode_SessionInvalid)
            {
                this.timer1.Enabled = false;
                this.loginTimer.Enabled = false;
                MessageBox.Show("���ʺ����������ط���½��", "ϵͳ�ỰʧЧ", MessageBoxButtons.OK);
                restartApp(string.Empty);
                return;
            }
            Trace.WriteLine("NewChangesCheckResult: " + result.ToString());         

            operatorPannel1.RecieveOperator(operaterServiceAgent.Operators);

            //Debug.WriteLine(string.Format("lastCheck={0}, result.CheckTime={1}",lastCheck.Ticks,result.CheckTime.Ticks));
            changeVisitorListViewItemColor();
            displayStatus();
        }
        #endregion 

        #region ���� NewChangesCheckResult

        private void processNewVisitor(Visitor visitor)
        {
            VisitorListViewItem vlvi = new VisitorListViewItem();
            vlvi.Visitor = visitor;

            string browser = Common.GetBrowserShortName(vlvi.VisitSession.Browser);
            string status = Common.GetVisitSessionStatusText(vlvi.VisitSession.Status);
            string visitingTime = vlvi.VisitSession.VisitingTime.Ticks == 0 ? "" : vlvi.VisitSession.VisitingTime.ToString();

            ListViewItem i = new ListViewItem(new string[]{ browser,vlvi.Visitor.Name,vlvi.VisitSession.Location,
                         vlvi.Visitor.VisitCount.ToString(),"���޽Ӵ�",status,
                         vlvi.VisitSession.VisitingTime.ToString(), "", "",
                         "","", "",vlvi.VisitSession.PageRequestCount.ToString()
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
                notifyIcon.ShowBalloonTip(5000, "�µķÿ�", string.Format("�ÿ�{0}���ڷ���ҳ�� \r\n {1}", vlvi.Visitor.Name, vlvi.VisitSession.PageRequested), ToolTipIcon.Info);
            }
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
                notifyIcon.ShowBalloonTip(5000, "�ÿ��뿪", string.Format("�ÿ�{0}���뿪��վ", vlvi.Visitor.Name), ToolTipIcon.Info);
            }
            else
            {
                lvi.SubItems[VisitorTreeView_HeaderColumn_Operator].Text = "���޽Ӵ�";
            }

            refreashListViewGroup();

        }

        #endregion

        #region �������¼�����
        // ���ܷÿ�����
        private void acceptToolStripButton_Click(object sender, EventArgs e)
        {
            VisitorListViewItem vlvi = getSelectedVisitorListViewItem();
            //visitor.CurrentSession.IP;

            lstVisitors.FullRowSelect = true;

            if (lstVisitors.SelectedItems.Count > 0)
            {

                if (vlvi.VisitSession.Status == VisitSessionStatus.ChatRequesting && vlvi.Chat!=null)
                {
                    foreach (var item in operaterServiceAgent.Chats)
                    {
                        if (item.VisitorId == vlvi.Visitor.VisitorId && item.Status == ChatStatus.Requested)
                        {
                            ChatForm cf = new ChatForm(operaterServiceAgent,item);
                            Program.ChatForms.Add(cf);
                            cf.Show();
                            break;

                        }
                    }

                }
                else
                {
                    MessageBox.Show("�÷ÿ���ʱ��δ����Ի�");
                }

            }
            else
            {
                MessageBox.Show("��ѡ��ÿ�");

            }
        }

        private VisitorListViewItem getSelectedVisitorListViewItem()
        {
            if (lstVisitors.SelectedItems.Count == 0)
            {
                return null;
            }
            VisitorListViewItem vlvi = lstVisitors.SelectedItems[0].Tag as VisitorListViewItem;
            return vlvi;
        }

        //��������ÿ�
        private void inviteToolStripButton_Click(object sender, EventArgs e)
        {
            VisitorListViewItem v = getSelectedVisitorListViewItem();
            if (v != null && v.VisitSession.Status == VisitSessionStatus.Visiting)
            {

                Chat chat = operaterServiceAgent.InviteChat(v.Visitor.VisitorId);


                if (chat != null)
                {
                    ChatForm cf = null;
                    foreach (var item in Program.ChatForms)
                    {
                        if (item.Chat.VisitorId == chat.VisitorId)
                        {

                            operaterServiceAgent.CloseChat(item.Chat.ChatId);
                            cf = item;
                            cf.Chat = chat;
                            break;
                        }
                    }

                    if (cf == null)
                    {
                        cf = new ChatForm(operaterServiceAgent,chat, true);
                        Program.ChatForms.Add(cf);
                    }

                    cf.Show();
                }
            }
            else
            {
                MessageBox.Show("�÷ÿ��ѱ������ͷ�������ڶԻ���");

            }
        }
        #endregion

        #region �ÿ����¼�����
        /// <summary>
        /// �ÿ���ʷҳ�������¼
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOk_Click(object sender, EventArgs e)
        {
            lstPageRequest.Items.Clear();
            if (lstVisitors.SelectedItems.Count > 0)
            {
                if (requestbeginDateTimePicker.Value <= requestendDateTimePicker.Value)
                {
                    Visitor v = lstVisitors.SelectedItems[0].Tag as Visitor;

                    List<PageRequest> pRequest = operaterServiceAgent.GetHistoryPageRequests(v.VisitorId, requestbeginDateTimePicker.Value, requestendDateTimePicker.Value);

                    if (pRequest.Count > 0)
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
                        MessageBox.Show("�÷ÿ����޷��ʼ�¼��");

                    }

                }
                else
                {

                    MessageBox.Show("����ѡ�����󣡣�");
                }
            }
            else
            {
                MessageBox.Show("��ѡ��ÿ�");
            }
        }

        /// <summary>
        /// �ÿ���ʷ�����¼
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSend_Click(object sender, EventArgs e)
        {
            lstMessage.Items.Clear();
            if (lstVisitors.SelectedItems.Count > 0)
            {
                if (messagebeginDateTimePicker.Value <= messageendDateTimePicker.Value)
                {
                    Visitor v = lstVisitors.SelectedItems[0].Tag as Visitor;
                    List<LiveSupport.OperatorConsole.LiveChatWS.Message> msg = operaterServiceAgent.GetHistoryChatMessage(v.VisitorId, messagebeginDateTimePicker.Value, messageendDateTimePicker.Value);
                    if (msg.Count > 0)
                    {
                        foreach (LiveSupport.OperatorConsole.LiveChatWS.Message item in msg)
                        {
                            if (item == null) continue;
                            ListViewItem Message = new ListViewItem(new string[]
                         {
                             item.Source, item.Destination,item.Text,item.SentDate.ToString()
                            
                          });
                            Message.Tag = item;
                            lstMessage.Items.Add(Message);

                        }
                    }
                    else
                    {
                        MessageBox.Show("�÷ÿ����������¼��");
                    }

                }
                else
                {

                    MessageBox.Show("����ѡ�����󣡣�");
                }
            }
            else
            {
                MessageBox.Show("��ѡ��ÿ�");
            }
        }
        #endregion

        #region ���˵��¼�����
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

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("ȷ��Ҫ�˳���ϯ�նˣ�", "�˳�ȷ��", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void changeOperatorToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("��ȷ��Ҫ�˳������������ʺŵ�¼��", "��ʾ", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) == DialogResult.Yes)
            {
                restartApp("");
            }
        }

        // ��������
        private void rejiggerpasswordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ChangePassword rop = new ChangePassword();
            rop.ShowDialog();
        }

        private void resetpasswordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("�˹�����δ���ţ���");
        }
        private void settalkToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QickResponseEidtor settalk = new QickResponseEidtor();
            settalk.ShowDialog();
        }

        private void checkUpdateToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Ŀǰ��Ϊ���°汾");
        }

        private void paymentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("�˹�����δ����");
        }

        private void touchToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("�绰��XXX-XXXXXXXX");

        }

        private void handBookToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void homePageToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            About about = new About();
            about.Show();
        }

        private void optionsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.AutoLogin = autoLoginToolStripMenuItem.Checked;
            Properties.Settings.Default.PlaySoundOnChatReq = playSoundOnChatRequestToolStripMenuItem.Checked;
            Properties.Settings.Default.GetWebRequestOffline = whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked;
        }
        #endregion

        #region ListView ����,�¼�����
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


        //������������
        private void lstVisitors_ColumnClick(object sender, ColumnClickEventArgs e)
        {
            if (lstVisitors.Groups.Count > 0 && e.Column == groupColumn)
            {
                lstVisitors.Groups.Clear();

                isAllowGroup = false;

            }
            else
            {
                if (e.Column.Equals(VisitorTreeView_HeaderColumn_VisitorName) || e.Column.Equals(VisitorTreeView_HeaderColumn_Browser) || e.Column.Equals(VisitorTreeView_HeaderColumn_Operator) || e.Column.Equals(VisitorTreeView_HeaderColumn_Status))
                {
                    groupTables = new Hashtable[e.Column + 1];
                    groupTables[e.Column] = CreateGroupsTable(e.Column);
                    groupColumn = e.Column;
                    SetGroups(e.Column);
                }
                else
                {
                    MessageBox.Show("���в��ʺϷ��飡");
                }
            }
        }

        // Sets lstVisitors to the groups created for the specified column.
        //������
        private void SetGroups(int column)
        {
            // Remove the current groups.
            lstVisitors.Groups.Clear();

            // Retrieve the hash table corresponding to the column.
            Hashtable groups = (Hashtable)groupTables[column];

            // Copy the groups for the column to an array.
            ListViewGroup[] groupsArray = new ListViewGroup[groups.Count];
            groups.Values.CopyTo(groupsArray, 0);

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
            get { return Visitor == null?null:Visitor.CurrentSession; }
        }
        private Chat chat;

        public Chat Chat
        {
            get { return chat; }
            set { chat = value; }
        }
    }
}