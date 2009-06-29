namespace LiveSupport.OperatorConsole
{
    partial class MainForm
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
            System.Windows.Forms.Label visitorIdLabel;
            System.Windows.Forms.Label visitCountLabel;
            System.Windows.Forms.Label reMarkLabel;
            System.Windows.Forms.Label nameLabel;
            System.Windows.Forms.Label emailLabel;
            System.Windows.Forms.Label visitingTimeLabel;
            System.Windows.Forms.Label referrerLabel;
            System.Windows.Forms.Label pageRequestedLabel;
            System.Windows.Forms.Label pageRequestCountLabel;
            System.Windows.Forms.Label locationLabel;
            System.Windows.Forms.Label leaveTimeLabel;
            System.Windows.Forms.Label iPLabel;
            System.Windows.Forms.Label domainRequestedLabel;
            System.Windows.Forms.Label browserLabel;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("在线客服");
            System.Windows.Forms.TreeNode treeNode2 = new System.Windows.Forms.TreeNode("离线客服");
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.operatorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.changeOperatorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.changePasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.客服栏OToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.访客信息栏VToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.administrationToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatRequestToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatMessageToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.autoLoginToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.autostartToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.adminToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.createToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.resetpasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.settalkToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.paymentToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.touchToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.handBookToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pnlChat = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.lblVisitorOnChat = new System.Windows.Forms.Label();
            this.lblCurrentVisitors = new System.Windows.Forms.Label();
            this.lblMyChat = new System.Windows.Forms.Label();
            this.lstVisitors = new System.Windows.Forms.ListView();
            this.colBrowser1 = new System.Windows.Forms.ColumnHeader();
            this.colName = new System.Windows.Forms.ColumnHeader();
            this.colLocation = new System.Windows.Forms.ColumnHeader();
            this.colVisitCount = new System.Windows.Forms.ColumnHeader();
            this.colOperator = new System.Windows.Forms.ColumnHeader();
            this.colStatus = new System.Windows.Forms.ColumnHeader();
            this.colVisitingTime = new System.Windows.Forms.ColumnHeader();
            this.colLeaveTime = new System.Windows.Forms.ColumnHeader();
            this.colRequestTime = new System.Windows.Forms.ColumnHeader();
            this.colChatingTime = new System.Windows.Forms.ColumnHeader();
            this.colWaitingDuring = new System.Windows.Forms.ColumnHeader();
            this.colChattingDuring = new System.Windows.Forms.ColumnHeader();
            this.colPageRequestCount = new System.Windows.Forms.ColumnHeader();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.inviteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.acceptToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.imgIconSet = new System.Windows.Forms.ImageList(this.components);
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.mainSplitContainer = new System.Windows.Forms.SplitContainer();
            this.visitorSessionSplitContainer = new System.Windows.Forms.SplitContainer();
            this.panel1 = new System.Windows.Forms.Panel();
            this.operatorPannel1 = new LiveSupport.OperatorConsole.OperatorPannel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.tabChats = new System.Windows.Forms.TabControl();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.browserTextBox = new System.Windows.Forms.TextBox();
            this.visitorBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.domainRequestedTextBox = new System.Windows.Forms.TextBox();
            this.iPTextBox = new System.Windows.Forms.TextBox();
            this.locationTextBox = new System.Windows.Forms.TextBox();
            this.pageRequestCountTextBox = new System.Windows.Forms.TextBox();
            this.pageRequestedTextBox = new System.Windows.Forms.TextBox();
            this.referrerTextBox = new System.Windows.Forms.TextBox();
            this.emailTextBox = new System.Windows.Forms.TextBox();
            this.nameTextBox = new System.Windows.Forms.TextBox();
            this.reMarkTextBox = new System.Windows.Forms.TextBox();
            this.visitCountTextBox = new System.Windows.Forms.TextBox();
            this.visitorIdTextBox = new System.Windows.Forms.TextBox();
            this.leaveTimeDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.visitingTimeDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.panelMessage = new System.Windows.Forms.Panel();
            this.messageendDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.messagebeginDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.btnSearchHistoryChatMsg = new System.Windows.Forms.Button();
            this.lblMessageEndTime = new System.Windows.Forms.Label();
            this.lblMessageBeginTime = new System.Windows.Forms.Label();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.requestendDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.requestbeginDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.btnSearchHistoryPageRequests = new System.Windows.Forms.Button();
            this.lblREndTime = new System.Windows.Forms.Label();
            this.lblRBeginTime = new System.Windows.Forms.Label();
            this.lstPageRequest = new System.Windows.Forms.ListView();
            this.colPage = new System.Windows.Forms.ColumnHeader();
            this.colRTime = new System.Windows.Forms.ColumnHeader();
            this.colReferrer = new System.Windows.Forms.ColumnHeader();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.notifyIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.notifyIconContextMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.idleToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.chattingToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.beRightBackToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.offlineToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.changeAccountToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
            this.inviteToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator6 = new System.Windows.Forms.ToolStripSeparator();
            this.acceptToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.operatorToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.powerToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.stateToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.stickToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.loginTimer = new System.Windows.Forms.Timer(this.components);
            visitorIdLabel = new System.Windows.Forms.Label();
            visitCountLabel = new System.Windows.Forms.Label();
            reMarkLabel = new System.Windows.Forms.Label();
            nameLabel = new System.Windows.Forms.Label();
            emailLabel = new System.Windows.Forms.Label();
            visitingTimeLabel = new System.Windows.Forms.Label();
            referrerLabel = new System.Windows.Forms.Label();
            pageRequestedLabel = new System.Windows.Forms.Label();
            pageRequestCountLabel = new System.Windows.Forms.Label();
            locationLabel = new System.Windows.Forms.Label();
            leaveTimeLabel = new System.Windows.Forms.Label();
            iPLabel = new System.Windows.Forms.Label();
            domainRequestedLabel = new System.Windows.Forms.Label();
            browserLabel = new System.Windows.Forms.Label();
            this.mainMenu.SuspendLayout();
            this.pnlChat.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.mainSplitContainer.Panel1.SuspendLayout();
            this.mainSplitContainer.Panel2.SuspendLayout();
            this.mainSplitContainer.SuspendLayout();
            this.visitorSessionSplitContainer.Panel1.SuspendLayout();
            this.visitorSessionSplitContainer.Panel2.SuspendLayout();
            this.visitorSessionSplitContainer.SuspendLayout();
            this.panel1.SuspendLayout();
            this.tabChats.SuspendLayout();
            this.tabPage5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.visitorBindingSource)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.panel2.SuspendLayout();
            this.notifyIconContextMenuStrip.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // visitorIdLabel
            // 
            visitorIdLabel.AutoSize = true;
            visitorIdLabel.Location = new System.Drawing.Point(21, 9);
            visitorIdLabel.Name = "visitorIdLabel";
            visitorIdLabel.Size = new System.Drawing.Size(47, 12);
            visitorIdLabel.TabIndex = 14;
            visitorIdLabel.Text = "访客ID:";
            // 
            // visitCountLabel
            // 
            visitCountLabel.AutoSize = true;
            visitCountLabel.Location = new System.Drawing.Point(21, 112);
            visitCountLabel.Name = "visitCountLabel";
            visitCountLabel.Size = new System.Drawing.Size(59, 12);
            visitCountLabel.TabIndex = 12;
            visitCountLabel.Text = "访问次数:";
            // 
            // reMarkLabel
            // 
            reMarkLabel.AutoSize = true;
            reMarkLabel.Location = new System.Drawing.Point(21, 85);
            reMarkLabel.Name = "reMarkLabel";
            reMarkLabel.Size = new System.Drawing.Size(35, 12);
            reMarkLabel.TabIndex = 10;
            reMarkLabel.Text = "备注:";
            // 
            // nameLabel
            // 
            nameLabel.AutoSize = true;
            nameLabel.Location = new System.Drawing.Point(21, 58);
            nameLabel.Name = "nameLabel";
            nameLabel.Size = new System.Drawing.Size(59, 12);
            nameLabel.TabIndex = 8;
            nameLabel.Text = "访客名称:";
            // 
            // emailLabel
            // 
            emailLabel.AutoSize = true;
            emailLabel.Location = new System.Drawing.Point(21, 35);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new System.Drawing.Size(59, 12);
            emailLabel.TabIndex = 4;
            emailLabel.Text = "电子邮件:";
            // 
            // visitingTimeLabel
            // 
            visitingTimeLabel.AutoSize = true;
            visitingTimeLabel.Location = new System.Drawing.Point(21, 387);
            visitingTimeLabel.Name = "visitingTimeLabel";
            visitingTimeLabel.Size = new System.Drawing.Size(83, 12);
            visitingTimeLabel.TabIndex = 44;
            visitingTimeLabel.Text = "页面访问时间:";
            // 
            // referrerLabel
            // 
            referrerLabel.AutoSize = true;
            referrerLabel.Location = new System.Drawing.Point(21, 330);
            referrerLabel.Name = "referrerLabel";
            referrerLabel.Size = new System.Drawing.Size(59, 12);
            referrerLabel.TabIndex = 38;
            referrerLabel.Text = "引用页面:";
            // 
            // pageRequestedLabel
            // 
            pageRequestedLabel.AutoSize = true;
            pageRequestedLabel.Location = new System.Drawing.Point(21, 297);
            pageRequestedLabel.Name = "pageRequestedLabel";
            pageRequestedLabel.Size = new System.Drawing.Size(59, 12);
            pageRequestedLabel.TabIndex = 36;
            pageRequestedLabel.Text = "请求页面:";
            // 
            // pageRequestCountLabel
            // 
            pageRequestCountLabel.AutoSize = true;
            pageRequestCountLabel.Location = new System.Drawing.Point(21, 264);
            pageRequestCountLabel.Name = "pageRequestCountLabel";
            pageRequestCountLabel.Size = new System.Drawing.Size(71, 12);
            pageRequestCountLabel.TabIndex = 34;
            pageRequestCountLabel.Text = "浏览页面数:";
            // 
            // locationLabel
            // 
            locationLabel.AutoSize = true;
            locationLabel.Location = new System.Drawing.Point(21, 233);
            locationLabel.Name = "locationLabel";
            locationLabel.Size = new System.Drawing.Size(59, 12);
            locationLabel.TabIndex = 30;
            locationLabel.Text = "地理位置:";
            // 
            // leaveTimeLabel
            // 
            leaveTimeLabel.AutoSize = true;
            leaveTimeLabel.Location = new System.Drawing.Point(21, 200);
            leaveTimeLabel.Name = "leaveTimeLabel";
            leaveTimeLabel.Size = new System.Drawing.Size(59, 12);
            leaveTimeLabel.TabIndex = 28;
            leaveTimeLabel.Text = "离开时间:";
            // 
            // iPLabel
            // 
            iPLabel.AutoSize = true;
            iPLabel.Location = new System.Drawing.Point(21, 172);
            iPLabel.Name = "iPLabel";
            iPLabel.Size = new System.Drawing.Size(23, 12);
            iPLabel.TabIndex = 26;
            iPLabel.Text = "IP:";
            // 
            // domainRequestedLabel
            // 
            domainRequestedLabel.AutoSize = true;
            domainRequestedLabel.Location = new System.Drawing.Point(21, 354);
            domainRequestedLabel.Name = "domainRequestedLabel";
            domainRequestedLabel.Size = new System.Drawing.Size(59, 12);
            domainRequestedLabel.TabIndex = 24;
            domainRequestedLabel.Text = "请求域名:";
            // 
            // browserLabel
            // 
            browserLabel.AutoSize = true;
            browserLabel.Location = new System.Drawing.Point(21, 139);
            browserLabel.Name = "browserLabel";
            browserLabel.Size = new System.Drawing.Size(47, 12);
            browserLabel.TabIndex = 16;
            browserLabel.Text = "浏览器:";
            // 
            // mainMenu
            // 
            this.mainMenu.BackColor = System.Drawing.Color.Transparent;
            this.mainMenu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.operatorToolStripMenuItem,
            this.toolsToolStripMenuItem,
            this.administrationToolStripMenuItem,
            this.adminToolStripMenuItem,
            this.helpToolStripMenuItem});
            this.mainMenu.Location = new System.Drawing.Point(0, 0);
            this.mainMenu.Name = "mainMenu";
            this.mainMenu.Size = new System.Drawing.Size(958, 24);
            this.mainMenu.TabIndex = 0;
            this.mainMenu.Text = "menuStrip1";
            // 
            // operatorToolStripMenuItem
            // 
            this.operatorToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.changeOperatorToolStripMenuItem,
            this.toolStripMenuItem1,
            this.changePasswordToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.operatorToolStripMenuItem.Name = "operatorToolStripMenuItem";
            this.operatorToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.operatorToolStripMenuItem.Text = "操作(&F)";
            // 
            // changeOperatorToolStripMenuItem
            // 
            this.changeOperatorToolStripMenuItem.Name = "changeOperatorToolStripMenuItem";
            this.changeOperatorToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F11;
            this.changeOperatorToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.changeOperatorToolStripMenuItem.Text = "更改账户(&C)";
            this.changeOperatorToolStripMenuItem.Click += new System.EventHandler(this.changeOperatorToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(156, 6);
            // 
            // changePasswordToolStripMenuItem
            // 
            this.changePasswordToolStripMenuItem.Name = "changePasswordToolStripMenuItem";
            this.changePasswordToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.changePasswordToolStripMenuItem.Text = "修改密码(&P)";
            this.changePasswordToolStripMenuItem.Click += new System.EventHandler(this.changePasswordToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.ShortcutKeyDisplayString = "";
            this.exitToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F4)));
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.exitToolStripMenuItem.Text = "退出(&E)";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // toolsToolStripMenuItem
            // 
            this.toolsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.客服栏OToolStripMenuItem,
            this.访客信息栏VToolStripMenuItem});
            this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
            this.toolsToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.toolsToolStripMenuItem.Text = "视图(&V)";
            this.toolsToolStripMenuItem.Visible = false;
            // 
            // 客服栏OToolStripMenuItem
            // 
            this.客服栏OToolStripMenuItem.Name = "客服栏OToolStripMenuItem";
            this.客服栏OToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.客服栏OToolStripMenuItem.Text = "客服栏(&O)";
            this.客服栏OToolStripMenuItem.Visible = false;
            // 
            // 访客信息栏VToolStripMenuItem
            // 
            this.访客信息栏VToolStripMenuItem.Name = "访客信息栏VToolStripMenuItem";
            this.访客信息栏VToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.访客信息栏VToolStripMenuItem.Text = "访客信息栏(&V)";
            this.访客信息栏VToolStripMenuItem.Visible = false;
            // 
            // administrationToolStripMenuItem
            // 
            this.administrationToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.playSoundOnChatRequestToolStripMenuItem,
            this.playSoundOnChatMessageToolStripMenuItem,
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem,
            this.autoLoginToolStripMenuItem,
            this.toolStripSeparator1,
            this.autostartToolStripMenuItem});
            this.administrationToolStripMenuItem.Name = "administrationToolStripMenuItem";
            this.administrationToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.administrationToolStripMenuItem.Text = "选项(&O)";
            // 
            // playSoundOnChatRequestToolStripMenuItem
            // 
            this.playSoundOnChatRequestToolStripMenuItem.Checked = true;
            this.playSoundOnChatRequestToolStripMenuItem.CheckOnClick = true;
            this.playSoundOnChatRequestToolStripMenuItem.CheckState = System.Windows.Forms.CheckState.Checked;
            this.playSoundOnChatRequestToolStripMenuItem.Name = "playSoundOnChatRequestToolStripMenuItem";
            this.playSoundOnChatRequestToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.playSoundOnChatRequestToolStripMenuItem.Text = "对话请求时播放声音";
            this.playSoundOnChatRequestToolStripMenuItem.Click += new System.EventHandler(this.optionsToolStripMenuItem_Click);
            // 
            // playSoundOnChatMessageToolStripMenuItem
            // 
            this.playSoundOnChatMessageToolStripMenuItem.CheckOnClick = true;
            this.playSoundOnChatMessageToolStripMenuItem.Name = "playSoundOnChatMessageToolStripMenuItem";
            this.playSoundOnChatMessageToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.playSoundOnChatMessageToolStripMenuItem.Text = "新消息时播放声音";
            this.playSoundOnChatMessageToolStripMenuItem.Click += new System.EventHandler(this.optionsToolStripMenuItem_Click);
            // 
            // whenOfflineGetWebsiteRequestsToolStripMenuItem
            // 
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.CheckOnClick = true;
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Name = "whenOfflineGetWebsiteRequestsToolStripMenuItem";
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Text = "离线时仍获取网站访问记录";
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Click += new System.EventHandler(this.optionsToolStripMenuItem_Click);
            // 
            // autoLoginToolStripMenuItem
            // 
            this.autoLoginToolStripMenuItem.CheckOnClick = true;
            this.autoLoginToolStripMenuItem.Name = "autoLoginToolStripMenuItem";
            this.autoLoginToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.autoLoginToolStripMenuItem.Text = "自动登录";
            this.autoLoginToolStripMenuItem.Click += new System.EventHandler(this.optionsToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(211, 6);
            // 
            // autostartToolStripMenuItem
            // 
            this.autostartToolStripMenuItem.CheckOnClick = true;
            this.autostartToolStripMenuItem.Name = "autostartToolStripMenuItem";
            this.autostartToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.autostartToolStripMenuItem.Text = "开机自动运行";
            this.autostartToolStripMenuItem.Click += new System.EventHandler(this.autostartToolStripMenuItem_Click);
            // 
            // adminToolStripMenuItem
            // 
            this.adminToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.createToolStripMenuItem,
            this.resetpasswordToolStripMenuItem,
            this.settalkToolStripMenuItem});
            this.adminToolStripMenuItem.Name = "adminToolStripMenuItem";
            this.adminToolStripMenuItem.Size = new System.Drawing.Size(71, 20);
            this.adminToolStripMenuItem.Text = "管理员(&A)";
            // 
            // createToolStripMenuItem
            // 
            this.createToolStripMenuItem.Name = "createToolStripMenuItem";
            this.createToolStripMenuItem.Size = new System.Drawing.Size(160, 22);
            this.createToolStripMenuItem.Text = "创建交流按钮(&C)";
            this.createToolStripMenuItem.Visible = false;
            // 
            // resetpasswordToolStripMenuItem
            // 
            this.resetpasswordToolStripMenuItem.Name = "resetpasswordToolStripMenuItem";
            this.resetpasswordToolStripMenuItem.Size = new System.Drawing.Size(160, 22);
            this.resetpasswordToolStripMenuItem.Text = "重置座席密码(&R)";
            this.resetpasswordToolStripMenuItem.Click += new System.EventHandler(this.resetpasswordToolStripMenuItem_Click);
            // 
            // settalkToolStripMenuItem
            // 
            this.settalkToolStripMenuItem.Name = "settalkToolStripMenuItem";
            this.settalkToolStripMenuItem.Size = new System.Drawing.Size(160, 22);
            this.settalkToolStripMenuItem.Text = "设置快速回复";
            this.settalkToolStripMenuItem.Click += new System.EventHandler(this.settalkToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.paymentToolStripMenuItem,
            this.touchToolStripMenuItem,
            this.handBookToolStripMenuItem,
            this.aboutToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.helpToolStripMenuItem.Text = "帮助(&H)";
            // 
            // paymentToolStripMenuItem
            // 
            this.paymentToolStripMenuItem.Name = "paymentToolStripMenuItem";
            this.paymentToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.paymentToolStripMenuItem.Text = "购买服务(&B)";
            this.paymentToolStripMenuItem.Visible = false;
            this.paymentToolStripMenuItem.Click += new System.EventHandler(this.paymentToolStripMenuItem_Click);
            // 
            // touchToolStripMenuItem
            // 
            this.touchToolStripMenuItem.Name = "touchToolStripMenuItem";
            this.touchToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.touchToolStripMenuItem.Text = "联系我们(&U)";
            this.touchToolStripMenuItem.Visible = false;
            this.touchToolStripMenuItem.Click += new System.EventHandler(this.touchToolStripMenuItem_Click);
            // 
            // handBookToolStripMenuItem
            // 
            this.handBookToolStripMenuItem.Name = "handBookToolStripMenuItem";
            this.handBookToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.handBookToolStripMenuItem.Text = "软件手册(&M)";
            this.handBookToolStripMenuItem.Visible = false;
            this.handBookToolStripMenuItem.Click += new System.EventHandler(this.handBookToolStripMenuItem_Click);
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.aboutToolStripMenuItem.Text = "关于座席客户端(&A)";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // pnlChat
            // 
            this.pnlChat.BackColor = System.Drawing.Color.Transparent;
            this.pnlChat.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnlChat.Controls.Add(this.button1);
            this.pnlChat.Controls.Add(this.label1);
            this.pnlChat.Controls.Add(this.textBox1);
            this.pnlChat.Controls.Add(this.label2);
            this.pnlChat.Controls.Add(this.comboBox1);
            this.pnlChat.Controls.Add(this.lblVisitorOnChat);
            this.pnlChat.Controls.Add(this.lblCurrentVisitors);
            this.pnlChat.Controls.Add(this.lblMyChat);
            this.pnlChat.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlChat.Location = new System.Drawing.Point(0, 49);
            this.pnlChat.Name = "pnlChat";
            this.pnlChat.Size = new System.Drawing.Size(958, 27);
            this.pnlChat.TabIndex = 1;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(813, 0);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(52, 23);
            this.button1.TabIndex = 10;
            this.button1.Text = "重置";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Visible = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(365, 7);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 12);
            this.label1.TabIndex = 9;
            this.label1.Text = "搜索访客:";
            this.label1.Visible = false;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(638, 3);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(156, 21);
            this.textBox1.TabIndex = 8;
            this.textBox1.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(564, 7);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 12);
            this.label2.TabIndex = 7;
            this.label2.Text = "地理位置:";
            this.label2.Visible = false;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "所有访客",
            "请求对话",
            "熟悉客人",
            "曾经洽谈过",
            "浏览过重要网页",
            "关键字匹配"});
            this.comboBox1.Location = new System.Drawing.Point(430, 4);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(112, 20);
            this.comboBox1.TabIndex = 6;
            this.comboBox1.Visible = false;
            // 
            // lblVisitorOnChat
            // 
            this.lblVisitorOnChat.AutoSize = true;
            this.lblVisitorOnChat.Location = new System.Drawing.Point(123, 7);
            this.lblVisitorOnChat.Name = "lblVisitorOnChat";
            this.lblVisitorOnChat.Size = new System.Drawing.Size(107, 12);
            this.lblVisitorOnChat.TabIndex = 3;
            this.lblVisitorOnChat.Text = "对话中的访客数: 3";
            // 
            // lblCurrentVisitors
            // 
            this.lblCurrentVisitors.AutoSize = true;
            this.lblCurrentVisitors.Location = new System.Drawing.Point(260, 7);
            this.lblCurrentVisitors.Name = "lblCurrentVisitors";
            this.lblCurrentVisitors.Size = new System.Drawing.Size(89, 12);
            this.lblCurrentVisitors.TabIndex = 2;
            this.lblCurrentVisitors.Text = "当前访客数: 39";
            // 
            // lblMyChat
            // 
            this.lblMyChat.AutoSize = true;
            this.lblMyChat.Location = new System.Drawing.Point(23, 7);
            this.lblMyChat.Name = "lblMyChat";
            this.lblMyChat.Size = new System.Drawing.Size(83, 12);
            this.lblMyChat.TabIndex = 4;
            this.lblMyChat.Text = "我的对话数: 2";
            // 
            // lstVisitors
            // 
            this.lstVisitors.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colBrowser1,
            this.colName,
            this.colLocation,
            this.colVisitCount,
            this.colOperator,
            this.colStatus,
            this.colVisitingTime,
            this.colLeaveTime,
            this.colRequestTime,
            this.colChatingTime,
            this.colWaitingDuring,
            this.colChattingDuring,
            this.colPageRequestCount});
            this.lstVisitors.ContextMenuStrip = this.contextMenuStrip1;
            this.lstVisitors.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstVisitors.FullRowSelect = true;
            this.lstVisitors.GridLines = true;
            this.lstVisitors.Location = new System.Drawing.Point(0, 0);
            this.lstVisitors.MultiSelect = false;
            this.lstVisitors.Name = "lstVisitors";
            this.lstVisitors.Size = new System.Drawing.Size(958, 184);
            this.lstVisitors.SmallImageList = this.imgIconSet;
            this.lstVisitors.TabIndex = 2;
            this.lstVisitors.UseCompatibleStateImageBehavior = false;
            this.lstVisitors.View = System.Windows.Forms.View.Details;
            this.lstVisitors.SelectedIndexChanged += new System.EventHandler(this.lstVisitors_SelectedIndexChanged);
            this.lstVisitors.ColumnClick += new System.Windows.Forms.ColumnClickEventHandler(this.lstVisitors_ColumnClick);
            // 
            // colBrowser1
            // 
            this.colBrowser1.DisplayIndex = 2;
            this.colBrowser1.Text = "浏览器";
            // 
            // colName
            // 
            this.colName.DisplayIndex = 0;
            this.colName.Text = "访客";
            this.colName.Width = 80;
            // 
            // colLocation
            // 
            this.colLocation.DisplayIndex = 1;
            this.colLocation.Text = "地理位置";
            this.colLocation.Width = 100;
            // 
            // colVisitCount
            // 
            this.colVisitCount.Text = "来访次数";
            this.colVisitCount.Width = 70;
            // 
            // colOperator
            // 
            this.colOperator.Text = "接待客服";
            this.colOperator.Width = 88;
            // 
            // colStatus
            // 
            this.colStatus.Text = "状态";
            this.colStatus.Width = 67;
            // 
            // colVisitingTime
            // 
            this.colVisitingTime.Text = "访问时间";
            this.colVisitingTime.Width = 94;
            // 
            // colLeaveTime
            // 
            this.colLeaveTime.Text = "离开时间";
            this.colLeaveTime.Width = 79;
            // 
            // colRequestTime
            // 
            this.colRequestTime.Text = "请求对话时间";
            this.colRequestTime.Width = 95;
            // 
            // colChatingTime
            // 
            this.colChatingTime.Text = "开始对话时间";
            this.colChatingTime.Width = 98;
            // 
            // colWaitingDuring
            // 
            this.colWaitingDuring.Text = "等待时长";
            this.colWaitingDuring.Width = 68;
            // 
            // colChattingDuring
            // 
            this.colChattingDuring.Text = "对话时长";
            this.colChattingDuring.Width = 112;
            // 
            // colPageRequestCount
            // 
            this.colPageRequestCount.Text = "浏览页面数";
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.inviteToolStripMenuItem,
            this.acceptToolStripMenuItem});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(119, 48);
            // 
            // inviteToolStripMenuItem
            // 
            this.inviteToolStripMenuItem.Name = "inviteToolStripMenuItem";
            this.inviteToolStripMenuItem.Size = new System.Drawing.Size(118, 22);
            this.inviteToolStripMenuItem.Text = "邀请对话";
            this.inviteToolStripMenuItem.Click += new System.EventHandler(this.inviteToolStripButton_Click);
            // 
            // acceptToolStripMenuItem
            // 
            this.acceptToolStripMenuItem.Name = "acceptToolStripMenuItem";
            this.acceptToolStripMenuItem.Size = new System.Drawing.Size(118, 22);
            this.acceptToolStripMenuItem.Text = "接受请求";
            this.acceptToolStripMenuItem.Click += new System.EventHandler(this.acceptToolStripButton_Click);
            // 
            // imgIconSet
            // 
            this.imgIconSet.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imgIconSet.ImageStream")));
            this.imgIconSet.TransparentColor = System.Drawing.Color.Transparent;
            this.imgIconSet.Images.SetKeyName(0, "ff.jpg");
            this.imgIconSet.Images.SetKeyName(1, "ie.jpg");
            this.imgIconSet.Images.SetKeyName(2, "chat.jpg");
            this.imgIconSet.Images.SetKeyName(3, "xiongzhang.jpg");
            this.imgIconSet.Images.SetKeyName(4, "xiongzhang2.jpg");
            this.imgIconSet.Images.SetKeyName(5, "PI Diagona Web Application 04 08.png");
            this.imgIconSet.Images.SetKeyName(6, "PI Diagona Web Application 04 09.png");
            this.imgIconSet.Images.SetKeyName(7, "PI Diagona Web Application 04 02.png");
            this.imgIconSet.Images.SetKeyName(8, "PI Diagona Web Application 04 05.png");
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // mainSplitContainer
            // 
            this.mainSplitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainSplitContainer.Location = new System.Drawing.Point(0, 76);
            this.mainSplitContainer.Name = "mainSplitContainer";
            this.mainSplitContainer.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // mainSplitContainer.Panel1
            // 
            this.mainSplitContainer.Panel1.Controls.Add(this.lstVisitors);
            // 
            // mainSplitContainer.Panel2
            // 
            this.mainSplitContainer.Panel2.Controls.Add(this.visitorSessionSplitContainer);
            this.mainSplitContainer.Size = new System.Drawing.Size(958, 591);
            this.mainSplitContainer.SplitterDistance = 184;
            this.mainSplitContainer.TabIndex = 4;
            // 
            // visitorSessionSplitContainer
            // 
            this.visitorSessionSplitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.visitorSessionSplitContainer.Location = new System.Drawing.Point(0, 0);
            this.visitorSessionSplitContainer.Name = "visitorSessionSplitContainer";
            // 
            // visitorSessionSplitContainer.Panel1
            // 
            this.visitorSessionSplitContainer.Panel1.BackColor = System.Drawing.Color.Transparent;
            this.visitorSessionSplitContainer.Panel1.Controls.Add(this.panel1);
            // 
            // visitorSessionSplitContainer.Panel2
            // 
            this.visitorSessionSplitContainer.Panel2.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.bg;
            this.visitorSessionSplitContainer.Panel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.visitorSessionSplitContainer.Panel2.Controls.Add(this.tabChats);
            this.visitorSessionSplitContainer.Panel2.Controls.Add(this.panel2);
            this.visitorSessionSplitContainer.Size = new System.Drawing.Size(958, 403);
            this.visitorSessionSplitContainer.SplitterDistance = 204;
            this.visitorSessionSplitContainer.TabIndex = 3;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.operatorPannel1);
            this.panel1.Controls.Add(this.panel5);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(204, 403);
            this.panel1.TabIndex = 0;
            // 
            // operatorPannel1
            // 
            this.operatorPannel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.operatorPannel1.Location = new System.Drawing.Point(0, 30);
            this.operatorPannel1.Name = "operatorPannel1";
            this.operatorPannel1.Size = new System.Drawing.Size(204, 373);
            this.operatorPannel1.TabIndex = 2;
            // 
            // panel5
            // 
            this.panel5.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.header1;
            this.panel5.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel5.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel5.Location = new System.Drawing.Point(0, 0);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(204, 30);
            this.panel5.TabIndex = 3;
            // 
            // tabChats
            // 
            this.tabChats.Controls.Add(this.tabPage5);
            this.tabChats.Controls.Add(this.tabPage2);
            this.tabChats.Controls.Add(this.tabPage4);
            this.tabChats.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabChats.Location = new System.Drawing.Point(0, 30);
            this.tabChats.Name = "tabChats";
            this.tabChats.SelectedIndex = 0;
            this.tabChats.Size = new System.Drawing.Size(750, 373);
            this.tabChats.TabIndex = 0;
            this.tabChats.SelectedIndexChanged += new System.EventHandler(this.tabChats_SelectedIndexChanged);
            // 
            // tabPage5
            // 
            this.tabPage5.AutoScroll = true;
            this.tabPage5.Controls.Add(browserLabel);
            this.tabPage5.Controls.Add(this.browserTextBox);
            this.tabPage5.Controls.Add(this.domainRequestedTextBox);
            this.tabPage5.Controls.Add(this.iPTextBox);
            this.tabPage5.Controls.Add(this.locationTextBox);
            this.tabPage5.Controls.Add(this.pageRequestCountTextBox);
            this.tabPage5.Controls.Add(this.pageRequestedTextBox);
            this.tabPage5.Controls.Add(this.referrerTextBox);
            this.tabPage5.Controls.Add(this.emailTextBox);
            this.tabPage5.Controls.Add(this.nameTextBox);
            this.tabPage5.Controls.Add(this.reMarkTextBox);
            this.tabPage5.Controls.Add(this.visitCountTextBox);
            this.tabPage5.Controls.Add(this.visitorIdTextBox);
            this.tabPage5.Controls.Add(domainRequestedLabel);
            this.tabPage5.Controls.Add(iPLabel);
            this.tabPage5.Controls.Add(leaveTimeLabel);
            this.tabPage5.Controls.Add(this.leaveTimeDateTimePicker);
            this.tabPage5.Controls.Add(locationLabel);
            this.tabPage5.Controls.Add(pageRequestCountLabel);
            this.tabPage5.Controls.Add(pageRequestedLabel);
            this.tabPage5.Controls.Add(referrerLabel);
            this.tabPage5.Controls.Add(visitingTimeLabel);
            this.tabPage5.Controls.Add(this.visitingTimeDateTimePicker);
            this.tabPage5.Controls.Add(emailLabel);
            this.tabPage5.Controls.Add(nameLabel);
            this.tabPage5.Controls.Add(reMarkLabel);
            this.tabPage5.Controls.Add(visitCountLabel);
            this.tabPage5.Controls.Add(visitorIdLabel);
            this.tabPage5.Location = new System.Drawing.Point(4, 21);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(742, 348);
            this.tabPage5.TabIndex = 4;
            this.tabPage5.Text = "访客详情";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // browserTextBox
            // 
            this.browserTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Browser", true));
            this.browserTextBox.Location = new System.Drawing.Point(146, 136);
            this.browserTextBox.Name = "browserTextBox";
            this.browserTextBox.Size = new System.Drawing.Size(200, 21);
            this.browserTextBox.TabIndex = 17;
            // 
            // visitorBindingSource
            // 
            this.visitorBindingSource.DataSource = typeof(LiveSupport.OperatorConsole.LiveChatWS.Visitor);
            // 
            // domainRequestedTextBox
            // 
            this.domainRequestedTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.DomainRequested", true));
            this.domainRequestedTextBox.Location = new System.Drawing.Point(146, 354);
            this.domainRequestedTextBox.Name = "domainRequestedTextBox";
            this.domainRequestedTextBox.Size = new System.Drawing.Size(200, 21);
            this.domainRequestedTextBox.TabIndex = 25;
            // 
            // iPTextBox
            // 
            this.iPTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.IP", true));
            this.iPTextBox.Location = new System.Drawing.Point(146, 169);
            this.iPTextBox.Name = "iPTextBox";
            this.iPTextBox.Size = new System.Drawing.Size(200, 21);
            this.iPTextBox.TabIndex = 27;
            // 
            // locationTextBox
            // 
            this.locationTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Location", true));
            this.locationTextBox.Location = new System.Drawing.Point(146, 230);
            this.locationTextBox.Name = "locationTextBox";
            this.locationTextBox.Size = new System.Drawing.Size(200, 21);
            this.locationTextBox.TabIndex = 31;
            // 
            // pageRequestCountTextBox
            // 
            this.pageRequestCountTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.PageRequestCount", true));
            this.pageRequestCountTextBox.Location = new System.Drawing.Point(146, 261);
            this.pageRequestCountTextBox.Name = "pageRequestCountTextBox";
            this.pageRequestCountTextBox.Size = new System.Drawing.Size(200, 21);
            this.pageRequestCountTextBox.TabIndex = 35;
            // 
            // pageRequestedTextBox
            // 
            this.pageRequestedTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.PageRequested", true));
            this.pageRequestedTextBox.Location = new System.Drawing.Point(146, 294);
            this.pageRequestedTextBox.Name = "pageRequestedTextBox";
            this.pageRequestedTextBox.Size = new System.Drawing.Size(200, 21);
            this.pageRequestedTextBox.TabIndex = 37;
            // 
            // referrerTextBox
            // 
            this.referrerTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Referrer", true));
            this.referrerTextBox.Location = new System.Drawing.Point(146, 321);
            this.referrerTextBox.Name = "referrerTextBox";
            this.referrerTextBox.Size = new System.Drawing.Size(200, 21);
            this.referrerTextBox.TabIndex = 39;
            // 
            // emailTextBox
            // 
            this.emailTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "Email", true));
            this.emailTextBox.Location = new System.Drawing.Point(146, 32);
            this.emailTextBox.Name = "emailTextBox";
            this.emailTextBox.Size = new System.Drawing.Size(200, 21);
            this.emailTextBox.TabIndex = 5;
            // 
            // nameTextBox
            // 
            this.nameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "Name", true));
            this.nameTextBox.Location = new System.Drawing.Point(146, 55);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.Size = new System.Drawing.Size(200, 21);
            this.nameTextBox.TabIndex = 9;
            // 
            // reMarkTextBox
            // 
            this.reMarkTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "ReMark", true));
            this.reMarkTextBox.Location = new System.Drawing.Point(146, 82);
            this.reMarkTextBox.Name = "reMarkTextBox";
            this.reMarkTextBox.Size = new System.Drawing.Size(200, 21);
            this.reMarkTextBox.TabIndex = 11;
            // 
            // visitCountTextBox
            // 
            this.visitCountTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "VisitCount", true));
            this.visitCountTextBox.Location = new System.Drawing.Point(146, 109);
            this.visitCountTextBox.Name = "visitCountTextBox";
            this.visitCountTextBox.Size = new System.Drawing.Size(200, 21);
            this.visitCountTextBox.TabIndex = 13;
            // 
            // visitorIdTextBox
            // 
            this.visitorIdTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "VisitorId", true));
            this.visitorIdTextBox.Location = new System.Drawing.Point(146, 6);
            this.visitorIdTextBox.Name = "visitorIdTextBox";
            this.visitorIdTextBox.Size = new System.Drawing.Size(200, 21);
            this.visitorIdTextBox.TabIndex = 15;
            // 
            // leaveTimeDateTimePicker
            // 
            this.leaveTimeDateTimePicker.DataBindings.Add(new System.Windows.Forms.Binding("Value", this.visitorBindingSource, "CurrentSession.LeaveTime", true));
            this.leaveTimeDateTimePicker.Location = new System.Drawing.Point(146, 196);
            this.leaveTimeDateTimePicker.Name = "leaveTimeDateTimePicker";
            this.leaveTimeDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.leaveTimeDateTimePicker.TabIndex = 29;
            // 
            // visitingTimeDateTimePicker
            // 
            this.visitingTimeDateTimePicker.DataBindings.Add(new System.Windows.Forms.Binding("Value", this.visitorBindingSource, "CurrentSession.VisitingTime", true));
            this.visitingTimeDateTimePicker.Location = new System.Drawing.Point(146, 383);
            this.visitingTimeDateTimePicker.Name = "visitingTimeDateTimePicker";
            this.visitingTimeDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.visitingTimeDateTimePicker.TabIndex = 45;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.panelMessage);
            this.tabPage2.Controls.Add(this.messageendDateTimePicker);
            this.tabPage2.Controls.Add(this.messagebeginDateTimePicker);
            this.tabPage2.Controls.Add(this.btnSearchHistoryChatMsg);
            this.tabPage2.Controls.Add(this.lblMessageEndTime);
            this.tabPage2.Controls.Add(this.lblMessageBeginTime);
            this.tabPage2.Location = new System.Drawing.Point(4, 21);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(742, 348);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "历史对话";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // panelMessage
            // 
            this.panelMessage.Location = new System.Drawing.Point(0, 47);
            this.panelMessage.Name = "panelMessage";
            this.panelMessage.Size = new System.Drawing.Size(680, 300);
            this.panelMessage.TabIndex = 18;
            // 
            // messageendDateTimePicker
            // 
            this.messageendDateTimePicker.Location = new System.Drawing.Point(366, 20);
            this.messageendDateTimePicker.MinDate = new System.DateTime(2000, 1, 1, 0, 0, 0, 0);
            this.messageendDateTimePicker.Name = "messageendDateTimePicker";
            this.messageendDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.messageendDateTimePicker.TabIndex = 17;
            // 
            // messagebeginDateTimePicker
            // 
            this.messagebeginDateTimePicker.Location = new System.Drawing.Point(72, 20);
            this.messagebeginDateTimePicker.MinDate = new System.DateTime(2000, 1, 1, 0, 0, 0, 0);
            this.messagebeginDateTimePicker.Name = "messagebeginDateTimePicker";
            this.messagebeginDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.messagebeginDateTimePicker.TabIndex = 16;
            // 
            // btnSearchHistoryChatMsg
            // 
            this.btnSearchHistoryChatMsg.Location = new System.Drawing.Point(578, 20);
            this.btnSearchHistoryChatMsg.Name = "btnSearchHistoryChatMsg";
            this.btnSearchHistoryChatMsg.Size = new System.Drawing.Size(75, 23);
            this.btnSearchHistoryChatMsg.TabIndex = 14;
            this.btnSearchHistoryChatMsg.Text = "查询(&S)";
            this.btnSearchHistoryChatMsg.UseVisualStyleBackColor = true;
            this.btnSearchHistoryChatMsg.Click += new System.EventHandler(this.btnSearchHistoryChatMsg_Click);
            // 
            // lblMessageEndTime
            // 
            this.lblMessageEndTime.AutoSize = true;
            this.lblMessageEndTime.Location = new System.Drawing.Point(293, 25);
            this.lblMessageEndTime.Name = "lblMessageEndTime";
            this.lblMessageEndTime.Size = new System.Drawing.Size(65, 12);
            this.lblMessageEndTime.TabIndex = 13;
            this.lblMessageEndTime.Text = "结束时间：";
            // 
            // lblMessageBeginTime
            // 
            this.lblMessageBeginTime.AutoSize = true;
            this.lblMessageBeginTime.Location = new System.Drawing.Point(11, 26);
            this.lblMessageBeginTime.Name = "lblMessageBeginTime";
            this.lblMessageBeginTime.Size = new System.Drawing.Size(65, 12);
            this.lblMessageBeginTime.TabIndex = 12;
            this.lblMessageBeginTime.Text = "开始时间：";
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.requestendDateTimePicker);
            this.tabPage4.Controls.Add(this.requestbeginDateTimePicker);
            this.tabPage4.Controls.Add(this.btnSearchHistoryPageRequests);
            this.tabPage4.Controls.Add(this.lblREndTime);
            this.tabPage4.Controls.Add(this.lblRBeginTime);
            this.tabPage4.Controls.Add(this.lstPageRequest);
            this.tabPage4.Location = new System.Drawing.Point(4, 21);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(742, 348);
            this.tabPage4.TabIndex = 3;
            this.tabPage4.Text = "网页浏览";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // requestendDateTimePicker
            // 
            this.requestendDateTimePicker.Location = new System.Drawing.Point(372, 20);
            this.requestendDateTimePicker.MinDate = new System.DateTime(2000, 1, 1, 0, 0, 0, 0);
            this.requestendDateTimePicker.Name = "requestendDateTimePicker";
            this.requestendDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.requestendDateTimePicker.TabIndex = 9;
            // 
            // requestbeginDateTimePicker
            // 
            this.requestbeginDateTimePicker.Location = new System.Drawing.Point(77, 20);
            this.requestbeginDateTimePicker.MinDate = new System.DateTime(2000, 1, 1, 0, 0, 0, 0);
            this.requestbeginDateTimePicker.Name = "requestbeginDateTimePicker";
            this.requestbeginDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.requestbeginDateTimePicker.TabIndex = 8;
            // 
            // btnSearchHistoryPageRequests
            // 
            this.btnSearchHistoryPageRequests.Location = new System.Drawing.Point(587, 18);
            this.btnSearchHistoryPageRequests.Name = "btnSearchHistoryPageRequests";
            this.btnSearchHistoryPageRequests.Size = new System.Drawing.Size(75, 23);
            this.btnSearchHistoryPageRequests.TabIndex = 6;
            this.btnSearchHistoryPageRequests.Text = "查询(&S)";
            this.btnSearchHistoryPageRequests.UseVisualStyleBackColor = true;
            this.btnSearchHistoryPageRequests.Click += new System.EventHandler(this.btnSearchHistoryPageRequests_Click);
            // 
            // lblREndTime
            // 
            this.lblREndTime.AutoSize = true;
            this.lblREndTime.Location = new System.Drawing.Point(302, 23);
            this.lblREndTime.Name = "lblREndTime";
            this.lblREndTime.Size = new System.Drawing.Size(65, 12);
            this.lblREndTime.TabIndex = 5;
            this.lblREndTime.Text = "结束时间：";
            // 
            // lblRBeginTime
            // 
            this.lblRBeginTime.AutoSize = true;
            this.lblRBeginTime.Location = new System.Drawing.Point(16, 23);
            this.lblRBeginTime.Name = "lblRBeginTime";
            this.lblRBeginTime.Size = new System.Drawing.Size(65, 12);
            this.lblRBeginTime.TabIndex = 4;
            this.lblRBeginTime.Text = "开始时间：";
            // 
            // lstPageRequest
            // 
            this.lstPageRequest.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lstPageRequest.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colPage,
            this.colRTime,
            this.colReferrer});
            this.lstPageRequest.FullRowSelect = true;
            this.lstPageRequest.GridLines = true;
            this.lstPageRequest.Location = new System.Drawing.Point(0, 59);
            this.lstPageRequest.Name = "lstPageRequest";
            this.lstPageRequest.Size = new System.Drawing.Size(816, 449);
            this.lstPageRequest.TabIndex = 7;
            this.lstPageRequest.UseCompatibleStateImageBehavior = false;
            this.lstPageRequest.View = System.Windows.Forms.View.Details;
            // 
            // colPage
            // 
            this.colPage.Text = "请求页面";
            this.colPage.Width = 233;
            // 
            // colRTime
            // 
            this.colRTime.Text = "请求时间";
            this.colRTime.Width = 148;
            // 
            // colReferrer
            // 
            this.colReferrer.Text = "引用页";
            this.colReferrer.Width = 241;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.panel4);
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(750, 30);
            this.panel2.TabIndex = 1;
            // 
            // panel4
            // 
            this.panel4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.panel4.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.header_bg_right;
            this.panel4.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel4.Location = new System.Drawing.Point(176, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(574, 30);
            this.panel4.TabIndex = 1;
            // 
            // panel3
            // 
            this.panel3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.panel3.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.header_bg_left1;
            this.panel3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel3.Location = new System.Drawing.Point(0, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(179, 30);
            this.panel3.TabIndex = 0;
            // 
            // treeView1
            // 
            this.treeView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeView1.LineColor = System.Drawing.Color.Empty;
            this.treeView1.Location = new System.Drawing.Point(0, 12);
            this.treeView1.Name = "treeView1";
            treeNode1.Name = "节点0";
            treeNode1.Text = "在线客服";
            treeNode2.Name = "节点1";
            treeNode2.Text = "离线客服";
            this.treeView1.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode1,
            treeNode2});
            this.treeView1.Size = new System.Drawing.Size(204, 486);
            this.treeView1.TabIndex = 0;
            // 
            // notifyIcon
            // 
            this.notifyIcon.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            this.notifyIcon.BalloonTipText = "座席客户端仍在运行中, 点击图标打开";
            this.notifyIcon.ContextMenuStrip = this.notifyIconContextMenuStrip;
            this.notifyIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("notifyIcon.Icon")));
            this.notifyIcon.Text = "LiveSupport 座席客户端";
            this.notifyIcon.Visible = true;
            this.notifyIcon.DoubleClick += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // notifyIconContextMenuStrip
            // 
            this.notifyIconContextMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.idleToolStripMenuItem,
            this.chattingToolStripMenuItem,
            this.beRightBackToolStripMenuItem,
            this.offlineToolStripMenuItem,
            this.toolStripSeparator3,
            this.changeAccountToolStripMenuItem,
            this.toolStripSeparator2,
            this.openToolStripMenuItem,
            this.exitToolStripMenuItem2});
            this.notifyIconContextMenuStrip.Name = "notifyIconContextMenuStrip";
            this.notifyIconContextMenuStrip.Size = new System.Drawing.Size(143, 170);
            // 
            // idleToolStripMenuItem
            // 
            this.idleToolStripMenuItem.Image = global::LiveSupport.OperatorConsole.Properties.Resources.PI_Diagona_Web_Application_04_02;
            this.idleToolStripMenuItem.Name = "idleToolStripMenuItem";
            this.idleToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.idleToolStripMenuItem.Text = "空闲";
            // 
            // chattingToolStripMenuItem
            // 
            this.chattingToolStripMenuItem.Image = global::LiveSupport.OperatorConsole.Properties.Resources.PI_Diagona_Web_Application_04_01;
            this.chattingToolStripMenuItem.Name = "chattingToolStripMenuItem";
            this.chattingToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.chattingToolStripMenuItem.Text = "对话中";
            // 
            // beRightBackToolStripMenuItem
            // 
            this.beRightBackToolStripMenuItem.Image = global::LiveSupport.OperatorConsole.Properties.Resources.PI_Diagona_Web_Application_04_04;
            this.beRightBackToolStripMenuItem.Name = "beRightBackToolStripMenuItem";
            this.beRightBackToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.beRightBackToolStripMenuItem.Text = "一会回来";
            this.beRightBackToolStripMenuItem.Click += new System.EventHandler(this.beRightBackToolStripMenuItem_Click);
            // 
            // offlineToolStripMenuItem
            // 
            this.offlineToolStripMenuItem.Image = global::LiveSupport.OperatorConsole.Properties.Resources.PI_Diagona_Web_Application_04_09;
            this.offlineToolStripMenuItem.Name = "offlineToolStripMenuItem";
            this.offlineToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.offlineToolStripMenuItem.Text = "离线";
            this.offlineToolStripMenuItem.Click += new System.EventHandler(this.offlineToolStripMenuItem_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(139, 6);
            // 
            // changeAccountToolStripMenuItem
            // 
            this.changeAccountToolStripMenuItem.Name = "changeAccountToolStripMenuItem";
            this.changeAccountToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.changeAccountToolStripMenuItem.Text = "更换座席(&C)";
            this.changeAccountToolStripMenuItem.Click += new System.EventHandler(this.changeOperatorToolStripMenuItem_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(139, 6);
            // 
            // openToolStripMenuItem
            // 
            this.openToolStripMenuItem.Name = "openToolStripMenuItem";
            this.openToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.openToolStripMenuItem.Text = "显示/隐藏(&O)";
            this.openToolStripMenuItem.Click += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem2
            // 
            this.exitToolStripMenuItem2.Name = "exitToolStripMenuItem2";
            this.exitToolStripMenuItem2.Size = new System.Drawing.Size(142, 22);
            this.exitToolStripMenuItem2.Text = "退出(&E)";
            this.exitToolStripMenuItem2.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // toolStrip1
            // 
            this.toolStrip1.BackColor = System.Drawing.Color.Transparent;
            this.toolStrip1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripSeparator5,
            this.inviteToolStripButton,
            this.toolStripSeparator6,
            this.acceptToolStripButton,
            this.toolStripButton1});
            this.toolStrip1.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.HorizontalStackWithOverflow;
            this.toolStrip1.Location = new System.Drawing.Point(0, 24);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(958, 25);
            this.toolStrip1.TabIndex = 6;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripSeparator5
            // 
            this.toolStripSeparator5.Name = "toolStripSeparator5";
            this.toolStripSeparator5.Size = new System.Drawing.Size(6, 25);
            // 
            // inviteToolStripButton
            // 
            this.inviteToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.aim;
            this.inviteToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.inviteToolStripButton.Name = "inviteToolStripButton";
            this.inviteToolStripButton.Size = new System.Drawing.Size(73, 22);
            this.inviteToolStripButton.Text = "邀请访客";
            this.inviteToolStripButton.Click += new System.EventHandler(this.inviteToolStripButton_Click);
            // 
            // toolStripSeparator6
            // 
            this.toolStripSeparator6.Name = "toolStripSeparator6";
            this.toolStripSeparator6.Size = new System.Drawing.Size(6, 25);
            // 
            // acceptToolStripButton
            // 
            this.acceptToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.All_software_is_current;
            this.acceptToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.acceptToolStripButton.Name = "acceptToolStripButton";
            this.acceptToolStripButton.Size = new System.Drawing.Size(97, 22);
            this.acceptToolStripButton.Text = "接受对话请求";
            this.acceptToolStripButton.Click += new System.EventHandler(this.acceptToolStripButton_Click);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.toolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton1.Image = global::LiveSupport.OperatorConsole.Properties.Resources.mailreminder;
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(23, 22);
            this.toolStripButton1.Text = "toolStripButton1";
            this.toolStripButton1.Visible = false;
            // 
            // statusStrip1
            // 
            this.statusStrip1.BackColor = System.Drawing.Color.Transparent;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.operatorToolStripStatusLabel,
            this.powerToolStripStatusLabel,
            this.stateToolStripStatusLabel,
            this.stickToolStripStatusLabel});
            this.statusStrip1.Location = new System.Drawing.Point(0, 667);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(958, 22);
            this.statusStrip1.TabIndex = 7;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.AutoSize = false;
            this.toolStripStatusLabel1.IsLink = true;
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(483, 17);
            this.toolStripStatusLabel1.Spring = true;
            this.toolStripStatusLabel1.Text = "信息提示";
            this.toolStripStatusLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.toolStripStatusLabel1.Click += new System.EventHandler(this.toolStripStatusLabel1_Click);
            // 
            // operatorToolStripStatusLabel
            // 
            this.operatorToolStripStatusLabel.AutoSize = false;
            this.operatorToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.operatorToolStripStatusLabel.Name = "operatorToolStripStatusLabel";
            this.operatorToolStripStatusLabel.Size = new System.Drawing.Size(120, 17);
            this.operatorToolStripStatusLabel.Text = "登录用户";
            // 
            // powerToolStripStatusLabel
            // 
            this.powerToolStripStatusLabel.AutoSize = false;
            this.powerToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.powerToolStripStatusLabel.Name = "powerToolStripStatusLabel";
            this.powerToolStripStatusLabel.Size = new System.Drawing.Size(100, 17);
            this.powerToolStripStatusLabel.Text = "登录权限";
            // 
            // stateToolStripStatusLabel
            // 
            this.stateToolStripStatusLabel.AutoSize = false;
            this.stateToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.stateToolStripStatusLabel.Name = "stateToolStripStatusLabel";
            this.stateToolStripStatusLabel.Size = new System.Drawing.Size(120, 17);
            this.stateToolStripStatusLabel.Text = "客服状态";
            // 
            // stickToolStripStatusLabel
            // 
            this.stickToolStripStatusLabel.AutoSize = false;
            this.stickToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.stickToolStripStatusLabel.Name = "stickToolStripStatusLabel";
            this.stickToolStripStatusLabel.Size = new System.Drawing.Size(120, 17);
            this.stickToolStripStatusLabel.Text = "登录时间";
            // 
            // loginTimer
            // 
            this.loginTimer.Enabled = true;
            this.loginTimer.Interval = 1000;
            this.loginTimer.Tick += new System.EventHandler(this.loginTimer_Tick);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.bg02;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(958, 689);
            this.Controls.Add(this.mainSplitContainer);
            this.Controls.Add(this.pnlChat);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.mainMenu);
            this.Controls.Add(this.statusStrip1);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.mainMenu;
            this.Name = "MainForm";
            this.Text = "座席客户端";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.MainForm_FormClosed);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
            this.Resize += new System.EventHandler(this.MainForm_Resize);
            this.mainMenu.ResumeLayout(false);
            this.mainMenu.PerformLayout();
            this.pnlChat.ResumeLayout(false);
            this.pnlChat.PerformLayout();
            this.contextMenuStrip1.ResumeLayout(false);
            this.mainSplitContainer.Panel1.ResumeLayout(false);
            this.mainSplitContainer.Panel2.ResumeLayout(false);
            this.mainSplitContainer.ResumeLayout(false);
            this.visitorSessionSplitContainer.Panel1.ResumeLayout(false);
            this.visitorSessionSplitContainer.Panel2.ResumeLayout(false);
            this.visitorSessionSplitContainer.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.tabChats.ResumeLayout(false);
            this.tabPage5.ResumeLayout(false);
            this.tabPage5.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.visitorBindingSource)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage4.ResumeLayout(false);
            this.tabPage4.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.notifyIconContextMenuStrip.ResumeLayout(false);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.MenuStrip mainMenu;
        private System.Windows.Forms.ToolStripMenuItem operatorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem administrationToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.Panel pnlChat;
        private System.Windows.Forms.Label lblMyChat;
        private System.Windows.Forms.Label lblVisitorOnChat;
        private System.Windows.Forms.Label lblCurrentVisitors;
        private System.Windows.Forms.ListView lstVisitors;
        private System.Windows.Forms.ToolStripMenuItem changeOperatorToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem playSoundOnChatRequestToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem playSoundOnChatMessageToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem whenOfflineGetWebsiteRequestsToolStripMenuItem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem inviteToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem acceptToolStripMenuItem;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.SplitContainer mainSplitContainer;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.NotifyIcon notifyIcon;
        private System.Windows.Forms.ContextMenuStrip notifyIconContextMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem changeAccountToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem idleToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem chattingToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem beRightBackToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem offlineToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem autostartToolStripMenuItem;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripMenuItem paymentToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem touchToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem handBookToolStripMenuItem;
        private System.Windows.Forms.ToolStripButton inviteToolStripButton;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator5;
        private System.Windows.Forms.ToolStripButton acceptToolStripButton;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripStatusLabel operatorToolStripStatusLabel;
        private System.Windows.Forms.ToolStripStatusLabel powerToolStripStatusLabel;
        private System.Windows.Forms.ToolStripStatusLabel stateToolStripStatusLabel;
        private System.Windows.Forms.ToolStripStatusLabel stickToolStripStatusLabel;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.SplitContainer visitorSessionSplitContainer;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ToolStripMenuItem 客服栏OToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 访客信息栏VToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator6;
        private System.Windows.Forms.Timer loginTimer;
        private System.Windows.Forms.ColumnHeader colName;
        private System.Windows.Forms.ColumnHeader colLocation;
        private System.Windows.Forms.ColumnHeader colBrowser1;
        private System.Windows.Forms.ColumnHeader colVisitCount;
        private System.Windows.Forms.ColumnHeader colOperator;
        private System.Windows.Forms.ColumnHeader colStatus;
        private System.Windows.Forms.ColumnHeader colVisitingTime;
        private System.Windows.Forms.ColumnHeader colLeaveTime;
        private System.Windows.Forms.ColumnHeader colRequestTime;
        private System.Windows.Forms.ColumnHeader colChatingTime;
        private System.Windows.Forms.ColumnHeader colWaitingDuring;
        private System.Windows.Forms.ColumnHeader colChattingDuring;
        private System.Windows.Forms.ColumnHeader colPageRequestCount;
        private System.Windows.Forms.BindingSource visitorBindingSource;
        private System.Windows.Forms.ToolStripMenuItem adminToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem createToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem resetpasswordToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem changePasswordToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem autoLoginToolStripMenuItem;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private OperatorPannel operatorPannel1;
        private System.Windows.Forms.ImageList imgIconSet;
        private System.Windows.Forms.ToolStripMenuItem settalkToolStripMenuItem;
        private System.Windows.Forms.TabControl tabChats;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.DateTimePicker messageendDateTimePicker;
        private System.Windows.Forms.DateTimePicker messagebeginDateTimePicker;
        private System.Windows.Forms.Button btnSearchHistoryChatMsg;
        private System.Windows.Forms.Label lblMessageEndTime;
        private System.Windows.Forms.Label lblMessageBeginTime;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.DateTimePicker requestendDateTimePicker;
        private System.Windows.Forms.DateTimePicker requestbeginDateTimePicker;
        private System.Windows.Forms.Button btnSearchHistoryPageRequests;
        private System.Windows.Forms.Label lblREndTime;
        private System.Windows.Forms.Label lblRBeginTime;
        private System.Windows.Forms.ListView lstPageRequest;
        private System.Windows.Forms.ColumnHeader colPage;
        private System.Windows.Forms.ColumnHeader colRTime;
        private System.Windows.Forms.ColumnHeader colReferrer;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.TabPage tabPage5;
        private System.Windows.Forms.TextBox browserTextBox;
        private System.Windows.Forms.TextBox domainRequestedTextBox;
        private System.Windows.Forms.TextBox iPTextBox;
        private System.Windows.Forms.TextBox locationTextBox;
        private System.Windows.Forms.TextBox pageRequestCountTextBox;
        private System.Windows.Forms.TextBox pageRequestedTextBox;
        private System.Windows.Forms.TextBox referrerTextBox;
        private System.Windows.Forms.TextBox emailTextBox;
        private System.Windows.Forms.TextBox nameTextBox;
        private System.Windows.Forms.TextBox reMarkTextBox;
        private System.Windows.Forms.TextBox visitCountTextBox;
        private System.Windows.Forms.TextBox visitorIdTextBox;
        private System.Windows.Forms.DateTimePicker leaveTimeDateTimePicker;
        private System.Windows.Forms.DateTimePicker visitingTimeDateTimePicker;
        private System.Windows.Forms.Panel panelMessage;
    }
}