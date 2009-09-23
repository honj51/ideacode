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
			this.menuStrip1 = new System.Windows.Forms.MenuStrip();
			this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.changeSubscriptionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.viewToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.refreshToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
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
			this.menuStrip1.SuspendLayout();
			this.splitContainer1.Panel1.SuspendLayout();
			this.splitContainer1.Panel2.SuspendLayout();
			this.splitContainer1.SuspendLayout();
			this.groupBox1.SuspendLayout();
			this.statusStrip1.SuspendLayout();
			this.SuspendLayout();
			// 
			// menuStrip1
			// 
			this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.viewToolStripMenuItem,
            this.helpToolStripMenuItem});
			this.menuStrip1.Location = new System.Drawing.Point(0, 0);
			this.menuStrip1.Name = "menuStrip1";
			this.menuStrip1.Size = new System.Drawing.Size(904, 24);
			this.menuStrip1.TabIndex = 0;
			this.menuStrip1.Text = "menuStrip1";
			// 
			// fileToolStripMenuItem
			// 
			this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.changeSubscriptionToolStripMenuItem,
            this.exitToolStripMenuItem});
			this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
			this.fileToolStripMenuItem.Text = "&File";
			// 
			// changeSubscriptionToolStripMenuItem
			// 
			this.changeSubscriptionToolStripMenuItem.Name = "changeSubscriptionToolStripMenuItem";
			this.changeSubscriptionToolStripMenuItem.Text = "&Change Subscription";
			this.changeSubscriptionToolStripMenuItem.Click += new System.EventHandler(this.changeSubscriptionToolStripMenuItem_Click);
			// 
			// exitToolStripMenuItem
			// 
			this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
			this.exitToolStripMenuItem.Text = "E&xit";
			this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
			// 
			// viewToolStripMenuItem
			// 
			this.viewToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.refreshToolStripMenuItem});
			this.viewToolStripMenuItem.Name = "viewToolStripMenuItem";
			this.viewToolStripMenuItem.Text = "&View";
			// 
			// refreshToolStripMenuItem
			// 
			this.refreshToolStripMenuItem.Name = "refreshToolStripMenuItem";
			this.refreshToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F5;
			this.refreshToolStripMenuItem.Text = "&Refresh";
			this.refreshToolStripMenuItem.Click += new System.EventHandler(this.refreshToolStripMenuItem_Click);
			// 
			// helpToolStripMenuItem
			// 
			this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
			this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
			this.helpToolStripMenuItem.Text = "&Help";
			// 
			// aboutToolStripMenuItem
			// 
			this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
			this.aboutToolStripMenuItem.Text = "&About...";
			this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
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
			this.splitContainer1.Size = new System.Drawing.Size(904, 503);
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
			this.summaryTreeView.Size = new System.Drawing.Size(279, 503);
			this.summaryTreeView.TabIndex = 0;
			this.summaryTreeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.summaryTreeView_AfterSelect);
			// 
			// summaryTreeViewImageList
			// 
			this.summaryTreeViewImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("summaryTreeViewImageList.ImageStream")));
			this.summaryTreeViewImageList.Images.SetKeyName(0, "SubSideMonitoringUI.Monitor.ico");
			this.summaryTreeViewImageList.Images.SetKeyName(1, "SubSideMonitoringUI.Success.bmp");
			this.summaryTreeViewImageList.Images.SetKeyName(2, "SubSideMonitoringUI.Running.bmp");
			this.summaryTreeViewImageList.Images.SetKeyName(3, "SubSideMonitoringUI.Error.bmp");
			this.summaryTreeViewImageList.Images.SetKeyName(4, "SubSideMonitoringUI.Interrupted.bmp");
			// 
			// closeButton
			// 
			this.closeButton.Location = new System.Drawing.Point(504, 70);
			this.closeButton.Name = "closeButton";
			this.closeButton.Size = new System.Drawing.Size(75, 23);
			this.closeButton.TabIndex = 5;
			this.closeButton.Text = "Close";
			this.closeButton.Click += new System.EventHandler(this.closeButton_Click);
			// 
			// refreshButton
			// 
			this.refreshButton.Location = new System.Drawing.Point(504, 36);
			this.refreshButton.Name = "refreshButton";
			this.refreshButton.Size = new System.Drawing.Size(75, 23);
			this.refreshButton.TabIndex = 4;
			this.refreshButton.Text = "&Refresh";
			this.refreshButton.Click += new System.EventHandler(this.refreshButton_Click);
			// 
			// lastMessageTextBox
			// 
			this.lastMessageTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
						| System.Windows.Forms.AnchorStyles.Right)));
			this.lastMessageTextBox.Location = new System.Drawing.Point(16, 380);
			this.lastMessageTextBox.Name = "lastMessageTextBox";
			this.lastMessageTextBox.ReadOnly = true;
			this.lastMessageTextBox.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
			this.lastMessageTextBox.Size = new System.Drawing.Size(591, 110);
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
			this.detailsListView.Location = new System.Drawing.Point(16, 130);
			this.detailsListView.Name = "detailsListView";
			this.detailsListView.Size = new System.Drawing.Size(591, 244);
			this.detailsListView.SmallImageList = this.detailsListViewImageList;
			this.detailsListView.TabIndex = 2;
			this.detailsListView.View = System.Windows.Forms.View.Details;
			// 
			// detailsListViewImageList
			// 
			this.detailsListViewImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("detailsListViewImageList.ImageStream")));
			this.detailsListViewImageList.Images.SetKeyName(0, "SubSideMonitoringUI.Success.bmp");
			this.detailsListViewImageList.Images.SetKeyName(1, "SubSideMonitoringUI.Error.bmp");
			// 
			// label8
			// 
			this.label8.AutoSize = true;
			this.label8.Location = new System.Drawing.Point(16, 109);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(141, 13);
			this.label8.TabIndex = 1;
			this.label8.Text = "Articles processed in session:";
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
			this.groupBox1.Location = new System.Drawing.Point(16, 21);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(449, 82);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Merge Session Summary";
			// 
			// downloadsLabel
			// 
			this.downloadsLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.downloadsLabel.Location = new System.Drawing.Point(328, 48);
			this.downloadsLabel.Name = "downloadsLabel";
			this.downloadsLabel.Size = new System.Drawing.Size(100, 23);
			this.downloadsLabel.TabIndex = 7;
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(202, 49);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(120, 23);
			this.label7.TabIndex = 6;
			this.label7.Text = "Number of Downloads:";
			// 
			// uploadsLabel
			// 
			this.uploadsLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.uploadsLabel.Location = new System.Drawing.Point(328, 21);
			this.uploadsLabel.Name = "uploadsLabel";
			this.uploadsLabel.Size = new System.Drawing.Size(100, 23);
			this.uploadsLabel.TabIndex = 5;
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(202, 20);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(120, 23);
			this.label5.TabIndex = 4;
			this.label5.Text = "Number of Uploads:";
			// 
			// durationLabel
			// 
			this.durationLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.durationLabel.Location = new System.Drawing.Point(65, 49);
			this.durationLabel.Name = "durationLabel";
			this.durationLabel.Size = new System.Drawing.Size(117, 23);
			this.durationLabel.TabIndex = 3;
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(7, 49);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(69, 23);
			this.label3.TabIndex = 2;
			this.label3.Text = "Duration:";
			// 
			// statusLabel
			// 
			this.statusLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.statusLabel.Location = new System.Drawing.Point(65, 20);
			this.statusLabel.Name = "statusLabel";
			this.statusLabel.Size = new System.Drawing.Size(117, 23);
			this.statusLabel.TabIndex = 1;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(7, 20);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(69, 23);
			this.label1.TabIndex = 0;
			this.label1.Text = "Status:";
			// 
			// statusStrip1
			// 
			this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.statusToolStripStatusLabel,
            this.lastRefreshTimeToolStripStatusLabel});
			this.statusStrip1.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.Table;
			this.statusStrip1.Location = new System.Drawing.Point(0, 527);
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
			this.lastRefreshTimeToolStripStatusLabel.Text = "Last Refresh: 00:00:00";
			this.lastRefreshTimeToolStripStatusLabel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// SubscriberMonitor
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(904, 549);
			this.Controls.Add(this.splitContainer1);
			this.Controls.Add(this.statusStrip1);
			this.Controls.Add(this.menuStrip1);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MainMenuStrip = this.menuStrip1;
			this.Name = "SubscriberMonitor";
			this.Text = "Merge Subscriber Monitor";
			this.Load += new System.EventHandler(this.MergeSubscriberMonitor_Load);
			this.menuStrip1.ResumeLayout(false);
			this.splitContainer1.Panel1.ResumeLayout(false);
			this.splitContainer1.Panel2.ResumeLayout(false);
			this.splitContainer1.Panel2.PerformLayout();
			this.splitContainer1.ResumeLayout(false);
			this.groupBox1.ResumeLayout(false);
			this.statusStrip1.ResumeLayout(false);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem viewToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem refreshToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
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
		private System.Windows.Forms.ToolStripMenuItem changeSubscriptionToolStripMenuItem;
		private System.Windows.Forms.Button closeButton;
		private System.Windows.Forms.Button refreshButton;
    }
}

