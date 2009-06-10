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
        private List<Operator> operators = new List<Operator>();
        private DateTime loginTime;

        public MainForm(DateTime loginTime)
        {
            this.loginTime = loginTime;
            InitializeComponent();
            
        }

        private void initForm()
        {
            this.operatorToolStripStatusLabel.Text = "��¼�ͷ�Ϊ��" + Program.CurrentOperator.NickName;
            this.stateToolStripStatusLabel.Text = "Ŀǰ״̬��" + getOperatorsStatusText(Program.CurrentOperator.Status);
            this.adminToolStripMenuItem.Visible = Program.CurrentOperator.IsAdmin;
            this.changePasswordToolStripMenuItem.Enabled = !Program.CurrentOperator.IsAdmin;
            if (Program.CurrentOperator.IsAdmin)
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
            
            lastCheck.ChatSessionChecks = new MessageCheck[] { };
            lastCheck.NewVisitorLastCheckTime = DateTime.Today.Ticks;

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
                    Program.WS.Logout();
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

        private void displayStatus()
        {
            int VisitorChatResult = 0;
            int Chatting = 0;
            int Visitors = 0;
            foreach (ListViewItem item in lstVisitors.Items)
            {
                Visitor v = item.Tag as Visitor;
                if (v.CurrentSession.Status == VisitSessionStatus.Chatting)
                {
                    VisitorChatResult++;
                }
                if (v.CurrentSession.OperatorId == Program.CurrentOperator.OperatorId && v.CurrentSession.Status == VisitSessionStatus.Chatting)
                {
                    Chatting++;
                }
                if (v.CurrentSession.Status != VisitSessionStatus.Leave)
                {
                    Visitors++;
                }
            }

            lblCurrentVisitors.Text = "��ǰ�ÿ���: " + Visitors;
            lblVisitorOnChat.Text = "�Ի��еķÿ���: " + VisitorChatResult;
            lblMyChat.Text = "�ҵĶԻ���: " + Chatting;
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

        private void restartApp(string args)
        {
            this.Close();
            Process.Start(new ProcessStartInfo(Application.ExecutablePath, args));
            Application.Exit();
        }

        private FormWindowState saveWindowState = FormWindowState.Normal;
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


        private NewChangesCheck lastCheck = new NewChangesCheck();
        TestFixture testFixture = new TestFixture();

        private NewChangesCheckResult getNewChanges(NewChangesCheck check)
        {
            try
            {
                return Program.WS.CheckNewChanges(lastCheck);
            }
            catch (WebException ex)
            {
                if (ex.InnerException != null && ex.InnerException is SocketException && (ex.InnerException as SocketException).ErrorCode == 10061)
                {
                    connectionLost();
                    return null;
                }
                else
                {
                    throw;
                }
            }
        }

        private void connectionLost()
        {
            timer1.Enabled = false;
            loginTimer.Enabled = false;
            MessageBox.Show("��������������жϣ���Ҫ���µ�½��", "�����ж�", MessageBoxButtons.OK, MessageBoxIcon.Error);
            restartApp("-r");
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            NewChangesCheckResult result = getNewChanges(lastCheck);

            if (result == null) return;
            if (result.ReturnCode == ReturnCodeEnum.ReturnCode_SessionInvalid)
            {
                this.timer1.Enabled = false;
                this.loginTimer.Enabled = false;
                MessageBox.Show("���ʺ����������ط���½��", "ϵͳ�ỰʧЧ", MessageBoxButtons.OK);
                restartApp(string.Empty);
                return;
            }
            Trace.WriteLine("NewChangesCheck: " + lastCheck.ToString());
            Trace.WriteLine("NewChangesCheckResult: " + result.ToString());
            //Debug.WriteLine(string.Format("CheckNewChanges: NewVisitor={0} Message={1}",result.NewVisitors.Length,result.Messages.Length ));
            // NewChangesResult result = testFixture.NewResult();

            processOpertors(result);

            processVisitSessionChange(result);

            processNewVisitors(result);

            precessChats(result);

            List<MessageCheck> nextChecks = new List<MessageCheck>();
            foreach (var cf in Program.ChatForms)
            {
                // find messages with ChatId
                LiveSupport.OperatorConsole.LiveChatWS.Message[] ms = null;
                foreach (var item in result.Messages)
                {
                    if (cf.Chat.ChatId == item.ChatId)
                    {
                        ms = item.Messages;
                        break;
                    }
                }

                MessageCheck c = new MessageCheck();
                c.ChatId = cf.Chat.ChatId;
                c.LastCheckTime = cf.LastCheckTime;
                if (ms != null)
                {
                    foreach (var m in ms)
                    {
                        if (m != null && m.SentDate.Ticks >= c.LastCheckTime)
                        {
                            cf.RecieveMessage(m);
                            c.LastCheckTime = Math.Max(m.SentDate.Ticks, c.LastCheckTime);
                        }
                        else
                            continue;

                    }
                    cf.LastCheckTime = c.LastCheckTime;
                }
                nextChecks.Add(c);

            }
            lastCheck.ChatSessionChecks = nextChecks.ToArray();



            //Debug.WriteLine(string.Format("lastCheck={0}, result.CheckTime={1}",lastCheck.Ticks,result.CheckTime.Ticks));
            //lastCheck = result.CheckTime;

            changeVisitorListViewItemColor();

            displayStatus();


        }

        private void precessChats(NewChangesCheckResult result)
        {
            Program.Chats.Clear();
            Program.Chats.AddRange(result.Chats);

            foreach (var item in Program.Chats)
            {

                if (item.Status == ChatStatus.Requested && !item.IsInviteByOperator)
                {
                    Visitor visitor = null;
                    if (Program.Visitors != null)
                    {
                        foreach (var v in Program.Visitors)
                        {
                            if (v.VisitorId == item.VisitorId)
                            {
                                visitor = v;
                                break;
                            }
                        }

                        NotifyForm.ShowNotifier(true, "�ÿ� " + visitor.Name + " ����Ի���", item);

                    }
                }
            }
        }

        private void changeVisitorListViewItemColor()
        {
            foreach (ListViewItem item in lstVisitors.Items)
            {
                if (item == null) continue;
                Visitor v = item.Tag as Visitor;
                if (v.CurrentSession.Status == VisitSessionStatus.Visiting)
                {
                    item.SubItems[0].ForeColor = Color.Green;
                }
                if (v.CurrentSession.Status == VisitSessionStatus.ChatRequesting)
                {
                    item.SubItems[0].ForeColor = Color.Red;
                }
                if (v.CurrentSession.Status == VisitSessionStatus.Chatting)
                {
                    item.SubItems[0].ForeColor = Color.Blue;
                }
                if (v.CurrentSession.Status == VisitSessionStatus.Leave)
                {
                    item.SubItems[0].ForeColor = Color.Gray;
                }
            }
        }

        private void processNewVisitors(NewChangesCheckResult result)
        {
            if (result.NewVisitors != null)
            {
                foreach (var item in result.NewVisitors)
                {
                    if (item == null) continue;
                    bool visitorExist = false;
                    foreach (var v in Program.Visitors)
                    {
                        if (v.VisitorId == item.VisitorId)
                        {
                            visitorExist = true;
                        }
                    }

                    string browser;
                    if (item.CurrentSession.Browser.Contains("MSIE"))
                    {

                        browser = "IE";
                    }
                    else if (item.CurrentSession.Browser.Contains("Firefox"))
                    {
                        browser = "FF";
                    }
                    else
                    {
                        browser = "����";

                    }
                    string status = getVisitSessionStatusText(item.CurrentSession.Status);
                    string leaveTime = item.CurrentSession.LeaveTime.Ticks == 0 ? "" : item.CurrentSession.LeaveTime.ToString();
                    string chatRequestTime = item.CurrentSession.ChatRequestTime.Ticks == 0 ? "" : item.CurrentSession.ChatRequestTime.ToString();
                    string chattingStartTime = item.CurrentSession.ChatingTime.Ticks == 0 ? "" : item.CurrentSession.ChatingTime.ToString();
                    string waitingDuring = item.CurrentSession.WaitingDuring.Ticks == 0 ? "" : item.CurrentSession.WaitingDuring.ToString();
                    string chattingDuring = item.CurrentSession.ChattingDuring.Ticks == 0 ? "" : item.CurrentSession.ChattingDuring.ToString();
                    string visitingTime = item.CurrentSession.VisitingTime.Ticks == 0 ? "" : item.CurrentSession.VisitingTime.ToString();
                    string OperatorId = item.CurrentSession.OperatorId;
                    if (visitorExist)
                    {
                        foreach (ListViewItem vitem in lstVisitors.Items)
                        {
                            Operator optoo = new Operator();
                            if (!string.IsNullOrEmpty(item.CurrentSession.OperatorId) && operators != null)
                            {
                                foreach (Operator op in operators)
                                {
                                    if (op.OperatorId == item.CurrentSession.OperatorId)
                                    {
                                        optoo = op;
                                        break;
                                    }
                                }
                            }
                            Visitor v = vitem.Tag as Visitor;
                            if (v.VisitorId == item.VisitorId)
                            {
                                // TODO: other columns
                                vitem.SubItems[VisitorTreeView_HeaderColumn_ChatRequestTime].Text = chatRequestTime;
                                vitem.SubItems[VisitorTreeView_HeaderColumn_ChatStartTime].Text = chattingStartTime;
                                vitem.SubItems[VisitorTreeView_HeaderColumn_LeaveTime].Text = leaveTime;
                                vitem.SubItems[VisitorTreeView_HeaderColumn_VisitTime].Text = visitingTime;
                                vitem.SubItems[VisitorTreeView_HeaderColumn_Status].Text = status;
                                v.CurrentSession.OperatorId = status != VisitSessionStatus.Chatting.ToString() ? "" : OperatorId;
                                vitem.SubItems[VisitorTreeView_HeaderColumn_Operator].Text = string.IsNullOrEmpty(v.CurrentSession.OperatorId) ? "���޽Ӵ�" : optoo.NickName;
                                break;
                            }
                        }
                    }
                    else
                    {
                        Operator optoo = new Operator();
                        if (!string.IsNullOrEmpty(item.CurrentSession.OperatorId) && operators != null)
                        {
                            foreach (Operator op in operators)
                            {
                                if (op.OperatorId == item.CurrentSession.OperatorId)
                                {
                                    optoo = op;
                                    break;
                                }
                            }
                        }
                        ListViewItem lvi = new ListViewItem(new string[]{ browser,item.Name,item.CurrentSession.Location,
                         item.VisitCount.ToString(),item.CurrentSession.Status!= VisitSessionStatus.Chatting ? "���޽Ӵ�" :optoo.NickName,status,
                         item.CurrentSession.VisitingTime.ToString(), leaveTime, chatRequestTime,
                         chattingStartTime,waitingDuring, chattingDuring,item.CurrentSession.PageRequestCount.ToString()
                        });
                        Program.Visitors.Add(item);
                        item.CurrentSession.OperatorId = item.CurrentSession.Status != VisitSessionStatus.Chatting ? "" : item.CurrentSession.OperatorId;
                        lvi.Tag = item;
                        lstVisitors.Items.Add(lvi);
                    }
                    for (int i = 0; i < lstVisitors.Items.Count; i++)
                    {
                        Visitor v = lstVisitors.Items[i].Tag as Visitor;
                        if (v.CurrentSession.Browser.Contains("MSIE"))
                        {
                            lstVisitors.Items[i].ImageIndex = 1;

                        }
                        if (v.CurrentSession.Browser.Contains("Firefox"))
                        {
                            lstVisitors.Items[i].ImageIndex = 0;

                        }
                    }
                    lastCheck.NewVisitorLastCheckTime = Math.Max(lastCheck.NewVisitorLastCheckTime, item.CurrentSession.VisitingTime.Ticks);

                    if (item.CurrentSession.Status != VisitSessionStatus.Leave)
                    {
                        notifyIcon.ShowBalloonTip(5000, "�µķÿ�", string.Format("�ÿ�{0}���ڷ���ҳ�� \r\n {1}", item.Name, item.CurrentSession.PageRequested), ToolTipIcon.Info);
                    }
                }


                if (isAllowGroup || VisitorChange(result.VisitSessionChange) && lstVisitors.Groups.Count > 0)
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
        }

        private void processVisitSessionChange(NewChangesCheckResult result)
        {
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
                    foreach (Chat item in Program.Chats)
                    {
                      
                    }
                    // �µĶԻ�����
                    //NotifyForm.ShowNotifier(true, "�ÿ� " + v.Name + " ����Ի���", remote);

                }
                else if (remote.Status == VisitSessionStatus.Leave)
                {
                    notifyIcon.ShowBalloonTip(5000, "�ÿ��뿪", string.Format("�ÿ�{0}���뿪��վ", v.Name), ToolTipIcon.Info);
                }
                else if (remote.Status == VisitSessionStatus.Chatting)
                {
                    foreach (var opItem in operators)
                    {
                        if (opItem.OperatorId == remote.OperatorId)
                        {
                            //local.OperatorId = remote.OperatorId;
                            item.SubItems[VisitorTreeView_HeaderColumn_Operator].Text = opItem.NickName;
                            break;
                        }
                    }
                }

                local.Status = remote.Status;
                if (local.Status != VisitSessionStatus.Chatting)
                {
                    v.CurrentSession.OperatorId = "";
                    item.SubItems[VisitorTreeView_HeaderColumn_Operator].Text = "���޽Ӵ�";
                }

                item.SubItems[VisitorTreeView_HeaderColumn_Status].Text = getVisitSessionStatusText(local.Status);

            }
        }

        private void processOpertors(NewChangesCheckResult result)
        {

            if (result.Operators != null)
            {
                if (result.Operators.Length > operators.Count || checkIfOperatorStatusChanges(operators, result.Operators))
                {
                    operators.Clear();
                    operators.AddRange(result.Operators);
                    operatorPannel1.RecieveOperator(operators);

                }
            }
        }

        private bool VisitorChange(VisitSession[] visitSession)
        {
            foreach (ListViewGroup item in lstVisitors.Groups)
            {
                if (item.Tag == null) continue;
                Visitor v = item.Tag as Visitor;
                for (int i = 0; i < visitSession.Length; i++)
                {
                    if (v.CurrentSession.Status != visitSession[i].Status)
                    {

                        return true;

                    }
                }


            }
            return false;


        }
        string getOperatorsStatusText(OperatorStatus os)
        {
            string status;
            switch (os)
            {
                case OperatorStatus.Idle:
                    status = "����";
                    break;
                case OperatorStatus.Away:
                    status = "�뿪";
                    break;
                case OperatorStatus.Chatting:
                    status = "�Ի���";
                    break;
                case OperatorStatus.BeRightBack:
                    status = "һ�����";
                    break;
                case OperatorStatus.Offline:
                    status = "����";
                    break;
                default:
                    status = "����";
                    break;

            }
            return status;

        }

        string getVisitSessionStatusText(VisitSessionStatus s)
        {
            string status;
            switch (s)
            {
                case VisitSessionStatus.Visiting:
                    status = "�����";
                    break;
                case VisitSessionStatus.ChatRequesting:
                    status = "����Ի���";
                    break;
                case VisitSessionStatus.Chatting:
                    status = "�Ի���";
                    break;
                case VisitSessionStatus.Leave:
                    status = "�뿪";
                    break;
                default:
                    status = "�뿪";
                    break;
            }
            return status;
        }


        private bool checkIfOperatorStatusChanges(List<Operator> ops, Operator[] p)
        {
            if (ops == null || p == null)
            {
                return false;

            }
            for (int i = 0; i < p.Length; i++)
            {

                foreach (var item in ops)
                {
                    if (p[i].Status != item.Status && p[i].OperatorId == item.OperatorId)
                    {
                        return true;


                    }
                }
            }
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

        // ���ܷÿ�����
        private void acceptToolStripButton_Click(object sender, EventArgs e)
        {
            if (lstVisitors.SelectedItems.Count == 0)
            {
                return;
            }
            Visitor visitor = lstVisitors.SelectedItems[0].Tag as Visitor;
            //visitor.CurrentSession.IP;

            lstVisitors.FullRowSelect = true;

            if (lstVisitors.SelectedItems.Count > 0)
            {

                if (visitor.CurrentSession.Status == VisitSessionStatus.ChatRequesting)
                {
                    foreach (var item in Program.Chats)
                    {
                        if (item.VisitorId == visitor.VisitorId && item.Status == ChatStatus.Requested)
                        {
                            ChatForm cf = new ChatForm(item);
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

        //��������ÿ�
        private void inviteToolStripButton_Click(object sender, EventArgs e)
        {
            lstVisitors.FullRowSelect = true;
            if (lstVisitors.SelectedItems.Count <= 0 || lstVisitors.SelectedItems[0].Tag == null)
            {
                return;
            }

            Visitor v = lstVisitors.SelectedItems[0].Tag as Visitor;
            if (v != null && v.CurrentSession.Status == VisitSessionStatus.Visiting)
            {

                Chat chat = Program.WS.InviteChat(v.VisitorId);


                if (chat != null)
                {
                    ChatForm cf = null;
                    foreach (var item in Program.ChatForms)
                    {
                        if (item.Chat.VisitorId == chat.VisitorId)
                        {

                            Program.WS.CloseChat(item.Chat.ChatId);
                            cf = item;
                            cf.Chat = chat;
                            break;
                        }
                    }

                    if (cf == null)
                    {
                        cf = new ChatForm(chat, true);
                        Program.ChatForms.Add(cf);
                    }

                    cf.Show();
                }
            }
            else
            {
                MessageBox.Show("�÷ÿ��ѱ������ͷ�������ڶԻ���");

            }
            //else if (Program.WS.InviteChat(v.VisitorId) == -1)
            //{
            //    MessageBox.Show("�÷ÿ��ѱ�����");
            //}
            //else if (Program.WS.InviteChat(v.VisitorId) == -2)
            //{
            //    MessageBox.Show("�ÿ;ܾ�����");
            //}

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

                    PageRequest[] pRequest = Program.WS.GetHistoryPageRequests(v.VisitorId, requestbeginDateTimePicker.Value, requestendDateTimePicker.Value);

                    if (pRequest.Length > 0)
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
                    LiveSupport.OperatorConsole.LiveChatWS.Message[] msg = Program.WS.GetHistoryChatMessage(v.VisitorId, messagebeginDateTimePicker.Value, messageendDateTimePicker.Value);
                    if (msg.Length > 0)
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
    }

}