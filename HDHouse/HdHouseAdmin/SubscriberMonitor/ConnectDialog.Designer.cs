namespace Microsoft.Samples.SqlServer
{
    partial class ConnectDialog
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ConnectDialog));
			this.splashPicture = new System.Windows.Forms.PictureBox();
			this.subscriberLabelDB = new System.Windows.Forms.Label();
			this.publisherLabel = new System.Windows.Forms.Label();
			this.publicationLabel = new System.Windows.Forms.Label();
			this.publisherLabelDB = new System.Windows.Forms.Label();
			this.connectButton = new System.Windows.Forms.Button();
			this.cancelButton = new System.Windows.Forms.Button();
			this.subscriberDbTextBox = new System.Windows.Forms.TextBox();
			this.publisherTextBox = new System.Windows.Forms.TextBox();
			this.publicationTextBox = new System.Windows.Forms.TextBox();
			this.publisherDbTextBox = new System.Windows.Forms.TextBox();
			this.subscriptionsComboBox = new System.Windows.Forms.ComboBox();
			this.label1 = new System.Windows.Forms.Label();
			this.editButton = new System.Windows.Forms.Button();
			this.subscriberComboBox = new System.Windows.Forms.ComboBox();
			this.label2 = new System.Windows.Forms.Label();
			((System.ComponentModel.ISupportInitialize)(this.splashPicture)).BeginInit();
			this.SuspendLayout();
			// 
			// splashPicture
			// 
			this.splashPicture.Dock = System.Windows.Forms.DockStyle.Top;
			this.splashPicture.Image = Microsoft.Samples.SqlServer.Properties.Resources.SubSideMonitoringUI_ConnectDlg;
			this.splashPicture.Location = new System.Drawing.Point(0, 0);
			this.splashPicture.Name = "splashPicture";
			this.splashPicture.Size = new System.Drawing.Size(384, 60);
			this.splashPicture.TabIndex = 0;
			this.splashPicture.TabStop = false;
			// 
			// subscriberLabelDB
			// 
			this.subscriberLabelDB.Location = new System.Drawing.Point(15, 146);
			this.subscriberLabelDB.Name = "subscriberLabelDB";
			this.subscriberLabelDB.Size = new System.Drawing.Size(131, 16);
			this.subscriberLabelDB.TabIndex = 4;
			this.subscriberLabelDB.Text = "Subscription Database:";
			// 
			// publisherLabel
			// 
			this.publisherLabel.Location = new System.Drawing.Point(15, 168);
			this.publisherLabel.Name = "publisherLabel";
			this.publisherLabel.Size = new System.Drawing.Size(116, 16);
			this.publisherLabel.TabIndex = 6;
			this.publisherLabel.Text = "Publisher:";
			// 
			// publicationLabel
			// 
			this.publicationLabel.Location = new System.Drawing.Point(15, 190);
			this.publicationLabel.Name = "publicationLabel";
			this.publicationLabel.Size = new System.Drawing.Size(116, 16);
			this.publicationLabel.TabIndex = 8;
			this.publicationLabel.Text = "Publication:";
			// 
			// publisherLabelDB
			// 
			this.publisherLabelDB.Location = new System.Drawing.Point(15, 212);
			this.publisherLabelDB.Name = "publisherLabelDB";
			this.publisherLabelDB.Size = new System.Drawing.Size(116, 17);
			this.publisherLabelDB.TabIndex = 10;
			this.publisherLabelDB.Text = "Publisher Database:";
			// 
			// connectButton
			// 
			this.connectButton.Location = new System.Drawing.Point(81, 245);
			this.connectButton.Name = "connectButton";
			this.connectButton.TabIndex = 6;
			this.connectButton.Text = "&Connect";
			this.connectButton.Click += new System.EventHandler(this.OnClickConnect);
			// 
			// cancelButton
			// 
			this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.cancelButton.Location = new System.Drawing.Point(243, 245);
			this.cancelButton.Name = "cancelButton";
			this.cancelButton.TabIndex = 8;
			this.cancelButton.Text = "Cancel";
			// 
			// subscriberDbTextBox
			// 
			this.subscriberDbTextBox.Enabled = false;
			this.subscriberDbTextBox.Location = new System.Drawing.Point(152, 143);
			this.subscriberDbTextBox.Name = "subscriberDbTextBox";
			this.subscriberDbTextBox.Size = new System.Drawing.Size(209, 20);
			this.subscriberDbTextBox.TabIndex = 2;
			// 
			// publisherTextBox
			// 
			this.publisherTextBox.Enabled = false;
			this.publisherTextBox.Location = new System.Drawing.Point(152, 164);
			this.publisherTextBox.Name = "publisherTextBox";
			this.publisherTextBox.Size = new System.Drawing.Size(209, 20);
			this.publisherTextBox.TabIndex = 3;
			// 
			// publicationTextBox
			// 
			this.publicationTextBox.Enabled = false;
			this.publicationTextBox.Location = new System.Drawing.Point(152, 186);
			this.publicationTextBox.Name = "publicationTextBox";
			this.publicationTextBox.Size = new System.Drawing.Size(209, 20);
			this.publicationTextBox.TabIndex = 4;
			// 
			// publisherDbTextBox
			// 
			this.publisherDbTextBox.Enabled = false;
			this.publisherDbTextBox.Location = new System.Drawing.Point(152, 209);
			this.publisherDbTextBox.Name = "publisherDbTextBox";
			this.publisherDbTextBox.Size = new System.Drawing.Size(209, 20);
			this.publisherDbTextBox.TabIndex = 5;
			// 
			// subscriptionsComboBox
			// 
			this.subscriptionsComboBox.DropDownWidth = 208;
			this.subscriptionsComboBox.FormattingEnabled = true;
			this.subscriptionsComboBox.Location = new System.Drawing.Point(153, 105);
			this.subscriptionsComboBox.Name = "subscriptionsComboBox";
			this.subscriptionsComboBox.Size = new System.Drawing.Size(208, 21);
			this.subscriptionsComboBox.TabIndex = 1;
			this.subscriptionsComboBox.SelectedIndexChanged += new System.EventHandler(this.subscriptionsComboBox_SelectedIndexChanged);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(15, 105);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(131, 18);
			this.label1.TabIndex = 2;
			this.label1.Text = "Available Subscriptions:";
			// 
			// editButton
			// 
			this.editButton.Location = new System.Drawing.Point(162, 245);
			this.editButton.Name = "editButton";
			this.editButton.TabIndex = 7;
			this.editButton.Text = "&Edit";
			this.editButton.Click += new System.EventHandler(this.editButton_Click);
			// 
			// subscriberComboBox
			// 
			this.subscriberComboBox.FormattingEnabled = true;
			this.subscriberComboBox.Location = new System.Drawing.Point(153, 78);
			this.subscriberComboBox.Name = "subscriberComboBox";
			this.subscriberComboBox.Size = new System.Drawing.Size(208, 21);
			this.subscriberComboBox.TabIndex = 0;
			this.subscriberComboBox.SelectedIndexChanged += new System.EventHandler(this.subscriberComboBox_SelectedIndexChanged);
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(15, 78);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(104, 14);
			this.label2.TabIndex = 10;
			this.label2.Text = "Local Server Name:";
			// 
			// ConnectDialog
			// 
			this.AcceptButton = this.connectButton;
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.CancelButton = this.cancelButton;
			this.ClientSize = new System.Drawing.Size(384, 280);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.subscriberComboBox);
			this.Controls.Add(this.editButton);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.subscriptionsComboBox);
			this.Controls.Add(this.splashPicture);
			this.Controls.Add(this.subscriberLabelDB);
			this.Controls.Add(this.publisherLabel);
			this.Controls.Add(this.publicationLabel);
			this.Controls.Add(this.publisherLabelDB);
			this.Controls.Add(this.subscriberDbTextBox);
			this.Controls.Add(this.publisherTextBox);
			this.Controls.Add(this.publicationTextBox);
			this.Controls.Add(this.publisherDbTextBox);
			this.Controls.Add(this.connectButton);
			this.Controls.Add(this.cancelButton);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "ConnectDialog";
			this.ShowInTaskbar = false;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Select Subscription to Monitor";
			this.Load += new System.EventHandler(this.ConnectDialog_Load);
			((System.ComponentModel.ISupportInitialize)(this.splashPicture)).EndInit();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

        #endregion

		private System.Windows.Forms.PictureBox splashPicture;
        private System.Windows.Forms.Label subscriberLabelDB;
        private System.Windows.Forms.Label publisherLabel;
        private System.Windows.Forms.Label publicationLabel;
		private System.Windows.Forms.Label publisherLabelDB;
        private System.Windows.Forms.TextBox subscriberDbTextBox;
        private System.Windows.Forms.TextBox publisherTextBox;
        private System.Windows.Forms.TextBox publicationTextBox;
        private System.Windows.Forms.TextBox publisherDbTextBox;
        private System.Windows.Forms.Button connectButton;
        private System.Windows.Forms.Button cancelButton;
        private System.Windows.Forms.ComboBox subscriptionsComboBox;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button editButton;
		private System.Windows.Forms.ComboBox subscriberComboBox;
		private System.Windows.Forms.Label label2;
    }
}