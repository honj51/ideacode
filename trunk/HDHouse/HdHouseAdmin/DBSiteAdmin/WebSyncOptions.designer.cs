namespace DBSiteAdmin
{
    partial class WebSyncOptions
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(WebSyncOptions));
            this.cancelButton = new System.Windows.Forms.Button();
            this.okButton = new System.Windows.Forms.Button();
            this.passwordTextBox = new System.Windows.Forms.TextBox();
            this.passwordLabel = new System.Windows.Forms.Label();
            this.userNameTextBox = new System.Windows.Forms.TextBox();
            this.userNameLabel = new System.Windows.Forms.Label();
            this.webSyncUrlTexBox = new System.Windows.Forms.TextBox();
            this.webSyncUrlLabel = new System.Windows.Forms.Label();
            this.optionsPanel = new System.Windows.Forms.Panel();
            this.enableWebSyncChkBox = new System.Windows.Forms.CheckBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.mnuTellMeMore = new System.Windows.Forms.ToolStripMenuItem();
            this.optionsPanel.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cancelButton
            // 
            this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            resources.ApplyResources(this.cancelButton, "cancelButton");
            this.cancelButton.Name = "cancelButton";
            this.cancelButton.Click += new System.EventHandler(this.cancelButton_Click);
            // 
            // okButton
            // 
            this.okButton.DialogResult = System.Windows.Forms.DialogResult.OK;
            resources.ApplyResources(this.okButton, "okButton");
            this.okButton.Name = "okButton";
            this.okButton.Click += new System.EventHandler(this.okButton_Click);
            // 
            // passwordTextBox
            // 
            resources.ApplyResources(this.passwordTextBox, "passwordTextBox");
            this.passwordTextBox.Name = "passwordTextBox";
            // 
            // passwordLabel
            // 
            resources.ApplyResources(this.passwordLabel, "passwordLabel");
            this.passwordLabel.Name = "passwordLabel";
            // 
            // userNameTextBox
            // 
            resources.ApplyResources(this.userNameTextBox, "userNameTextBox");
            this.userNameTextBox.Name = "userNameTextBox";
            // 
            // userNameLabel
            // 
            resources.ApplyResources(this.userNameLabel, "userNameLabel");
            this.userNameLabel.Name = "userNameLabel";
            // 
            // webSyncUrlTexBox
            // 
            resources.ApplyResources(this.webSyncUrlTexBox, "webSyncUrlTexBox");
            this.webSyncUrlTexBox.Name = "webSyncUrlTexBox";
            // 
            // webSyncUrlLabel
            // 
            resources.ApplyResources(this.webSyncUrlLabel, "webSyncUrlLabel");
            this.webSyncUrlLabel.Name = "webSyncUrlLabel";
            // 
            // optionsPanel
            // 
            this.optionsPanel.Controls.Add(this.userNameTextBox);
            this.optionsPanel.Controls.Add(this.webSyncUrlLabel);
            this.optionsPanel.Controls.Add(this.userNameLabel);
            this.optionsPanel.Controls.Add(this.webSyncUrlTexBox);
            this.optionsPanel.Controls.Add(this.passwordLabel);
            this.optionsPanel.Controls.Add(this.passwordTextBox);
            resources.ApplyResources(this.optionsPanel, "optionsPanel");
            this.optionsPanel.Name = "optionsPanel";
            // 
            // enableWebSyncChkBox
            // 
            resources.ApplyResources(this.enableWebSyncChkBox, "enableWebSyncChkBox");
            this.enableWebSyncChkBox.Name = "enableWebSyncChkBox";
            this.enableWebSyncChkBox.CheckedChanged += new System.EventHandler(this.enableWebSyncChkBox_CheckedChanged);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuTellMeMore});
            resources.ApplyResources(this.menuStrip1, "menuStrip1");
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            // 
            // mnuTellMeMore
            // 
            this.mnuTellMeMore.Name = "mnuTellMeMore";
            resources.ApplyResources(this.mnuTellMeMore, "mnuTellMeMore");
            this.mnuTellMeMore.Click += new System.EventHandler(this.mnuTellMeMore_Click);
            // 
            // WebSyncOptions
            // 
            this.AcceptButton = this.okButton;
            resources.ApplyResources(this, "$this");
            this.CancelButton = this.cancelButton;
            this.Controls.Add(this.enableWebSyncChkBox);
            this.Controls.Add(this.optionsPanel);
            this.Controls.Add(this.cancelButton);
            this.Controls.Add(this.okButton);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "WebSyncOptions";
            this.ShowInTaskbar = false;
            this.Load += new System.EventHandler(this.WebSyncOptions_Load);
            this.optionsPanel.ResumeLayout(false);
            this.optionsPanel.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button cancelButton;
        private System.Windows.Forms.Button okButton;
        private System.Windows.Forms.TextBox passwordTextBox;
        private System.Windows.Forms.Label passwordLabel;
        private System.Windows.Forms.TextBox userNameTextBox;
        private System.Windows.Forms.Label userNameLabel;
		private System.Windows.Forms.TextBox webSyncUrlTexBox;
		private System.Windows.Forms.Label webSyncUrlLabel;
		private System.Windows.Forms.Panel optionsPanel;
		private System.Windows.Forms.CheckBox enableWebSyncChkBox;
		private System.Windows.Forms.MenuStrip menuStrip1;
		private System.Windows.Forms.ToolStripMenuItem mnuTellMeMore;
    }
}
