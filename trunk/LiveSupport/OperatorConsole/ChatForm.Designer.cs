namespace LiveSupport.OperatorConsole
{
    partial class ChatForm
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
            System.Windows.Forms.Timer tmrGetMsg;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ChatForm));
            this.cutSaveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.uploadOpenFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.panelMessage = new System.Windows.Forms.Panel();
            this.chatMessageViewerControl1 = new LiveSupport.OperatorConsole.ChatMessageViewerControl();
            this.toolStrip2 = new System.Windows.Forms.ToolStrip();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton2 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSplitButton2 = new System.Windows.Forms.ToolStripSplitButton();
            this.flashToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ringToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.txtMsg = new System.Windows.Forms.TextBox();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.uploadToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.ExitToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.cutToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toollblIsTyping = new System.Windows.Forms.ToolStripStatusLabel();
            this.tabControlVideo = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.setTalkTreeView = new System.Windows.Forms.TreeView();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.panel1 = new System.Windows.Forms.Panel();
            this.glassPanel1 = new IC.Controls.GlassPanel();
            this.remarkLabel = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.visitCountLabel = new System.Windows.Forms.Label();
            this.visitorNameLabel = new System.Windows.Forms.Label();
            this.visitorLocationLabel = new System.Windows.Forms.Label();
            this.lblVisitorInfo = new System.Windows.Forms.Label();
            this.domainRequestedLabel = new System.Windows.Forms.Label();
            tmrGetMsg = new System.Windows.Forms.Timer(this.components);
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            this.panelMessage.SuspendLayout();
            this.toolStrip2.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.tabControlVideo.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.glassPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // cutSaveFileDialog
            // 
            this.cutSaveFileDialog.FileName = "image1";
            this.cutSaveFileDialog.Filter = "jpg Files(*.jpg) |*.jpg |jpeg Files(*.*) |*.jpeg |bmp Files(*.bmp) |*.bmp";
            // 
            // uploadOpenFileDialog
            // 
            this.uploadOpenFileDialog.FileName = "uploadOpenFileDialog";
            // 
            // splitContainer1
            // 
            this.splitContainer1.BackColor = System.Drawing.Color.Transparent;
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.splitContainer2);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.tabControlVideo);
            this.splitContainer1.Panel2.Controls.Add(this.panel1);
            this.splitContainer1.Size = new System.Drawing.Size(658, 470);
            this.splitContainer1.SplitterDistance = 426;
            this.splitContainer1.TabIndex = 0;
            // 
            // splitContainer2
            // 
            this.splitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer2.Location = new System.Drawing.Point(0, 0);
            this.splitContainer2.Name = "splitContainer2";
            this.splitContainer2.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer2.Panel1
            // 
            this.splitContainer2.Panel1.Controls.Add(this.panelMessage);
            this.splitContainer2.Panel1.Controls.Add(this.toolStrip2);
            // 
            // splitContainer2.Panel2
            // 
            this.splitContainer2.Panel2.Controls.Add(this.txtMsg);
            this.splitContainer2.Panel2.Controls.Add(this.toolStrip1);
            this.splitContainer2.Panel2.Controls.Add(this.statusStrip1);
            this.splitContainer2.Size = new System.Drawing.Size(426, 470);
            this.splitContainer2.SplitterDistance = 313;
            this.splitContainer2.TabIndex = 11;
            // 
            // panelMessage
            // 
            this.panelMessage.Controls.Add(this.chatMessageViewerControl1);
            this.panelMessage.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelMessage.Location = new System.Drawing.Point(0, 39);
            this.panelMessage.Name = "panelMessage";
            this.panelMessage.Size = new System.Drawing.Size(426, 274);
            this.panelMessage.TabIndex = 9;
            // 
            // chatMessageViewerControl1
            // 
            this.chatMessageViewerControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chatMessageViewerControl1.Location = new System.Drawing.Point(0, 0);
            this.chatMessageViewerControl1.Name = "chatMessageViewerControl1";
            this.chatMessageViewerControl1.Size = new System.Drawing.Size(426, 274);
            this.chatMessageViewerControl1.TabIndex = 0;
            // 
            // toolStrip2
            // 
            this.toolStrip2.BackColor = System.Drawing.Color.Transparent;
            this.toolStrip2.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip2.ImageScalingSize = new System.Drawing.Size(0, 0);
            this.toolStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripButton1,
            this.toolStripButton2,
            this.toolStripSplitButton2,
            this.toolStripLabel1});
            this.toolStrip2.Location = new System.Drawing.Point(0, 0);
            this.toolStrip2.Name = "toolStrip2";
            this.toolStrip2.Size = new System.Drawing.Size(426, 39);
            this.toolStrip2.TabIndex = 8;
            this.toolStrip2.Text = "toolStrip2";
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.AutoSize = false;
            this.toolStripButton1.BackColor = System.Drawing.Color.Transparent;
            this.toolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton1.Image = global::LiveSupport.OperatorConsole.Properties.Resources.sipphone;
            this.toolStripButton1.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(36, 36);
            this.toolStripButton1.Text = "发起语言对话";
            this.toolStripButton1.Visible = false;
            // 
            // toolStripButton2
            // 
            this.toolStripButton2.AutoSize = false;
            this.toolStripButton2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton2.Image = global::LiveSupport.OperatorConsole.Properties.Resources.file_sent;
            this.toolStripButton2.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton2.Name = "toolStripButton2";
            this.toolStripButton2.Size = new System.Drawing.Size(36, 36);
            this.toolStripButton2.Text = "发送文件";
            this.toolStripButton2.Visible = false;
            // 
            // toolStripSplitButton2
            // 
            this.toolStripSplitButton2.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.toolStripSplitButton2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripSplitButton2.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.flashToolStripMenuItem,
            this.ringToolStripMenuItem});
            this.toolStripSplitButton2.Image = global::LiveSupport.OperatorConsole.Properties.Resources.alert;
            this.toolStripSplitButton2.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripSplitButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripSplitButton2.Name = "toolStripSplitButton2";
            this.toolStripSplitButton2.Size = new System.Drawing.Size(48, 36);
            this.toolStripSplitButton2.Text = "新消息提示";
            this.toolStripSplitButton2.ButtonClick += new System.EventHandler(this.toolStripSplitButton2_ButtonClick);
            // 
            // flashToolStripMenuItem
            // 
            this.flashToolStripMenuItem.CheckOnClick = true;
            this.flashToolStripMenuItem.Image = global::LiveSupport.OperatorConsole.Properties.Resources.windows_16;
            this.flashToolStripMenuItem.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.flashToolStripMenuItem.Name = "flashToolStripMenuItem";
            this.flashToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.flashToolStripMenuItem.Text = "窗口闪烁";
            // 
            // ringToolStripMenuItem
            // 
            this.ringToolStripMenuItem.CheckOnClick = true;
            this.ringToolStripMenuItem.Image = global::LiveSupport.OperatorConsole.Properties.Resources.alarmd;
            this.ringToolStripMenuItem.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.ringToolStripMenuItem.Name = "ringToolStripMenuItem";
            this.ringToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.ringToolStripMenuItem.Text = "声音提醒";
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.IsLink = true;
            this.toolStripLabel1.LinkBehavior = System.Windows.Forms.LinkBehavior.NeverUnderline;
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(203, 36);
            this.toolStripLabel1.Text = "欢迎使用LiveSupport在线交流系统！";
            // 
            // txtMsg
            // 
            this.txtMsg.AllowDrop = true;
            this.txtMsg.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtMsg.Location = new System.Drawing.Point(0, 25);
            this.txtMsg.Multiline = true;
            this.txtMsg.Name = "txtMsg";
            this.txtMsg.Size = new System.Drawing.Size(426, 106);
            this.txtMsg.TabIndex = 9;
            this.txtMsg.DragDrop += new System.Windows.Forms.DragEventHandler(this.txtMsg_DragDrop);
            this.txtMsg.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtMsg_KeyUp);
            this.txtMsg.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtMsg_KeyPress);
            this.txtMsg.DragEnter += new System.Windows.Forms.DragEventHandler(this.txtMsg_DragEnter);
            // 
            // toolStrip1
            // 
            this.toolStrip1.BackColor = System.Drawing.Color.Transparent;
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.uploadToolStripButton,
            this.ExitToolStripButton,
            this.cutToolStripButton});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(426, 25);
            this.toolStrip1.TabIndex = 10;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // uploadToolStripButton
            // 
            this.uploadToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.file_sent;
            this.uploadToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.uploadToolStripButton.Name = "uploadToolStripButton";
            this.uploadToolStripButton.Size = new System.Drawing.Size(73, 22);
            this.uploadToolStripButton.Text = "发送文件";
            this.uploadToolStripButton.ToolTipText = "发送文件";
            this.uploadToolStripButton.Click += new System.EventHandler(this.uploadToolStripButton_Click);
            // 
            // ExitToolStripButton
            // 
            this.ExitToolStripButton.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.ExitToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.ExitToolStripButton.Name = "ExitToolStripButton";
            this.ExitToolStripButton.Size = new System.Drawing.Size(51, 22);
            this.ExitToolStripButton.Text = "关闭(&S)";
            this.ExitToolStripButton.Click += new System.EventHandler(this.ExitToolStripButton_Click);
            // 
            // cutToolStripButton
            // 
            this.cutToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.windows_16;
            this.cutToolStripButton.ImageTransparentColor = System.Drawing.Color.Teal;
            this.cutToolStripButton.Name = "cutToolStripButton";
            this.cutToolStripButton.Size = new System.Drawing.Size(49, 22);
            this.cutToolStripButton.Text = "截屏";
            this.cutToolStripButton.Click += new System.EventHandler(this.cutToolStripButton_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.BackColor = System.Drawing.Color.Transparent;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toollblIsTyping});
            this.statusStrip1.Location = new System.Drawing.Point(0, 131);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(426, 22);
            this.statusStrip1.TabIndex = 8;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toollblIsTyping
            // 
            this.toollblIsTyping.Name = "toollblIsTyping";
            this.toollblIsTyping.Size = new System.Drawing.Size(53, 17);
            this.toollblIsTyping.Text = "对话客户";
            // 
            // tabControlVideo
            // 
            this.tabControlVideo.Controls.Add(this.tabPage1);
            this.tabControlVideo.Controls.Add(this.tabPage4);
            this.tabControlVideo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControlVideo.Location = new System.Drawing.Point(0, 147);
            this.tabControlVideo.Name = "tabControlVideo";
            this.tabControlVideo.SelectedIndex = 0;
            this.tabControlVideo.ShowToolTips = true;
            this.tabControlVideo.Size = new System.Drawing.Size(228, 323);
            this.tabControlVideo.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.setTalkTreeView);
            this.tabPage1.Location = new System.Drawing.Point(4, 21);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(220, 298);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "快捷回复";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // setTalkTreeView
            // 
            this.setTalkTreeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.setTalkTreeView.Location = new System.Drawing.Point(3, 3);
            this.setTalkTreeView.Name = "setTalkTreeView";
            this.setTalkTreeView.Size = new System.Drawing.Size(214, 292);
            this.setTalkTreeView.TabIndex = 0;
            this.setTalkTreeView.NodeMouseDoubleClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.setTalkTreeView_NodeMouseDoubleClick);
            // 
            // tabPage4
            // 
            this.tabPage4.Location = new System.Drawing.Point(4, 21);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Size = new System.Drawing.Size(220, 298);
            this.tabPage4.TabIndex = 2;
            this.tabPage4.Text = "视频";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.glassPanel1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(228, 147);
            this.panel1.TabIndex = 1;
            // 
            // glassPanel1
            // 
            this.glassPanel1.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.glassPanel1.ButtonBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(125)))), ((int)(((byte)(44)))), ((int)(((byte)(61)))), ((int)(((byte)(90)))));
            this.glassPanel1.Controls.Add(this.remarkLabel);
            this.glassPanel1.Controls.Add(this.domainRequestedLabel);
            this.glassPanel1.Controls.Add(this.pictureBox1);
            this.glassPanel1.Controls.Add(this.visitCountLabel);
            this.glassPanel1.Controls.Add(this.visitorNameLabel);
            this.glassPanel1.Controls.Add(this.visitorLocationLabel);
            this.glassPanel1.Controls.Add(this.lblVisitorInfo);
            this.glassPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.glassPanel1.Location = new System.Drawing.Point(0, 0);
            this.glassPanel1.Name = "glassPanel1";
            this.glassPanel1.ShadowColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.glassPanel1.Size = new System.Drawing.Size(228, 147);
            this.glassPanel1.TabIndex = 4;
            // 
            // remarkLabel
            // 
            this.remarkLabel.AutoSize = true;
            this.remarkLabel.ForeColor = System.Drawing.Color.White;
            this.remarkLabel.Location = new System.Drawing.Point(17, 118);
            this.remarkLabel.Name = "remarkLabel";
            this.remarkLabel.Size = new System.Drawing.Size(59, 12);
            this.remarkLabel.TabIndex = 5;
            this.remarkLabel.Text = "备注信息:";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::LiveSupport.OperatorConsole.Properties.Resources._06;
            this.pictureBox1.Location = new System.Drawing.Point(4, 3);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(32, 32);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // visitCountLabel
            // 
            this.visitCountLabel.AutoSize = true;
            this.visitCountLabel.ForeColor = System.Drawing.Color.White;
            this.visitCountLabel.Location = new System.Drawing.Point(17, 80);
            this.visitCountLabel.Name = "visitCountLabel";
            this.visitCountLabel.Size = new System.Drawing.Size(59, 12);
            this.visitCountLabel.TabIndex = 3;
            this.visitCountLabel.Text = "来访次数:";
            // 
            // visitorNameLabel
            // 
            this.visitorNameLabel.AutoSize = true;
            this.visitorNameLabel.Font = new System.Drawing.Font("宋体", 9F);
            this.visitorNameLabel.ForeColor = System.Drawing.Color.White;
            this.visitorNameLabel.Location = new System.Drawing.Point(17, 41);
            this.visitorNameLabel.Name = "visitorNameLabel";
            this.visitorNameLabel.Size = new System.Drawing.Size(59, 12);
            this.visitorNameLabel.TabIndex = 1;
            this.visitorNameLabel.Text = "访客名称:";
            // 
            // visitorLocationLabel
            // 
            this.visitorLocationLabel.AutoSize = true;
            this.visitorLocationLabel.ForeColor = System.Drawing.Color.White;
            this.visitorLocationLabel.Location = new System.Drawing.Point(17, 97);
            this.visitorLocationLabel.Name = "visitorLocationLabel";
            this.visitorLocationLabel.Size = new System.Drawing.Size(59, 12);
            this.visitorLocationLabel.TabIndex = 2;
            this.visitorLocationLabel.Text = "地理位置:";
            // 
            // lblVisitorInfo
            // 
            this.lblVisitorInfo.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblVisitorInfo.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.lblVisitorInfo.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblVisitorInfo.ForeColor = System.Drawing.Color.SteelBlue;
            this.lblVisitorInfo.Location = new System.Drawing.Point(0, 0);
            this.lblVisitorInfo.Name = "lblVisitorInfo";
            this.lblVisitorInfo.Padding = new System.Windows.Forms.Padding(8);
            this.lblVisitorInfo.Size = new System.Drawing.Size(228, 35);
            this.lblVisitorInfo.TabIndex = 6;
            this.lblVisitorInfo.Text = "访客信息";
            this.lblVisitorInfo.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // domainRequestedLabel
            // 
            this.domainRequestedLabel.AutoSize = true;
            this.domainRequestedLabel.ForeColor = System.Drawing.Color.White;
            this.domainRequestedLabel.Location = new System.Drawing.Point(17, 63);
            this.domainRequestedLabel.Name = "domainRequestedLabel";
            this.domainRequestedLabel.Size = new System.Drawing.Size(59, 12);
            this.domainRequestedLabel.TabIndex = 4;
            this.domainRequestedLabel.Text = "访问域名:";
            // 
            // ChatForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::LiveSupport.OperatorConsole.Properties.Resources.bg02;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(658, 470);
            this.Controls.Add(this.splitContainer1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "ChatForm";
            this.Load += new System.EventHandler(this.ChatForm_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ChatForm_FormClosing);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel1.PerformLayout();
            this.splitContainer2.Panel2.ResumeLayout(false);
            this.splitContainer2.Panel2.PerformLayout();
            this.splitContainer2.ResumeLayout(false);
            this.panelMessage.ResumeLayout(false);
            this.toolStrip2.ResumeLayout(false);
            this.toolStrip2.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.tabControlVideo.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.glassPanel1.ResumeLayout(false);
            this.glassPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton uploadToolStripButton;
        private System.Windows.Forms.ToolStripButton ExitToolStripButton;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toollblIsTyping;
        private System.Windows.Forms.ToolStrip toolStrip2;
        private System.Windows.Forms.TabControl tabControlVideo;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.ToolStripButton cutToolStripButton;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.OpenFileDialog uploadOpenFileDialog;
      
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.ToolStripButton toolStripButton2;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label visitorLocationLabel;
        private System.Windows.Forms.Label visitorNameLabel;
        private System.Windows.Forms.Label visitCountLabel;
        private IC.Controls.GlassPanel glassPanel1;
        private System.Windows.Forms.ToolStripSplitButton toolStripSplitButton2;
        private System.Windows.Forms.ToolStripMenuItem flashToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ringToolStripMenuItem;
        private System.Windows.Forms.Label remarkLabel;
        private System.Windows.Forms.Label lblVisitorInfo;

        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.TreeView setTalkTreeView;
        private System.Windows.Forms.Panel panelMessage;
        private System.Windows.Forms.TabPage tabPage4;
        private ChatMessageViewerControl chatMessageViewerControl1;
        private System.Windows.Forms.TextBox txtMsg;
        private System.Windows.Forms.Label domainRequestedLabel;
       
    }
}