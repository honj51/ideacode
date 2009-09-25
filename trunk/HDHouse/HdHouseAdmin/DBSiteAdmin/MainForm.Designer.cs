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
            this.帮助ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.关于我们AToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.syncTimer = new System.Timers.Timer();
            this.syncWhenConnectedStrip = new System.Windows.Forms.StatusStrip();
            this.syncWhenConnectedIcon = new System.Windows.Forms.ToolStripStatusLabel();
            this.syncWhenConnectedStatus = new System.Windows.Forms.ToolStripProgressBar();
            this.syncWhenConnectedText = new System.Windows.Forms.ToolStripStatusLabel();
            this.propertyGrid1 = new System.Windows.Forms.PropertyGrid();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.syncTimer)).BeginInit();
            this.syncWhenConnectedStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.文件ToolStripMenuItem,
            this.同步ToolStripMenuItem,
            this.帮助ToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.menuStrip1.Size = new System.Drawing.Size(638, 24);
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
            this.configToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.configToolStripMenuItem.Text = "配置(&C)";
            this.configToolStripMenuItem.Click += new System.EventHandler(this.configToolStripMenuItem_Click);
            // 
            // 退出EToolStripMenuItem
            // 
            this.退出EToolStripMenuItem.Name = "退出EToolStripMenuItem";
            this.退出EToolStripMenuItem.Size = new System.Drawing.Size(160, 22);
            this.退出EToolStripMenuItem.Text = "退出(&E)";
            this.退出EToolStripMenuItem.Click += new System.EventHandler(this.退出EToolStripMenuItem_Click);
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
            this.mnuSyncWhenConnected.Text = "连接时同步(&C)";
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
            this.syncWhenConnectedStrip.Location = new System.Drawing.Point(0, 310);
            this.syncWhenConnectedStrip.Name = "syncWhenConnectedStrip";
            this.syncWhenConnectedStrip.Size = new System.Drawing.Size(800, 25);
            this.syncWhenConnectedStrip.TabIndex = 30;
            this.syncWhenConnectedStrip.Text = "Ready";
            this.syncWhenConnectedStrip.Visible = false;
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
            // 
            // syncWhenConnectedText
            // 
            this.syncWhenConnectedText.Name = "syncWhenConnectedText";
            this.syncWhenConnectedText.Size = new System.Drawing.Size(0, 20);
            // 
            // propertyGrid1
            // 
            this.propertyGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.propertyGrid1.Location = new System.Drawing.Point(0, 24);
            this.propertyGrid1.Name = "propertyGrid1";
            this.propertyGrid1.Size = new System.Drawing.Size(638, 409);
            this.propertyGrid1.TabIndex = 34;
            this.propertyGrid1.ToolbarVisible = false;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(638, 433);
            this.Controls.Add(this.propertyGrid1);
            this.Controls.Add(this.syncWhenConnectedStrip);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "站点数据库管理";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.syncTimer)).EndInit();
            this.syncWhenConnectedStrip.ResumeLayout(false);
            this.syncWhenConnectedStrip.PerformLayout();
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
    }
}

