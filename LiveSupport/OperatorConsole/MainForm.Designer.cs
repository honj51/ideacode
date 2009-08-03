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
            System.Windows.Forms.Label callerDateLabel;
            System.Windows.Forms.Label callerNameLabel;
            System.Windows.Forms.Label contentLabel;
            System.Windows.Forms.Label emailLabel1;
            System.Windows.Forms.Label ipLabel1;
            System.Windows.Forms.Label operatorNameLabel;
            System.Windows.Forms.Label phoneLabel;
            System.Windows.Forms.Label senddateLabel;
            System.Windows.Forms.Label subjectLabel;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("在线客服");
            System.Windows.Forms.TreeNode treeNode2 = new System.Windows.Forms.TreeNode("离线客服");
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.operatorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.myAccountToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.changePasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.changeOperatorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.operatorsInfoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.visitorInfoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.adminToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.getWebSiteCodeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.resetpasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.settalkToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.manageOperatorsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.configureDomainsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.viewAllChatsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.viewAllLeaveMessagesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.viewStatusticsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.OptionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.administrationToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatRequestToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playSoundOnChatMessageToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.whenOfflineGetWebsiteRequestsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.autoLoginToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.autostartToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.paymentToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.touchToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.handBookToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.lblDomainName = new System.Windows.Forms.Label();
            this.cbxDomainName = new System.Windows.Forms.ComboBox();
            this.lstVisitors = new System.Windows.Forms.ListView();
            this.colBrowser1 = new System.Windows.Forms.ColumnHeader();
            this.colName = new System.Windows.Forms.ColumnHeader();
            this.colDomainRequested = new System.Windows.Forms.ColumnHeader();
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
            this.mainSplitContainer2 = new System.Windows.Forms.SplitContainer();
            this.tabChats = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
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
            this.messageendDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.messagebeginDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.btnSearchHistoryChatMsg = new System.Windows.Forms.Button();
            this.lblMessageEndTime = new System.Windows.Forms.Label();
            this.lblMessageBeginTime = new System.Windows.Forms.Label();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.requestendDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.requestbeginDateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.btnSearchHistoryPageRequests = new System.Windows.Forms.Button();
            this.lblREndTime = new System.Windows.Forms.Label();
            this.lblRBeginTime = new System.Windows.Forms.Label();
            this.lstPageRequest = new System.Windows.Forms.ListView();
            this.colPage = new System.Windows.Forms.ColumnHeader();
            this.colRTime = new System.Windows.Forms.ColumnHeader();
            this.colReferrer = new System.Windows.Forms.ColumnHeader();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.leaveWordDataGridView = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn8 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.IsReplied = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.leaveWordBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.txtDomainRequested = new System.Windows.Forms.TextBox();
            this.lblDomainRequested = new System.Windows.Forms.Label();
            this.btnDelLeaveWord = new System.Windows.Forms.Button();
            this.btnSend = new System.Windows.Forms.Button();
            this.callerDateTextBox = new System.Windows.Forms.TextBox();
            this.callerNameTextBox = new System.Windows.Forms.TextBox();
            this.contentTextBox = new System.Windows.Forms.TextBox();
            this.emailTextBox1 = new System.Windows.Forms.TextBox();
            this.ipTextBox1 = new System.Windows.Forms.TextBox();
            this.isRepliedCheckBox = new System.Windows.Forms.CheckBox();
            this.operatorNameTextBox = new System.Windows.Forms.TextBox();
            this.phoneTextBox = new System.Windows.Forms.TextBox();
            this.senddateTextBox = new System.Windows.Forms.TextBox();
            this.subjectTextBox = new System.Windows.Forms.TextBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.operatorsPanel = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.notifyIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.notifyIconContextMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.restartConnectionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.changeAccountToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
            this.inviteToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator6 = new System.Windows.Forms.ToolStripSeparator();
            this.acceptToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.operatorToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.powerToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.stateToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.stickToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.loginTimer = new System.Windows.Forms.Timer(this.components);
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.mainSplitContainer1 = new System.Windows.Forms.SplitContainer();
            this.webBrowser1 = new System.Windows.Forms.WebBrowser();
            this.toolStrip2 = new System.Windows.Forms.ToolStrip();
            this.toolStripButtonReturnToOperator = new System.Windows.Forms.ToolStripButton();
            this.toolStripButtonRefresh = new System.Windows.Forms.ToolStripButton();
            this.toolStrip3 = new System.Windows.Forms.ToolStrip();
            this.toolStripSeparator7 = new System.Windows.Forms.ToolStripSeparator();
            this.myChatToolStripLabel = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator8 = new System.Windows.Forms.ToolStripSeparator();
            this.visitorOnChatToolStripLabel = new System.Windows.Forms.ToolStripLabel();
            this.currentVisitorsToolStripLabel = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator9 = new System.Windows.Forms.ToolStripSeparator();
            this.colReferer = new System.Windows.Forms.ColumnHeader();
            this.operatorPannel1 = new LiveSupport.OperatorConsole.OperatorPannel();
            this.chatMessageViewerControl1 = new LiveSupport.OperatorConsole.ChatMessageViewerControl();
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
            callerDateLabel = new System.Windows.Forms.Label();
            callerNameLabel = new System.Windows.Forms.Label();
            contentLabel = new System.Windows.Forms.Label();
            emailLabel1 = new System.Windows.Forms.Label();
            ipLabel1 = new System.Windows.Forms.Label();
            operatorNameLabel = new System.Windows.Forms.Label();
            phoneLabel = new System.Windows.Forms.Label();
            senddateLabel = new System.Windows.Forms.Label();
            subjectLabel = new System.Windows.Forms.Label();
            this.mainMenu.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.mainSplitContainer2.Panel1.SuspendLayout();
            this.mainSplitContainer2.Panel2.SuspendLayout();
            this.mainSplitContainer2.SuspendLayout();
            this.tabChats.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.visitorBindingSource)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.leaveWordDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.leaveWordBindingSource)).BeginInit();
            this.panel2.SuspendLayout();
            this.operatorsPanel.SuspendLayout();
            this.notifyIconContextMenuStrip.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            this.mainSplitContainer1.Panel1.SuspendLayout();
            this.mainSplitContainer1.Panel2.SuspendLayout();
            this.mainSplitContainer1.SuspendLayout();
            this.toolStrip2.SuspendLayout();
            this.toolStrip3.SuspendLayout();
            this.SuspendLayout();
            // 
            // visitorIdLabel
            // 
            visitorIdLabel.AutoSize = true;
            visitorIdLabel.Location = new System.Drawing.Point(63, 47);
            visitorIdLabel.Name = "visitorIdLabel";
            visitorIdLabel.Size = new System.Drawing.Size(47, 12);
            visitorIdLabel.TabIndex = 14;
            visitorIdLabel.Text = "访客ID:";
            // 
            // visitCountLabel
            // 
            visitCountLabel.AutoSize = true;
            visitCountLabel.Location = new System.Drawing.Point(63, 150);
            visitCountLabel.Name = "visitCountLabel";
            visitCountLabel.Size = new System.Drawing.Size(59, 12);
            visitCountLabel.TabIndex = 12;
            visitCountLabel.Text = "访问次数:";
            // 
            // reMarkLabel
            // 
            reMarkLabel.AutoSize = true;
            reMarkLabel.Location = new System.Drawing.Point(63, 123);
            reMarkLabel.Name = "reMarkLabel";
            reMarkLabel.Size = new System.Drawing.Size(35, 12);
            reMarkLabel.TabIndex = 10;
            reMarkLabel.Text = "备注:";
            // 
            // nameLabel
            // 
            nameLabel.AutoSize = true;
            nameLabel.Location = new System.Drawing.Point(63, 96);
            nameLabel.Name = "nameLabel";
            nameLabel.Size = new System.Drawing.Size(59, 12);
            nameLabel.TabIndex = 8;
            nameLabel.Text = "访客名称:";
            // 
            // emailLabel
            // 
            emailLabel.AutoSize = true;
            emailLabel.Location = new System.Drawing.Point(63, 73);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new System.Drawing.Size(59, 12);
            emailLabel.TabIndex = 4;
            emailLabel.Text = "电子邮件:";
            // 
            // visitingTimeLabel
            // 
            visitingTimeLabel.AutoSize = true;
            visitingTimeLabel.Location = new System.Drawing.Point(63, 428);
            visitingTimeLabel.Name = "visitingTimeLabel";
            visitingTimeLabel.Size = new System.Drawing.Size(83, 12);
            visitingTimeLabel.TabIndex = 44;
            visitingTimeLabel.Text = "页面访问时间:";
            // 
            // referrerLabel
            // 
            referrerLabel.AutoSize = true;
            referrerLabel.Location = new System.Drawing.Point(63, 371);
            referrerLabel.Name = "referrerLabel";
            referrerLabel.Size = new System.Drawing.Size(59, 12);
            referrerLabel.TabIndex = 38;
            referrerLabel.Text = "引用页面:";
            // 
            // pageRequestedLabel
            // 
            pageRequestedLabel.AutoSize = true;
            pageRequestedLabel.Location = new System.Drawing.Point(63, 338);
            pageRequestedLabel.Name = "pageRequestedLabel";
            pageRequestedLabel.Size = new System.Drawing.Size(59, 12);
            pageRequestedLabel.TabIndex = 36;
            pageRequestedLabel.Text = "请求页面:";
            // 
            // pageRequestCountLabel
            // 
            pageRequestCountLabel.AutoSize = true;
            pageRequestCountLabel.Location = new System.Drawing.Point(63, 305);
            pageRequestCountLabel.Name = "pageRequestCountLabel";
            pageRequestCountLabel.Size = new System.Drawing.Size(71, 12);
            pageRequestCountLabel.TabIndex = 34;
            pageRequestCountLabel.Text = "浏览页面数:";
            // 
            // locationLabel
            // 
            locationLabel.AutoSize = true;
            locationLabel.Location = new System.Drawing.Point(63, 271);
            locationLabel.Name = "locationLabel";
            locationLabel.Size = new System.Drawing.Size(59, 12);
            locationLabel.TabIndex = 30;
            locationLabel.Text = "地理位置:";
            // 
            // leaveTimeLabel
            // 
            leaveTimeLabel.AutoSize = true;
            leaveTimeLabel.Location = new System.Drawing.Point(63, 238);
            leaveTimeLabel.Name = "leaveTimeLabel";
            leaveTimeLabel.Size = new System.Drawing.Size(59, 12);
            leaveTimeLabel.TabIndex = 28;
            leaveTimeLabel.Text = "离开时间:";
            // 
            // iPLabel
            // 
            iPLabel.AutoSize = true;
            iPLabel.Location = new System.Drawing.Point(63, 210);
            iPLabel.Name = "iPLabel";
            iPLabel.Size = new System.Drawing.Size(23, 12);
            iPLabel.TabIndex = 26;
            iPLabel.Text = "IP:";
            // 
            // domainRequestedLabel
            // 
            domainRequestedLabel.AutoSize = true;
            domainRequestedLabel.Location = new System.Drawing.Point(63, 395);
            domainRequestedLabel.Name = "domainRequestedLabel";
            domainRequestedLabel.Size = new System.Drawing.Size(59, 12);
            domainRequestedLabel.TabIndex = 24;
            domainRequestedLabel.Text = "请求域名:";
            // 
            // browserLabel
            // 
            browserLabel.AutoSize = true;
            browserLabel.Location = new System.Drawing.Point(63, 177);
            browserLabel.Name = "browserLabel";
            browserLabel.Size = new System.Drawing.Size(47, 12);
            browserLabel.TabIndex = 16;
            browserLabel.Text = "浏览器:";
            // 
            // callerDateLabel
            // 
            callerDateLabel.AutoSize = true;
            callerDateLabel.Location = new System.Drawing.Point(23, 42);
            callerDateLabel.Name = "callerDateLabel";
            callerDateLabel.Size = new System.Drawing.Size(59, 12);
            callerDateLabel.TabIndex = 0;
            callerDateLabel.Text = "留言时间:";
            // 
            // callerNameLabel
            // 
            callerNameLabel.AutoSize = true;
            callerNameLabel.Location = new System.Drawing.Point(23, 69);
            callerNameLabel.Name = "callerNameLabel";
            callerNameLabel.Size = new System.Drawing.Size(47, 12);
            callerNameLabel.TabIndex = 2;
            callerNameLabel.Text = "留言者:";
            // 
            // contentLabel
            // 
            contentLabel.AutoSize = true;
            contentLabel.Location = new System.Drawing.Point(23, 150);
            contentLabel.Name = "contentLabel";
            contentLabel.Size = new System.Drawing.Size(35, 12);
            contentLabel.TabIndex = 4;
            contentLabel.Text = "内容:";
            // 
            // emailLabel1
            // 
            emailLabel1.AutoSize = true;
            emailLabel1.Location = new System.Drawing.Point(245, 42);
            emailLabel1.Name = "emailLabel1";
            emailLabel1.Size = new System.Drawing.Size(41, 12);
            emailLabel1.TabIndex = 6;
            emailLabel1.Text = "Email:";
            // 
            // ipLabel1
            // 
            ipLabel1.AutoSize = true;
            ipLabel1.Location = new System.Drawing.Point(247, 99);
            ipLabel1.Name = "ipLabel1";
            ipLabel1.Size = new System.Drawing.Size(17, 12);
            ipLabel1.TabIndex = 10;
            ipLabel1.Text = "IP";
            // 
            // operatorNameLabel
            // 
            operatorNameLabel.AutoSize = true;
            operatorNameLabel.Location = new System.Drawing.Point(22, 96);
            operatorNameLabel.Name = "operatorNameLabel";
            operatorNameLabel.Size = new System.Drawing.Size(47, 12);
            operatorNameLabel.TabIndex = 16;
            operatorNameLabel.Text = "回复者:";
            // 
            // phoneLabel
            // 
            phoneLabel.AutoSize = true;
            phoneLabel.Location = new System.Drawing.Point(245, 69);
            phoneLabel.Name = "phoneLabel";
            phoneLabel.Size = new System.Drawing.Size(59, 12);
            phoneLabel.TabIndex = 18;
            phoneLabel.Text = "联系电话:";
            // 
            // senddateLabel
            // 
            senddateLabel.AutoSize = true;
            senddateLabel.Location = new System.Drawing.Point(21, 308);
            senddateLabel.Name = "senddateLabel";
            senddateLabel.Size = new System.Drawing.Size(59, 12);
            senddateLabel.TabIndex = 20;
            senddateLabel.Text = "回复时间:";
            // 
            // subjectLabel
            // 
            subjectLabel.AutoSize = true;
            subjectLabel.Location = new System.Drawing.Point(22, 126);
            subjectLabel.Name = "subjectLabel";
            subjectLabel.Size = new System.Drawing.Size(35, 12);
            subjectLabel.TabIndex = 22;
            subjectLabel.Text = "主题:";
            // 
            // mainMenu
            // 
            this.mainMenu.BackColor = System.Drawing.Color.Transparent;
            this.mainMenu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.operatorToolStripMenuItem,
            this.toolsToolStripMenuItem,
            this.adminToolStripMenuItem,
            this.ToolStripMenuItem,
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
            this.myAccountToolStripMenuItem,
            this.changePasswordToolStripMenuItem,
            this.toolStripMenuItem1,
            this.changeOperatorToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.operatorToolStripMenuItem.Name = "operatorToolStripMenuItem";
            this.operatorToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.operatorToolStripMenuItem.Text = "操作(&F)";
            // 
            // myAccountToolStripMenuItem
            // 
            this.myAccountToolStripMenuItem.Name = "myAccountToolStripMenuItem";
            this.myAccountToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.myAccountToolStripMenuItem.Text = "我的帐户(&A)";
            this.myAccountToolStripMenuItem.Click += new System.EventHandler(this.myAccountToolStripMenuItem_Click);
            // 
            // changePasswordToolStripMenuItem
            // 
            this.changePasswordToolStripMenuItem.Name = "changePasswordToolStripMenuItem";
            this.changePasswordToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.changePasswordToolStripMenuItem.Text = "修改密码(&P)";
            this.changePasswordToolStripMenuItem.Click += new System.EventHandler(this.changePasswordToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(156, 6);
            // 
            // changeOperatorToolStripMenuItem
            // 
            this.changeOperatorToolStripMenuItem.Name = "changeOperatorToolStripMenuItem";
            this.changeOperatorToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F11;
            this.changeOperatorToolStripMenuItem.Size = new System.Drawing.Size(159, 22);
            this.changeOperatorToolStripMenuItem.Text = "更改账户(&C)";
            this.changeOperatorToolStripMenuItem.Click += new System.EventHandler(this.changeOperatorToolStripMenuItem_Click);
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
            this.operatorsInfoToolStripMenuItem,
            this.visitorInfoToolStripMenuItem});
            this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
            this.toolsToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.toolsToolStripMenuItem.Text = "视图(&V)";
            // 
            // operatorsInfoToolStripMenuItem
            // 
            this.operatorsInfoToolStripMenuItem.Checked = true;
            this.operatorsInfoToolStripMenuItem.CheckOnClick = true;
            this.operatorsInfoToolStripMenuItem.CheckState = System.Windows.Forms.CheckState.Checked;
            this.operatorsInfoToolStripMenuItem.Name = "operatorsInfoToolStripMenuItem";
            this.operatorsInfoToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.operatorsInfoToolStripMenuItem.Text = "客服栏(&O)";
            this.operatorsInfoToolStripMenuItem.Click += new System.EventHandler(this.operatorsInfoToolStripMenuItem_Click);
            // 
            // visitorInfoToolStripMenuItem
            // 
            this.visitorInfoToolStripMenuItem.Checked = true;
            this.visitorInfoToolStripMenuItem.CheckOnClick = true;
            this.visitorInfoToolStripMenuItem.CheckState = System.Windows.Forms.CheckState.Checked;
            this.visitorInfoToolStripMenuItem.Name = "visitorInfoToolStripMenuItem";
            this.visitorInfoToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.visitorInfoToolStripMenuItem.Text = "访客信息栏(&V)";
            this.visitorInfoToolStripMenuItem.Click += new System.EventHandler(this.visitorInfoToolStripMenuItem_Click);
            // 
            // adminToolStripMenuItem
            // 
            this.adminToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.getWebSiteCodeToolStripMenuItem,
            this.toolStripSeparator4,
            this.resetpasswordToolStripMenuItem,
            this.settalkToolStripMenuItem,
            this.toolStripSeparator3,
            this.manageOperatorsToolStripMenuItem,
            this.configureDomainsToolStripMenuItem,
            this.viewAllChatsToolStripMenuItem,
            this.viewAllLeaveMessagesToolStripMenuItem,
            this.viewStatusticsToolStripMenuItem});
            this.adminToolStripMenuItem.Name = "adminToolStripMenuItem";
            this.adminToolStripMenuItem.Size = new System.Drawing.Size(71, 20);
            this.adminToolStripMenuItem.Text = "管理员(&A)";
            // 
            // getWebSiteCodeToolStripMenuItem
            // 
            this.getWebSiteCodeToolStripMenuItem.Name = "getWebSiteCodeToolStripMenuItem";
            this.getWebSiteCodeToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.getWebSiteCodeToolStripMenuItem.Text = "获取网站代码(&W)";
            this.getWebSiteCodeToolStripMenuItem.Click += new System.EventHandler(this.getWebSiteCodeToolStripMenuItem_Click);
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(163, 6);
            // 
            // resetpasswordToolStripMenuItem
            // 
            this.resetpasswordToolStripMenuItem.Name = "resetpasswordToolStripMenuItem";
            this.resetpasswordToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.resetpasswordToolStripMenuItem.Text = "重置座席密码(&R)";
            this.resetpasswordToolStripMenuItem.Click += new System.EventHandler(this.resetpasswordToolStripMenuItem_Click);
            // 
            // settalkToolStripMenuItem
            // 
            this.settalkToolStripMenuItem.Name = "settalkToolStripMenuItem";
            this.settalkToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.settalkToolStripMenuItem.Text = "设置快速回复";
            this.settalkToolStripMenuItem.Click += new System.EventHandler(this.settalkToolStripMenuItem_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(163, 6);
            // 
            // manageOperatorsToolStripMenuItem
            // 
            this.manageOperatorsToolStripMenuItem.Name = "manageOperatorsToolStripMenuItem";
            this.manageOperatorsToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.manageOperatorsToolStripMenuItem.Tag = "http://www.zxkefu.cn/AccountAdmin/OperatorsManagment.aspx";
            this.manageOperatorsToolStripMenuItem.Text = "管理客服";
            this.manageOperatorsToolStripMenuItem.Click += new System.EventHandler(this.openBrowser);
            // 
            // configureDomainsToolStripMenuItem
            // 
            this.configureDomainsToolStripMenuItem.Name = "configureDomainsToolStripMenuItem";
            this.configureDomainsToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.configureDomainsToolStripMenuItem.Tag = "http://www.zxkefu.cn/AccountAdmin/DomainName.aspx";
            this.configureDomainsToolStripMenuItem.Text = "管理域名";
            this.configureDomainsToolStripMenuItem.Click += new System.EventHandler(this.openBrowser);
            // 
            // viewAllChatsToolStripMenuItem
            // 
            this.viewAllChatsToolStripMenuItem.Name = "viewAllChatsToolStripMenuItem";
            this.viewAllChatsToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.viewAllChatsToolStripMenuItem.Tag = "http://www.zxkefu.cn/AccountAdmin/ChatAnnal.aspx";
            this.viewAllChatsToolStripMenuItem.Text = "查看所有聊天记录";
            this.viewAllChatsToolStripMenuItem.Click += new System.EventHandler(this.openBrowser);
            // 
            // viewAllLeaveMessagesToolStripMenuItem
            // 
            this.viewAllLeaveMessagesToolStripMenuItem.Name = "viewAllLeaveMessagesToolStripMenuItem";
            this.viewAllLeaveMessagesToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.viewAllLeaveMessagesToolStripMenuItem.Tag = "http://www.zxkefu.cn/AccountAdmin/CallerLeaveWord.aspx";
            this.viewAllLeaveMessagesToolStripMenuItem.Text = "查看所有留言";
            this.viewAllLeaveMessagesToolStripMenuItem.Click += new System.EventHandler(this.openBrowser);
            // 
            // viewStatusticsToolStripMenuItem
            // 
            this.viewStatusticsToolStripMenuItem.Name = "viewStatusticsToolStripMenuItem";
            this.viewStatusticsToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.viewStatusticsToolStripMenuItem.Tag = "http://www.zxkefu.cn/AccountAdmin/AccountHome.aspx";
            this.viewStatusticsToolStripMenuItem.Text = "查看统计报表";
            this.viewStatusticsToolStripMenuItem.Click += new System.EventHandler(this.openBrowser);
            // 
            // ToolStripMenuItem
            // 
            this.ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.OptionToolStripMenuItem});
            this.ToolStripMenuItem.Name = "ToolStripMenuItem";
            this.ToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.ToolStripMenuItem.Text = "工具(&O)";
            // 
            // OptionToolStripMenuItem
            // 
            this.OptionToolStripMenuItem.Name = "OptionToolStripMenuItem";
            this.OptionToolStripMenuItem.Size = new System.Drawing.Size(112, 22);
            this.OptionToolStripMenuItem.Text = "选项(&O)";
            this.OptionToolStripMenuItem.Click += new System.EventHandler(this.OptionToolStripMenuItem_Click);
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
            this.administrationToolStripMenuItem.Visible = false;
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
            // lblDomainName
            // 
            this.lblDomainName.AutoSize = true;
            this.lblDomainName.Location = new System.Drawing.Point(21, 12);
            this.lblDomainName.Name = "lblDomainName";
            this.lblDomainName.Size = new System.Drawing.Size(59, 12);
            this.lblDomainName.TabIndex = 9;
            this.lblDomainName.Text = "查询留言:";
            // 
            // cbxDomainName
            // 
            this.cbxDomainName.FormattingEnabled = true;
            this.cbxDomainName.Items.AddRange(new object[] {
            "查看全部留言"});
            this.cbxDomainName.Location = new System.Drawing.Point(88, 9);
            this.cbxDomainName.Name = "cbxDomainName";
            this.cbxDomainName.Size = new System.Drawing.Size(146, 20);
            this.cbxDomainName.TabIndex = 6;
            this.cbxDomainName.SelectedIndexChanged += new System.EventHandler(this.cbxDomainName_SelectedIndexChanged);
            // 
            // lstVisitors
            // 
            this.lstVisitors.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.lstVisitors.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colBrowser1,
            this.colName,
            this.colDomainRequested,
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
            this.colPageRequestCount,
            this.colReferer});
            this.lstVisitors.ContextMenuStrip = this.contextMenuStrip1;
            this.lstVisitors.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstVisitors.FullRowSelect = true;
            this.lstVisitors.GridLines = true;
            this.lstVisitors.Location = new System.Drawing.Point(0, 0);
            this.lstVisitors.MultiSelect = false;
            this.lstVisitors.Name = "lstVisitors";
            this.lstVisitors.Size = new System.Drawing.Size(755, 197);
            this.lstVisitors.SmallImageList = this.imgIconSet;
            this.lstVisitors.TabIndex = 2;
            this.lstVisitors.UseCompatibleStateImageBehavior = false;
            this.lstVisitors.View = System.Windows.Forms.View.Details;
            this.lstVisitors.SelectedIndexChanged += new System.EventHandler(this.lstVisitors_SelectedIndexChanged);
            this.lstVisitors.ColumnClick += new System.Windows.Forms.ColumnClickEventHandler(this.lstVisitors_ColumnClick);
            // 
            // colBrowser1
            // 
            this.colBrowser1.DisplayIndex = 3;
            this.colBrowser1.Text = "浏览器";
            // 
            // colName
            // 
            this.colName.DisplayIndex = 0;
            this.colName.Text = "访客";
            this.colName.Width = 80;
            // 
            // colDomainRequested
            // 
            this.colDomainRequested.DisplayIndex = 1;
            this.colDomainRequested.Text = "访问域名";
            this.colDomainRequested.Width = 77;
            // 
            // colLocation
            // 
            this.colLocation.DisplayIndex = 2;
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
            // mainSplitContainer2
            // 
            this.mainSplitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainSplitContainer2.Location = new System.Drawing.Point(0, 0);
            this.mainSplitContainer2.Name = "mainSplitContainer2";
            this.mainSplitContainer2.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // mainSplitContainer2.Panel1
            // 
            this.mainSplitContainer2.Panel1.Controls.Add(this.lstVisitors);
            // 
            // mainSplitContainer2.Panel2
            // 
            this.mainSplitContainer2.Panel2.Controls.Add(this.tabChats);
            this.mainSplitContainer2.Panel2.Controls.Add(this.panel2);
            this.mainSplitContainer2.Size = new System.Drawing.Size(755, 593);
            this.mainSplitContainer2.SplitterDistance = 197;
            this.mainSplitContainer2.TabIndex = 4;
            // 
            // tabChats
            // 
            this.tabChats.Controls.Add(this.tabPage1);
            this.tabChats.Controls.Add(this.tabPage2);
            this.tabChats.Controls.Add(this.tabPage3);
            this.tabChats.Controls.Add(this.tabPage4);
            this.tabChats.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabChats.Location = new System.Drawing.Point(0, 33);
            this.tabChats.Name = "tabChats";
            this.tabChats.SelectedIndex = 0;
            this.tabChats.ShowToolTips = true;
            this.tabChats.Size = new System.Drawing.Size(755, 359);
            this.tabChats.TabIndex = 0;
            this.tabChats.SelectedIndexChanged += new System.EventHandler(this.tabChats_SelectedIndexChanged);
            // 
            // tabPage1
            // 
            this.tabPage1.AutoScroll = true;
            this.tabPage1.Controls.Add(browserLabel);
            this.tabPage1.Controls.Add(this.browserTextBox);
            this.tabPage1.Controls.Add(this.domainRequestedTextBox);
            this.tabPage1.Controls.Add(this.iPTextBox);
            this.tabPage1.Controls.Add(this.locationTextBox);
            this.tabPage1.Controls.Add(this.pageRequestCountTextBox);
            this.tabPage1.Controls.Add(this.pageRequestedTextBox);
            this.tabPage1.Controls.Add(this.referrerTextBox);
            this.tabPage1.Controls.Add(this.emailTextBox);
            this.tabPage1.Controls.Add(this.nameTextBox);
            this.tabPage1.Controls.Add(this.reMarkTextBox);
            this.tabPage1.Controls.Add(this.visitCountTextBox);
            this.tabPage1.Controls.Add(this.visitorIdTextBox);
            this.tabPage1.Controls.Add(domainRequestedLabel);
            this.tabPage1.Controls.Add(iPLabel);
            this.tabPage1.Controls.Add(leaveTimeLabel);
            this.tabPage1.Controls.Add(this.leaveTimeDateTimePicker);
            this.tabPage1.Controls.Add(locationLabel);
            this.tabPage1.Controls.Add(pageRequestCountLabel);
            this.tabPage1.Controls.Add(pageRequestedLabel);
            this.tabPage1.Controls.Add(referrerLabel);
            this.tabPage1.Controls.Add(visitingTimeLabel);
            this.tabPage1.Controls.Add(this.visitingTimeDateTimePicker);
            this.tabPage1.Controls.Add(emailLabel);
            this.tabPage1.Controls.Add(nameLabel);
            this.tabPage1.Controls.Add(reMarkLabel);
            this.tabPage1.Controls.Add(visitCountLabel);
            this.tabPage1.Controls.Add(visitorIdLabel);
            this.tabPage1.Location = new System.Drawing.Point(4, 21);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(747, 334);
            this.tabPage1.TabIndex = 4;
            this.tabPage1.Text = "访客详情";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // browserTextBox
            // 
            this.browserTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Browser", true));
            this.browserTextBox.Location = new System.Drawing.Point(188, 174);
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
            this.domainRequestedTextBox.Location = new System.Drawing.Point(188, 395);
            this.domainRequestedTextBox.Name = "domainRequestedTextBox";
            this.domainRequestedTextBox.Size = new System.Drawing.Size(200, 21);
            this.domainRequestedTextBox.TabIndex = 25;
            // 
            // iPTextBox
            // 
            this.iPTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.IP", true));
            this.iPTextBox.Location = new System.Drawing.Point(188, 207);
            this.iPTextBox.Name = "iPTextBox";
            this.iPTextBox.Size = new System.Drawing.Size(200, 21);
            this.iPTextBox.TabIndex = 27;
            // 
            // locationTextBox
            // 
            this.locationTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Location", true));
            this.locationTextBox.Location = new System.Drawing.Point(188, 268);
            this.locationTextBox.Name = "locationTextBox";
            this.locationTextBox.Size = new System.Drawing.Size(200, 21);
            this.locationTextBox.TabIndex = 31;
            // 
            // pageRequestCountTextBox
            // 
            this.pageRequestCountTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.PageRequestCount", true));
            this.pageRequestCountTextBox.Location = new System.Drawing.Point(188, 302);
            this.pageRequestCountTextBox.Name = "pageRequestCountTextBox";
            this.pageRequestCountTextBox.Size = new System.Drawing.Size(200, 21);
            this.pageRequestCountTextBox.TabIndex = 35;
            // 
            // pageRequestedTextBox
            // 
            this.pageRequestedTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.PageRequested", true));
            this.pageRequestedTextBox.Location = new System.Drawing.Point(188, 335);
            this.pageRequestedTextBox.Name = "pageRequestedTextBox";
            this.pageRequestedTextBox.Size = new System.Drawing.Size(200, 21);
            this.pageRequestedTextBox.TabIndex = 37;
            // 
            // referrerTextBox
            // 
            this.referrerTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "CurrentSession.Referrer", true));
            this.referrerTextBox.Location = new System.Drawing.Point(188, 362);
            this.referrerTextBox.Name = "referrerTextBox";
            this.referrerTextBox.Size = new System.Drawing.Size(200, 21);
            this.referrerTextBox.TabIndex = 39;
            // 
            // emailTextBox
            // 
            this.emailTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "Email", true));
            this.emailTextBox.Location = new System.Drawing.Point(188, 70);
            this.emailTextBox.Name = "emailTextBox";
            this.emailTextBox.Size = new System.Drawing.Size(200, 21);
            this.emailTextBox.TabIndex = 5;
            // 
            // nameTextBox
            // 
            this.nameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "Name", true));
            this.nameTextBox.Location = new System.Drawing.Point(188, 93);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.Size = new System.Drawing.Size(200, 21);
            this.nameTextBox.TabIndex = 9;
            // 
            // reMarkTextBox
            // 
            this.reMarkTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "ReMark", true));
            this.reMarkTextBox.Location = new System.Drawing.Point(188, 120);
            this.reMarkTextBox.Name = "reMarkTextBox";
            this.reMarkTextBox.Size = new System.Drawing.Size(200, 21);
            this.reMarkTextBox.TabIndex = 11;
            // 
            // visitCountTextBox
            // 
            this.visitCountTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "VisitCount", true));
            this.visitCountTextBox.Location = new System.Drawing.Point(188, 147);
            this.visitCountTextBox.Name = "visitCountTextBox";
            this.visitCountTextBox.Size = new System.Drawing.Size(200, 21);
            this.visitCountTextBox.TabIndex = 13;
            // 
            // visitorIdTextBox
            // 
            this.visitorIdTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.visitorBindingSource, "VisitorId", true));
            this.visitorIdTextBox.Location = new System.Drawing.Point(188, 44);
            this.visitorIdTextBox.Name = "visitorIdTextBox";
            this.visitorIdTextBox.Size = new System.Drawing.Size(200, 21);
            this.visitorIdTextBox.TabIndex = 15;
            // 
            // leaveTimeDateTimePicker
            // 
            this.leaveTimeDateTimePicker.DataBindings.Add(new System.Windows.Forms.Binding("Value", this.visitorBindingSource, "CurrentSession.LeaveTime", true));
            this.leaveTimeDateTimePicker.Location = new System.Drawing.Point(188, 234);
            this.leaveTimeDateTimePicker.Name = "leaveTimeDateTimePicker";
            this.leaveTimeDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.leaveTimeDateTimePicker.TabIndex = 29;
            // 
            // visitingTimeDateTimePicker
            // 
            this.visitingTimeDateTimePicker.DataBindings.Add(new System.Windows.Forms.Binding("Value", this.visitorBindingSource, "CurrentSession.VisitingTime", true));
            this.visitingTimeDateTimePicker.Location = new System.Drawing.Point(188, 424);
            this.visitingTimeDateTimePicker.Name = "visitingTimeDateTimePicker";
            this.visitingTimeDateTimePicker.Size = new System.Drawing.Size(200, 21);
            this.visitingTimeDateTimePicker.TabIndex = 45;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.chatMessageViewerControl1);
            this.tabPage2.Controls.Add(this.messageendDateTimePicker);
            this.tabPage2.Controls.Add(this.messagebeginDateTimePicker);
            this.tabPage2.Controls.Add(this.btnSearchHistoryChatMsg);
            this.tabPage2.Controls.Add(this.lblMessageEndTime);
            this.tabPage2.Controls.Add(this.lblMessageBeginTime);
            this.tabPage2.Location = new System.Drawing.Point(4, 21);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(747, 334);
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
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.requestendDateTimePicker);
            this.tabPage3.Controls.Add(this.requestbeginDateTimePicker);
            this.tabPage3.Controls.Add(this.btnSearchHistoryPageRequests);
            this.tabPage3.Controls.Add(this.lblREndTime);
            this.tabPage3.Controls.Add(this.lblRBeginTime);
            this.tabPage3.Controls.Add(this.lstPageRequest);
            this.tabPage3.Location = new System.Drawing.Point(4, 21);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(747, 334);
            this.tabPage3.TabIndex = 3;
            this.tabPage3.Text = "网页浏览";
            this.tabPage3.UseVisualStyleBackColor = true;
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
            this.lstPageRequest.HoverSelection = true;
            this.lstPageRequest.Location = new System.Drawing.Point(3, 47);
            this.lstPageRequest.Name = "lstPageRequest";
            this.lstPageRequest.ShowItemToolTips = true;
            this.lstPageRequest.Size = new System.Drawing.Size(741, 654);
            this.lstPageRequest.TabIndex = 7;
            this.lstPageRequest.UseCompatibleStateImageBehavior = false;
            this.lstPageRequest.View = System.Windows.Forms.View.Details;
            this.lstPageRequest.SelectedIndexChanged += new System.EventHandler(this.lstPageRequest_SelectedIndexChanged);
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
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.splitContainer1);
            this.tabPage4.Location = new System.Drawing.Point(4, 21);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(747, 334);
            this.tabPage4.TabIndex = 5;
            this.tabPage4.Text = "留言列表";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel2;
            this.splitContainer1.Location = new System.Drawing.Point(3, 3);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.AutoScroll = true;
            this.splitContainer1.Panel1.Controls.Add(this.leaveWordDataGridView);
            this.splitContainer1.Panel1MinSize = 100;
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.AutoScroll = true;
            this.splitContainer1.Panel2.Controls.Add(this.txtDomainRequested);
            this.splitContainer1.Panel2.Controls.Add(this.lblDomainName);
            this.splitContainer1.Panel2.Controls.Add(this.lblDomainRequested);
            this.splitContainer1.Panel2.Controls.Add(this.btnDelLeaveWord);
            this.splitContainer1.Panel2.Controls.Add(this.btnSend);
            this.splitContainer1.Panel2.Controls.Add(this.cbxDomainName);
            this.splitContainer1.Panel2.Controls.Add(callerDateLabel);
            this.splitContainer1.Panel2.Controls.Add(this.callerDateTextBox);
            this.splitContainer1.Panel2.Controls.Add(callerNameLabel);
            this.splitContainer1.Panel2.Controls.Add(this.callerNameTextBox);
            this.splitContainer1.Panel2.Controls.Add(contentLabel);
            this.splitContainer1.Panel2.Controls.Add(this.contentTextBox);
            this.splitContainer1.Panel2.Controls.Add(emailLabel1);
            this.splitContainer1.Panel2.Controls.Add(this.emailTextBox1);
            this.splitContainer1.Panel2.Controls.Add(ipLabel1);
            this.splitContainer1.Panel2.Controls.Add(this.ipTextBox1);
            this.splitContainer1.Panel2.Controls.Add(this.isRepliedCheckBox);
            this.splitContainer1.Panel2.Controls.Add(operatorNameLabel);
            this.splitContainer1.Panel2.Controls.Add(this.operatorNameTextBox);
            this.splitContainer1.Panel2.Controls.Add(phoneLabel);
            this.splitContainer1.Panel2.Controls.Add(this.phoneTextBox);
            this.splitContainer1.Panel2.Controls.Add(senddateLabel);
            this.splitContainer1.Panel2.Controls.Add(this.senddateTextBox);
            this.splitContainer1.Panel2.Controls.Add(subjectLabel);
            this.splitContainer1.Panel2.Controls.Add(this.subjectTextBox);
            this.splitContainer1.Panel2MinSize = 100;
            this.splitContainer1.Size = new System.Drawing.Size(741, 328);
            this.splitContainer1.SplitterDistance = 227;
            this.splitContainer1.TabIndex = 0;
            // 
            // leaveWordDataGridView
            // 
            this.leaveWordDataGridView.AllowUserToAddRows = false;
            this.leaveWordDataGridView.AllowUserToDeleteRows = false;
            this.leaveWordDataGridView.AllowUserToResizeRows = false;
            this.leaveWordDataGridView.AutoGenerateColumns = false;
            this.leaveWordDataGridView.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            this.leaveWordDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.leaveWordDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn2,
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn8,
            this.IsReplied});
            this.leaveWordDataGridView.DataBindings.Add(new System.Windows.Forms.Binding("Tag", this.leaveWordBindingSource, "Id", true));
            this.leaveWordDataGridView.DataSource = this.leaveWordBindingSource;
            this.leaveWordDataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.leaveWordDataGridView.Location = new System.Drawing.Point(0, 0);
            this.leaveWordDataGridView.MultiSelect = false;
            this.leaveWordDataGridView.Name = "leaveWordDataGridView";
            this.leaveWordDataGridView.ReadOnly = true;
            this.leaveWordDataGridView.RowHeadersVisible = false;
            this.leaveWordDataGridView.RowTemplate.Height = 23;
            this.leaveWordDataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.leaveWordDataGridView.Size = new System.Drawing.Size(227, 328);
            this.leaveWordDataGridView.TabIndex = 0;
            this.leaveWordDataGridView.SelectionChanged += new System.EventHandler(this.leaveWordDataGridView_SelectionChanged);
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn2.DataPropertyName = "CallerName";
            this.dataGridViewTextBoxColumn2.HeaderText = "留言者";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            this.dataGridViewTextBoxColumn2.ReadOnly = true;
            // 
            // dataGridViewTextBoxColumn5
            // 
            this.dataGridViewTextBoxColumn5.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn5.DataPropertyName = "Subject";
            this.dataGridViewTextBoxColumn5.HeaderText = "主题";
            this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
            this.dataGridViewTextBoxColumn5.ReadOnly = true;
            // 
            // dataGridViewTextBoxColumn8
            // 
            this.dataGridViewTextBoxColumn8.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn8.DataPropertyName = "CallerDate";
            this.dataGridViewTextBoxColumn8.HeaderText = "留言时间";
            this.dataGridViewTextBoxColumn8.Name = "dataGridViewTextBoxColumn8";
            this.dataGridViewTextBoxColumn8.ReadOnly = true;
            // 
            // IsReplied
            // 
            this.IsReplied.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.IsReplied.DataPropertyName = "IsReplied";
            this.IsReplied.HeaderText = "是否回复";
            this.IsReplied.Name = "IsReplied";
            this.IsReplied.ReadOnly = true;
            // 
            // leaveWordBindingSource
            // 
            this.leaveWordBindingSource.DataSource = typeof(LiveSupport.OperatorConsole.LiveChatWS.LeaveWord);
            // 
            // txtDomainRequested
            // 
            this.txtDomainRequested.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "DomainName", true));
            this.txtDomainRequested.Location = new System.Drawing.Point(310, 12);
            this.txtDomainRequested.Name = "txtDomainRequested";
            this.txtDomainRequested.ReadOnly = true;
            this.txtDomainRequested.Size = new System.Drawing.Size(146, 21);
            this.txtDomainRequested.TabIndex = 27;
            // 
            // lblDomainRequested
            // 
            this.lblDomainRequested.AutoSize = true;
            this.lblDomainRequested.Location = new System.Drawing.Point(240, 17);
            this.lblDomainRequested.Name = "lblDomainRequested";
            this.lblDomainRequested.Size = new System.Drawing.Size(59, 12);
            this.lblDomainRequested.TabIndex = 26;
            this.lblDomainRequested.Text = "访问域名:";
            // 
            // btnDelLeaveWord
            // 
            this.btnDelLeaveWord.Location = new System.Drawing.Point(336, 303);
            this.btnDelLeaveWord.Name = "btnDelLeaveWord";
            this.btnDelLeaveWord.Size = new System.Drawing.Size(38, 23);
            this.btnDelLeaveWord.TabIndex = 25;
            this.btnDelLeaveWord.Text = "删除";
            this.btnDelLeaveWord.UseVisualStyleBackColor = true;
            this.btnDelLeaveWord.Click += new System.EventHandler(this.btnDelLeaveWord_Click);
            // 
            // btnSend
            // 
            this.btnSend.Location = new System.Drawing.Point(291, 303);
            this.btnSend.Name = "btnSend";
            this.btnSend.Size = new System.Drawing.Size(37, 23);
            this.btnSend.TabIndex = 24;
            this.btnSend.Text = "回复";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            // 
            // callerDateTextBox
            // 
            this.callerDateTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "CallerDate", true));
            this.callerDateTextBox.Location = new System.Drawing.Point(88, 39);
            this.callerDateTextBox.Name = "callerDateTextBox";
            this.callerDateTextBox.ReadOnly = true;
            this.callerDateTextBox.Size = new System.Drawing.Size(146, 21);
            this.callerDateTextBox.TabIndex = 1;
            // 
            // callerNameTextBox
            // 
            this.callerNameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "CallerName", true));
            this.callerNameTextBox.Location = new System.Drawing.Point(88, 66);
            this.callerNameTextBox.Name = "callerNameTextBox";
            this.callerNameTextBox.ReadOnly = true;
            this.callerNameTextBox.Size = new System.Drawing.Size(146, 21);
            this.callerNameTextBox.TabIndex = 3;
            // 
            // contentTextBox
            // 
            this.contentTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.contentTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "Content", true));
            this.contentTextBox.Location = new System.Drawing.Point(88, 154);
            this.contentTextBox.Multiline = true;
            this.contentTextBox.Name = "contentTextBox";
            this.contentTextBox.ReadOnly = true;
            this.contentTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.contentTextBox.Size = new System.Drawing.Size(387, 136);
            this.contentTextBox.TabIndex = 5;
            // 
            // emailTextBox1
            // 
            this.emailTextBox1.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "Email", true));
            this.emailTextBox1.Location = new System.Drawing.Point(310, 39);
            this.emailTextBox1.Name = "emailTextBox1";
            this.emailTextBox1.ReadOnly = true;
            this.emailTextBox1.Size = new System.Drawing.Size(146, 21);
            this.emailTextBox1.TabIndex = 7;
            // 
            // ipTextBox1
            // 
            this.ipTextBox1.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "Ip", true));
            this.ipTextBox1.Location = new System.Drawing.Point(312, 96);
            this.ipTextBox1.Name = "ipTextBox1";
            this.ipTextBox1.ReadOnly = true;
            this.ipTextBox1.Size = new System.Drawing.Size(146, 21);
            this.ipTextBox1.TabIndex = 11;
            // 
            // isRepliedCheckBox
            // 
            this.isRepliedCheckBox.AutoSize = true;
            this.isRepliedCheckBox.BackColor = System.Drawing.Color.Transparent;
            this.isRepliedCheckBox.DataBindings.Add(new System.Windows.Forms.Binding("CheckState", this.leaveWordBindingSource, "IsReplied", true));
            this.isRepliedCheckBox.Enabled = false;
            this.isRepliedCheckBox.Location = new System.Drawing.Point(213, 307);
            this.isRepliedCheckBox.Name = "isRepliedCheckBox";
            this.isRepliedCheckBox.Size = new System.Drawing.Size(72, 16);
            this.isRepliedCheckBox.TabIndex = 13;
            this.isRepliedCheckBox.Text = "是否回复";
            this.isRepliedCheckBox.UseVisualStyleBackColor = false;
            // 
            // operatorNameTextBox
            // 
            this.operatorNameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "OperatorName", true));
            this.operatorNameTextBox.Location = new System.Drawing.Point(87, 93);
            this.operatorNameTextBox.Name = "operatorNameTextBox";
            this.operatorNameTextBox.ReadOnly = true;
            this.operatorNameTextBox.Size = new System.Drawing.Size(146, 21);
            this.operatorNameTextBox.TabIndex = 17;
            // 
            // phoneTextBox
            // 
            this.phoneTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "Phone", true));
            this.phoneTextBox.Location = new System.Drawing.Point(310, 66);
            this.phoneTextBox.Name = "phoneTextBox";
            this.phoneTextBox.ReadOnly = true;
            this.phoneTextBox.Size = new System.Drawing.Size(146, 21);
            this.phoneTextBox.TabIndex = 19;
            // 
            // senddateTextBox
            // 
            this.senddateTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "Senddate", true));
            this.senddateTextBox.Location = new System.Drawing.Point(88, 305);
            this.senddateTextBox.Name = "senddateTextBox";
            this.senddateTextBox.ReadOnly = true;
            this.senddateTextBox.Size = new System.Drawing.Size(112, 21);
            this.senddateTextBox.TabIndex = 21;
            this.senddateTextBox.Text = "暂未回复";
            // 
            // subjectTextBox
            // 
            this.subjectTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.subjectTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.leaveWordBindingSource, "Subject", true));
            this.subjectTextBox.Location = new System.Drawing.Point(88, 123);
            this.subjectTextBox.Name = "subjectTextBox";
            this.subjectTextBox.ReadOnly = true;
            this.subjectTextBox.Size = new System.Drawing.Size(387, 21);
            this.subjectTextBox.TabIndex = 23;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.panel4);
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(755, 33);
            this.panel2.TabIndex = 1;
            // 
            // panel4
            // 
            this.panel4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.panel4.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.header_bg_right;
            this.panel4.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel4.Location = new System.Drawing.Point(202, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(1179, 33);
            this.panel4.TabIndex = 1;
            // 
            // panel3
            // 
            this.panel3.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.header_bg_left1;
            this.panel3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel3.Location = new System.Drawing.Point(4, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(200, 33);
            this.panel3.TabIndex = 0;
            // 
            // operatorsPanel
            // 
            this.operatorsPanel.Controls.Add(this.operatorPannel1);
            this.operatorsPanel.Controls.Add(this.panel1);
            this.operatorsPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.operatorsPanel.Location = new System.Drawing.Point(0, 0);
            this.operatorsPanel.Name = "operatorsPanel";
            this.operatorsPanel.Size = new System.Drawing.Size(199, 593);
            this.operatorsPanel.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.header1;
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(199, 31);
            this.panel1.TabIndex = 1;
            // 
            // treeView1
            // 
            this.treeView1.Dock = System.Windows.Forms.DockStyle.Fill;
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
            this.notifyIcon.ContextMenuStrip = this.notifyIconContextMenuStrip;
            this.notifyIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("notifyIcon.Icon")));
            this.notifyIcon.Text = "LiveSupport 座席客户端";
            this.notifyIcon.Visible = true;
            this.notifyIcon.DoubleClick += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // notifyIconContextMenuStrip
            // 
            this.notifyIconContextMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.restartConnectionToolStripMenuItem,
            this.changeAccountToolStripMenuItem,
            this.toolStripSeparator2,
            this.openToolStripMenuItem,
            this.exitToolStripMenuItem2});
            this.notifyIconContextMenuStrip.Name = "notifyIconContextMenuStrip";
            this.notifyIconContextMenuStrip.Size = new System.Drawing.Size(143, 98);
            // 
            // restartConnectionToolStripMenuItem
            // 
            this.restartConnectionToolStripMenuItem.Name = "restartConnectionToolStripMenuItem";
            this.restartConnectionToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.restartConnectionToolStripMenuItem.Text = "上线";
            this.restartConnectionToolStripMenuItem.Visible = false;
            this.restartConnectionToolStripMenuItem.Click += new System.EventHandler(this.restartConnectionToolStripMenuItem_Click);
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
            this.acceptToolStripButton});
            this.toolStrip1.Location = new System.Drawing.Point(0, 24);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
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
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(715, 17);
            this.toolStripStatusLabel1.Spring = true;
            this.toolStripStatusLabel1.Text = "信息提示";
            this.toolStripStatusLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.toolStripStatusLabel1.Click += new System.EventHandler(this.toolStripStatusLabel1_Click);
            // 
            // operatorToolStripStatusLabel
            // 
            this.operatorToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.operatorToolStripStatusLabel.Name = "operatorToolStripStatusLabel";
            this.operatorToolStripStatusLabel.Size = new System.Drawing.Size(57, 17);
            this.operatorToolStripStatusLabel.Text = "登录用户";
            // 
            // powerToolStripStatusLabel
            // 
            this.powerToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.powerToolStripStatusLabel.Name = "powerToolStripStatusLabel";
            this.powerToolStripStatusLabel.Size = new System.Drawing.Size(57, 17);
            this.powerToolStripStatusLabel.Text = "登录权限";
            // 
            // stateToolStripStatusLabel
            // 
            this.stateToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.stateToolStripStatusLabel.Name = "stateToolStripStatusLabel";
            this.stateToolStripStatusLabel.Size = new System.Drawing.Size(57, 17);
            this.stateToolStripStatusLabel.Text = "客服状态";
            // 
            // stickToolStripStatusLabel
            // 
            this.stickToolStripStatusLabel.BorderSides = System.Windows.Forms.ToolStripStatusLabelBorderSides.Left;
            this.stickToolStripStatusLabel.Name = "stickToolStripStatusLabel";
            this.stickToolStripStatusLabel.Size = new System.Drawing.Size(57, 17);
            this.stickToolStripStatusLabel.Text = "登录时间";
            // 
            // loginTimer
            // 
            this.loginTimer.Enabled = true;
            this.loginTimer.Interval = 1000;
            this.loginTimer.Tick += new System.EventHandler(this.loginTimer_Tick);
            // 
            // splitContainer2
            // 
            this.splitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer2.Location = new System.Drawing.Point(0, 74);
            this.splitContainer2.Name = "splitContainer2";
            // 
            // splitContainer2.Panel1
            // 
            this.splitContainer2.Panel1.Controls.Add(this.mainSplitContainer1);
            // 
            // splitContainer2.Panel2
            // 
            this.splitContainer2.Panel2.Controls.Add(this.webBrowser1);
            this.splitContainer2.Panel2.Controls.Add(this.toolStrip2);
            this.splitContainer2.Panel2Collapsed = true;
            this.splitContainer2.Size = new System.Drawing.Size(958, 593);
            this.splitContainer2.SplitterDistance = 561;
            this.splitContainer2.TabIndex = 9;
            // 
            // mainSplitContainer1
            // 
            this.mainSplitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainSplitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel1;
            this.mainSplitContainer1.Location = new System.Drawing.Point(0, 0);
            this.mainSplitContainer1.Name = "mainSplitContainer1";
            // 
            // mainSplitContainer1.Panel1
            // 
            this.mainSplitContainer1.Panel1.Controls.Add(this.operatorsPanel);
            // 
            // mainSplitContainer1.Panel2
            // 
            this.mainSplitContainer1.Panel2.Controls.Add(this.mainSplitContainer2);
            this.mainSplitContainer1.Size = new System.Drawing.Size(958, 593);
            this.mainSplitContainer1.SplitterDistance = 199;
            this.mainSplitContainer1.TabIndex = 3;
            // 
            // webBrowser1
            // 
            this.webBrowser1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.webBrowser1.Location = new System.Drawing.Point(0, 25);
            this.webBrowser1.MinimumSize = new System.Drawing.Size(20, 20);
            this.webBrowser1.Name = "webBrowser1";
            this.webBrowser1.Size = new System.Drawing.Size(96, 75);
            this.webBrowser1.TabIndex = 0;
            // 
            // toolStrip2
            // 
            this.toolStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripButtonReturnToOperator,
            this.toolStripButtonRefresh});
            this.toolStrip2.Location = new System.Drawing.Point(0, 0);
            this.toolStrip2.Name = "toolStrip2";
            this.toolStrip2.Size = new System.Drawing.Size(96, 25);
            this.toolStrip2.TabIndex = 1;
            this.toolStrip2.Text = "toolStrip2";
            // 
            // toolStripButtonReturnToOperator
            // 
            this.toolStripButtonReturnToOperator.Image = global::LiveSupport.OperatorConsole.Properties.Resources.development_54;
            this.toolStripButtonReturnToOperator.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButtonReturnToOperator.Name = "toolStripButtonReturnToOperator";
            this.toolStripButtonReturnToOperator.Size = new System.Drawing.Size(97, 20);
            this.toolStripButtonReturnToOperator.Text = "返回座席界面";
            this.toolStripButtonReturnToOperator.Click += new System.EventHandler(this.toolStripButtonReturnToOperator_Click);
            // 
            // toolStripButtonRefresh
            // 
            this.toolStripButtonRefresh.Image = global::LiveSupport.OperatorConsole.Properties.Resources.development_39;
            this.toolStripButtonRefresh.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButtonRefresh.Name = "toolStripButtonRefresh";
            this.toolStripButtonRefresh.Size = new System.Drawing.Size(49, 20);
            this.toolStripButtonRefresh.Text = "刷新";
            this.toolStripButtonRefresh.Click += new System.EventHandler(this.toolStripButtonRefresh_Click);
            // 
            // toolStrip3
            // 
            this.toolStrip3.BackColor = System.Drawing.Color.Transparent;
            this.toolStrip3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.toolStrip3.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip3.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripSeparator7,
            this.myChatToolStripLabel,
            this.toolStripSeparator8,
            this.visitorOnChatToolStripLabel,
            this.currentVisitorsToolStripLabel,
            this.toolStripSeparator9});
            this.toolStrip3.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.HorizontalStackWithOverflow;
            this.toolStrip3.Location = new System.Drawing.Point(0, 49);
            this.toolStrip3.Name = "toolStrip3";
            this.toolStrip3.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.toolStrip3.Size = new System.Drawing.Size(958, 25);
            this.toolStrip3.TabIndex = 11;
            this.toolStrip3.Text = "toolStrip3";
            // 
            // toolStripSeparator7
            // 
            this.toolStripSeparator7.Name = "toolStripSeparator7";
            this.toolStripSeparator7.Size = new System.Drawing.Size(6, 25);
            // 
            // myChatToolStripLabel
            // 
            this.myChatToolStripLabel.Name = "myChatToolStripLabel";
            this.myChatToolStripLabel.Size = new System.Drawing.Size(83, 22);
            this.myChatToolStripLabel.Text = "我的对话数: *";
            // 
            // toolStripSeparator8
            // 
            this.toolStripSeparator8.Name = "toolStripSeparator8";
            this.toolStripSeparator8.Size = new System.Drawing.Size(6, 25);
            // 
            // visitorOnChatToolStripLabel
            // 
            this.visitorOnChatToolStripLabel.Name = "visitorOnChatToolStripLabel";
            this.visitorOnChatToolStripLabel.Size = new System.Drawing.Size(107, 22);
            this.visitorOnChatToolStripLabel.Text = "对话中的访客数: *";
            // 
            // currentVisitorsToolStripLabel
            // 
            this.currentVisitorsToolStripLabel.Name = "currentVisitorsToolStripLabel";
            this.currentVisitorsToolStripLabel.Size = new System.Drawing.Size(83, 22);
            this.currentVisitorsToolStripLabel.Text = "当前访客数: *";
            // 
            // toolStripSeparator9
            // 
            this.toolStripSeparator9.Name = "toolStripSeparator9";
            this.toolStripSeparator9.Size = new System.Drawing.Size(6, 25);
            // 
            // colReferer
            // 
            this.colReferer.Text = "搜索引擎";
            // 
            // operatorPannel1
            // 
            this.operatorPannel1.BackColor = System.Drawing.SystemColors.Control;
            this.operatorPannel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.operatorPannel1.Location = new System.Drawing.Point(0, 31);
            this.operatorPannel1.Name = "operatorPannel1";
            this.operatorPannel1.Size = new System.Drawing.Size(199, 562);
            this.operatorPannel1.TabIndex = 0;
            // 
            // chatMessageViewerControl1
            // 
            this.chatMessageViewerControl1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.chatMessageViewerControl1.Location = new System.Drawing.Point(3, 48);
            this.chatMessageViewerControl1.Name = "chatMessageViewerControl1";
            this.chatMessageViewerControl1.Size = new System.Drawing.Size(741, 745);
            this.chatMessageViewerControl1.TabIndex = 18;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(958, 689);
            this.Controls.Add(this.splitContainer2);
            this.Controls.Add(this.toolStrip3);
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
            this.contextMenuStrip1.ResumeLayout(false);
            this.mainSplitContainer2.Panel1.ResumeLayout(false);
            this.mainSplitContainer2.Panel2.ResumeLayout(false);
            this.mainSplitContainer2.ResumeLayout(false);
            this.tabChats.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.visitorBindingSource)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.tabPage4.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.leaveWordDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.leaveWordBindingSource)).EndInit();
            this.panel2.ResumeLayout(false);
            this.operatorsPanel.ResumeLayout(false);
            this.notifyIconContextMenuStrip.ResumeLayout(false);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel2.ResumeLayout(false);
            this.splitContainer2.Panel2.PerformLayout();
            this.splitContainer2.ResumeLayout(false);
            this.mainSplitContainer1.Panel1.ResumeLayout(false);
            this.mainSplitContainer1.Panel2.ResumeLayout(false);
            this.mainSplitContainer1.ResumeLayout(false);
            this.toolStrip2.ResumeLayout(false);
            this.toolStrip2.PerformLayout();
            this.toolStrip3.ResumeLayout(false);
            this.toolStrip3.PerformLayout();
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
        private System.Windows.Forms.SplitContainer mainSplitContainer2;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.NotifyIcon notifyIcon;
        private System.Windows.Forms.ContextMenuStrip notifyIconContextMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem changeAccountToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem2;
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
        private System.Windows.Forms.ComboBox cbxDomainName;
        private System.Windows.Forms.Label lblDomainName;
        private System.Windows.Forms.Panel operatorsPanel;
        private System.Windows.Forms.ToolStripMenuItem operatorsInfoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem visitorInfoToolStripMenuItem;
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
        private System.Windows.Forms.ToolStripMenuItem resetpasswordToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem changePasswordToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem autoLoginToolStripMenuItem;
        private System.Windows.Forms.ImageList imgIconSet;
        private System.Windows.Forms.ToolStripMenuItem settalkToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem OptionToolStripMenuItem;
        private System.Windows.Forms.TabControl tabChats;
        private System.Windows.Forms.TabPage tabPage1;
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
        private System.Windows.Forms.TabPage tabPage2;
        private ChatMessageViewerControl chatMessageViewerControl1;
        private System.Windows.Forms.DateTimePicker messageendDateTimePicker;
        private System.Windows.Forms.DateTimePicker messagebeginDateTimePicker;
        private System.Windows.Forms.Button btnSearchHistoryChatMsg;
        private System.Windows.Forms.Label lblMessageEndTime;
        private System.Windows.Forms.Label lblMessageBeginTime;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.DateTimePicker requestendDateTimePicker;
        private System.Windows.Forms.DateTimePicker requestbeginDateTimePicker;
        private System.Windows.Forms.Button btnSearchHistoryPageRequests;
        private System.Windows.Forms.Label lblREndTime;
        private System.Windows.Forms.Label lblRBeginTime;
        private System.Windows.Forms.ListView lstPageRequest;
        private System.Windows.Forms.ColumnHeader colPage;
        private System.Windows.Forms.ColumnHeader colRTime;
        private System.Windows.Forms.ColumnHeader colReferrer;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.DataGridView leaveWordDataGridView;
        private System.Windows.Forms.BindingSource leaveWordBindingSource;
        private System.Windows.Forms.TextBox callerDateTextBox;
        private System.Windows.Forms.TextBox callerNameTextBox;
        private System.Windows.Forms.TextBox contentTextBox;
        private System.Windows.Forms.TextBox emailTextBox1;
        private System.Windows.Forms.TextBox ipTextBox1;
        private System.Windows.Forms.CheckBox isRepliedCheckBox;
        private System.Windows.Forms.TextBox operatorNameTextBox;
        private System.Windows.Forms.TextBox phoneTextBox;
        private System.Windows.Forms.TextBox senddateTextBox;
        private System.Windows.Forms.TextBox subjectTextBox;
        private System.Windows.Forms.Button btnSend;
        private System.Windows.Forms.ToolStripMenuItem restartConnectionToolStripMenuItem;
        private System.Windows.Forms.Button btnDelLeaveWord;
        private System.Windows.Forms.ColumnHeader colDomainRequested;
        private System.Windows.Forms.TextBox txtDomainRequested;
        private System.Windows.Forms.Label lblDomainRequested;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripMenuItem getWebSiteCodeToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem configureDomainsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageOperatorsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem viewAllChatsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem viewAllLeaveMessagesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem viewStatusticsToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripMenuItem myAccountToolStripMenuItem;
        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.ToolStrip toolStrip2;
        private System.Windows.Forms.ToolStripButton toolStripButtonReturnToOperator;
        private System.Windows.Forms.ToolStripButton toolStripButtonRefresh;
        private System.Windows.Forms.WebBrowser webBrowser1;
        private System.Windows.Forms.ToolStrip toolStrip3;
        private System.Windows.Forms.ToolStripLabel myChatToolStripLabel;
        private System.Windows.Forms.ToolStripLabel visitorOnChatToolStripLabel;
        private System.Windows.Forms.ToolStripLabel currentVisitorsToolStripLabel;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator7;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator8;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator9;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn8;
        private System.Windows.Forms.DataGridViewCheckBoxColumn IsReplied;
        private System.Windows.Forms.SplitContainer mainSplitContainer1;
        private System.Windows.Forms.Panel panel2;
        private OperatorPannel operatorPannel1;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ColumnHeader colReferer;
    }
}