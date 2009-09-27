namespace DBSiteAdmin
{
    partial class MainForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.文件ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.configToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.退出EToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.同步ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.同步所有数据ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSynchronizeOnlyUploadData = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSyncWhenConnected = new System.Windows.Forms.ToolStripMenuItem();
            this.高级选择ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.重新初始化数据RToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.上传更新并初始化数据UToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.webToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.查看同步历史HToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.工具TToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.hostResolveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.httpsDiagToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.帮助ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.关于我们AToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.syncTimer = new System.Timers.Timer();
            this.syncWhenConnectedStrip = new System.Windows.Forms.StatusStrip();
            this.syncWhenConnectedIcon = new System.Windows.Forms.ToolStripStatusLabel();
            this.syncWhenConnectedStatus = new System.Windows.Forms.ToolStripProgressBar();
            this.syncWhenConnectedText = new System.Windows.Forms.ToolStripStatusLabel();
            this.propertyGrid1 = new System.Windows.Forms.PropertyGrid();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.button1 = new System.Windows.Forms.Button();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.splashPicture = new System.Windows.Forms.PictureBox();
            this.notifyIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.notifyIconContextMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.syncTimer)).BeginInit();
            this.syncWhenConnectedStrip.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splashPicture)).BeginInit();
            this.notifyIconContextMenuStrip.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.文件ToolStripMenuItem,
            this.同步ToolStripMenuItem,
            this.工具TToolStripMenuItem,
            this.帮助ToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(576, 24);
            this.menuStrip1.TabIndex = 12;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // 文件ToolStripMenuItem
            // 
            this.文件ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.configToolStripMenuItem,
            this.退出EToolStripMenuItem});
            this.文件ToolStripMenuItem.Name = "文件ToolStripMenuItem";
            this.文件ToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.文件ToolStripMenuItem.Text = "文件(&F)";
            // 
            // configToolStripMenuItem
            // 
            this.configToolStripMenuItem.Name = "configToolStripMenuItem";
            this.configToolStripMenuItem.Size = new System.Drawing.Size(112, 22);
            this.configToolStripMenuItem.Text = "配置(&C)";
            this.configToolStripMenuItem.Click += new System.EventHandler(this.configToolStripMenuItem_Click);
            // 
            // 退出EToolStripMenuItem
            // 
            this.退出EToolStripMenuItem.Name = "退出EToolStripMenuItem";
            this.退出EToolStripMenuItem.Size = new System.Drawing.Size(112, 22);
            this.退出EToolStripMenuItem.Text = "退出(&E)";
            this.退出EToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // 同步ToolStripMenuItem
            // 
            this.同步ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.同步所有数据ToolStripMenuItem,
            this.mnuSynchronizeOnlyUploadData,
            this.mnuSyncWhenConnected,
            this.高级选择ToolStripMenuItem,
            this.查看同步历史HToolStripMenuItem});
            this.同步ToolStripMenuItem.Name = "同步ToolStripMenuItem";
            this.同步ToolStripMenuItem.Size = new System.Drawing.Size(41, 20);
            this.同步ToolStripMenuItem.Text = "同步";
            // 
            // 同步所有数据ToolStripMenuItem
            // 
            this.同步所有数据ToolStripMenuItem.Name = "同步所有数据ToolStripMenuItem";
            this.同步所有数据ToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.同步所有数据ToolStripMenuItem.Text = "同步所有数据(推荐&A)";
            this.同步所有数据ToolStripMenuItem.Click += new System.EventHandler(this.同步所有数据ToolStripMenuItem_Click);
            // 
            // mnuSynchronizeOnlyUploadData
            // 
            this.mnuSynchronizeOnlyUploadData.Name = "mnuSynchronizeOnlyUploadData";
            this.mnuSynchronizeOnlyUploadData.Size = new System.Drawing.Size(184, 22);
            this.mnuSynchronizeOnlyUploadData.Text = "只上传数据(&U)";
            this.mnuSynchronizeOnlyUploadData.Click += new System.EventHandler(this.只上传数据ToolStripMenuItem_Click);
            // 
            // mnuSyncWhenConnected
            // 
            this.mnuSyncWhenConnected.Name = "mnuSyncWhenConnected";
            this.mnuSyncWhenConnected.Size = new System.Drawing.Size(184, 22);
            this.mnuSyncWhenConnected.Text = "连接时自动同步(&C)";
            this.mnuSyncWhenConnected.Click += new System.EventHandler(this.mnuSyncWhenConnected_Click);
            // 
            // 高级选择ToolStripMenuItem
            // 
            this.高级选择ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.重新初始化数据RToolStripMenuItem,
            this.上传更新并初始化数据UToolStripMenuItem,
            this.webToolStripMenuItem});
            this.高级选择ToolStripMenuItem.Name = "高级选择ToolStripMenuItem";
            this.高级选择ToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.高级选择ToolStripMenuItem.Text = "高级选项(&O)";
            // 
            // 重新初始化数据RToolStripMenuItem
            // 
            this.重新初始化数据RToolStripMenuItem.Name = "重新初始化数据RToolStripMenuItem";
            this.重新初始化数据RToolStripMenuItem.Size = new System.Drawing.Size(208, 22);
            this.重新初始化数据RToolStripMenuItem.Text = "重新初始化数据(&R)";
            this.重新初始化数据RToolStripMenuItem.Click += new System.EventHandler(this.重新初始化数据RToolStripMenuItem_Click);
            // 
            // 上传更新并初始化数据UToolStripMenuItem
            // 
            this.上传更新并初始化数据UToolStripMenuItem.Name = "上传更新并初始化数据UToolStripMenuItem";
            this.上传更新并初始化数据UToolStripMenuItem.Size = new System.Drawing.Size(208, 22);
            this.上传更新并初始化数据UToolStripMenuItem.Text = "上传更新并初始化数据(&U)";
            this.上传更新并初始化数据UToolStripMenuItem.Click += new System.EventHandler(this.上传更新并初始化数据UToolStripMenuItem_Click);
            // 
            // webToolStripMenuItem
            // 
            this.webToolStripMenuItem.Name = "webToolStripMenuItem";
            this.webToolStripMenuItem.Size = new System.Drawing.Size(208, 22);
            this.webToolStripMenuItem.Text = "Web同步选项";
            this.webToolStripMenuItem.Click += new System.EventHandler(this.webToolStripMenuItem_Click);
            // 
            // 查看同步历史HToolStripMenuItem
            // 
            this.查看同步历史HToolStripMenuItem.Name = "查看同步历史HToolStripMenuItem";
            this.查看同步历史HToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.查看同步历史HToolStripMenuItem.Text = "查看同步历史(&H)";
            this.查看同步历史HToolStripMenuItem.Click += new System.EventHandler(this.查看同步历史HToolStripMenuItem_Click);
            // 
            // 工具TToolStripMenuItem
            // 
            this.工具TToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.hostResolveToolStripMenuItem,
            this.httpsDiagToolStripMenuItem});
            this.工具TToolStripMenuItem.Name = "工具TToolStripMenuItem";
            this.工具TToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.工具TToolStripMenuItem.Text = "工具(&T)";
            // 
            // hostResolveToolStripMenuItem
            // 
            this.hostResolveToolStripMenuItem.Name = "hostResolveToolStripMenuItem";
            this.hostResolveToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.hostResolveToolStripMenuItem.Text = "Host解析";
            this.hostResolveToolStripMenuItem.Click += new System.EventHandler(this.hostResolveToolStripMenuItem_Click);
            // 
            // httpsDiagToolStripMenuItem
            // 
            this.httpsDiagToolStripMenuItem.Name = "httpsDiagToolStripMenuItem";
            this.httpsDiagToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.httpsDiagToolStripMenuItem.Text = "HTTPS诊断";
            this.httpsDiagToolStripMenuItem.Click += new System.EventHandler(this.httpsDiagToolStripMenuItem_Click);
            // 
            // 帮助ToolStripMenuItem
            // 
            this.帮助ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.关于我们AToolStripMenuItem});
            this.帮助ToolStripMenuItem.Name = "帮助ToolStripMenuItem";
            this.帮助ToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.帮助ToolStripMenuItem.Text = "帮助(&H)";
            // 
            // 关于我们AToolStripMenuItem
            // 
            this.关于我们AToolStripMenuItem.Name = "关于我们AToolStripMenuItem";
            this.关于我们AToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.关于我们AToolStripMenuItem.Text = "关于我们(&A)";
            this.关于我们AToolStripMenuItem.Click += new System.EventHandler(this.关于我们AToolStripMenuItem_Click);
            // 
            // syncTimer
            // 
            this.syncTimer.Interval = 1000;
            this.syncTimer.SynchronizingObject = this;
            this.syncTimer.Elapsed += new System.Timers.ElapsedEventHandler(this.syncTimer_Elapsed);
            // 
            // syncWhenConnectedStrip
            // 
            this.syncWhenConnectedStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.syncWhenConnectedIcon,
            this.syncWhenConnectedStatus,
            this.syncWhenConnectedText});
            this.syncWhenConnectedStrip.Location = new System.Drawing.Point(0, 513);
            this.syncWhenConnectedStrip.Name = "syncWhenConnectedStrip";
            this.syncWhenConnectedStrip.Size = new System.Drawing.Size(576, 25);
            this.syncWhenConnectedStrip.TabIndex = 30;
            this.syncWhenConnectedStrip.Text = "Ready";
            // 
            // syncWhenConnectedIcon
            // 
            this.syncWhenConnectedIcon.AutoSize = false;
            this.syncWhenConnectedIcon.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.syncWhenConnectedIcon.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.syncWhenConnectedIcon.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.syncWhenConnectedIcon.ImageTransparentColor = System.Drawing.Color.White;
            this.syncWhenConnectedIcon.Name = "syncWhenConnectedIcon";
            this.syncWhenConnectedIcon.Overflow = System.Windows.Forms.ToolStripItemOverflow.Never;
            this.syncWhenConnectedIcon.Size = new System.Drawing.Size(32, 20);
            // 
            // syncWhenConnectedStatus
            // 
            this.syncWhenConnectedStatus.Name = "syncWhenConnectedStatus";
            this.syncWhenConnectedStatus.Size = new System.Drawing.Size(120, 19);
            this.syncWhenConnectedStatus.Visible = false;
            // 
            // syncWhenConnectedText
            // 
            this.syncWhenConnectedText.Name = "syncWhenConnectedText";
            this.syncWhenConnectedText.Size = new System.Drawing.Size(0, 20);
            // 
            // propertyGrid1
            // 
            this.propertyGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.propertyGrid1.Location = new System.Drawing.Point(3, 17);
            this.propertyGrid1.Name = "propertyGrid1";
            this.propertyGrid1.Size = new System.Drawing.Size(547, 317);
            this.propertyGrid1.TabIndex = 34;
            this.propertyGrid1.ToolbarVisible = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 12);
            this.label1.TabIndex = 35;
            this.label1.Text = "日期";
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.pictureBox1);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.textBox2);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.textBox1);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(8, 433);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(554, 72);
            this.groupBox1.TabIndex = 36;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "同步状态";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(183, 34);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(32, 32);
            this.pictureBox1.TabIndex = 40;
            this.pictureBox1.TabStop = false;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(428, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(111, 23);
            this.button1.TabIndex = 39;
            this.button1.Text = "查看同步详情";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.查看同步历史HToolStripMenuItem_Click);
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(225, 41);
            this.textBox2.Name = "textBox2";
            this.textBox2.ReadOnly = true;
            this.textBox2.Size = new System.Drawing.Size(314, 21);
            this.textBox2.TabIndex = 38;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(182, 17);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 12);
            this.label2.TabIndex = 37;
            this.label2.Text = "状态";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(17, 41);
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.Size = new System.Drawing.Size(152, 21);
            this.textBox1.TabIndex = 36;
            // 
            // splashPicture
            // 
            this.splashPicture.Dock = System.Windows.Forms.DockStyle.Top;
            this.splashPicture.Image = global::DBSiteAdmin.Properties.Resources.SubSideMonitoringUI_ConnectDlg;
            this.splashPicture.Location = new System.Drawing.Point(0, 24);
            this.splashPicture.Name = "splashPicture";
            this.splashPicture.Size = new System.Drawing.Size(576, 50);
            this.splashPicture.TabIndex = 37;
            this.splashPicture.TabStop = false;
            // 
            // notifyIcon
            // 
            this.notifyIcon.ContextMenuStrip = this.notifyIconContextMenuStrip;
            this.notifyIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("notifyIcon.Icon")));
            this.notifyIcon.Text = "站点数据管理";
            this.notifyIcon.Visible = true;
            this.notifyIcon.DoubleClick += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // notifyIconContextMenuStrip
            // 
            this.notifyIconContextMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.notifyIconContextMenuStrip.Name = "notifyIconContextMenuStrip";
            this.notifyIconContextMenuStrip.Size = new System.Drawing.Size(143, 48);
            // 
            // openToolStripMenuItem
            // 
            this.openToolStripMenuItem.Name = "openToolStripMenuItem";
            this.openToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.openToolStripMenuItem.Text = "显示/隐藏(&O)";
            this.openToolStripMenuItem.Click += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(142, 22);
            this.exitToolStripMenuItem.Text = "退出(&E)";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.propertyGrid1);
            this.groupBox2.Location = new System.Drawing.Point(9, 81);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(553, 337);
            this.groupBox2.TabIndex = 39;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "站点数据配置信息";
            // 
            // toolTip1
            // 
            this.toolTip1.IsBalloon = true;
            this.toolTip1.ToolTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(576, 538);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.splashPicture);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.syncWhenConnectedStrip);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "站点数据库管理";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
            this.Resize += new System.EventHandler(this.MainForm_Resize);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.syncTimer)).EndInit();
            this.syncWhenConnectedStrip.ResumeLayout(false);
            this.syncWhenConnectedStrip.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splashPicture)).EndInit();
            this.notifyIconContextMenuStrip.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem 文件ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 退出EToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 同步ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 同步所有数据ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mnuSynchronizeOnlyUploadData;
        private System.Windows.Forms.ToolStripMenuItem mnuSyncWhenConnected;
        private System.Windows.Forms.ToolStripMenuItem 高级选择ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 重新初始化数据RToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 上传更新并初始化数据UToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem webToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 查看同步历史HToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 帮助ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 关于我们AToolStripMenuItem;
        private System.Timers.Timer syncTimer;
        private System.Windows.Forms.StatusStrip syncWhenConnectedStrip;
        private System.Windows.Forms.ToolStripStatusLabel syncWhenConnectedIcon;
        private System.Windows.Forms.ToolStripProgressBar syncWhenConnectedStatus;
        private System.Windows.Forms.ToolStripStatusLabel syncWhenConnectedText;
        private System.Windows.Forms.ToolStripMenuItem configToolStripMenuItem;
        private System.Windows.Forms.PropertyGrid propertyGrid1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox splashPicture;
        private System.Windows.Forms.ToolStripMenuItem 工具TToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem hostResolveToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem httpsDiagToolStripMenuItem;
        private System.Windows.Forms.NotifyIcon notifyIcon;
        private System.Windows.Forms.ContextMenuStrip notifyIconContextMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.ToolTip toolTip1;
    }
}

