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
            this.splashPicture.Image = global::Microsoft.Samples.SqlServer.Properties.Resources.SubSideMonitoringUI_ConnectDlg;
            this.splashPicture.Location = new System.Drawing.Point(0, 0);
            this.splashPicture.Name = "splashPicture";
            this.splashPicture.Size = new System.Drawing.Size(384, 55);
            this.splashPicture.TabIndex = 0;
            this.splashPicture.TabStop = false;
            // 
            // subscriberLabelDB
            // 
            this.subscriberLabelDB.Location = new System.Drawing.Point(15, 135);
            this.subscriberLabelDB.Name = "subscriberLabelDB";
            this.subscriberLabelDB.Size = new System.Drawing.Size(131, 15);
            this.subscriberLabelDB.TabIndex = 4;
            this.subscriberLabelDB.Text = "订阅数据库:";
            // 
            // publisherLabel
            // 
            this.publisherLabel.Location = new System.Drawing.Point(15, 155);
            this.publisherLabel.Name = "publisherLabel";
            this.publisherLabel.Size = new System.Drawing.Size(116, 15);
            this.publisherLabel.TabIndex = 6;
            this.publisherLabel.Text = "发布者:";
            // 
            // publicationLabel
            // 
            this.publicationLabel.Location = new System.Drawing.Point(15, 175);
            this.publicationLabel.Name = "publicationLabel";
            this.publicationLabel.Size = new System.Drawing.Size(116, 15);
            this.publicationLabel.TabIndex = 8;
            this.publicationLabel.Text = "发布名:";
            // 
            // publisherLabelDB
            // 
            this.publisherLabelDB.Location = new System.Drawing.Point(15, 196);
            this.publisherLabelDB.Name = "publisherLabelDB";
            this.publisherLabelDB.Size = new System.Drawing.Size(116, 16);
            this.publisherLabelDB.TabIndex = 10;
            this.publisherLabelDB.Text = "发布数据库:";
            // 
            // connectButton
            // 
            this.connectButton.Location = new System.Drawing.Point(81, 226);
            this.connectButton.Name = "connectButton";
            this.connectButton.Size = new System.Drawing.Size(75, 21);
            this.connectButton.TabIndex = 6;
            this.connectButton.Text = "连接";
            this.connectButton.Click += new System.EventHandler(this.OnClickConnect);
            // 
            // cancelButton
            // 
            this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.cancelButton.Location = new System.Drawing.Point(243, 226);
            this.cancelButton.Name = "cancelButton";
            this.cancelButton.Size = new System.Drawing.Size(75, 21);
            this.cancelButton.TabIndex = 8;
            this.cancelButton.Text = "取消";
            // 
            // subscriberDbTextBox
            // 
            this.subscriberDbTextBox.Enabled = false;
            this.subscriberDbTextBox.Location = new System.Drawing.Point(152, 132);
            this.subscriberDbTextBox.Name = "subscriberDbTextBox";
            this.subscriberDbTextBox.Size = new System.Drawing.Size(209, 21);
            this.subscriberDbTextBox.TabIndex = 2;
            // 
            // publisherTextBox
            // 
            this.publisherTextBox.Enabled = false;
            this.publisherTextBox.Location = new System.Drawing.Point(152, 151);
            this.publisherTextBox.Name = "publisherTextBox";
            this.publisherTextBox.Size = new System.Drawing.Size(209, 21);
            this.publisherTextBox.TabIndex = 3;
            // 
            // publicationTextBox
            // 
            this.publicationTextBox.Enabled = false;
            this.publicationTextBox.Location = new System.Drawing.Point(152, 172);
            this.publicationTextBox.Name = "publicationTextBox";
            this.publicationTextBox.Size = new System.Drawing.Size(209, 21);
            this.publicationTextBox.TabIndex = 4;
            // 
            // publisherDbTextBox
            // 
            this.publisherDbTextBox.Enabled = false;
            this.publisherDbTextBox.Location = new System.Drawing.Point(152, 193);
            this.publisherDbTextBox.Name = "publisherDbTextBox";
            this.publisherDbTextBox.Size = new System.Drawing.Size(209, 21);
            this.publisherDbTextBox.TabIndex = 5;
            // 
            // subscriptionsComboBox
            // 
            this.subscriptionsComboBox.DropDownWidth = 208;
            this.subscriptionsComboBox.FormattingEnabled = true;
            this.subscriptionsComboBox.Location = new System.Drawing.Point(153, 97);
            this.subscriptionsComboBox.Name = "subscriptionsComboBox";
            this.subscriptionsComboBox.Size = new System.Drawing.Size(208, 20);
            this.subscriptionsComboBox.TabIndex = 1;
            this.subscriptionsComboBox.SelectedIndexChanged += new System.EventHandler(this.subscriptionsComboBox_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(15, 97);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(131, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "可用订阅:";
            // 
            // editButton
            // 
            this.editButton.Location = new System.Drawing.Point(162, 226);
            this.editButton.Name = "editButton";
            this.editButton.Size = new System.Drawing.Size(75, 21);
            this.editButton.TabIndex = 7;
            this.editButton.Text = "修改";
            this.editButton.Click += new System.EventHandler(this.editButton_Click);
            // 
            // subscriberComboBox
            // 
            this.subscriberComboBox.FormattingEnabled = true;
            this.subscriberComboBox.Location = new System.Drawing.Point(153, 72);
            this.subscriberComboBox.Name = "subscriberComboBox";
            this.subscriberComboBox.Size = new System.Drawing.Size(208, 20);
            this.subscriberComboBox.TabIndex = 0;
            this.subscriberComboBox.SelectedIndexChanged += new System.EventHandler(this.subscriberComboBox_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 72);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(95, 12);
            this.label2.TabIndex = 10;
            this.label2.Text = "本地服务器名称:";
            // 
            // ConnectDialog
            // 
            this.AcceptButton = this.connectButton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.cancelButton;
            this.ClientSize = new System.Drawing.Size(384, 258);
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