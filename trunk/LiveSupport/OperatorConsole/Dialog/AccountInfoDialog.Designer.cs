namespace LiveSupport.OperatorConsole.Dialog
{
    partial class AccountInfoDialog
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
            System.Windows.Forms.Label accountNumberLabel;
            System.Windows.Forms.Label companyNameLabel;
            System.Windows.Forms.Label departmentNameLabel;
            System.Windows.Forms.Label emailLabel;
            System.Windows.Forms.Label isAdminLabel;
            System.Windows.Forms.Label loginNameLabel;
            System.Windows.Forms.Label nickNameLabel;
            this.operatorBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.accountNumberTextBox = new System.Windows.Forms.TextBox();
            this.companyNameTextBox = new System.Windows.Forms.TextBox();
            this.departmentNameTextBox = new System.Windows.Forms.TextBox();
            this.emailTextBox = new System.Windows.Forms.TextBox();
            this.isAdminCheckBox = new System.Windows.Forms.CheckBox();
            this.loginNameTextBox = new System.Windows.Forms.TextBox();
            this.nickNameTextBox = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.buttonModifyAccountInfo = new System.Windows.Forms.Button();
            accountNumberLabel = new System.Windows.Forms.Label();
            companyNameLabel = new System.Windows.Forms.Label();
            departmentNameLabel = new System.Windows.Forms.Label();
            emailLabel = new System.Windows.Forms.Label();
            isAdminLabel = new System.Windows.Forms.Label();
            loginNameLabel = new System.Windows.Forms.Label();
            nickNameLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.operatorBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // accountNumberLabel
            // 
            accountNumberLabel.AutoSize = true;
            accountNumberLabel.Location = new System.Drawing.Point(39, 17);
            accountNumberLabel.Name = "accountNumberLabel";
            accountNumberLabel.Size = new System.Drawing.Size(47, 12);
            accountNumberLabel.TabIndex = 1;
            accountNumberLabel.Text = "帐号ID:";
            // 
            // companyNameLabel
            // 
            companyNameLabel.AutoSize = true;
            companyNameLabel.Location = new System.Drawing.Point(39, 172);
            companyNameLabel.Name = "companyNameLabel";
            companyNameLabel.Size = new System.Drawing.Size(47, 12);
            companyNameLabel.TabIndex = 2;
            companyNameLabel.Text = "公司名:";
            // 
            // departmentNameLabel
            // 
            departmentNameLabel.AutoSize = true;
            departmentNameLabel.Location = new System.Drawing.Point(51, 203);
            departmentNameLabel.Name = "departmentNameLabel";
            departmentNameLabel.Size = new System.Drawing.Size(35, 12);
            departmentNameLabel.TabIndex = 4;
            departmentNameLabel.Text = "部门:";
            // 
            // emailLabel
            // 
            emailLabel.AutoSize = true;
            emailLabel.Location = new System.Drawing.Point(27, 141);
            emailLabel.Name = "emailLabel";
            emailLabel.Size = new System.Drawing.Size(59, 12);
            emailLabel.TabIndex = 6;
            emailLabel.Text = "电子邮件:";
            // 
            // isAdminLabel
            // 
            isAdminLabel.AutoSize = true;
            isAdminLabel.Location = new System.Drawing.Point(39, 110);
            isAdminLabel.Name = "isAdminLabel";
            isAdminLabel.Size = new System.Drawing.Size(47, 12);
            isAdminLabel.TabIndex = 8;
            isAdminLabel.Text = "管理员:";
            // 
            // loginNameLabel
            // 
            loginNameLabel.AutoSize = true;
            loginNameLabel.Location = new System.Drawing.Point(15, 48);
            loginNameLabel.Name = "loginNameLabel";
            loginNameLabel.Size = new System.Drawing.Size(71, 12);
            loginNameLabel.TabIndex = 10;
            loginNameLabel.Text = "登陆用户名:";
            // 
            // nickNameLabel
            // 
            nickNameLabel.AutoSize = true;
            nickNameLabel.Location = new System.Drawing.Point(27, 79);
            nickNameLabel.Name = "nickNameLabel";
            nickNameLabel.Size = new System.Drawing.Size(59, 12);
            nickNameLabel.TabIndex = 12;
            nickNameLabel.Text = "座席昵称:";
            // 
            // operatorBindingSource
            // 
            this.operatorBindingSource.DataSource = typeof(LiveSupport.OperatorConsole.LiveChatWS.Operator);
            // 
            // accountNumberTextBox
            // 
            this.accountNumberTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.operatorBindingSource, "Account.AccountNumber", true));
            this.accountNumberTextBox.Location = new System.Drawing.Point(98, 14);
            this.accountNumberTextBox.Name = "accountNumberTextBox";
            this.accountNumberTextBox.ReadOnly = true;
            this.accountNumberTextBox.Size = new System.Drawing.Size(171, 21);
            this.accountNumberTextBox.TabIndex = 2;
            // 
            // companyNameTextBox
            // 
            this.companyNameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.operatorBindingSource, "Account.CompanyName", true));
            this.companyNameTextBox.Location = new System.Drawing.Point(98, 172);
            this.companyNameTextBox.Name = "companyNameTextBox";
            this.companyNameTextBox.ReadOnly = true;
            this.companyNameTextBox.Size = new System.Drawing.Size(171, 21);
            this.companyNameTextBox.TabIndex = 3;
            // 
            // departmentNameTextBox
            // 
            this.departmentNameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.operatorBindingSource, "Department.DepartmentName", true));
            this.departmentNameTextBox.Location = new System.Drawing.Point(98, 203);
            this.departmentNameTextBox.Name = "departmentNameTextBox";
            this.departmentNameTextBox.ReadOnly = true;
            this.departmentNameTextBox.Size = new System.Drawing.Size(171, 21);
            this.departmentNameTextBox.TabIndex = 5;
            // 
            // emailTextBox
            // 
            this.emailTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.operatorBindingSource, "Email", true));
            this.emailTextBox.Location = new System.Drawing.Point(98, 141);
            this.emailTextBox.Name = "emailTextBox";
            this.emailTextBox.ReadOnly = true;
            this.emailTextBox.Size = new System.Drawing.Size(171, 21);
            this.emailTextBox.TabIndex = 7;
            // 
            // isAdminCheckBox
            // 
            this.isAdminCheckBox.DataBindings.Add(new System.Windows.Forms.Binding("CheckState", this.operatorBindingSource, "IsAdmin", true));
            this.isAdminCheckBox.Enabled = false;
            this.isAdminCheckBox.Location = new System.Drawing.Point(98, 107);
            this.isAdminCheckBox.Name = "isAdminCheckBox";
            this.isAdminCheckBox.Size = new System.Drawing.Size(171, 24);
            this.isAdminCheckBox.TabIndex = 9;
            this.isAdminCheckBox.UseVisualStyleBackColor = true;
            // 
            // loginNameTextBox
            // 
            this.loginNameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.operatorBindingSource, "LoginName", true));
            this.loginNameTextBox.Location = new System.Drawing.Point(98, 45);
            this.loginNameTextBox.Name = "loginNameTextBox";
            this.loginNameTextBox.ReadOnly = true;
            this.loginNameTextBox.Size = new System.Drawing.Size(171, 21);
            this.loginNameTextBox.TabIndex = 11;
            // 
            // nickNameTextBox
            // 
            this.nickNameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.operatorBindingSource, "NickName", true));
            this.nickNameTextBox.Location = new System.Drawing.Point(98, 76);
            this.nickNameTextBox.Name = "nickNameTextBox";
            this.nickNameTextBox.ReadOnly = true;
            this.nickNameTextBox.Size = new System.Drawing.Size(171, 21);
            this.nickNameTextBox.TabIndex = 13;
            // 
            // button1
            // 
            this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.button1.Location = new System.Drawing.Point(172, 233);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 14;
            this.button1.Text = "确定(&O)";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // buttonModifyAccountInfo
            // 
            this.buttonModifyAccountInfo.Location = new System.Drawing.Point(41, 233);
            this.buttonModifyAccountInfo.Name = "buttonModifyAccountInfo";
            this.buttonModifyAccountInfo.Size = new System.Drawing.Size(83, 23);
            this.buttonModifyAccountInfo.TabIndex = 15;
            this.buttonModifyAccountInfo.Text = "修改信息(&M)";
            this.buttonModifyAccountInfo.UseVisualStyleBackColor = true;
            this.buttonModifyAccountInfo.Click += new System.EventHandler(this.buttonModifyAccountInfo_Click);
            // 
            // AccountInfoDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(281, 268);
            this.Controls.Add(this.buttonModifyAccountInfo);
            this.Controls.Add(this.button1);
            this.Controls.Add(nickNameLabel);
            this.Controls.Add(this.nickNameTextBox);
            this.Controls.Add(loginNameLabel);
            this.Controls.Add(this.loginNameTextBox);
            this.Controls.Add(isAdminLabel);
            this.Controls.Add(this.isAdminCheckBox);
            this.Controls.Add(emailLabel);
            this.Controls.Add(this.emailTextBox);
            this.Controls.Add(departmentNameLabel);
            this.Controls.Add(this.departmentNameTextBox);
            this.Controls.Add(companyNameLabel);
            this.Controls.Add(this.companyNameTextBox);
            this.Controls.Add(accountNumberLabel);
            this.Controls.Add(this.accountNumberTextBox);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AccountInfoDialog";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "帐户信息";
            ((System.ComponentModel.ISupportInitialize)(this.operatorBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingSource operatorBindingSource;
        private System.Windows.Forms.TextBox accountNumberTextBox;
        private System.Windows.Forms.TextBox companyNameTextBox;
        private System.Windows.Forms.TextBox departmentNameTextBox;
        private System.Windows.Forms.TextBox emailTextBox;
        private System.Windows.Forms.CheckBox isAdminCheckBox;
        private System.Windows.Forms.TextBox loginNameTextBox;
        private System.Windows.Forms.TextBox nickNameTextBox;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button buttonModifyAccountInfo;
    }
}