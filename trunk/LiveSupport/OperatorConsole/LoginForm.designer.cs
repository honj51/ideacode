namespace LiveSupport.OperatorConsole
{
    partial class LoginForm
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LoginForm));
            this.lblOpName = new System.Windows.Forms.Label();
            this.txtOpName = new System.Windows.Forms.TextBox();
            this.txtOpPassword = new System.Windows.Forms.TextBox();
            this.lblOpPassword = new System.Windows.Forms.Label();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnOK = new System.Windows.Forms.Button();
            this.pnlLogIn = new System.Windows.Forms.Panel();
            this.lblMessage = new System.Windows.Forms.Label();
            this.lblAuthenticate = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.picLogIn = new System.Windows.Forms.PictureBox();
            this.txtUserName = new System.Windows.Forms.TextBox();
            this.lblUserName = new System.Windows.Forms.Label();
            this.cbxPassword = new System.Windows.Forms.CheckBox();
            this.cbxAutoLogin = new System.Windows.Forms.CheckBox();
            this.linkLabelRegister = new System.Windows.Forms.LinkLabel();
            this.linkLabelPassword = new System.Windows.Forms.LinkLabel();
            this.autoLoginTimer = new System.Windows.Forms.Timer(this.components);
            this.pnlLogIn.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picLogIn)).BeginInit();
            this.SuspendLayout();
            // 
            // lblOpName
            // 
            this.lblOpName.AutoSize = true;
            this.lblOpName.Location = new System.Drawing.Point(24, 89);
            this.lblOpName.Name = "lblOpName";
            this.lblOpName.Size = new System.Drawing.Size(65, 12);
            this.lblOpName.TabIndex = 0;
            this.lblOpName.Text = "座席用户名";
            // 
            // txtOpName
            // 
            this.txtOpName.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtOpName.Location = new System.Drawing.Point(101, 87);
            this.txtOpName.Name = "txtOpName";
            this.txtOpName.Size = new System.Drawing.Size(154, 21);
            this.txtOpName.TabIndex = 1;
            // 
            // txtOpPassword
            // 
            this.txtOpPassword.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtOpPassword.Location = new System.Drawing.Point(101, 120);
            this.txtOpPassword.Name = "txtOpPassword";
            this.txtOpPassword.PasswordChar = '*';
            this.txtOpPassword.Size = new System.Drawing.Size(154, 21);
            this.txtOpPassword.TabIndex = 2;
            // 
            // lblOpPassword
            // 
            this.lblOpPassword.AutoSize = true;
            this.lblOpPassword.Location = new System.Drawing.Point(24, 122);
            this.lblOpPassword.Name = "lblOpPassword";
            this.lblOpPassword.Size = new System.Drawing.Size(65, 12);
            this.lblOpPassword.TabIndex = 2;
            this.lblOpPassword.Text = "密      码";
            // 
            // btnCancel
            // 
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(274, 159);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 21);
            this.btnCancel.TabIndex = 6;
            this.btnCancel.Text = "取消(&C)";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnOK
            // 
            this.btnOK.Location = new System.Drawing.Point(195, 159);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 21);
            this.btnOK.TabIndex = 5;
            this.btnOK.Text = "登陆(&L)";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // pnlLogIn
            // 
            this.pnlLogIn.BackColor = System.Drawing.Color.White;
            this.pnlLogIn.Controls.Add(this.lblMessage);
            this.pnlLogIn.Controls.Add(this.lblAuthenticate);
            this.pnlLogIn.Controls.Add(this.pictureBox1);
            this.pnlLogIn.Controls.Add(this.picLogIn);
            this.pnlLogIn.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlLogIn.Location = new System.Drawing.Point(0, 0);
            this.pnlLogIn.Name = "pnlLogIn";
            this.pnlLogIn.Size = new System.Drawing.Size(367, 51);
            this.pnlLogIn.TabIndex = 6;
            // 
            // lblMessage
            // 
            this.lblMessage.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lblMessage.AutoSize = true;
            this.lblMessage.Location = new System.Drawing.Point(207, 22);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(143, 12);
            this.lblMessage.TabIndex = 11;
            this.lblMessage.Text = "请输入座席用户名和密码.";
            // 
            // lblAuthenticate
            // 
            this.lblAuthenticate.AutoSize = true;
            this.lblAuthenticate.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAuthenticate.Location = new System.Drawing.Point(63, 22);
            this.lblAuthenticate.Name = "lblAuthenticate";
            this.lblAuthenticate.Size = new System.Drawing.Size(59, 13);
            this.lblAuthenticate.TabIndex = 1;
            this.lblAuthenticate.Text = "登陆认证";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::LiveSupport.OperatorConsole.Properties.Resources.loading;
            this.pictureBox1.Location = new System.Drawing.Point(176, 15);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(16, 16);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pictureBox1.TabIndex = 9;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Visible = false;
            // 
            // picLogIn
            // 
            this.picLogIn.ErrorImage = null;
            this.picLogIn.Image = ((System.Drawing.Image)(resources.GetObject("picLogIn.Image")));
            this.picLogIn.InitialImage = null;
            this.picLogIn.Location = new System.Drawing.Point(14, 9);
            this.picLogIn.Name = "picLogIn";
            this.picLogIn.Size = new System.Drawing.Size(43, 35);
            this.picLogIn.TabIndex = 0;
            this.picLogIn.TabStop = false;
            // 
            // txtUserName
            // 
            this.txtUserName.Location = new System.Drawing.Point(101, 57);
            this.txtUserName.Name = "txtUserName";
            this.txtUserName.Size = new System.Drawing.Size(154, 21);
            this.txtUserName.TabIndex = 0;
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Location = new System.Drawing.Point(24, 60);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(71, 12);
            this.lblUserName.TabIndex = 2;
            this.lblUserName.Text = "公 司 帐 号";
            // 
            // cbxPassword
            // 
            this.cbxPassword.AutoSize = true;
            this.cbxPassword.Location = new System.Drawing.Point(26, 161);
            this.cbxPassword.Name = "cbxPassword";
            this.cbxPassword.Size = new System.Drawing.Size(72, 16);
            this.cbxPassword.TabIndex = 3;
            this.cbxPassword.Text = "记住密码";
            this.cbxPassword.UseVisualStyleBackColor = true;
            // 
            // cbxAutoLogin
            // 
            this.cbxAutoLogin.AutoSize = true;
            this.cbxAutoLogin.Location = new System.Drawing.Point(104, 161);
            this.cbxAutoLogin.Name = "cbxAutoLogin";
            this.cbxAutoLogin.Size = new System.Drawing.Size(72, 16);
            this.cbxAutoLogin.TabIndex = 4;
            this.cbxAutoLogin.Text = "自动登录";
            this.cbxAutoLogin.UseVisualStyleBackColor = true;
            // 
            // linkLabelRegister
            // 
            this.linkLabelRegister.AutoSize = true;
            this.linkLabelRegister.Location = new System.Drawing.Point(263, 60);
            this.linkLabelRegister.Name = "linkLabelRegister";
            this.linkLabelRegister.Size = new System.Drawing.Size(65, 12);
            this.linkLabelRegister.TabIndex = 7;
            this.linkLabelRegister.TabStop = true;
            this.linkLabelRegister.Text = "注册新帐号";
            this.linkLabelRegister.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabelRegister_LinkClicked);
            // 
            // linkLabelPassword
            // 
            this.linkLabelPassword.AutoSize = true;
            this.linkLabelPassword.Location = new System.Drawing.Point(263, 122);
            this.linkLabelPassword.Name = "linkLabelPassword";
            this.linkLabelPassword.Size = new System.Drawing.Size(53, 12);
            this.linkLabelPassword.TabIndex = 8;
            this.linkLabelPassword.TabStop = true;
            this.linkLabelPassword.Text = "取回密码";
            this.linkLabelPassword.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabelPassword_LinkClicked);
            // 
            // autoLoginTimer
            // 
            this.autoLoginTimer.Tick += new System.EventHandler(this.autoLoginTimer_Tick);
            // 
            // LoginForm
            // 
            this.AcceptButton = this.btnOK;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(367, 195);
            this.ControlBox = false;
            this.Controls.Add(this.linkLabelPassword);
            this.Controls.Add(this.linkLabelRegister);
            this.Controls.Add(this.cbxAutoLogin);
            this.Controls.Add(this.cbxPassword);
            this.Controls.Add(this.lblUserName);
            this.Controls.Add(this.txtUserName);
            this.Controls.Add(this.pnlLogIn);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.txtOpPassword);
            this.Controls.Add(this.lblOpPassword);
            this.Controls.Add(this.txtOpName);
            this.Controls.Add(this.lblOpName);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "LoginForm";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "登陆";
            this.Load += new System.EventHandler(this.Login_Load);
            this.pnlLogIn.ResumeLayout(false);
            this.pnlLogIn.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picLogIn)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblOpName;
        private System.Windows.Forms.TextBox txtOpName;
        private System.Windows.Forms.TextBox txtOpPassword;
        private System.Windows.Forms.Label lblOpPassword;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Panel pnlLogIn;
        private System.Windows.Forms.TextBox txtUserName;
        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.CheckBox cbxPassword;
        private System.Windows.Forms.CheckBox cbxAutoLogin;
        private System.Windows.Forms.LinkLabel linkLabelRegister;
        private System.Windows.Forms.LinkLabel linkLabelPassword;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblAuthenticate;
        private System.Windows.Forms.PictureBox picLogIn;
        public System.Windows.Forms.Label lblMessage;
        private System.Windows.Forms.Timer autoLoginTimer;
    }
}