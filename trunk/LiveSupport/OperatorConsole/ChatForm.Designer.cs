namespace LiveSupport.OperatorConsole
{
    partial class ChatForm
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
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("您好！");
            System.Windows.Forms.TreeNode treeNode2 = new System.Windows.Forms.TreeNode("您好，欢迎光临我们的网站！");
            System.Windows.Forms.TreeNode treeNode3 = new System.Windows.Forms.TreeNode("欢迎词", new System.Windows.Forms.TreeNode[] {
            treeNode1,
            treeNode2});
            System.Windows.Forms.TreeNode treeNode4 = new System.Windows.Forms.TreeNode("稍等");
            System.Windows.Forms.TreeNode treeNode5 = new System.Windows.Forms.TreeNode("再见");
            System.Windows.Forms.TreeNode treeNode6 = new System.Windows.Forms.TreeNode("常见问题回复");
            System.Windows.Forms.TreeNode treeNode7 = new System.Windows.Forms.TreeNode("技术问题");
            System.Windows.Forms.TreeNode treeNode8 = new System.Windows.Forms.TreeNode("联系信息");
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ChatForm));
            this.cutSaveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.wb = new System.Windows.Forms.WebBrowser();
            this.toolStrip2 = new System.Windows.Forms.ToolStrip();
            this.txtMsg = new System.Windows.Forms.TextBox();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.uploadToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.ExitToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.cutToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.flashToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.ringToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toollblIsTyping = new System.Windows.Forms.ToolStripStatusLabel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.label1 = new System.Windows.Forms.Label();
            this.uploadOpenFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.tmrGetMsg = new System.Windows.Forms.Timer(this.components);
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // cutSaveFileDialog
            // 
            this.cutSaveFileDialog.FileName = "image1";
            this.cutSaveFileDialog.Filter = "jpg Files(*.jpg) |*.jpg |jpeg Files(*.*) |*.jpeg |bmp Files(*.bmp) |*.bmp";
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.splitContainer2);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.panel1);
            this.splitContainer1.Panel2.Controls.Add(this.tabControl1);
            this.splitContainer1.Size = new System.Drawing.Size(660, 441);
            this.splitContainer1.SplitterDistance = 428;
            this.splitContainer1.TabIndex = 0;
            // 
            // splitContainer2
            // 
            this.splitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer2.Location = new System.Drawing.Point(0, 0);
            this.splitContainer2.Name = "splitContainer2";
            this.splitContainer2.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer2.Panel1
            // 
            this.splitContainer2.Panel1.Controls.Add(this.wb);
            this.splitContainer2.Panel1.Controls.Add(this.toolStrip2);
            // 
            // splitContainer2.Panel2
            // 
            this.splitContainer2.Panel2.Controls.Add(this.txtMsg);
            this.splitContainer2.Panel2.Controls.Add(this.toolStrip1);
            this.splitContainer2.Panel2.Controls.Add(this.statusStrip1);
            this.splitContainer2.Size = new System.Drawing.Size(428, 441);
            this.splitContainer2.SplitterDistance = 300;
            this.splitContainer2.TabIndex = 11;
            // 
            // wb
            // 
            this.wb.AllowNavigation = false;
            this.wb.AllowWebBrowserDrop = false;
            this.wb.Dock = System.Windows.Forms.DockStyle.Fill;
            this.wb.IsWebBrowserContextMenuEnabled = false;
            this.wb.Location = new System.Drawing.Point(0, 25);
            this.wb.MinimumSize = new System.Drawing.Size(20, 18);
            this.wb.Name = "wb";
            this.wb.ScriptErrorsSuppressed = true;
            this.wb.Size = new System.Drawing.Size(428, 275);
            this.wb.TabIndex = 7;
            this.wb.WebBrowserShortcutsEnabled = false;
            // 
            // toolStrip2
            // 
            this.toolStrip2.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip2.Location = new System.Drawing.Point(0, 0);
            this.toolStrip2.Name = "toolStrip2";
            this.toolStrip2.Size = new System.Drawing.Size(428, 25);
            this.toolStrip2.TabIndex = 8;
            this.toolStrip2.Text = "toolStrip2";
            // 
            // txtMsg
            // 
            this.txtMsg.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtMsg.Location = new System.Drawing.Point(0, 25);
            this.txtMsg.Multiline = true;
            this.txtMsg.Name = "txtMsg";
            this.txtMsg.Size = new System.Drawing.Size(428, 90);
            this.txtMsg.TabIndex = 9;
            this.txtMsg.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtMsg_KeyUp);
            this.txtMsg.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtMsg_KeyPress);
            // 
            // toolStrip1
            // 
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.uploadToolStripButton,
            this.ExitToolStripButton,
            this.cutToolStripButton,
            this.flashToolStripButton,
            this.ringToolStripButton});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(428, 25);
            this.toolStrip1.TabIndex = 10;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // uploadToolStripButton
            // 
            this.uploadToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.file_sent;
            this.uploadToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.uploadToolStripButton.Name = "uploadToolStripButton";
            this.uploadToolStripButton.Size = new System.Drawing.Size(76, 22);
            this.uploadToolStripButton.Text = "发送文件";
            this.uploadToolStripButton.ToolTipText = "发送文件";
            this.uploadToolStripButton.Click += new System.EventHandler(this.uploadToolStripButton_Click);
            // 
            // ExitToolStripButton
            // 
            this.ExitToolStripButton.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.ExitToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.cancel;
            this.ExitToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.ExitToolStripButton.Name = "ExitToolStripButton";
            this.ExitToolStripButton.Size = new System.Drawing.Size(52, 22);
            this.ExitToolStripButton.Text = "关闭";
            this.ExitToolStripButton.Click += new System.EventHandler(this.ExitToolStripButton_Click);
            // 
            // cutToolStripButton
            // 
            this.cutToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.sc;
            this.cutToolStripButton.ImageTransparentColor = System.Drawing.Color.Teal;
            this.cutToolStripButton.Name = "cutToolStripButton";
            this.cutToolStripButton.Size = new System.Drawing.Size(52, 22);
            this.cutToolStripButton.Text = "截屏";
            this.cutToolStripButton.Click += new System.EventHandler(this.cutToolStripButton_Click);
            // 
            // flashToolStripButton
            // 
            this.flashToolStripButton.CheckOnClick = true;
            this.flashToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.logfile_24;
            this.flashToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.flashToolStripButton.Name = "flashToolStripButton";
            this.flashToolStripButton.Size = new System.Drawing.Size(76, 22);
            this.flashToolStripButton.Text = "消息提示";
            // 
            // ringToolStripButton
            // 
            this.ringToolStripButton.CheckOnClick = true;
            this.ringToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.alarmd;
            this.ringToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.ringToolStripButton.Name = "ringToolStripButton";
            this.ringToolStripButton.Size = new System.Drawing.Size(76, 22);
            this.ringToolStripButton.Text = "响铃提示";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toollblIsTyping});
            this.statusStrip1.Location = new System.Drawing.Point(0, 115);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(428, 22);
            this.statusStrip1.TabIndex = 8;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toollblIsTyping
            // 
            this.toollblIsTyping.Name = "toollblIsTyping";
            this.toollblIsTyping.Size = new System.Drawing.Size(56, 17);
            this.toollblIsTyping.Text = "对话客户";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 341);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(228, 100);
            this.panel1.TabIndex = 1;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureBox1.Image = global::LiveSupport.OperatorConsole.Properties.Resources.live800;
            this.pictureBox1.Location = new System.Drawing.Point(0, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(228, 100);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(228, 441);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.treeView1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(220, 415);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "快捷回复";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // treeView1
            // 
            this.treeView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeView1.Location = new System.Drawing.Point(3, 3);
            this.treeView1.Name = "treeView1";
            treeNode1.Name = "节点4";
            treeNode1.Text = "您好！";
            treeNode2.Name = "节点5";
            treeNode2.Text = "您好，欢迎光临我们的网站！";
            treeNode3.Name = "节点0";
            treeNode3.Text = "欢迎词";
            treeNode4.Name = "节点1";
            treeNode4.Text = "稍等";
            treeNode5.Name = "节点2";
            treeNode5.Text = "再见";
            treeNode6.Name = "节点6";
            treeNode6.Text = "常见问题回复";
            treeNode7.Name = "节点7";
            treeNode7.Text = "技术问题";
            treeNode8.Name = "节点8";
            treeNode8.Text = "联系信息";
            this.treeView1.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode3,
            treeNode4,
            treeNode5,
            treeNode6,
            treeNode7,
            treeNode8});
            this.treeView1.Size = new System.Drawing.Size(214, 409);
            this.treeView1.TabIndex = 0;
            this.treeView1.NodeMouseDoubleClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.treeView1_NodeMouseDoubleClick);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.label1);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(220, 415);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "对话转接";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 3);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(125, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "将该对话转到其他客服";
            // 
            // uploadOpenFileDialog
            // 
            this.uploadOpenFileDialog.FileName = "uploadOpenFileDialog";
            // 
            // tmrGetMsg
            // 
            this.tmrGetMsg.Enabled = true;
            this.tmrGetMsg.Interval = 5000;
            // 
            // ChatForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(660, 441);
            this.Controls.Add(this.splitContainer1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "ChatForm";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.ChatForm_FormClosed);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ChatForm_FormClosing);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel1.PerformLayout();
            this.splitContainer2.Panel2.ResumeLayout(false);
            this.splitContainer2.Panel2.PerformLayout();
            this.splitContainer2.ResumeLayout(false);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.WebBrowser wb;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton uploadToolStripButton;
        private System.Windows.Forms.ToolStripButton ExitToolStripButton;
        private System.Windows.Forms.TextBox txtMsg;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toollblIsTyping;
        private System.Windows.Forms.ToolStrip toolStrip2;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ToolStripButton cutToolStripButton;
        private System.Windows.Forms.ToolStripButton ringToolStripButton;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.ToolStripButton flashToolStripButton;
        private System.Windows.Forms.OpenFileDialog uploadOpenFileDialog;
        private System.Windows.Forms.Timer tmrGetMsg;
    }
}