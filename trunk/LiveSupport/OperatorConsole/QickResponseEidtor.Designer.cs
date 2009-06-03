namespace LiveSupport.OperatorConsole
{
    partial class QickResponseEidtor
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
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("快速回复");
            this.setTalkTreeView = new System.Windows.Forms.TreeView();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.addNodeToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.delNodeToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.amendNodeToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.OkToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // setTalkTreeView
            // 
            this.setTalkTreeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.setTalkTreeView.Location = new System.Drawing.Point(0, 25);
            this.setTalkTreeView.Name = "setTalkTreeView";
            treeNode1.Checked = true;
            treeNode1.Name = "节点0";
            treeNode1.Text = "快速回复";
            this.setTalkTreeView.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode1});
            this.setTalkTreeView.Size = new System.Drawing.Size(316, 261);
            this.setTalkTreeView.TabIndex = 6;
            this.setTalkTreeView.AfterLabelEdit += new System.Windows.Forms.NodeLabelEditEventHandler(this.setTalkTreeView_AfterLabelEdit);
            // 
            // toolStrip1
            // 
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addNodeToolStripButton,
            this.delNodeToolStripButton,
            this.amendNodeToolStripButton,
            this.OkToolStripButton});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(316, 25);
            this.toolStrip1.TabIndex = 5;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // addNodeToolStripButton
            // 
            this.addNodeToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.addNodeToolStripButton.Name = "addNodeToolStripButton";
            this.addNodeToolStripButton.Size = new System.Drawing.Size(57, 22);
            this.addNodeToolStripButton.Text = "增加节点";
            this.addNodeToolStripButton.Click += new System.EventHandler(this.addNodeToolStripButton_Click);
            // 
            // delNodeToolStripButton
            // 
            this.delNodeToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.delNodeToolStripButton.Name = "delNodeToolStripButton";
            this.delNodeToolStripButton.Size = new System.Drawing.Size(57, 22);
            this.delNodeToolStripButton.Text = "删除节点";
            this.delNodeToolStripButton.Click += new System.EventHandler(this.delNodeToolStripButton_Click);
            // 
            // amendNodeToolStripButton
            // 
            this.amendNodeToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.amendNodeToolStripButton.Name = "amendNodeToolStripButton";
            this.amendNodeToolStripButton.Size = new System.Drawing.Size(57, 22);
            this.amendNodeToolStripButton.Text = "修改节点";
            this.amendNodeToolStripButton.Click += new System.EventHandler(this.amendNodeToolStripButton_Click);
            // 
            // OkToolStripButton
            // 
            this.OkToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.OkToolStripButton.Name = "OkToolStripButton";
            this.OkToolStripButton.Size = new System.Drawing.Size(57, 22);
            this.OkToolStripButton.Text = "确定修改";
            this.OkToolStripButton.Click += new System.EventHandler(this.OkToolStripButton_Click);
            // 
            // QickResponseEidtor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(316, 286);
            this.Controls.Add(this.setTalkTreeView);
            this.Controls.Add(this.toolStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "QickResponseEidtor";
            this.ShowInTaskbar = false;
            this.Text = "设置快速回复";
            this.Load += new System.EventHandler(this.QickResponseEidtor_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TreeView setTalkTreeView;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton addNodeToolStripButton;
        private System.Windows.Forms.ToolStripButton delNodeToolStripButton;
        private System.Windows.Forms.ToolStripButton amendNodeToolStripButton;
        private System.Windows.Forms.ToolStripButton OkToolStripButton;

    }
}