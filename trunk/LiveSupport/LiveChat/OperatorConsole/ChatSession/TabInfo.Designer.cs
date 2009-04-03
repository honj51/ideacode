namespace LiveChatStarterKit.OperatorConsole
{
    partial class TabInfo
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabOptions = new System.Windows.Forms.TabControl();
            this.tabInformation = new System.Windows.Forms.TabPage();
            this.lnkUrlReferrer = new System.Windows.Forms.LinkLabel();
            this.lblUrlReferrer = new System.Windows.Forms.Label();
            this.lblCurrentTime = new System.Windows.Forms.Label();
            this.lnkCurrentPage = new System.Windows.Forms.LinkLabel();
            this.lblCurrentPage = new System.Windows.Forms.Label();
            this.lblEntryTime = new System.Windows.Forms.Label();
            this.lnkEntryPage = new System.Windows.Forms.LinkLabel();
            this.lblFirstVisit = new System.Windows.Forms.Label();
            this.tabBrowseHistory = new System.Windows.Forms.TabPage();
            this.lstVisitedUrl = new System.Windows.Forms.ListView();
            this.lblVisitedHint = new System.Windows.Forms.Label();
            this.tabTransfer = new System.Windows.Forms.TabPage();
            this.chkWarnVisitor = new System.Windows.Forms.CheckBox();
            this.btnTransfer = new System.Windows.Forms.Button();
            this.cboOperators = new System.Windows.Forms.ComboBox();
            this.lblTransfer = new System.Windows.Forms.Label();
            this.tabOptions.SuspendLayout();
            this.tabInformation.SuspendLayout();
            this.tabBrowseHistory.SuspendLayout();
            this.tabTransfer.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabOptions
            // 
            this.tabOptions.Controls.Add(this.tabInformation);
            this.tabOptions.Controls.Add(this.tabBrowseHistory);
            this.tabOptions.Controls.Add(this.tabTransfer);
            this.tabOptions.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabOptions.Location = new System.Drawing.Point(0, 0);
            this.tabOptions.Name = "tabOptions";
            this.tabOptions.SelectedIndex = 0;
            this.tabOptions.Size = new System.Drawing.Size(269, 266);
            this.tabOptions.TabIndex = 0;
            // 
            // tabInformation
            // 
            this.tabInformation.Controls.Add(this.lnkUrlReferrer);
            this.tabInformation.Controls.Add(this.lblUrlReferrer);
            this.tabInformation.Controls.Add(this.lblCurrentTime);
            this.tabInformation.Controls.Add(this.lnkCurrentPage);
            this.tabInformation.Controls.Add(this.lblCurrentPage);
            this.tabInformation.Controls.Add(this.lblEntryTime);
            this.tabInformation.Controls.Add(this.lnkEntryPage);
            this.tabInformation.Controls.Add(this.lblFirstVisit);
            this.tabInformation.Location = new System.Drawing.Point(4, 21);
            this.tabInformation.Name = "tabInformation";
            this.tabInformation.Size = new System.Drawing.Size(261, 241);
            this.tabInformation.TabIndex = 0;
            this.tabInformation.Text = "信息";
            this.tabInformation.ToolTipText = "General information";
            this.tabInformation.UseVisualStyleBackColor = true;
            // 
            // lnkUrlReferrer
            // 
            this.lnkUrlReferrer.AutoSize = true;
            this.lnkUrlReferrer.Location = new System.Drawing.Point(14, 141);
            this.lnkUrlReferrer.Name = "lnkUrlReferrer";
            this.lnkUrlReferrer.Size = new System.Drawing.Size(47, 12);
            this.lnkUrlReferrer.TabIndex = 7;
            this.lnkUrlReferrer.TabStop = true;
            this.lnkUrlReferrer.Text = "Not set";
            // 
            // lblUrlReferrer
            // 
            this.lblUrlReferrer.AutoSize = true;
            this.lblUrlReferrer.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUrlReferrer.Location = new System.Drawing.Point(14, 120);
            this.lblUrlReferrer.Name = "lblUrlReferrer";
            this.lblUrlReferrer.Size = new System.Drawing.Size(59, 13);
            this.lblUrlReferrer.TabIndex = 6;
            this.lblUrlReferrer.Text = "引用页面";
            // 
            // lblCurrentTime
            // 
            this.lblCurrentTime.AutoSize = true;
            this.lblCurrentTime.Location = new System.Drawing.Point(111, 68);
            this.lblCurrentTime.Name = "lblCurrentTime";
            this.lblCurrentTime.Size = new System.Drawing.Size(35, 12);
            this.lblCurrentTime.TabIndex = 5;
            this.lblCurrentTime.Text = "时间:";
            // 
            // lnkCurrentPage
            // 
            this.lnkCurrentPage.AutoSize = true;
            this.lnkCurrentPage.Location = new System.Drawing.Point(14, 90);
            this.lnkCurrentPage.Name = "lnkCurrentPage";
            this.lnkCurrentPage.Size = new System.Drawing.Size(47, 12);
            this.lnkCurrentPage.TabIndex = 4;
            this.lnkCurrentPage.TabStop = true;
            this.lnkCurrentPage.Text = "Not set";
            // 
            // lblCurrentPage
            // 
            this.lblCurrentPage.AutoSize = true;
            this.lblCurrentPage.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCurrentPage.Location = new System.Drawing.Point(14, 68);
            this.lblCurrentPage.Name = "lblCurrentPage";
            this.lblCurrentPage.Size = new System.Drawing.Size(59, 13);
            this.lblCurrentPage.TabIndex = 3;
            this.lblCurrentPage.Text = "当前页面";
            // 
            // lblEntryTime
            // 
            this.lblEntryTime.AutoSize = true;
            this.lblEntryTime.Location = new System.Drawing.Point(111, 13);
            this.lblEntryTime.Name = "lblEntryTime";
            this.lblEntryTime.Size = new System.Drawing.Size(35, 12);
            this.lblEntryTime.TabIndex = 2;
            this.lblEntryTime.Text = "时间:";
            // 
            // lnkEntryPage
            // 
            this.lnkEntryPage.AutoSize = true;
            this.lnkEntryPage.Location = new System.Drawing.Point(14, 34);
            this.lnkEntryPage.Name = "lnkEntryPage";
            this.lnkEntryPage.Size = new System.Drawing.Size(47, 12);
            this.lnkEntryPage.TabIndex = 1;
            this.lnkEntryPage.TabStop = true;
            this.lnkEntryPage.Text = "Not set";
            // 
            // lblFirstVisit
            // 
            this.lblFirstVisit.AutoSize = true;
            this.lblFirstVisit.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFirstVisit.Location = new System.Drawing.Point(14, 13);
            this.lblFirstVisit.Name = "lblFirstVisit";
            this.lblFirstVisit.Size = new System.Drawing.Size(59, 13);
            this.lblFirstVisit.TabIndex = 0;
            this.lblFirstVisit.Text = "入口页面";
            this.lblFirstVisit.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // tabBrowseHistory
            // 
            this.tabBrowseHistory.Controls.Add(this.lstVisitedUrl);
            this.tabBrowseHistory.Controls.Add(this.lblVisitedHint);
            this.tabBrowseHistory.Location = new System.Drawing.Point(4, 21);
            this.tabBrowseHistory.Name = "tabBrowseHistory";
            this.tabBrowseHistory.Size = new System.Drawing.Size(261, 241);
            this.tabBrowseHistory.TabIndex = 1;
            this.tabBrowseHistory.Text = "浏览历史";
            this.tabBrowseHistory.ToolTipText = "View pages that the visitors has visited";
            this.tabBrowseHistory.UseVisualStyleBackColor = true;
            // 
            // lstVisitedUrl
            // 
            this.lstVisitedUrl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstVisitedUrl.Location = new System.Drawing.Point(0, 12);
            this.lstVisitedUrl.Name = "lstVisitedUrl";
            this.lstVisitedUrl.Size = new System.Drawing.Size(261, 229);
            this.lstVisitedUrl.TabIndex = 1;
            this.lstVisitedUrl.UseCompatibleStateImageBehavior = false;
            // 
            // lblVisitedHint
            // 
            this.lblVisitedHint.AutoSize = true;
            this.lblVisitedHint.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblVisitedHint.Location = new System.Drawing.Point(0, 0);
            this.lblVisitedHint.Name = "lblVisitedHint";
            this.lblVisitedHint.Size = new System.Drawing.Size(77, 12);
            this.lblVisitedHint.TabIndex = 0;
            this.lblVisitedHint.Text = "双击打开页面";
            // 
            // tabTransfer
            // 
            this.tabTransfer.Controls.Add(this.chkWarnVisitor);
            this.tabTransfer.Controls.Add(this.btnTransfer);
            this.tabTransfer.Controls.Add(this.cboOperators);
            this.tabTransfer.Controls.Add(this.lblTransfer);
            this.tabTransfer.Location = new System.Drawing.Point(4, 21);
            this.tabTransfer.Name = "tabTransfer";
            this.tabTransfer.Size = new System.Drawing.Size(261, 241);
            this.tabTransfer.TabIndex = 2;
            this.tabTransfer.Text = "转移对话";
            this.tabTransfer.ToolTipText = "Transfer the chat to another operator";
            this.tabTransfer.UseVisualStyleBackColor = true;
            // 
            // chkWarnVisitor
            // 
            this.chkWarnVisitor.AutoSize = true;
            this.chkWarnVisitor.Location = new System.Drawing.Point(23, 65);
            this.chkWarnVisitor.Name = "chkWarnVisitor";
            this.chkWarnVisitor.Size = new System.Drawing.Size(120, 16);
            this.chkWarnVisitor.TabIndex = 3;
            this.chkWarnVisitor.Text = "提示访客对话转移";
            this.chkWarnVisitor.UseVisualStyleBackColor = true;
            // 
            // btnTransfer
            // 
            this.btnTransfer.Location = new System.Drawing.Point(23, 94);
            this.btnTransfer.Name = "btnTransfer";
            this.btnTransfer.Size = new System.Drawing.Size(193, 21);
            this.btnTransfer.TabIndex = 2;
            this.btnTransfer.Text = "转移到选定的座席(&T)";
            this.btnTransfer.UseVisualStyleBackColor = true;
            this.btnTransfer.Click += new System.EventHandler(this.btnTransfer_Click);
            // 
            // cboOperators
            // 
            this.cboOperators.FormattingEnabled = true;
            this.cboOperators.Location = new System.Drawing.Point(23, 40);
            this.cboOperators.Name = "cboOperators";
            this.cboOperators.Size = new System.Drawing.Size(193, 20);
            this.cboOperators.TabIndex = 1;
            // 
            // lblTransfer
            // 
            this.lblTransfer.AutoSize = true;
            this.lblTransfer.Location = new System.Drawing.Point(20, 15);
            this.lblTransfer.Name = "lblTransfer";
            this.lblTransfer.Size = new System.Drawing.Size(161, 12);
            this.lblTransfer.TabIndex = 0;
            this.lblTransfer.Text = "把这个对话转移到另一个座席";
            // 
            // TabInfo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tabOptions);
            this.Name = "TabInfo";
            this.Size = new System.Drawing.Size(269, 266);
            this.Load += new System.EventHandler(this.TabInfo_Load);
            this.tabOptions.ResumeLayout(false);
            this.tabInformation.ResumeLayout(false);
            this.tabInformation.PerformLayout();
            this.tabBrowseHistory.ResumeLayout(false);
            this.tabBrowseHistory.PerformLayout();
            this.tabTransfer.ResumeLayout(false);
            this.tabTransfer.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabOptions;
        private System.Windows.Forms.TabPage tabInformation;
        private System.Windows.Forms.TabPage tabBrowseHistory;
        private System.Windows.Forms.TabPage tabTransfer;
        private System.Windows.Forms.Label lblFirstVisit;
        private System.Windows.Forms.LinkLabel lnkUrlReferrer;
        private System.Windows.Forms.Label lblUrlReferrer;
        private System.Windows.Forms.Label lblCurrentTime;
        private System.Windows.Forms.LinkLabel lnkCurrentPage;
        private System.Windows.Forms.Label lblCurrentPage;
        private System.Windows.Forms.Label lblEntryTime;
        private System.Windows.Forms.LinkLabel lnkEntryPage;
        private System.Windows.Forms.ListView lstVisitedUrl;
        private System.Windows.Forms.Label lblVisitedHint;
        private System.Windows.Forms.Label lblTransfer;
        private System.Windows.Forms.CheckBox chkWarnVisitor;
        private System.Windows.Forms.Button btnTransfer;
        private System.Windows.Forms.ComboBox cboOperators;
    }
}
