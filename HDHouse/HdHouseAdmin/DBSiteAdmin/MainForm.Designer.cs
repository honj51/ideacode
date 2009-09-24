namespace DBSiteAdmin
{
    partial class MainForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.currentStatusTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.文件ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.退出EToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.同步ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.同步所有数据ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSynchronizeOnlyUploadData = new System.Windows.Forms.ToolStripMenuItem();
            this.连接时同步ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.高级选择ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.重新初始化数据RToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.上传更新并初始化数据UToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.webToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.查看同步历史HToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.帮助ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.关于我们AToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.button1 = new System.Windows.Forms.Button();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(109, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 12);
            this.label1.TabIndex = 1;
            // 
            // currentStatusTextBox
            // 
            this.currentStatusTextBox.Location = new System.Drawing.Point(12, 135);
            this.currentStatusTextBox.Multiline = true;
            this.currentStatusTextBox.Name = "currentStatusTextBox";
            this.currentStatusTextBox.ReadOnly = true;
            this.currentStatusTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.currentStatusTextBox.Size = new System.Drawing.Size(422, 57);
            this.currentStatusTextBox.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 105);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 12);
            this.label2.TabIndex = 3;
            this.label2.Text = "操作日志:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 34);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(89, 12);
            this.label3.TabIndex = 4;
            this.label3.Text = "数据库实例名：";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(101, 31);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 21);
            this.textBox2.TabIndex = 5;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(101, 58);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 21);
            this.textBox3.TabIndex = 6;
            // 
            // textBox4
            // 
            this.textBox4.Location = new System.Drawing.Point(278, 31);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(100, 21);
            this.textBox4.TabIndex = 7;
            // 
            // textBox5
            // 
            this.textBox5.Location = new System.Drawing.Point(278, 58);
            this.textBox5.Name = "textBox5";
            this.textBox5.PasswordChar = '*';
            this.textBox5.Size = new System.Drawing.Size(100, 21);
            this.textBox5.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(46, 61);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 12);
            this.label4.TabIndex = 9;
            this.label4.Text = "主机名：";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(219, 34);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 12);
            this.label5.TabIndex = 10;
            this.label5.Text = "登录名：";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(207, 61);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(65, 12);
            this.label6.TabIndex = 11;
            this.label6.Text = "登录密码：";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.文件ToolStripMenuItem,
            this.同步ToolStripMenuItem,
            this.帮助ToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.menuStrip1.Size = new System.Drawing.Size(446, 24);
            this.menuStrip1.TabIndex = 12;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // 文件ToolStripMenuItem
            // 
            this.文件ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.退出EToolStripMenuItem});
            this.文件ToolStripMenuItem.Name = "文件ToolStripMenuItem";
            this.文件ToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.文件ToolStripMenuItem.Text = "文件(&F)";
            // 
            // 退出EToolStripMenuItem
            // 
            this.退出EToolStripMenuItem.Name = "退出EToolStripMenuItem";
            this.退出EToolStripMenuItem.Size = new System.Drawing.Size(112, 22);
            this.退出EToolStripMenuItem.Text = "退出(&E)";
            this.退出EToolStripMenuItem.Click += new System.EventHandler(this.退出EToolStripMenuItem_Click);
            // 
            // 同步ToolStripMenuItem
            // 
            this.同步ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.同步所有数据ToolStripMenuItem,
            this.mnuSynchronizeOnlyUploadData,
            this.连接时同步ToolStripMenuItem,
            this.高级选择ToolStripMenuItem,
            this.查看同步历史HToolStripMenuItem});
            this.同步ToolStripMenuItem.Name = "同步ToolStripMenuItem";
            this.同步ToolStripMenuItem.Size = new System.Drawing.Size(41, 20);
            this.同步ToolStripMenuItem.Text = "同步";
            // 
            // 同步所有数据ToolStripMenuItem
            // 
            this.同步所有数据ToolStripMenuItem.Name = "同步所有数据ToolStripMenuItem";
            this.同步所有数据ToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.同步所有数据ToolStripMenuItem.Text = "同步所有数据(推荐&A)";
            this.同步所有数据ToolStripMenuItem.Click += new System.EventHandler(this.同步所有数据ToolStripMenuItem_Click);
            // 
            // mnuSynchronizeOnlyUploadData
            // 
            this.mnuSynchronizeOnlyUploadData.Name = "mnuSynchronizeOnlyUploadData";
            this.mnuSynchronizeOnlyUploadData.Size = new System.Drawing.Size(184, 22);
            this.mnuSynchronizeOnlyUploadData.Text = "只上传数据(&U)";
            this.mnuSynchronizeOnlyUploadData.Click += new System.EventHandler(this.只上传数据ToolStripMenuItem_Click);
            // 
            // 连接时同步ToolStripMenuItem
            // 
            this.连接时同步ToolStripMenuItem.Name = "连接时同步ToolStripMenuItem";
            this.连接时同步ToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.连接时同步ToolStripMenuItem.Text = "连接时同步(&C)";
            this.连接时同步ToolStripMenuItem.Click += new System.EventHandler(this.连接时同步ToolStripMenuItem_Click);
            // 
            // 高级选择ToolStripMenuItem
            // 
            this.高级选择ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.重新初始化数据RToolStripMenuItem,
            this.上传更新并初始化数据UToolStripMenuItem,
            this.webToolStripMenuItem});
            this.高级选择ToolStripMenuItem.Name = "高级选择ToolStripMenuItem";
            this.高级选择ToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.高级选择ToolStripMenuItem.Text = "高级选项(&O)";
            // 
            // 重新初始化数据RToolStripMenuItem
            // 
            this.重新初始化数据RToolStripMenuItem.Name = "重新初始化数据RToolStripMenuItem";
            this.重新初始化数据RToolStripMenuItem.Size = new System.Drawing.Size(208, 22);
            this.重新初始化数据RToolStripMenuItem.Text = "重新初始化数据(&R)";
            this.重新初始化数据RToolStripMenuItem.Click += new System.EventHandler(this.重新初始化数据RToolStripMenuItem_Click);
            // 
            // 上传更新并初始化数据UToolStripMenuItem
            // 
            this.上传更新并初始化数据UToolStripMenuItem.Name = "上传更新并初始化数据UToolStripMenuItem";
            this.上传更新并初始化数据UToolStripMenuItem.Size = new System.Drawing.Size(208, 22);
            this.上传更新并初始化数据UToolStripMenuItem.Text = "上传更新并初始化数据(&U)";
            this.上传更新并初始化数据UToolStripMenuItem.Click += new System.EventHandler(this.上传更新并初始化数据UToolStripMenuItem_Click);
            // 
            // webToolStripMenuItem
            // 
            this.webToolStripMenuItem.Name = "webToolStripMenuItem";
            this.webToolStripMenuItem.Size = new System.Drawing.Size(208, 22);
            this.webToolStripMenuItem.Text = "Web同步选项";
            this.webToolStripMenuItem.Click += new System.EventHandler(this.webToolStripMenuItem_Click);
            // 
            // 查看同步历史HToolStripMenuItem
            // 
            this.查看同步历史HToolStripMenuItem.Name = "查看同步历史HToolStripMenuItem";
            this.查看同步历史HToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.查看同步历史HToolStripMenuItem.Text = "查看同步历史(&H)";
            this.查看同步历史HToolStripMenuItem.Click += new System.EventHandler(this.查看同步历史HToolStripMenuItem_Click);
            // 
            // 帮助ToolStripMenuItem
            // 
            this.帮助ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.关于我们AToolStripMenuItem});
            this.帮助ToolStripMenuItem.Name = "帮助ToolStripMenuItem";
            this.帮助ToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.帮助ToolStripMenuItem.Text = "帮助(&H)";
            // 
            // 关于我们AToolStripMenuItem
            // 
            this.关于我们AToolStripMenuItem.Name = "关于我们AToolStripMenuItem";
            this.关于我们AToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.关于我们AToolStripMenuItem.Text = "关于我们(&A)";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(293, 94);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 13;
            this.button1.Text = "确认修改";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(446, 214);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.textBox5);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.currentStatusTextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "站点数据库管理";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox currentStatusTextBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem 文件ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 退出EToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 同步ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 同步所有数据ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mnuSynchronizeOnlyUploadData;
        private System.Windows.Forms.ToolStripMenuItem 连接时同步ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 高级选择ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 重新初始化数据RToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 上传更新并初始化数据UToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem webToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 查看同步历史HToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 帮助ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 关于我们AToolStripMenuItem;
        private System.Windows.Forms.Button button1;
    }
}

