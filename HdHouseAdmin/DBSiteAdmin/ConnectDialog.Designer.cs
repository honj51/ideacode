﻿namespace DBSiteAdmin
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
            this.label3 = new System.Windows.Forms.Label();
            this.webSyncUrlTextBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.internetUserNameTextBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.internetUserPasswordTextBox = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            ((System.ComponentModel.ISupportInitialize)(this.splashPicture)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // splashPicture
            // 
            this.splashPicture.Dock = System.Windows.Forms.DockStyle.Top;
            this.splashPicture.Image = global::DBSiteAdmin.Properties.Resources.SubSideMonitoringUI_ConnectDlg;
            this.splashPicture.Location = new System.Drawing.Point(0, 0);
            this.splashPicture.Name = "splashPicture";
            this.splashPicture.Size = new System.Drawing.Size(399, 60);
            this.splashPicture.TabIndex = 0;
            this.splashPicture.TabStop = false;
            // 
            // subscriberLabelDB
            // 
            this.subscriberLabelDB.Location = new System.Drawing.Point(15, 17);
            this.subscriberLabelDB.Name = "subscriberLabelDB";
            this.subscriberLabelDB.Size = new System.Drawing.Size(108, 15);
            this.subscriberLabelDB.TabIndex = 4;
            this.subscriberLabelDB.Text = "订阅数据库:";
            // 
            // publisherLabel
            // 
            this.publisherLabel.Location = new System.Drawing.Point(15, 41);
            this.publisherLabel.Name = "publisherLabel";
            this.publisherLabel.Size = new System.Drawing.Size(108, 15);
            this.publisherLabel.TabIndex = 6;
            this.publisherLabel.Text = "发布者:";
            // 
            // publicationLabel
            // 
            this.publicationLabel.Location = new System.Drawing.Point(15, 65);
            this.publicationLabel.Name = "publicationLabel";
            this.publicationLabel.Size = new System.Drawing.Size(108, 15);
            this.publicationLabel.TabIndex = 8;
            this.publicationLabel.Text = "发布名:";
            // 
            // publisherLabelDB
            // 
            this.publisherLabelDB.Location = new System.Drawing.Point(15, 90);
            this.publisherLabelDB.Name = "publisherLabelDB";
            this.publisherLabelDB.Size = new System.Drawing.Size(108, 16);
            this.publisherLabelDB.TabIndex = 10;
            this.publisherLabelDB.Text = "发布数据库:";
            // 
            // connectButton
            // 
            this.connectButton.Location = new System.Drawing.Point(210, 379);
            this.connectButton.Name = "connectButton";
            this.connectButton.Size = new System.Drawing.Size(75, 27);
            this.connectButton.TabIndex = 6;
            this.connectButton.Text = "确定";
            this.connectButton.Click += new System.EventHandler(this.OnClickConnect);
            // 
            // cancelButton
            // 
            this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.cancelButton.Location = new System.Drawing.Point(291, 379);
            this.cancelButton.Name = "cancelButton";
            this.cancelButton.Size = new System.Drawing.Size(75, 27);
            this.cancelButton.TabIndex = 8;
            this.cancelButton.Text = "取消";
            // 
            // subscriberDbTextBox
            // 
            this.subscriberDbTextBox.Enabled = false;
            this.subscriberDbTextBox.Location = new System.Drawing.Point(143, 14);
            this.subscriberDbTextBox.Name = "subscriberDbTextBox";
            this.subscriberDbTextBox.Size = new System.Drawing.Size(209, 21);
            this.subscriberDbTextBox.TabIndex = 2;
            // 
            // publisherTextBox
            // 
            this.publisherTextBox.Enabled = false;
            this.publisherTextBox.Location = new System.Drawing.Point(143, 38);
            this.publisherTextBox.Name = "publisherTextBox";
            this.publisherTextBox.Size = new System.Drawing.Size(209, 21);
            this.publisherTextBox.TabIndex = 3;
            // 
            // publicationTextBox
            // 
            this.publicationTextBox.Enabled = false;
            this.publicationTextBox.Location = new System.Drawing.Point(143, 62);
            this.publicationTextBox.Name = "publicationTextBox";
            this.publicationTextBox.Size = new System.Drawing.Size(209, 21);
            this.publicationTextBox.TabIndex = 4;
            // 
            // publisherDbTextBox
            // 
            this.publisherDbTextBox.Enabled = false;
            this.publisherDbTextBox.Location = new System.Drawing.Point(143, 87);
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
            this.label1.Size = new System.Drawing.Size(108, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "可用订阅:";
            // 
            // editButton
            // 
            this.editButton.Location = new System.Drawing.Point(57, 379);
            this.editButton.Name = "editButton";
            this.editButton.Size = new System.Drawing.Size(75, 27);
            this.editButton.TabIndex = 7;
            this.editButton.Text = "修改(&M)";
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
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(15, 32);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(108, 16);
            this.label3.TabIndex = 12;
            this.label3.Text = "同步地址:";
            // 
            // webSyncUrlTextBox
            // 
            this.webSyncUrlTextBox.Enabled = false;
            this.webSyncUrlTextBox.Location = new System.Drawing.Point(143, 29);
            this.webSyncUrlTextBox.Name = "webSyncUrlTextBox";
            this.webSyncUrlTextBox.Size = new System.Drawing.Size(209, 21);
            this.webSyncUrlTextBox.TabIndex = 11;
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(15, 60);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(108, 16);
            this.label4.TabIndex = 14;
            this.label4.Text = "用户名:";
            // 
            // internetUserNameTextBox
            // 
            this.internetUserNameTextBox.Enabled = false;
            this.internetUserNameTextBox.Location = new System.Drawing.Point(143, 57);
            this.internetUserNameTextBox.Name = "internetUserNameTextBox";
            this.internetUserNameTextBox.Size = new System.Drawing.Size(209, 21);
            this.internetUserNameTextBox.TabIndex = 13;
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(15, 87);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(108, 16);
            this.label5.TabIndex = 16;
            this.label5.Text = "密码:";
            // 
            // internetUserPasswordTextBox
            // 
            this.internetUserPasswordTextBox.Enabled = false;
            this.internetUserPasswordTextBox.Location = new System.Drawing.Point(143, 84);
            this.internetUserPasswordTextBox.Name = "internetUserPasswordTextBox";
            this.internetUserPasswordTextBox.Size = new System.Drawing.Size(209, 21);
            this.internetUserPasswordTextBox.TabIndex = 15;
            this.internetUserPasswordTextBox.UseSystemPasswordChar = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.subscriberLabelDB);
            this.groupBox1.Controls.Add(this.publisherDbTextBox);
            this.groupBox1.Controls.Add(this.publicationTextBox);
            this.groupBox1.Controls.Add(this.publisherTextBox);
            this.groupBox1.Controls.Add(this.subscriberDbTextBox);
            this.groupBox1.Controls.Add(this.publisherLabelDB);
            this.groupBox1.Controls.Add(this.publicationLabel);
            this.groupBox1.Controls.Add(this.publisherLabel);
            this.groupBox1.Location = new System.Drawing.Point(9, 123);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(358, 114);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "订阅";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.webSyncUrlTextBox);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.internetUserNameTextBox);
            this.groupBox2.Controls.Add(this.internetUserPasswordTextBox);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Location = new System.Drawing.Point(9, 243);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(358, 120);
            this.groupBox2.TabIndex = 18;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "同步";
            // 
            // ConnectDialog
            // 
            this.AcceptButton = this.connectButton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.cancelButton;
            this.ClientSize = new System.Drawing.Size(399, 416);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.subscriberComboBox);
            this.Controls.Add(this.editButton);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.subscriptionsComboBox);
            this.Controls.Add(this.splashPicture);
            this.Controls.Add(this.connectButton);
            this.Controls.Add(this.cancelButton);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ConnectDialog";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "选择订阅监测";
            this.Load += new System.EventHandler(this.ConnectDialog_Load);
            ((System.ComponentModel.ISupportInitialize)(this.splashPicture)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
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
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox webSyncUrlTextBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox internetUserNameTextBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox internetUserPasswordTextBox;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
    }
}