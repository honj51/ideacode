namespace LiveSupport.OperatorConsole
{
    partial class ControlPanel
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ControlPanel));
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.operatorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.connectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.disconnectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cannedMessagesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.presetLinksToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.administrationToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatRequestToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatMessageToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pnlChat = new System.Windows.Forms.Panel();
            this.btnAccept = new System.Windows.Forms.Button();
            this.lblMyChat = new System.Windows.Forms.Label();
            this.lblVisitorOnChat = new System.Windows.Forms.Label();
            this.lblCurrentVisitors = new System.Windows.Forms.Label();
            this.drpChatRequest = new System.Windows.Forms.ComboBox();
            this.lblChatRequest = new System.Windows.Forms.Label();
            this.lstVisitors = new System.Windows.Forms.ListView();
            this.colInChat = new System.Windows.Forms.ColumnHeader();
            this.colReqTime = new System.Windows.Forms.ColumnHeader();
            this.colIP = new System.Windows.Forms.ColumnHeader();
            this.colCurrentPage = new System.Windows.Forms.ColumnHeader();
            this.colBrowser = new System.Windows.Forms.ColumnHeader();
            this.colReferrer = new System.Windows.Forms.ColumnHeader();
            this.colDomain = new System.Windows.Forms.ColumnHeader();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.����Ի�ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.��������ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.imgIconSet = new System.Windows.Forms.ImageList(this.components);
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.button1 = new System.Windows.Forms.Button();
            this.tabChats = new System.Windows.Forms.TabControl();
            this.tmrCheckRequests = new System.Windows.Forms.Timer(this.components);
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.mainMenu.SuspendLayout();
            this.pnlChat.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainMenu
            // 
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.operatorToolStripMenuItem,
            this.toolsToolStripMenuItem,
            this.administrationToolStripMenuItem,
            this.helpToolStripMenuItem});
            this.mainMenu.Location = new System.Drawing.Point(0, 0);
            this.mainMenu.Name = "mainMenu";
            this.mainMenu.Size = new System.Drawing.Size(980, 24);
            this.mainMenu.TabIndex = 0;
            this.mainMenu.Text = "menuStrip1";
            // 
            // operatorToolStripMenuItem
            // 
            this.operatorToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.connectToolStripMenuItem,
            this.disconnectToolStripMenuItem,
            this.toolStripMenuItem1,
            this.exitToolStripMenuItem});
            this.operatorToolStripMenuItem.Name = "operatorToolStripMenuItem";
            this.operatorToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.operatorToolStripMenuItem.Text = "��ϯ(&F)";
            // 
            // connectToolStripMenuItem
            // 
            this.connectToolStripMenuItem.Checked = true;
            this.connectToolStripMenuItem.CheckState = System.Windows.Forms.CheckState.Checked;
            this.connectToolStripMenuItem.Name = "connectToolStripMenuItem";
            this.connectToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F11;
            this.connectToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.connectToolStripMenuItem.Text = "����(&C)";
            this.connectToolStripMenuItem.Click += new System.EventHandler(this.connectToolStripMenuItem_Click);
            // 
            // disconnectToolStripMenuItem
            // 
            this.disconnectToolStripMenuItem.Name = "disconnectToolStripMenuItem";
            this.disconnectToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F12;
            this.disconnectToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.disconnectToolStripMenuItem.Text = "�Ͽ�(&D)";
            this.disconnectToolStripMenuItem.Click += new System.EventHandler(this.disconnectToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(150, 6);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.ShortcutKeyDisplayString = "";
            this.exitToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F4)));
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.exitToolStripMenuItem.Text = "�˳�(&E)";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // toolsToolStripMenuItem
            // 
            this.toolsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cannedMessagesToolStripMenuItem,
            this.presetLinksToolStripMenuItem});
            this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
            this.toolsToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.toolsToolStripMenuItem.Text = "����(&T)";
            // 
            // cannedMessagesToolStripMenuItem
            // 
            this.cannedMessagesToolStripMenuItem.Name = "cannedMessagesToolStripMenuItem";
            this.cannedMessagesToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.cannedMessagesToolStripMenuItem.Text = "������Ϣ(&C)";
            this.cannedMessagesToolStripMenuItem.Click += new System.EventHandler(this.cannedMessagesToolStripMenuItem_Click);
            // 
            // presetLinksToolStripMenuItem
            // 
            this.presetLinksToolStripMenuItem.Name = "presetLinksToolStripMenuItem";
            this.presetLinksToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.presetLinksToolStripMenuItem.Text = "Ԥ������(&P)";
            this.presetLinksToolStripMenuItem.Click += new System.EventHandler(this.presetLinksToolStripMenuItem_Click);
            // 
            // administrationToolStripMenuItem
            // 
            this.administrationToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.playSoundOnChatRequestToolStripMenuItem,
            this.playSoundOnChatMessageToolStripMenuItem,
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem});
            this.administrationToolStripMenuItem.Name = "administrationToolStripMenuItem";
            this.administrationToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.administrationToolStripMenuItem.Text = "ѡ��(&O)";
            // 
            // playSoundOnChatRequestToolStripMenuItem
            // 
            this.playSoundOnChatRequestToolStripMenuItem.Checked = true;
            this.playSoundOnChatRequestToolStripMenuItem.CheckState = System.Windows.Forms.CheckState.Checked;
            this.playSoundOnChatRequestToolStripMenuItem.Name = "playSoundOnChatRequestToolStripMenuItem";
            this.playSoundOnChatRequestToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.playSoundOnChatRequestToolStripMenuItem.Text = "�Ի�����ʱ��������";
            this.playSoundOnChatRequestToolStripMenuItem.Click += new System.EventHandler(this.playSoundOnChatRequestToolStripMenuItem_Click);
            // 
            // playSoundOnChatMessageToolStripMenuItem
            // 
            this.playSoundOnChatMessageToolStripMenuItem.Name = "playSoundOnChatMessageToolStripMenuItem";
            this.playSoundOnChatMessageToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.playSoundOnChatMessageToolStripMenuItem.Text = "����Ϣʱ��������";
            this.playSoundOnChatMessageToolStripMenuItem.Click += new System.EventHandler(this.playSoundOnChatMessageToolStripMenuItem_Click);
            // 
            // whenOfflineGetWebsiteRequestsToolStripMenuItem
            // 
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Name = "whenOfflineGetWebsiteRequestsToolStripMenuItem";
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Text = "����ʱ�Ի�ȡ��վ���ʼ�¼";
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Click += new System.EventHandler(this.whenOfflineGetWebsiteRequestsToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.helpToolStripMenuItem.Text = "����(&H)";
            // 
            // pnlChat
            // 
            this.pnlChat.BackColor = System.Drawing.SystemColors.ControlDark;
            this.pnlChat.Controls.Add(this.btnAccept);
            this.pnlChat.Controls.Add(this.lblMyChat);
            this.pnlChat.Controls.Add(this.lblVisitorOnChat);
            this.pnlChat.Controls.Add(this.lblCurrentVisitors);
            this.pnlChat.Controls.Add(this.drpChatRequest);
            this.pnlChat.Controls.Add(this.lblChatRequest);
            this.pnlChat.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlChat.Location = new System.Drawing.Point(0, 24);
            this.pnlChat.Name = "pnlChat";
            this.pnlChat.Size = new System.Drawing.Size(980, 30);
            this.pnlChat.TabIndex = 1;
            // 
            // btnAccept
            // 
            this.btnAccept.Location = new System.Drawing.Point(241, 5);
            this.btnAccept.Name = "btnAccept";
            this.btnAccept.Size = new System.Drawing.Size(111, 21);
            this.btnAccept.TabIndex = 5;
            this.btnAccept.Text = "��������";
            this.btnAccept.UseVisualStyleBackColor = true;
            this.btnAccept.Click += new System.EventHandler(this.btnAccept_Click);
            // 
            // lblMyChat
            // 
            this.lblMyChat.AutoSize = true;
            this.lblMyChat.Location = new System.Drawing.Point(787, 9);
            this.lblMyChat.Name = "lblMyChat";
            this.lblMyChat.Size = new System.Drawing.Size(83, 12);
            this.lblMyChat.TabIndex = 4;
            this.lblMyChat.Text = "�ҵĶԻ���: 2";
            // 
            // lblVisitorOnChat
            // 
            this.lblVisitorOnChat.AutoSize = true;
            this.lblVisitorOnChat.Location = new System.Drawing.Point(605, 9);
            this.lblVisitorOnChat.Name = "lblVisitorOnChat";
            this.lblVisitorOnChat.Size = new System.Drawing.Size(107, 12);
            this.lblVisitorOnChat.TabIndex = 3;
            this.lblVisitorOnChat.Text = "�Ի��еķÿ���: 3";
            // 
            // lblCurrentVisitors
            // 
            this.lblCurrentVisitors.AutoSize = true;
            this.lblCurrentVisitors.Location = new System.Drawing.Point(477, 9);
            this.lblCurrentVisitors.Name = "lblCurrentVisitors";
            this.lblCurrentVisitors.Size = new System.Drawing.Size(89, 12);
            this.lblCurrentVisitors.TabIndex = 2;
            this.lblCurrentVisitors.Text = "��ǰ�ÿ���: 39";
            // 
            // drpChatRequest
            // 
            this.drpChatRequest.FormattingEnabled = true;
            this.drpChatRequest.Location = new System.Drawing.Point(95, 6);
            this.drpChatRequest.Name = "drpChatRequest";
            this.drpChatRequest.Size = new System.Drawing.Size(140, 20);
            this.drpChatRequest.TabIndex = 1;
            this.drpChatRequest.Text = " ";
            // 
            // lblChatRequest
            // 
            this.lblChatRequest.AutoSize = true;
            this.lblChatRequest.Location = new System.Drawing.Point(12, 9);
            this.lblChatRequest.Name = "lblChatRequest";
            this.lblChatRequest.Size = new System.Drawing.Size(53, 12);
            this.lblChatRequest.TabIndex = 0;
            this.lblChatRequest.Text = "�Ի�����";
            // 
            // lstVisitors
            // 
            this.lstVisitors.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colInChat,
            this.colReqTime,
            this.colIP,
            this.colCurrentPage,
            this.colBrowser,
            this.colReferrer,
            this.colDomain});
            this.lstVisitors.ContextMenuStrip = this.contextMenuStrip1;
            this.lstVisitors.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstVisitors.FullRowSelect = true;
            this.lstVisitors.GridLines = true;
            this.lstVisitors.Location = new System.Drawing.Point(0, 54);
            this.lstVisitors.MultiSelect = false;
            this.lstVisitors.Name = "lstVisitors";
            this.lstVisitors.Size = new System.Drawing.Size(980, 635);
            this.lstVisitors.SmallImageList = this.imgIconSet;
            this.lstVisitors.TabIndex = 2;
            this.lstVisitors.UseCompatibleStateImageBehavior = false;
            this.lstVisitors.View = System.Windows.Forms.View.Details;
            // 
            // colInChat
            // 
            this.colInChat.Text = "�Ի���";
            this.colInChat.Width = 53;
            // 
            // colReqTime
            // 
            this.colReqTime.Text = "����ʱ��";
            this.colReqTime.Width = 70;
            // 
            // colIP
            // 
            this.colIP.Text = "IP ��ַ";
            this.colIP.Width = 105;
            // 
            // colCurrentPage
            // 
            this.colCurrentPage.Text = "��ǰҳ��";
            this.colCurrentPage.Width = 177;
            // 
            // colBrowser
            // 
            this.colBrowser.Text = "�����";
            this.colBrowser.Width = 56;
            // 
            // colReferrer
            // 
            this.colReferrer.Text = "����ҳ";
            this.colReferrer.Width = 226;
            // 
            // colDomain
            // 
            this.colDomain.Text = "����";
            this.colDomain.Width = 115;
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.����Ի�ToolStripMenuItem,
            this.��������ToolStripMenuItem});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(153, 70);
            // 
            // ����Ի�ToolStripMenuItem
            // 
            this.����Ի�ToolStripMenuItem.Name = "����Ի�ToolStripMenuItem";
            this.����Ի�ToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.����Ի�ToolStripMenuItem.Text = "����Ի�";
            this.����Ի�ToolStripMenuItem.Click += new System.EventHandler(this.����Ի�ToolStripMenuItem_Click);
            // 
            // ��������ToolStripMenuItem
            // 
            this.��������ToolStripMenuItem.Name = "��������ToolStripMenuItem";
            this.��������ToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.��������ToolStripMenuItem.Text = "��������";
            this.��������ToolStripMenuItem.Click += new System.EventHandler(this.��������ToolStripMenuItem_Click);
            // 
            // imgIconSet
            // 
            this.imgIconSet.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imgIconSet.ImageStream")));
            this.imgIconSet.TransparentColor = System.Drawing.Color.Transparent;
            this.imgIconSet.Images.SetKeyName(0, "ff.jpg");
            this.imgIconSet.Images.SetKeyName(1, "ie.jpg");
            this.imgIconSet.Images.SetKeyName(2, "chat.jpg");
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.splitContainer1.Location = new System.Drawing.Point(0, 405);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.button1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.tabChats);
            this.splitContainer1.Size = new System.Drawing.Size(980, 284);
            this.splitContainer1.SplitterDistance = 326;
            this.splitContainer1.TabIndex = 3;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(14, 39);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(115, 41);
            this.button1.TabIndex = 0;
            this.button1.Text = "��������ļ�";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tabChats
            // 
            this.tabChats.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabChats.Location = new System.Drawing.Point(0, 0);
            this.tabChats.Name = "tabChats";
            this.tabChats.SelectedIndex = 0;
            this.tabChats.Size = new System.Drawing.Size(650, 284);
            this.tabChats.TabIndex = 0;
            this.tabChats.SelectedIndexChanged += new System.EventHandler(this.tabChats_SelectedIndexChanged);
            // 
            // tmrCheckRequests
            // 
            this.tmrCheckRequests.Enabled = true;
            this.tmrCheckRequests.Interval = 3500;
            this.tmrCheckRequests.Tick += new System.EventHandler(this.tmrCheckRequests_Tick);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            this.openFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog1_FileOk);
            // 
            // ControlPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(980, 689);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.lstVisitors);
            this.Controls.Add(this.pnlChat);
            this.Controls.Add(this.mainMenu);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.mainMenu;
            this.Name = "ControlPanel";
            this.Text = "LiveSupport Operator";
            this.Load += new System.EventHandler(this.ControlPanel_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ControlPanel_FormClosing);
            this.mainMenu.ResumeLayout(false);
            this.mainMenu.PerformLayout();
            this.pnlChat.ResumeLayout(false);
            this.pnlChat.PerformLayout();
            this.contextMenuStrip1.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip mainMenu;
        private System.Windows.Forms.ToolStripMenuItem operatorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem administrationToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.Panel pnlChat;
        private System.Windows.Forms.Label lblMyChat;
        private System.Windows.Forms.Label lblVisitorOnChat;
        private System.Windows.Forms.Label lblCurrentVisitors;
        private System.Windows.Forms.ComboBox drpChatRequest;
        private System.Windows.Forms.Label lblChatRequest;
        private System.Windows.Forms.ListView lstVisitors;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.ColumnHeader colReqTime;
        private System.Windows.Forms.ColumnHeader colIP;
        private System.Windows.Forms.ColumnHeader colCurrentPage;
        private System.Windows.Forms.ColumnHeader colBrowser;
        private System.Windows.Forms.ColumnHeader colReferrer;
        private System.Windows.Forms.ColumnHeader colDomain;
        private System.Windows.Forms.ToolStripMenuItem connectToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem disconnectToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cannedMessagesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem presetLinksToolStripMenuItem;
        private System.Windows.Forms.Timer tmrCheckRequests;
        private System.Windows.Forms.ColumnHeader colInChat;
        private System.Windows.Forms.ImageList imgIconSet;
        private System.Windows.Forms.Button btnAccept;
        private System.Windows.Forms.TabControl tabChats;
        private System.Windows.Forms.ToolStripMenuItem playSoundOnChatRequestToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem playSoundOnChatMessageToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem whenOfflineGetWebsiteRequestsToolStripMenuItem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem ����Ի�ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ��������ToolStripMenuItem;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}