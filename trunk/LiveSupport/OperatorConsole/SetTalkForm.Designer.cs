namespace LiveSupport.OperatorConsole
{
    partial class SetTalkForm
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

        #region 组件设计器生成的代码

        /// <summary> 
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("快速回复");
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.addNodeToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.delNodeToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.amendNodeToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.setTalkTreeView = new System.Windows.Forms.TreeView();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addNodeToolStripButton,
            this.delNodeToolStripButton,
            this.amendNodeToolStripButton});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(230, 25);
            this.toolStrip1.TabIndex = 3;
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
            // setTalkTreeView
            // 
            this.setTalkTreeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.setTalkTreeView.LabelEdit = true;
            this.setTalkTreeView.Location = new System.Drawing.Point(0, 25);
            this.setTalkTreeView.Name = "setTalkTreeView";
            treeNode1.Checked = true;
            treeNode1.Name = "节点0";
            treeNode1.Text = "快速回复";
            this.setTalkTreeView.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode1});
            this.setTalkTreeView.Size = new System.Drawing.Size(230, 302);
            this.setTalkTreeView.TabIndex = 4;
            // 
            // SetTalkForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.setTalkTreeView);
            this.Controls.Add(this.toolStrip1);
            this.Name = "SetTalkForm";
            this.Size = new System.Drawing.Size(230, 327);
            this.Load += new System.EventHandler(this.SetTalkForm_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton addNodeToolStripButton;
        private System.Windows.Forms.ToolStripButton delNodeToolStripButton;
        private System.Windows.Forms.ToolStripButton amendNodeToolStripButton;
        private System.Windows.Forms.TreeView setTalkTreeView;
    }
}
