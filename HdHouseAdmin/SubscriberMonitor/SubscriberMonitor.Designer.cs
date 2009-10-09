namespace Microsoft.Samples.SqlServer
{
    partial class SubscriberMonitor
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components;

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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SubscriberMonitor));
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.summaryTreeView = new System.Windows.Forms.TreeView();
            this.summaryTreeViewImageList = new System.Windows.Forms.ImageList(this.components);
            this.closeButton = new System.Windows.Forms.Button();
            this.refreshButton = new System.Windows.Forms.Button();
            this.lastMessageTextBox = new System.Windows.Forms.RichTextBox();
            this.detailsListView = new System.Windows.Forms.ListView();
            this.detailsListViewImageList = new System.Windows.Forms.ImageList(this.components);
            this.label8 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.downloadsLabel = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.uploadsLabel = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.durationLabel = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.statusLabel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.statusToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.lastRefreshTimeToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.menuStrip2 = new System.Windows.Forms.MenuStrip();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.changeSubscriptionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem4 = new System.Windows.Forms.ToolStripMenuItem();
            this.refreshToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem6 = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.menuStrip2.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 24);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.summaryTreeView);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.closeButton);
            this.splitContainer1.Panel2.Controls.Add(this.refreshButton);
            this.splitContainer1.Panel2.Controls.Add(this.lastMessageTextBox);
            this.splitContainer1.Panel2.Controls.Add(this.detailsListView);
            this.splitContainer1.Panel2.Controls.Add(this.label8);
            this.splitContainer1.Panel2.Controls.Add(this.groupBox1);
            this.splitContainer1.Size = new System.Drawing.Size(904, 461);
            this.splitContainer1.SplitterDistance = 279;
            this.splitContainer1.TabIndex = 1;
            // 
            // summaryTreeView
            // 
            this.summaryTreeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.summaryTreeView.ImageIndex = 0;
            this.summaryTreeView.ImageList = this.summaryTreeViewImageList;
            this.summaryTreeView.Location = new System.Drawing.Point(0, 0);
            this.summaryTreeView.Name = "summaryTreeView";
            this.summaryTreeView.SelectedImageIndex = 0;
            this.summaryTreeView.Size = new System.Drawing.Size(279, 461);
            this.summaryTreeView.TabIndex = 0;
            this.summaryTreeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.summaryTreeView_AfterSelect);
            // 
            // summaryTreeViewImageList
            // 
            this.summaryTreeViewImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("summaryTreeViewImageList.ImageStream")));
            this.summaryTreeViewImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.summaryTreeViewImageList.Images.SetKeyName(0, "SubSideMonitoringUI.Monitor.ico");
            this.summaryTreeViewImageList.Images.SetKeyName(1, "SubSideMonitoringUI.Success.bmp");
            this.summaryTreeViewImageList.Images.SetKeyName(2, "SubSideMonitoringUI.Running.bmp");
            this.summaryTreeViewImageList.Images.SetKeyName(3, "SubSideMonitoringUI.Error.bmp");
            this.summaryTreeViewImageList.Images.SetKeyName(4, "SubSideMonitoringUI.Interrupted.bmp");
            // 
            // closeButton
            // 
            this.closeButton.Location = new System.Drawing.Point(504, 65);
            this.closeButton.Name = "closeButton";
            this.closeButton.Size = new System.Drawing.Size(75, 21);
            this.closeButton.TabIndex = 5;
            this.closeButton.Text = "关闭";
            this.closeButton.Click += new System.EventHandler(this.closeButton_Click);
            // 
            // refreshButton
            // 
            this.refreshButton.Location = new System.Drawing.Point(504, 33);
            this.refreshButton.Name = "refreshButton";
            this.refreshButton.Size = new System.Drawing.Size(75, 21);
            this.refreshButton.TabIndex = 4;
            this.refreshButton.Text = "刷新";
            this.refreshButton.Click += new System.EventHandler(this.refreshButton_Click);
            // 
            // lastMessageTextBox
            // 
            this.lastMessageTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lastMessageTextBox.Location = new System.Drawing.Point(16, 348);
            this.lastMessageTextBox.Name = "lastMessageTextBox";
            this.lastMessageTextBox.ReadOnly = true;
            this.lastMessageTextBox.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
            this.lastMessageTextBox.Size = new System.Drawing.Size(591, 102);
            this.lastMessageTextBox.TabIndex = 3;
            this.lastMessageTextBox.Text = "";
            // 
            // detailsListView
            // 
            this.detailsListView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.detailsListView.FullRowSelect = true;
            this.detailsListView.GridLines = true;
            this.detailsListView.LargeImageList = this.detailsListViewImageList;
            this.detailsListView.Location = new System.Drawing.Point(16, 120);
            this.detailsListView.Name = "detailsListView";
            this.detailsListView.Size = new System.Drawing.Size(591, 223);
            this.detailsListView.SmallImageList = this.detailsListViewImageList;
            this.detailsListView.TabIndex = 2;
            this.detailsListView.UseCompatibleStateImageBehavior = false;
            this.detailsListView.View = System.Windows.Forms.View.Details;
            // 
            // detailsListViewImageList
            // 
            this.detailsListViewImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("detailsListViewImageList.ImageStream")));
            this.detailsListViewImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.detailsListViewImageList.Images.SetKeyName(0, "SubSideMonitoringUI.Success.bmp");
            this.detailsListViewImageList.Images.SetKeyName(1, "SubSideMonitoringUI.Error.bmp");
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(16, 101);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(125, 12);
            this.label8.TabIndex = 1;
            this.label8.Text = "所选会话中已处理项目";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.downloadsLabel);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.uploadsLabel);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.durationLabel);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.statusLabel);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(16, 19);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(449, 76);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "合并会话摘要";
            // 
            // downloadsLabel
            // 
            this.downloadsLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.downloadsLabel.Location = new System.Drawing.Point(328, 44);
            this.downloadsLabel.Name = "downloadsLabel";
            this.downloadsLabel.Size = new System.Drawing.Size(100, 21);
            this.downloadsLabel.TabIndex = 7;
            // 
            // label7
            // 
            this.label7.Location = new System.Drawing.Point(202, 45);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(120, 21);
            this.label7.TabIndex = 6;
            this.label7.Text = "下载数:";
            // 
            // uploadsLabel
            // 
            this.uploadsLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.uploadsLabel.Location = new System.Drawing.Point(328, 19);
            this.uploadsLabel.Name = "uploadsLabel";
            this.uploadsLabel.Size = new System.Drawing.Size(100, 21);
            this.uploadsLabel.TabIndex = 5;
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(202, 18);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(120, 21);
            this.label5.TabIndex = 4;
            this.label5.Text = "上传数:";
            // 
            // durationLabel
            // 
            this.durationLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.durationLabel.Location = new System.Drawing.Point(65, 45);
            this.durationLabel.Name = "durationLabel";
            this.durationLabel.Size = new System.Drawing.Size(117, 21);
            this.durationLabel.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(7, 45);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(69, 21);
            this.label3.TabIndex = 2;
            this.label3.Text = "时间:";
            // 
            // statusLabel
            // 
            this.statusLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.statusLabel.Location = new System.Drawing.Point(65, 18);
            this.statusLabel.Name = "statusLabel";
            this.statusLabel.Size = new System.Drawing.Size(117, 21);
            this.statusLabel.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(7, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(69, 21);
            this.label1.TabIndex = 0;
            this.label1.Text = "状态:";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.statusToolStripStatusLabel,
            this.lastRefreshTimeToolStripStatusLabel});
            this.statusStrip1.Location = new System.Drawing.Point(0, 485);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(904, 22);
            this.statusStrip1.TabIndex = 2;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // statusToolStripStatusLabel
            // 
            this.statusToolStripStatusLabel.BorderStyle = System.Windows.Forms.Border3DStyle.Sunken;
            this.statusToolStripStatusLabel.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.statusToolStripStatusLabel.Name = "statusToolStripStatusLabel";
            this.statusToolStripStatusLabel.Size = new System.Drawing.Size(539, 17);
            this.statusToolStripStatusLabel.Spring = true;
            this.statusToolStripStatusLabel.Text = "Ready";
            this.statusToolStripStatusLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lastRefreshTimeToolStripStatusLabel
            // 
            this.lastRefreshTimeToolStripStatusLabel.AutoSize = false;
            this.lastRefreshTimeToolStripStatusLabel.BorderStyle = System.Windows.Forms.Border3DStyle.Sunken;
            this.lastRefreshTimeToolStripStatusLabel.Name = "lastRefreshTimeToolStripStatusLabel";
            this.lastRefreshTimeToolStripStatusLabel.Size = new System.Drawing.Size(350, 17);
            this.lastRefreshTimeToolStripStatusLabel.Text = "最后刷新: 00:00:00";
            this.lastRefreshTimeToolStripStatusLabel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // menuStrip2
            // 
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.toolStripMenuItem4,
            this.toolStripMenuItem6});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(904, 24);
            this.menuStrip2.TabIndex = 6;
            this.menuStrip2.Text = "menuStrip2";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.changeSubscriptionToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(59, 20);
            this.toolStripMenuItem1.Text = "文件(&F)";
            // 
            // changeSubscriptionToolStripMenuItem
            // 
            this.changeSubscriptionToolStripMenuItem.Name = "changeSubscriptionToolStripMenuItem";
            this.changeSubscriptionToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.changeSubscriptionToolStripMenuItem.Text = "更改订阅(&C)";
            this.changeSubscriptionToolStripMenuItem.Click += new System.EventHandler(this.changeSubscriptionToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.exitToolStripMenuItem.Text = "退出(&E)";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // toolStripMenuItem4
            // 
            this.toolStripMenuItem4.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.refreshToolStripMenuItem});
            this.toolStripMenuItem4.Name = "toolStripMenuItem4";
            this.toolStripMenuItem4.Size = new System.Drawing.Size(59, 20);
            this.toolStripMenuItem4.Text = "视图(&V)";
            // 
            // refreshToolStripMenuItem
            // 
            this.refreshToolStripMenuItem.Name = "refreshToolStripMenuItem";
            this.refreshToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F5;
            this.refreshToolStripMenuItem.Size = new System.Drawing.Size(129, 22);
            this.refreshToolStripMenuItem.Text = "刷新(&R)";
            this.refreshToolStripMenuItem.Click += new System.EventHandler(this.refreshToolStripMenuItem_Click);
            // 
            // toolStripMenuItem6
            // 
            this.toolStripMenuItem6.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.toolStripMenuItem6.Name = "toolStripMenuItem6";
            this.toolStripMenuItem6.Size = new System.Drawing.Size(59, 20);
            this.toolStripMenuItem6.Text = "帮助(&H)";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(112, 22);
            this.aboutToolStripMenuItem.Text = "关于(&A)";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // SubscriberMonitor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(904, 507);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip2);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip2;
            this.Name = "SubscriberMonitor";
            this.Text = "合并订阅监视器";
            this.Load += new System.EventHandler(this.MergeSubscriberMonitor_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            this.splitContainer1.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.menuStrip2.ResumeLayout(false);
            this.menuStrip2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

		}

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TreeView summaryTreeView;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel statusToolStripStatusLabel;
		private System.Windows.Forms.ToolStripStatusLabel lastRefreshTimeToolStripStatusLabel;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label downloadsLabel;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label uploadsLabel;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label durationLabel;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label statusLabel;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ListView detailsListView;
        private System.Windows.Forms.RichTextBox lastMessageTextBox;
        private System.Windows.Forms.ImageList summaryTreeViewImageList;
        private System.Windows.Forms.ImageList detailsListViewImageList;
		private System.Windows.Forms.Button closeButton;
		private System.Windows.Forms.Button refreshButton;
        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem changeSubscriptionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem4;
        private System.Windows.Forms.ToolStripMenuItem refreshToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem6;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
    }
}

