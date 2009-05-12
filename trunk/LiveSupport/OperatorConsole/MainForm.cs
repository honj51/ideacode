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
     
        private bool hasCheckedChatRequests = false;
        private int numberOfChatWaiting = 0;

        public bool Relogin = false;
        private SoundPlayer player = new SoundPlayer();
     
                
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
          
          
            // Simple authentication
            AuthenticationHeader auth = new AuthenticationHeader();
            auth.userName = Properties.Settings.Default.WSUser;
            ws.AuthenticationHeaderValue = auth;
            initForm(LoginTime);
           

                //drpChatRequest.DisplayMember = "VisitorIP";

            //drpChatRequest.ValueMember = "ChatId";

            playSoundOnChatRequestToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatReq;
            playSoundOnChatMessageToolStripMenuItem.Checked = Properties.Settings.Default.PlaySoundOnChatMsg;
            whenOfflineGetWebsiteRequestsToolStripMenuItem.Checked = Properties.Settings.Default.GetWebRequestOffline;
            autostartToolStripMenuItem.Checked = Properties.Settings.Default.StartWithWindows;
        }
        public void initForm(DateTime LoginTime) 
        {
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
            lblMyChat.Text = "我的对话数: ";
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
         
          
            //Application.Exit();
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
           
            if(MessageBox.Show("您确定要退出，更换其他帐号登录吗？","提示",MessageBoxButtons.YesNo,MessageBoxIcon.Question,MessageBoxDefaultButton.Button1)==DialogResult.Yes)
            {
                //this.Hide();
                //Login lg = new Login();
                //lg.Show();
                Relogin = true;
                notifyIcon.Dispose();
                this.Close();               
                
            }

           // connectToolStripMenuItem.Checked = false;
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
     


        private void MainForm_Load(object sender, EventArgs e)
        {

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
                    NotifyForm.ShowNotifier(true, "访客 " + v.Name + " 请求对话！", remote);


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
               
               // SetGroups(5);
              
            }

        

            foreach (var item in result.Messages)
            {
                foreach (var cf in Program.ChatForms)
                {
                    if (cf.ChatSession.SessionId == item.ChatId)
                    {
                        cf.RecieveMessage(item);
                        break;
                    }
                }
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
            ChangePassword rop = new ChangePassword();
            rop.ShowDialog();
        }

        private void resetpasswordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("此功能暂未开放！！");
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

                    //if (!myChats.ContainsKey(lstVisitors.SelectedItems[0].Index))
                    //{
                    //    myChats.Add(lstVisitors.SelectedItems[0].Index, Program.CurrentOperator.Id);
                        
                    //}
                   //声音
                   player.Stop();
                 
                   ChatForm cf = new ChatForm();
                   Visitor v = lstVisitors.SelectedItems[0].Tag as Visitor;
                   cf.ChatSession = v.CurrentSession;;
                      
                     
                   Program.ChatForms.Add(cf);
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
                    

                    ChatForm cf = new ChatForm();
                    
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