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
            System.Windows.Forms.TreeNode treeNode3 = new System.Windows.Forms.TreeNode("快速回复");
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
            this.setTalkTreeView.Location = new System.Drawing.Point(0, 31);
            this.setTalkTreeView.Name = "setTalkTreeView";
            treeNode3.Checked = true;
            treeNode3.Name = "节点0";
            treeNode3.Text = "快速回复";
            this.setTalkTreeView.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode3});
            this.setTalkTreeView.Size = new System.Drawing.Size(163, 254);
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
            this.toolStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.toolStrip1.Size = new System.Drawing.Size(163, 31);
            this.toolStrip1.TabIndex = 5;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // addNodeToolStripButton
            // 
            this.addNodeToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.addNodeToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.Add;
            this.addNodeToolStripButton.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.addNodeToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.addNodeToolStripButton.Name = "addNodeToolStripButton";
            this.addNodeToolStripButton.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.addNodeToolStripButton.Size = new System.Drawing.Size(38, 28);
            this.addNodeToolStripButton.Text = "增加节点";
            this.addNodeToolStripButton.Click += new System.EventHandler(this.addNodeToolStripButton_Click);
            // 
            // delNodeToolStripButton
            // 
            this.delNodeToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.delNodeToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.Delete;
            this.delNodeToolStripButton.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.delNodeToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.delNodeToolStripButton.Name = "delNodeToolStripButton";
            this.delNodeToolStripButton.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.delNodeToolStripButton.Size = new System.Drawing.Size(38, 28);
            this.delNodeToolStripButton.Text = "删除节点";
            this.delNodeToolStripButton.Click += new System.EventHandler(this.delNodeToolStripButton_Click);
            // 
            // amendNodeToolStripButton
            // 
            this.amendNodeToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.amendNodeToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.Modify;
            this.amendNodeToolStripButton.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.amendNodeToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.amendNodeToolStripButton.Name = "amendNodeToolStripButton";
            this.amendNodeToolStripButton.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.amendNodeToolStripButton.Size = new System.Drawing.Size(38, 28);
            this.amendNodeToolStripButton.Text = "修改节点";
            this.amendNodeToolStripButton.Click += new System.EventHandler(this.amendNodeToolStripButton_Click);
            // 
            // OkToolStripButton
            // 
            this.OkToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.OkToolStripButton.Image = global::LiveSupport.OperatorConsole.Properties.Resources.Save;
            this.OkToolStripButton.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.OkToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.OkToolStripButton.Name = "OkToolStripButton";
            this.OkToolStripButton.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.OkToolStripButton.Size = new System.Drawing.Size(38, 28);
            this.OkToolStripButton.Text = "保存";
            this.OkToolStripButton.Click += new System.EventHandler(this.OkToolStripButton_Click);
            // 
            // QickResponseEidtor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(163, 285);
            this.Controls.Add(this.setTalkTreeView);
            this.Controls.Add(this.toolStrip1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "QickResponseEidtor";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "设置快速回复";
            this.Load += new System.EventHandler(this.QickResponseEidtor_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.QickResponseEidtor_FormClosing);
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