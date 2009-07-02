namespace LiveSupport.OperatorConsole
{
    partial class OptionsForm
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
            this.cbxplaySoundOnChatRequest = new System.Windows.Forms.CheckBox();
            this.cbxplaySoundOnChatMessage = new System.Windows.Forms.CheckBox();
            this.cbxwhenOfflineGetWebsiteRequests = new System.Windows.Forms.CheckBox();
            this.cbxAutoLogin = new System.Windows.Forms.CheckBox();
            this.radioButtonCloseSet1 = new System.Windows.Forms.RadioButton();
            this.radioButtonCloseSet2 = new System.Windows.Forms.RadioButton();
            this.cbxAutoStart = new System.Windows.Forms.CheckBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.buttonSave = new System.Windows.Forms.Button();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonApply = new System.Windows.Forms.Button();
            this.groupBox3.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbxplaySoundOnChatRequest
            // 
            this.cbxplaySoundOnChatRequest.AutoSize = true;
            this.cbxplaySoundOnChatRequest.Location = new System.Drawing.Point(33, 20);
            this.cbxplaySoundOnChatRequest.Name = "cbxplaySoundOnChatRequest";
            this.cbxplaySoundOnChatRequest.Size = new System.Drawing.Size(132, 16);
            this.cbxplaySoundOnChatRequest.TabIndex = 2;
            this.cbxplaySoundOnChatRequest.Text = "对话请求时播放声音";
            this.cbxplaySoundOnChatRequest.UseVisualStyleBackColor = true;
            this.cbxplaySoundOnChatRequest.Click += new System.EventHandler(this.cbxAutoStart_CheckedChanged);
            // 
            // cbxplaySoundOnChatMessage
            // 
            this.cbxplaySoundOnChatMessage.AutoSize = true;
            this.cbxplaySoundOnChatMessage.Location = new System.Drawing.Point(33, 42);
            this.cbxplaySoundOnChatMessage.Name = "cbxplaySoundOnChatMessage";
            this.cbxplaySoundOnChatMessage.Size = new System.Drawing.Size(120, 16);
            this.cbxplaySoundOnChatMessage.TabIndex = 3;
            this.cbxplaySoundOnChatMessage.Text = "新消息时播放声音";
            this.cbxplaySoundOnChatMessage.UseVisualStyleBackColor = true;
            this.cbxplaySoundOnChatMessage.Click += new System.EventHandler(this.cbxAutoStart_CheckedChanged);
            // 
            // cbxwhenOfflineGetWebsiteRequests
            // 
            this.cbxwhenOfflineGetWebsiteRequests.AutoSize = true;
            this.cbxwhenOfflineGetWebsiteRequests.Location = new System.Drawing.Point(33, 64);
            this.cbxwhenOfflineGetWebsiteRequests.Name = "cbxwhenOfflineGetWebsiteRequests";
            this.cbxwhenOfflineGetWebsiteRequests.Size = new System.Drawing.Size(168, 16);
            this.cbxwhenOfflineGetWebsiteRequests.TabIndex = 4;
            this.cbxwhenOfflineGetWebsiteRequests.Text = "离线时仍获取网站访问记录";
            this.cbxwhenOfflineGetWebsiteRequests.UseVisualStyleBackColor = true;
            this.cbxwhenOfflineGetWebsiteRequests.Click += new System.EventHandler(this.cbxAutoStart_CheckedChanged);
            // 
            // cbxAutoLogin
            // 
            this.cbxAutoLogin.AutoSize = true;
            this.cbxAutoLogin.Location = new System.Drawing.Point(33, 42);
            this.cbxAutoLogin.Name = "cbxAutoLogin";
            this.cbxAutoLogin.Size = new System.Drawing.Size(72, 16);
            this.cbxAutoLogin.TabIndex = 1;
            this.cbxAutoLogin.Text = "自动登录";
            this.cbxAutoLogin.UseVisualStyleBackColor = true;
            this.cbxAutoLogin.Click += new System.EventHandler(this.cbxAutoStart_CheckedChanged);
            // 
            // radioButtonCloseSet1
            // 
            this.radioButtonCloseSet1.AutoSize = true;
            this.radioButtonCloseSet1.Location = new System.Drawing.Point(32, 20);
            this.radioButtonCloseSet1.Name = "radioButtonCloseSet1";
            this.radioButtonCloseSet1.Size = new System.Drawing.Size(173, 16);
            this.radioButtonCloseSet1.TabIndex = 5;
            this.radioButtonCloseSet1.TabStop = true;
            this.radioButtonCloseSet1.Text = "隐藏在任务栏中,不退出系统";
            this.radioButtonCloseSet1.UseVisualStyleBackColor = true;
            this.radioButtonCloseSet1.CheckedChanged += new System.EventHandler(this.cbxAutoStart_CheckedChanged);
            // 
            // radioButtonCloseSet2
            // 
            this.radioButtonCloseSet2.AutoSize = true;
            this.radioButtonCloseSet2.Location = new System.Drawing.Point(33, 42);
            this.radioButtonCloseSet2.Name = "radioButtonCloseSet2";
            this.radioButtonCloseSet2.Size = new System.Drawing.Size(71, 16);
            this.radioButtonCloseSet2.TabIndex = 6;
            this.radioButtonCloseSet2.TabStop = true;
            this.radioButtonCloseSet2.Text = "退出系统";
            this.radioButtonCloseSet2.UseVisualStyleBackColor = true;
            this.radioButtonCloseSet2.CheckedChanged += new System.EventHandler(this.cbxAutoStart_CheckedChanged);
            // 
            // cbxAutoStart
            // 
            this.cbxAutoStart.AutoSize = true;
            this.cbxAutoStart.Location = new System.Drawing.Point(33, 20);
            this.cbxAutoStart.Name = "cbxAutoStart";
            this.cbxAutoStart.Size = new System.Drawing.Size(150, 16);
            this.cbxAutoStart.TabIndex = 0;
            this.cbxAutoStart.Text = "启动Windows时自动运行";
            this.cbxAutoStart.UseVisualStyleBackColor = true;
            this.cbxAutoStart.CheckedChanged += new System.EventHandler(this.cbxAutoStart_CheckedChanged);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.radioButtonCloseSet2);
            this.groupBox3.Controls.Add(this.radioButtonCloseSet1);
            this.groupBox3.ForeColor = System.Drawing.Color.Black;
            this.groupBox3.Location = new System.Drawing.Point(32, 201);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(383, 73);
            this.groupBox3.TabIndex = 12;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "关闭主面板时：";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cbxAutoStart);
            this.groupBox1.Controls.Add(this.cbxAutoLogin);
            this.groupBox1.ForeColor = System.Drawing.Color.Black;
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(419, 67);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "启动和登录";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.cbxplaySoundOnChatRequest);
            this.groupBox2.Controls.Add(this.cbxplaySoundOnChatMessage);
            this.groupBox2.Controls.Add(this.cbxwhenOfflineGetWebsiteRequests);
            this.groupBox2.ForeColor = System.Drawing.Color.Black;
            this.groupBox2.Location = new System.Drawing.Point(12, 85);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(419, 100);
            this.groupBox2.TabIndex = 11;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "一般设置";
            // 
            // buttonSave
            // 
            this.buttonSave.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.buttonSave.Location = new System.Drawing.Point(215, 292);
            this.buttonSave.Name = "buttonSave";
            this.buttonSave.Size = new System.Drawing.Size(65, 23);
            this.buttonSave.TabIndex = 7;
            this.buttonSave.Text = "确定";
            this.buttonSave.UseVisualStyleBackColor = true;
            this.buttonSave.Click += new System.EventHandler(this.buttonSave_Click);
            // 
            // buttonCancel
            // 
            this.buttonCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.buttonCancel.Location = new System.Drawing.Point(291, 292);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(65, 23);
            this.buttonCancel.TabIndex = 8;
            this.buttonCancel.Text = "取消";
            this.buttonCancel.UseVisualStyleBackColor = true;
            // 
            // buttonApply
            // 
            this.buttonApply.Location = new System.Drawing.Point(366, 292);
            this.buttonApply.Name = "buttonApply";
            this.buttonApply.Size = new System.Drawing.Size(65, 23);
            this.buttonApply.TabIndex = 9;
            this.buttonApply.Text = "应用";
            this.buttonApply.UseVisualStyleBackColor = true;
            this.buttonApply.Click += new System.EventHandler(this.buttonApply_Click);
            // 
            // OptionsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(443, 323);
            this.Controls.Add(this.buttonApply);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonSave);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox3);
            this.Name = "OptionsForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "系统设置";
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.CheckBox cbxplaySoundOnChatRequest;
        private System.Windows.Forms.CheckBox cbxplaySoundOnChatMessage;
        private System.Windows.Forms.CheckBox cbxwhenOfflineGetWebsiteRequests;
        private System.Windows.Forms.CheckBox cbxAutoLogin;
        private System.Windows.Forms.RadioButton radioButtonCloseSet1;
        private System.Windows.Forms.RadioButton radioButtonCloseSet2;
        private System.Windows.Forms.CheckBox cbxAutoStart;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button buttonSave;
        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonApply;

    }
}