namespace LiveSupport.OperatorConsole
{
    partial class OperatorPannel
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
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("在线");
            System.Windows.Forms.TreeNode treeNode2 = new System.Windows.Forms.TreeNode("离线");
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(OperatorPannel));
            this.operatorsTreeView = new System.Windows.Forms.TreeView();
            this.imgIconSet = new System.Windows.Forms.ImageList(this.components);
            this.SuspendLayout();
            // 
            // operatorsTreeView
            // 
            this.operatorsTreeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.operatorsTreeView.ImageIndex = 3;
            this.operatorsTreeView.ImageList = this.imgIconSet;
            this.operatorsTreeView.Location = new System.Drawing.Point(0, 0);
            this.operatorsTreeView.Name = "operatorsTreeView";
            treeNode1.Name = "节点0";
            treeNode1.Text = "在线";
            treeNode2.Name = "节点1";
            treeNode2.Text = "离线";
            this.operatorsTreeView.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode1,
            treeNode2});
            this.operatorsTreeView.PathSeparator = "";
            this.operatorsTreeView.SelectedImageIndex = 2;
            this.operatorsTreeView.ShowNodeToolTips = true;
            this.operatorsTreeView.Size = new System.Drawing.Size(219, 359);
            this.operatorsTreeView.TabIndex = 1;
            this.operatorsTreeView.DoubleClick += new System.EventHandler(this.operatorsTreeView_DoubleClick);
            // 
            // imgIconSet
            // 
            this.imgIconSet.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imgIconSet.ImageStream")));
            this.imgIconSet.TransparentColor = System.Drawing.Color.Transparent;
            this.imgIconSet.Images.SetKeyName(0, "ff.jpg");
            this.imgIconSet.Images.SetKeyName(1, "ie.jpg");
            this.imgIconSet.Images.SetKeyName(2, "chat.jpg");
            this.imgIconSet.Images.SetKeyName(3, "development 54.png");
            this.imgIconSet.Images.SetKeyName(4, "development 54 grey.png");
            this.imgIconSet.Images.SetKeyName(5, "PI Diagona Web Application 04 09.png");
            this.imgIconSet.Images.SetKeyName(6, "PI Diagona Web Application 04 08.png");
            this.imgIconSet.Images.SetKeyName(7, "PI Diagona Web Application 04 02.png");
            this.imgIconSet.Images.SetKeyName(8, "PI Diagona Web Application 04 05.png");
            this.imgIconSet.Images.SetKeyName(9, "PI Diagona Web Application 04 04.png");
            // 
            // OperatorPannel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.operatorsTreeView);
            this.Name = "OperatorPannel";
            this.Size = new System.Drawing.Size(219, 359);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TreeView operatorsTreeView;
        private System.Windows.Forms.ImageList imgIconSet;
    }
}
