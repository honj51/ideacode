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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(QickResponseEidtor));
            this.setTalkTreeView = new System.Windows.Forms.TreeView();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.tsbAddType = new System.Windows.Forms.ToolStripButton();
            this.tsbDeleteType = new System.Windows.Forms.ToolStripButton();
            this.tsbAddMessage = new System.Windows.Forms.ToolStripButton();
            this.tsbDeleteMessage = new System.Windows.Forms.ToolStripButton();
            this.tsbEdit = new System.Windows.Forms.ToolStripButton();
            this.tsbSave = new System.Windows.Forms.ToolStripButton();
            this.domainToolStripComboBox = new System.Windows.Forms.ToolStripComboBox();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // setTalkTreeView
            // 
            this.setTalkTreeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.setTalkTreeView.Location = new System.Drawing.Point(0, 43);
            this.setTalkTreeView.Name = "setTalkTreeView";
            this.setTalkTreeView.Size = new System.Drawing.Size(492, 230);
            this.setTalkTreeView.TabIndex = 6;
            this.setTalkTreeView.AfterLabelEdit += new System.Windows.Forms.NodeLabelEditEventHandler(this.setTalkTreeView_AfterLabelEdit);
            this.setTalkTreeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.setTalkTreeView_AfterSelect);
            // 
            // toolStrip1
            // 
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsbAddType,
            this.tsbDeleteType,
            this.tsbAddMessage,
            this.tsbDeleteMessage,
            this.tsbEdit,
            this.tsbSave,
            this.domainToolStripComboBox});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.toolStrip1.Size = new System.Drawing.Size(492, 43);
            this.toolStrip1.TabIndex = 5;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // tsbAddType
            // 
            this.tsbAddType.Image = global::LiveSupport.OperatorConsole.Properties.Resources.addType;
            this.tsbAddType.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbAddType.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAddType.Name = "tsbAddType";
            this.tsbAddType.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.tsbAddType.Size = new System.Drawing.Size(67, 40);
            this.tsbAddType.Text = "添加分类";
            this.tsbAddType.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsbAddType.Click += new System.EventHandler(this.addNodeToolStripButton_Click);
            // 
            // tsbDeleteType
            // 
            this.tsbDeleteType.Enabled = false;
            this.tsbDeleteType.Image = global::LiveSupport.OperatorConsole.Properties.Resources.deleteType;
            this.tsbDeleteType.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbDeleteType.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbDeleteType.Name = "tsbDeleteType";
            this.tsbDeleteType.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.tsbDeleteType.Size = new System.Drawing.Size(67, 40);
            this.tsbDeleteType.Text = "删除分类";
            this.tsbDeleteType.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsbDeleteType.Click += new System.EventHandler(this.delNodeToolStripButton_Click);
            // 
            // tsbAddMessage
            // 
            this.tsbAddMessage.Enabled = false;
            this.tsbAddMessage.Image = global::LiveSupport.OperatorConsole.Properties.Resources.addMessage;
            this.tsbAddMessage.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbAddMessage.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAddMessage.Name = "tsbAddMessage";
            this.tsbAddMessage.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.tsbAddMessage.Size = new System.Drawing.Size(67, 40);
            this.tsbAddMessage.Text = "添加消息";
            this.tsbAddMessage.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsbAddMessage.Click += new System.EventHandler(this.tsbAddMessage_Click);
            // 
            // tsbDeleteMessage
            // 
            this.tsbDeleteMessage.Enabled = false;
            this.tsbDeleteMessage.Image = global::LiveSupport.OperatorConsole.Properties.Resources.deleteMessage;
            this.tsbDeleteMessage.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbDeleteMessage.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbDeleteMessage.Name = "tsbDeleteMessage";
            this.tsbDeleteMessage.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.tsbDeleteMessage.Size = new System.Drawing.Size(67, 40);
            this.tsbDeleteMessage.Text = "删除消息";
            this.tsbDeleteMessage.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsbDeleteMessage.Click += new System.EventHandler(this.tsbDeleteMessage_Click);
            // 
            // tsbEdit
            // 
            this.tsbEdit.Enabled = false;
            this.tsbEdit.Image = global::LiveSupport.OperatorConsole.Properties.Resources.Modify;
            this.tsbEdit.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbEdit.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbEdit.Name = "tsbEdit";
            this.tsbEdit.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.tsbEdit.Size = new System.Drawing.Size(43, 40);
            this.tsbEdit.Text = "修改";
            this.tsbEdit.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsbEdit.Click += new System.EventHandler(this.amendNodeToolStripButton_Click);
            // 
            // tsbSave
            // 
            this.tsbSave.Image = global::LiveSupport.OperatorConsole.Properties.Resources.Save;
            this.tsbSave.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbSave.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbSave.Name = "tsbSave";
            this.tsbSave.Padding = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.tsbSave.Size = new System.Drawing.Size(43, 40);
            this.tsbSave.Text = "保存";
            this.tsbSave.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsbSave.Click += new System.EventHandler(this.OkToolStripButton_Click);
            // 
            // domainToolStripComboBox
            // 
            this.domainToolStripComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.domainToolStripComboBox.Items.AddRange(new object[] {
            "请选择域名"});
            this.domainToolStripComboBox.Name = "domainToolStripComboBox";
            this.domainToolStripComboBox.Size = new System.Drawing.Size(121, 20);
            this.domainToolStripComboBox.SelectedIndexChanged += new System.EventHandler(this.domainToolStripComboBox_SelectedIndexChanged);
            // 
            // QickResponseEidtor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(492, 273);
            this.Controls.Add(this.setTalkTreeView);
            this.Controls.Add(this.toolStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "QickResponseEidtor";
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
        private System.Windows.Forms.ToolStripButton tsbAddType;
        private System.Windows.Forms.ToolStripButton tsbDeleteType;
        private System.Windows.Forms.ToolStripButton tsbEdit;
        private System.Windows.Forms.ToolStripButton tsbSave;
        private System.Windows.Forms.ToolStripButton tsbAddMessage;
        private System.Windows.Forms.ToolStripButton tsbDeleteMessage;
        private System.Windows.Forms.ToolStripComboBox domainToolStripComboBox;

    }
}