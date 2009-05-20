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
            System.Windows.Forms.Label emailLabel;
            System.Windows.Forms.Label nameLabel;
            System.Windows.Forms.Label reMarkLabel;
            System.Windows.Forms.Label visitCountLabel;
            System.Windows.Forms.Label visitorIdLabel;
            System.Windows.Forms.Label browserLabel;
            System.Windows.Forms.Label iPLabel;
            System.Windows.Forms.Label leaveTimeLabel;
            System.Windows.Forms.Label locationLabel;
            System.Windows.Forms.Label pageRequestCountLabel;
            System.Windows.Forms.Label pageRequestedLabel;
            System.Windows.Forms.Label referrerLabel;
            System.Windows.Forms.Label visitingTimeLabel;
            System.Windows.Forms.Label domainRequestedLabel;
            System.Windows.Forms.TreeNode treeNode3 = new System.Windows.Forms.TreeNode("在线客服");
            System.Windows.Forms.TreeNode treeNode4 = new System.Windows.Forms.TreeNode("离线客服");
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.operatorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.connectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.rejiggerpasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.adminToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.创建交流按钮CToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.resetpasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cannedMessagesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.presetLinksToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.客服栏OToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.访客信息栏VToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.administrationToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatRequestToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatMessageToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.autoLoginToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.autostartToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.检查升级CToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.购买服务BToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.联系我们UToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.软件手册MToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.官方网站ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.关于AToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
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
            this.colName = new System.Windows.Forms.ColumnHeader();
            this.colLocation = new System.Windows.Forms.ColumnHeader();
            this.colBrowser1 = new System.Windows.Forms.ColumnHeader();
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
            this.tabChats = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.messageendDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.messagebeginDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.btnSend = new System.Windows.Forms.Button();
            this.lblMessageEndTime = new System.Windows.Forms.Label();
            this.lblMessageBeginTime = new System.Windows.Forms.Label();
            this.lstMessage = new System.Windows.Forms.ListView();
            this.colSource = new System.Windows.Forms.ColumnHeader();
            this.colDestination = new System.Windows.Forms.ColumnHeader();
            this.colText = new System.Windows.Forms.ColumnHeader();
            this.colSentDate = new System.Windows.Forms.ColumnHeader();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.requestendDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.requestbeginDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.btnOk = new System.Windows.Forms.Button();
            this.lblREndTime = new System.Windows.Forms.Label();
            this.lblRBeginTime = new System.Windows.Forms.Label();
            this.lstPageRequest = new System.Windows.Forms.ListView();
            this.colPage = new System.Windows.Forms.ColumnHeader();
            this.colRTime = new System.Windows.Forms.ColumnHeader();
            this.colReferrer = new System.Windows.Forms.ColumnHeader();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.browserTextBox = new System.Windows.Forms.TextBox();
            this.visitorBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.domainRequestedTextBox = new System.Windows.Forms.TextBox();
            this.iPTextBox = new System.Windows.Forms.TextBox();
            this.leaveTimeDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.locationTextBox = new System.Windows.Forms.TextBox();
            this.pageRequestCountTextBox = new System.Windows.Forms.TextBox();
            this.pageRequestedTextBox = new System.Windows.Forms.TextBox();
            this.referrerTextBox = new System.Windows.Forms.TextBox();
            this.visitingTimeDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.emailTextBox = new System.Windows.Forms.TextBox();
            this.nameTextBox = new System.Windows.Forms.TextBox();
            this.reMarkTextBox = new System.Windows.Forms.TextBox();
            this.visitCountTextBox = new System.Windows.Forms.TextBox();
            this.visitorIdTextBox = new System.Windows.Forms.TextBox();
            this.tmrCheckRequests = new System.Windows.Forms.Timer(this.components);
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.mainSplitContainer = new System.Windows.Forms.SplitContainer();
            this.visitorSessionSplitContainer = new System.Windows.Forms.SplitContainer();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label3 = new System.Windows.Forms.Label();
            this.访客信息栏 = new System.Windows.Forms.Label();
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
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.imgIconSet = new System.Windows.Forms.ImageList(this.components);
            this.operatorPannel1 = new LiveSupport.OperatorConsole.OperatorPannel();
            emailLabel = new System.Windows.Forms.Label();
            nameLabel = new System.Windows.Forms.Label();
            reMarkLabel = new System.Windows.Forms.Label();
            visitCountLabel = new System.Windows.Forms.Label();
            visitorIdLabel = new System.Windows.Forms.Label();
            browserLabel = new System.Windows.Forms.Label();
            iPLabel = new System.Windows.Forms.Label();
            leaveTimeLabel = new System.Windows.Forms.Label();
            locationLabel = new System.Windows.Forms.Label();
            pageRequestCountLabel = new System.Windows.Forms.Label();
            pageRequestedLabel = new System.Windows.Forms.Label();
            referrerLabel = new System.Windows.Forms.Label();
            visitingTimeLabel = new System.Windows.Forms.Label();
            domainRequestedLabel = new System.Windows.Forms.Label();
            this.mainMenu.SuspendLayout();
            this.pnlChat.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.tabChats.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.tabPage5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.visitorBindingSource)).BeginInit();
            this.mainSplitContainer.Panel1.SuspendLayout();
            this.mainSplitContainer.Panel2.SuspendLayout();
            this.mainSplitContainer.SuspendLayout();
            this.visitorSessionSplitContainer.Panel1.SuspendLayout();
            this.visitorSessionSplitContainer.Panel2.SuspendLayout();
            this.visitorSessionSplitContainer.SuspendLayout();
            this.panel1.SuspendLayout();
            this.notifyIconContextMenuStrip.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // emailLabel
            // 
            emailLabel.AutoSize = true;
            emailLabel.Location = new System.Drawing.Point(23, 42);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new System.Drawing.Size(59, 12);
            emailLabel.TabIndex = 4;
            emailLabel.Text = "电子邮件:";
            // 
            // nameLabel
            // 
            nameLabel.AutoSize = true;
            nameLabel.Location = new System.Drawing.Point(23, 65);
            nameLabel.Name = "nameLabel";
            nameLabel.Size = new System.Drawing.Size(59, 12);
            nameLabel.TabIndex = 8;
            nameLabel.Text = "访客名称:";
            // 
            // reMarkLabel
            // 
            reMarkLabel.AutoSize = true;
            reMarkLabel.Location = new System.Drawing.Point(23, 92);
            reMarkLabel.Name = "reMarkLabel";
            reMarkLabel.Size = new System.Drawing.Size(35, 12);
            reMarkLabel.TabIndex = 10;
            reMarkLabel.Text = "备注:";
            // 
            // visitCountLabel
            // 
            visitCountLabel.AutoSize = true;
            visitCountLabel.Location = new System.Drawing.Point(23, 119);
            visitCountLabel.Name = "visitCountLabel";
            visitCountLabel.Size = new System.Drawing.Size(59, 12);
            visitCountLabel.TabIndex = 12;
            visitCountLabel.Text = "访问次数:";
            // 
            // visitorIdLabel
            // 
            visitorIdLabel.AutoSize = true;
            visitorIdLabel.Location = new System.Drawing.Point(23, 16);
            visitorIdLabel.Name = "visitorIdLabel";
            visitorIdLabel.Size = new System.Drawing.Size(47, 12);
            visitorIdLabel.TabIndex = 14;
            visitorIdLabel.Text = "访客ID:";
            // 
            // browserLabel
            // 
            browserLabel.AutoSize = true;
            browserLabel.Location = new System.Drawing.Point(23, 146);
            browserLabel.Name = "browserLabel";
            browserLabel.Size = new System.Drawing.Size(47, 12);
            browserLabel.TabIndex = 16;
            browserLabel.Text = "浏览器:";
            // 
            // iPLabel
            // 
            iPLabel.AutoSize = true;
            iPLabel.Location = new System.Drawing.Point(23, 179);
            iPLabel.Name = "iPLabel";
            iPLabel.Size = new System.Drawing.Size(23, 12);
            iPLabel.TabIndex = 26;
            iPLabel.Text = "IP:";
            // 
            // leaveTimeLabel
            // 
            leaveTimeLabel.AutoSize = true;
            leaveTimeLabel.Location = new System.Drawing.Point(23, 207);
            leaveTimeLabel.Name = "leaveTimeLabel";
            leaveTimeLabel.Size = new System.Drawing.Size(59, 12);
            leaveTimeLabel.TabIndex = 28;
            leaveTimeLabel.Text = "离开时间:";
            // 
            // locationLabel
            // 
            locationLabel.AutoSize = true;
            locationLabel.Location = new System.Drawing.Point(23, 240);
            locationLabel.Name = "locationLabel";
            locationLabel.Size = new System.Drawing.Size(59, 12);
            locationLabel.TabIndex = 30;
            locationLabel.Text = "地理位置:";
            // 
            // pageRequestCountLabel
            // 
            pageRequestCountLabel.AutoSize = true;
            pageRequestCountLabel.Location = new System.Drawing.Point(23, 271);
            pageRequestCountLabel.Name = "pageRequestCountLabel";
            pageRequestCountLabel.Size = new System.Drawing.Size(71, 12);
            pageRequestCountLabel.TabIndex = 34;
            pageRequestCountLabel.Text = "浏览页面数:";
            // 
            // pageRequestedLabel
            // 
            pageRequestedLabel.AutoSize = true;
            pageRequestedLabel.Location = new System.Drawing.Point(23, 304);
            pageRequestedLabel.Name = "pageRequestedLabel";
            pageRequestedLabel.Size = new System.Drawing.Size(59, 12);
            pageRequestedLabel.TabIndex = 36;
            pageRequestedLabel.Text = "请求页面:";
            // 
            // referrerLabel
            // 
            referrerLabel.AutoSize = true;
            referrerLabel.Location = new System.Drawing.Point(23, 337);
            referrerLabel.Name = "referrerLabel";
            referrerLabel.Size = new System.Drawing.Size(59, 12);
            referrerLabel.TabIndex = 38;
            referrerLabel.Text = "引用页面:";
            // 
            // visitingTimeLabel
            // 
            visitingTimeLabel.AutoSize = true;
            visitingTimeLabel.Location = new System.Drawing.Point(23, 394);
            visitingTimeLabel.Name = "visitingTimeLabel";
            visitingTimeLabel.Size = new System.Drawing.Size(83, 12);
            visitingTimeLabel.TabIndex = 44;
            visitingTimeLabel.Text = "页面访问时间:";
            // 
            // domainRequestedLabel
            // 
            domainRequestedLabel.AutoSize = true;
            domainRequestedLabel.Location = new System.Drawing.Point(23, 361);
            domainRequestedLabel.Name = "domainRequestedLabel";
            domainRequestedLabel.Size = new System.Drawing.Size(59, 12);
            domainRequestedLabel.TabIndex = 24;
            domainRequestedLabel.Text = "请求域名:";
            // 
            // mainMenu
            // 
            this.mainMenu.BackColor = System.Drawing.Color.Transparent;
            this.mainMenu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.operatorToolStripMenuItem,
            this.adminToolStripMenuItem,
            this.toolsToolStripMenuItem,
            this.administrationToolStripMenuItem,
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
            this.connectToolStripMenuItem,
            this.toolStripMenuItem1,
            this.rejiggerpasswordToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.operatorToolStripMenuItem.Name = "operatorToolStripMenuItem";
            this.operatorToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.operatorToolStripMenuItem.Text = "操作(&F)";
            // 
            // connectToolStripMenuItem
            // 
            this.connectToolStripMenuItem.Name = "connectToolStripMenuItem";
            this.connectToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F11;
            this.connectToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.connectToolStripMenuItem.Text = "更改账户(&C)";
            this.connectToolStripMenuItem.Click += new System.EventHandler(this.connectToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(156, 6);
            // 
            // rejiggerpasswordToolStripMenuItem
            // 
            this.rejiggerpasswordToolStripMenuItem.Name = "rejiggerpasswordToolStripMenuItem";
            this.rejiggerpasswordToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.rejiggerpasswordToolStripMenuItem.Text = "修改密码(&P)";
            this.rejiggerpasswordToolStripMenuItem.Click += new System.EventHandler(this.rejiggerpasswordToolStripMenuItem_Click);
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
            // adminToolStripMenuItem
            // 
            this.adminToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.创建交流按钮CToolStripMenuItem,
            this.resetpasswordToolStripMenuItem});
            this.adminToolStripMenuItem.Name = "adminToolStripMenuItem";
            this.adminToolStripMenuItem.Size = new System.Drawing.Size(71, 20);
            this.adminToolStripMenuItem.Text = "管理员(&A)";
            // 
            // 创建交流按钮CToolStripMenuItem
            // 
            this.创建交流按钮CToolStripMenuItem.Name = "创建交流按钮CToolStripMenuItem";
            this.创建交流按钮CToolStripMenuItem.Size = new System.Drawing.Size(160, 22);
            this.创建交流按钮CToolStripMenuItem.Text = "创建交流按钮(&C)";
            // 
            // resetpasswordToolStripMenuItem
            // 
            this.resetpasswordToolStripMenuItem.Name = "resetpasswordToolStripMenuItem";
            this.resetpasswordToolStripMenuItem.Size = new System.Drawing.Size(160, 22);
            this.resetpasswordToolStripMenuItem.Text = "重置座席密码(&R)";
            this.resetpasswordToolStripMenuItem.Click += new System.EventHandler(this.resetpasswordToolStripMenuItem_Click);
            // 
            // toolsToolStripMenuItem
            // 
            this.toolsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cannedMessagesToolStripMenuItem,
            this.presetLinksToolStripMenuItem,
            this.客服栏OToolStripMenuItem,
            this.访客信息栏VToolStripMenuItem});
            this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
            this.toolsToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.toolsToolStripMenuItem.Text = "视图(&V)";
            // 
            // cannedMessagesToolStripMenuItem
            // 
            this.cannedMessagesToolStripMenuItem.Name = "cannedMessagesToolStripMenuItem";
            this.cannedMessagesToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.cannedMessagesToolStripMenuItem.Text = "常用消息(&C)";
            this.cannedMessagesToolStripMenuItem.Click += new System.EventHandler(this.cannedMessagesToolStripMenuItem_Click);
            // 
            // presetLinksToolStripMenuItem
            // 
            this.presetLinksToolStripMenuItem.Name = "presetLinksToolStripMenuItem";
            this.presetLinksToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.presetLinksToolStripMenuItem.Text = "预置链接(&P)";
            this.presetLinksToolStripMenuItem.Click += new System.EventHandler(this.presetLinksToolStripMenuItem_Click);
            // 
            // 客服栏OToolStripMenuItem
            // 
            this.客服栏OToolStripMenuItem.Name = "客服栏OToolStripMenuItem";
            this.客服栏OToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.客服栏OToolStripMenuItem.Text = "客服栏(&O)";
            // 
            // 访客信息栏VToolStripMenuItem
            // 
            this.访客信息栏VToolStripMenuItem.Name = "访客信息栏VToolStripMenuItem";
            this.访客信息栏VToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.访客信息栏VToolStripMenuItem.Text = "访客信息栏(&V)";
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
            this.playSoundOnChatRequestToolStripMenuItem.CheckState = System.Windows.Forms.CheckState.Checked;
            this.playSoundOnChatRequestToolStripMenuItem.Name = "playSoundOnChatRequestToolStripMenuItem";
            this.playSoundOnChatRequestToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.playSoundOnChatRequestToolStripMenuItem.Text = "对话请求时播放声音";
            this.playSoundOnChatRequestToolStripMenuItem.Click += new System.EventHandler(this.playSoundOnChatRequestToolStripMenuItem_Click);
            // 
            // playSoundOnChatMessageToolStripMenuItem
            // 
            this.playSoundOnChatMessageToolStripMenuItem.Name = "playSoundOnChatMessageToolStripMenuItem";
            this.playSoundOnChatMessageToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.playSoundOnChatMessageToolStripMenuItem.Text = "新消息时播放声音";
            this.playSoundOnChatMessageToolStripMenuItem.Click += new System.EventHandler(this.playSoundOnChatMessageToolStripMenuItem_Click);
            // 
            // whenOfflineGetWebsiteRequestsToolStripMenuItem
            // 
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Name = "whenOfflineGetWebsiteRequestsToolStripMenuItem";
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Text = "离线时仍获取网站访问记录";
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem.Click += new System.EventHandler(this.whenOfflineGetWebsiteRequestsToolStripMenuItem_Click);
            // 
            // autoLoginToolStripMenuItem
            // 
            this.autoLoginToolStripMenuItem.CheckOnClick = true;
            this.autoLoginToolStripMenuItem.Name = "autoLoginToolStripMenuItem";
            this.autoLoginToolStripMenuItem.Size = new System.Drawing.Size(214, 22);
            this.autoLoginToolStripMenuItem.Text = "自动登录";
            this.autoLoginToolStripMenuItem.Click += new System.EventHandler(this.autoLoginToolStripMenuItem_Click);
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
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.检查升级CToolStripMenuItem,
            this.toolStripSeparator4,
            this.购买服务BToolStripMenuItem,
            this.联系我们UToolStripMenuItem,
            this.软件手册MToolStripMenuItem,
            this.官方网站ToolStripMenuItem,
            this.关于AToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.helpToolStripMenuItem.Text = "帮助(&H)";
            // 
            // 检查升级CToolStripMenuItem
            // 
            this.检查升级CToolStripMenuItem.Name = "检查升级CToolStripMenuItem";
            this.检查升级CToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.检查升级CToolStripMenuItem.Text = "检查升级(&C)";
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(169, 6);
            // 
            // 购买服务BToolStripMenuItem
            // 
            this.购买服务BToolStripMenuItem.Name = "购买服务BToolStripMenuItem";
            this.购买服务BToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.购买服务BToolStripMenuItem.Text = "购买服务(&B)";
            // 
            // 联系我们UToolStripMenuItem
            // 
            this.联系我们UToolStripMenuItem.Name = "联系我们UToolStripMenuItem";
            this.联系我们UToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.联系我们UToolStripMenuItem.Text = "联系我们(&U)";
            // 
            // 软件手册MToolStripMenuItem
            // 
            this.软件手册MToolStripMenuItem.Name = "软件手册MToolStripMenuItem";
            this.软件手册MToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.软件手册MToolStripMenuItem.Text = "软件手册(&M)";
            // 
            // 官方网站ToolStripMenuItem
            // 
            this.官方网站ToolStripMenuItem.Name = "官方网站ToolStripMenuItem";
            this.官方网站ToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.官方网站ToolStripMenuItem.Text = "官方网站(&H)";
            // 
            // 关于AToolStripMenuItem
            // 
            this.关于AToolStripMenuItem.Name = "关于AToolStripMenuItem";
            this.关于AToolStripMenuItem.Size = new System.Drawing.Size(172, 22);
            this.关于AToolStripMenuItem.Text = "关于座席客户端(&A)";
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
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(365, 7);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 12);
            this.label1.TabIndex = 9;
            this.label1.Text = "搜索访客:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(638, 3);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(156, 21);
            this.textBox1.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(564, 7);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 12);
            this.label2.TabIndex = 7;
            this.label2.Text = "地理位置:";
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
            this.lstVisitors.Size = new System.Drawing.Size(958, 226);
            this.lstVisitors.SmallImageList = this.imgIconSet;
            this.lstVisitors.TabIndex = 2;
            this.lstVisitors.UseCompatibleStateImageBehavior = false;
            this.lstVisitors.View = System.Windows.Forms.View.Details;
            this.lstVisitors.SelectedIndexChanged += new System.EventHandler(this.lstVisitors_SelectedIndexChanged);
            this.lstVisitors.ColumnClick += new System.Windows.Forms.ColumnClickEventHandler(this.lstVisitors_ColumnClick);
            // 
            // colName
            // 
            this.colName.DisplayIndex = 0;
            this.colName.Text = "访客";
            // 
            // colLocation
            // 
            this.colLocation.DisplayIndex = 1;
            this.colLocation.Text = "地理位置";
            this.colLocation.Width = 75;
            // 
            // colBrowser1
            // 
            this.colBrowser1.DisplayIndex = 2;
            this.colBrowser1.Text = "浏览器";
            // 
            // colVisitCount
            // 
            this.colVisitCount.Text = "来访次数";
            this.colVisitCount.Width = 73;
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
            this.inviteToolStripMenuItem.Click += new System.EventHandler(this.inviteToolStripMenuItem_Click);
            // 
            // acceptToolStripMenuItem
            // 
            this.acceptToolStripMenuItem.Name = "acceptToolStripMenuItem";
            this.acceptToolStripMenuItem.Size = new System.Drawing.Size(118, 22);
            this.acceptToolStripMenuItem.Text = "接受请求";
            this.acceptToolStripMenuItem.Click += new System.EventHandler(this.acceptToolStripMenuItem_Click);
            // 
            // tabChats
            // 
            this.tabChats.Controls.Add(this.tabPage1);
            this.tabChats.Controls.Add(this.tabPage2);
            this.tabChats.Controls.Add(this.tabPage3);
            this.tabChats.Controls.Add(this.tabPage4);
            this.tabChats.Controls.Add(this.tabPage5);
            this.tabChats.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabChats.Location = new System.Drawing.Point(0, 12);
            this.tabChats.Name = "tabChats";
            this.tabChats.SelectedIndex = 0;
            this.tabChats.Size = new System.Drawing.Size(750, 349);
            this.tabChats.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.WelCome;
            this.tabPage1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.tabPage1.Location = new System.Drawing.Point(4, 21);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(742, 324);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Tag = "";
            this.tabPage1.Text = "欢迎";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.messageendDateTimePicker);
            this.tabPage2.Controls.Add(this.messagebeginDateTimePicker);
            this.tabPage2.Controls.Add(this.btnSend);
            this.tabPage2.Controls.Add(this.lblMessageEndTime);
            this.tabPage2.Controls.Add(this.lblMessageBeginTime);
            this.tabPage2.Controls.Add(this.lstMessage);
            this.tabPage2.Location = new System.Drawing.Point(4, 21);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(742, 324);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "历史对话";
            this.tabPage2.UseVisualStyleBackColor = true;
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
            // btnSend
            // 
            this.btnSend.Location = new System.Drawing.Point(578, 20);
            this.btnSend.Name = "btnSend";
            this.btnSend.Size = new System.Drawing.Size(75, 23);
            this.btnSend.TabIndex = 14;
            this.btnSend.Text = "确   定";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
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
            // lstMessage
            // 
            this.lstMessage.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lstMessage.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colSource,
            this.colDestination,
            this.colText,
            this.colSentDate});
            this.lstMessage.GridLines = true;
            this.lstMessage.Location = new System.Drawing.Point(0, 61);
            this.lstMessage.Name = "lstMessage";
            this.lstMessage.Size = new System.Drawing.Size(742, 256);
            this.lstMessage.TabIndex = 15;
            this.lstMessage.UseCompatibleStateImageBehavior = false;
            this.lstMessage.View = System.Windows.Forms.View.Details;
            // 
            // colSource
            // 
            this.colSource.Text = "发送者";
            this.colSource.Width = 108;
            // 
            // colDestination
            // 
            this.colDestination.Text = "接受者";
            this.colDestination.Width = 78;
            // 
            // colText
            // 
            this.colText.Text = "消息内容";
            this.colText.Width = 213;
            // 
            // colSentDate
            // 
            this.colSentDate.Text = "发送时间";
            this.colSentDate.Width = 161;
            // 
            // tabPage3
            // 
            this.tabPage3.Location = new System.Drawing.Point(4, 21);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(742, 324);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "访客名片";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.requestendDateTimePicker);
            this.tabPage4.Controls.Add(this.requestbeginDateTimePicker);
            this.tabPage4.Controls.Add(this.btnOk);
            this.tabPage4.Controls.Add(this.lblREndTime);
            this.tabPage4.Controls.Add(this.lblRBeginTime);
            this.tabPage4.Controls.Add(this.lstPageRequest);
            this.tabPage4.Location = new System.Drawing.Point(4, 21);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(742, 324);
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
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(578, 18);
            this.btnOk.Name = "btnOk";
            this.btnOk.Size = new System.Drawing.Size(75, 23);
            this.btnOk.TabIndex = 6;
            this.btnOk.Text = "确   定";
            this.btnOk.UseVisualStyleBackColor = true;
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
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
            this.lstPageRequest.GridLines = true;
            this.lstPageRequest.Location = new System.Drawing.Point(0, 59);
            this.lstPageRequest.Name = "lstPageRequest";
            this.lstPageRequest.Size = new System.Drawing.Size(739, 273);
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
            // tabPage5
            // 
            this.tabPage5.AutoScroll = true;
            this.tabPage5.Controls.Add(browserLabel);
            this.tabPage5.Controls.Add(this.browserTextBox);
            this.tabPage5.Controls.Add(domainRequestedLabel);
            this.tabPage5.Controls.Add(this.domainRequestedTextBox);
            this.tabPage5.Controls.Add(iPLabel);
            this.tabPage5.Controls.Add(this.iPTextBox);
            this.tabPage5.Controls.Add(leaveTimeLabel);
            this.tabPage5.Controls.Add(this.leaveTimeDateTimePicker);
            this.tabPage5.Controls.Add(locationLabel);
            this.tabPage5.Controls.Add(this.locationTextBox);
            this.tabPage5.Controls.Add(pageRequestCountLabel);
            this.tabPage5.Controls.Add(this.pageRequestCountTextBox);
            this.tabPage5.Controls.Add(pageRequestedLabel);
            this.tabPage5.Controls.Add(this.pageRequestedTextBox);
            this.tabPage5.Controls.Add(referrerLabel);
            this.tabPage5.Controls.Add(this.referrerTextBox);
            this.tabPage5.Controls.Add(visitingTimeLabel);
            this.tabPage5.Controls.Add(this.visitingTimeDateTimePicker);
            this.tabPage5.Controls.Add(emailLabel);
            this.tabPage5.Controls.Add(this.emailTextBox);
            this.tabPage5.Controls.Add(nameLabel);
            this.tabPage5.Controls.Add(this.nameTextBox);
            this.tabPage5.Controls.Add(reMarkLabel);
            this.tabPage5.Controls.Add(this.reMarkTextBox);
            this.tabPage5.Controls.Add(visitCountLabel);
            this.tabPage5.Controls.Add(this.visitCountTextBox);
            this.tabPage5.Controls.Add(visitorIdLabel);
            this.tabPage5.Controls.Add(this.visitorIdTextBox);
            this.tabPage5.Location = new System.Drawing.Point(4, 21);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(742, 324);
            this.tabPage5.TabIndex = 4;
            this.tabPage5.Text = "访客详情";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // browserTextBox
            // 
            this.browserTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Browser", true));
            this.browserTextBox.Location = new System.Drawing.Point(148, 143);
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
            this.domainRequestedTextBox.Location = new System.Drawing.Point(148, 361);
            this.domainRequestedTextBox.Name = "domainRequestedTextBox";
            this.domainRequestedTextBox.Size = new System.Drawing.Size(200, 21);
            this.domainRequestedTextBox.TabIndex = 25;
            // 
            // iPTextBox
            // 
            this.iPTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.IP", true));
            this.iPTextBox.Location = new System.Drawing.Point(148, 176);
            this.iPTextBox.Name = "iPTextBox";
            this.iPTextBox.Size = new System.Drawing.Size(200, 21);
            this.iPTextBox.TabIndex = 27;
            // 
            // leaveTimeDateTimePicker
            // 
            this.leaveTimeDateTimePicker.DataBindings.Add(new System.Windows.Forms.Binding("Value", this.visitorBindingSource, "CurrentSession.LeaveTime", true));
            this.leaveTimeDateTimePicker.Location = new System.Drawing.Point(148, 203);
            this.leaveTimeDateTimePicker.Name = "leaveTimeDateTimePicker";
            this.leaveTimeDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.leaveTimeDateTimePicker.TabIndex = 29;
            // 
            // locationTextBox
            // 
            this.locationTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Location", true));
            this.locationTextBox.Location = new System.Drawing.Point(148, 237);
            this.locationTextBox.Name = "locationTextBox";
            this.locationTextBox.Size = new System.Drawing.Size(200, 21);
            this.locationTextBox.TabIndex = 31;
            // 
            // pageRequestCountTextBox
            // 
            this.pageRequestCountTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.PageRequestCount", true));
            this.pageRequestCountTextBox.Location = new System.Drawing.Point(148, 268);
            this.pageRequestCountTextBox.Name = "pageRequestCountTextBox";
            this.pageRequestCountTextBox.Size = new System.Drawing.Size(200, 21);
            this.pageRequestCountTextBox.TabIndex = 35;
            // 
            // pageRequestedTextBox
            // 
            this.pageRequestedTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.PageRequested", true));
            this.pageRequestedTextBox.Location = new System.Drawing.Point(148, 301);
            this.pageRequestedTextBox.Name = "pageRequestedTextBox";
            this.pageRequestedTextBox.Size = new System.Drawing.Size(200, 21);
            this.pageRequestedTextBox.TabIndex = 37;
            // 
            // referrerTextBox
            // 
            this.referrerTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Referrer", true));
            this.referrerTextBox.Location = new System.Drawing.Point(148, 328);
            this.referrerTextBox.Name = "referrerTextBox";
            this.referrerTextBox.Size = new System.Drawing.Size(200, 21);
            this.referrerTextBox.TabIndex = 39;
            // 
            // visitingTimeDateTimePicker
            // 
            this.visitingTimeDateTimePicker.DataBindings.Add(new System.Windows.Forms.Binding("Value", this.visitorBindingSource, "CurrentSession.VisitingTime", true));
            this.visitingTimeDateTimePicker.Location = new System.Drawing.Point(148, 390);
            this.visitingTimeDateTimePicker.Name = "visitingTimeDateTimePicker";
            this.visitingTimeDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.visitingTimeDateTimePicker.TabIndex = 45;
            // 
            // emailTextBox
            // 
            this.emailTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "Email", true));
            this.emailTextBox.Location = new System.Drawing.Point(148, 39);
            this.emailTextBox.Name = "emailTextBox";
            this.emailTextBox.Size = new System.Drawing.Size(200, 21);
            this.emailTextBox.TabIndex = 5;
            // 
            // nameTextBox
            // 
            this.nameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "Name", true));
            this.nameTextBox.Location = new System.Drawing.Point(148, 62);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.Size = new System.Drawing.Size(200, 21);
            this.nameTextBox.TabIndex = 9;
            // 
            // reMarkTextBox
            // 
            this.reMarkTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "ReMark", true));
            this.reMarkTextBox.Location = new System.Drawing.Point(148, 89);
            this.reMarkTextBox.Name = "reMarkTextBox";
            this.reMarkTextBox.Size = new System.Drawing.Size(200, 21);
            this.reMarkTextBox.TabIndex = 11;
            // 
            // visitCountTextBox
            // 
            this.visitCountTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "VisitCount", true));
            this.visitCountTextBox.Location = new System.Drawing.Point(148, 116);
            this.visitCountTextBox.Name = "visitCountTextBox";
            this.visitCountTextBox.Size = new System.Drawing.Size(200, 21);
            this.visitCountTextBox.TabIndex = 13;
            // 
            // visitorIdTextBox
            // 
            this.visitorIdTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "VisitorId", true));
            this.visitorIdTextBox.Location = new System.Drawing.Point(148, 13);
            this.visitorIdTextBox.Name = "visitorIdTextBox";
            this.visitorIdTextBox.Size = new System.Drawing.Size(200, 21);
            this.visitorIdTextBox.TabIndex = 15;
            // 
            // tmrCheckRequests
            // 
            this.tmrCheckRequests.Enabled = true;
            this.tmrCheckRequests.Interval = 3500;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // mainSplitContainer
            // 
            this.mainSplitContainer.BackColor = System.Drawing.Color.Transparent;
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
            this.mainSplitContainer.Panel2.BackColor = System.Drawing.Color.Transparent;
            this.mainSplitContainer.Panel2.Controls.Add(this.visitorSessionSplitContainer);
            this.mainSplitContainer.Size = new System.Drawing.Size(958, 591);
            this.mainSplitContainer.SplitterDistance = 226;
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
            this.visitorSessionSplitContainer.Panel1.Controls.Add(this.panel1);
            // 
            // visitorSessionSplitContainer.Panel2
            // 
            this.visitorSessionSplitContainer.Panel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.visitorSessionSplitContainer.Panel2.Controls.Add(this.tabChats);
            this.visitorSessionSplitContainer.Panel2.Controls.Add(this.访客信息栏);
            this.visitorSessionSplitContainer.Size = new System.Drawing.Size(958, 361);
            this.visitorSessionSplitContainer.SplitterDistance = 204;
            this.visitorSessionSplitContainer.TabIndex = 3;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.operatorPannel1);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(204, 361);
            this.panel1.TabIndex = 0;
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Dock = System.Windows.Forms.DockStyle.Top;
            this.label3.Location = new System.Drawing.Point(0, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(204, 12);
            this.label3.TabIndex = 1;
            this.label3.Text = "客服栏";
            // 
            // 访客信息栏
            // 
            this.访客信息栏.BackColor = System.Drawing.Color.Transparent;
            this.访客信息栏.Dock = System.Windows.Forms.DockStyle.Top;
            this.访客信息栏.Location = new System.Drawing.Point(0, 0);
            this.访客信息栏.Name = "访客信息栏";
            this.访客信息栏.Size = new System.Drawing.Size(750, 12);
            this.访客信息栏.TabIndex = 0;
            this.访客信息栏.Text = "访客信息栏";
            // 
            // treeView1
            // 
            this.treeView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeView1.Location = new System.Drawing.Point(0, 12);
            this.treeView1.Name = "treeView1";
            treeNode3.Name = "节点0";
            treeNode3.Text = "在线客服";
            treeNode4.Name = "节点1";
            treeNode4.Text = "离线客服";
            this.treeView1.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode3,
            treeNode4});
            this.treeView1.Size = new System.Drawing.Size(204, 486);
            this.treeView1.TabIndex = 0;
            // 
            // notifyIcon
            // 
            this.notifyIcon.BalloonTipText = "座席客户端仍在运行中, 点击图标打开";
            this.notifyIcon.ContextMenuStrip = this.notifyIconContextMenuStrip;
            this.notifyIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("notifyIcon.Icon")));
            this.notifyIcon.Text = "notifyIcon1";
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
            this.changeAccountToolStripMenuItem.Click += new System.EventHandler(this.connectToolStripMenuItem_Click);
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
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(483, 17);
            this.toolStripStatusLabel1.Spring = true;
            this.toolStripStatusLabel1.Text = "信息提示";
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
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
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
            // operatorPannel1
            // 
            this.operatorPannel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.operatorPannel1.Location = new System.Drawing.Point(0, 12);
            this.operatorPannel1.Name = "operatorPannel1";
            this.operatorPannel1.Size = new System.Drawing.Size(204, 349);
            this.operatorPannel1.TabIndex = 2;
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
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.mainMenu;
            this.Name = "MainForm";
            this.Text = "座席客户端";
            this.TransparencyKey = System.Drawing.Color.LightSteelBlue;
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
            this.Resize += new System.EventHandler(this.MainForm_Resize);
            this.mainMenu.ResumeLayout(false);
            this.mainMenu.PerformLayout();
            this.pnlChat.ResumeLayout(false);
            this.pnlChat.PerformLayout();
            this.contextMenuStrip1.ResumeLayout(false);
            this.tabChats.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage4.ResumeLayout(false);
            this.tabPage4.PerformLayout();
            this.tabPage5.ResumeLayout(false);
            this.tabPage5.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.visitorBindingSource)).EndInit();
            this.mainSplitContainer.Panel1.ResumeLayout(false);
            this.mainSplitContainer.Panel2.ResumeLayout(false);
            this.mainSplitContainer.ResumeLayout(false);
            this.visitorSessionSplitContainer.Panel1.ResumeLayout(false);
            this.visitorSessionSplitContainer.Panel2.ResumeLayout(false);
            this.visitorSessionSplitContainer.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
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
        private System.Windows.Forms.ToolStripMenuItem connectToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cannedMessagesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem presetLinksToolStripMenuItem;
        private System.Windows.Forms.Timer tmrCheckRequests;
        private System.Windows.Forms.TabControl tabChats;
        private System.Windows.Forms.ToolStripMenuItem playSoundOnChatRequestToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem playSoundOnChatMessageToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem whenOfflineGetWebsiteRequestsToolStripMenuItem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem inviteToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem acceptToolStripMenuItem;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.SplitContainer mainSplitContainer;
        private System.Windows.Forms.ToolStripMenuItem 关于AToolStripMenuItem;
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
        private System.Windows.Forms.ToolStripMenuItem 检查升级CToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripMenuItem 购买服务BToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 联系我们UToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 软件手册MToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 官方网站ToolStripMenuItem;
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
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.TabPage tabPage5;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label 访客信息栏;
        private System.Windows.Forms.ToolStripMenuItem 客服栏OToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 访客信息栏VToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator6;
        private System.Windows.Forms.Timer loginTimer;
        private System.Windows.Forms.Timer timer1;
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
        private System.Windows.Forms.TextBox browserTextBox;
        private System.Windows.Forms.BindingSource visitorBindingSource;
        private System.Windows.Forms.TextBox iPTextBox;
        private System.Windows.Forms.DateTimePicker leaveTimeDateTimePicker;
        private System.Windows.Forms.TextBox locationTextBox;
        private System.Windows.Forms.TextBox pageRequestCountTextBox;
        private System.Windows.Forms.TextBox pageRequestedTextBox;
        private System.Windows.Forms.TextBox referrerTextBox;
        private System.Windows.Forms.DateTimePicker visitingTimeDateTimePicker;
        private System.Windows.Forms.TextBox emailTextBox;
        private System.Windows.Forms.TextBox nameTextBox;
        private System.Windows.Forms.TextBox reMarkTextBox;
        private System.Windows.Forms.TextBox visitCountTextBox;
        private System.Windows.Forms.TextBox visitorIdTextBox;
        private System.Windows.Forms.TextBox domainRequestedTextBox;
        private System.Windows.Forms.ToolStripMenuItem adminToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 创建交流按钮CToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem resetpasswordToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rejiggerpasswordToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem autoLoginToolStripMenuItem;
        private System.Windows.Forms.Label lblREndTime;
        private System.Windows.Forms.Label lblRBeginTime;
        private System.Windows.Forms.Button btnOk;
        private System.Windows.Forms.ListView lstPageRequest;
        private System.Windows.Forms.ColumnHeader colPage;
        private System.Windows.Forms.ColumnHeader colRTime;
        private System.Windows.Forms.ColumnHeader colReferrer;
        private System.Windows.Forms.Button btnSend;
        private System.Windows.Forms.Label lblMessageEndTime;
        private System.Windows.Forms.Label lblMessageBeginTime;
        private System.Windows.Forms.ListView lstMessage;
        private System.Windows.Forms.ColumnHeader colSource;
        private System.Windows.Forms.ColumnHeader colDestination;
        private System.Windows.Forms.ColumnHeader colText;
        private System.Windows.Forms.ColumnHeader colSentDate;
        private System.Windows.Forms.DateTimePicker requestendDateTimePicker;
        private System.Windows.Forms.DateTimePicker requestbeginDateTimePicker;
        private System.Windows.Forms.DateTimePicker messageendDateTimePicker;
        private System.Windows.Forms.DateTimePicker messagebeginDateTimePicker;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private OperatorPannel operatorPannel1;
        private System.Windows.Forms.ImageList imgIconSet;
    }
}