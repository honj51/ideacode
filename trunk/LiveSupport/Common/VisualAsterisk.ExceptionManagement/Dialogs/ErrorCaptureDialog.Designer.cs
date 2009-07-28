namespace VisualAsterisk.ExceptionManagement.Dialogs
{
    partial class ErrorCaptureDialog
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ErrorCaptureDialog));
            this.lnkShowErrorContent = new System.Windows.Forms.LinkLabel();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btnSend = new System.Windows.Forms.Button();
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.lblHeader = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.checkBoxSendErrorReport = new System.Windows.Forms.CheckBox();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // lnkShowErrorContent
            // 
            this.lnkShowErrorContent.AccessibleDescription = null;
            this.lnkShowErrorContent.AccessibleName = null;
            this.lnkShowErrorContent.ActiveLinkColor = System.Drawing.Color.RoyalBlue;
            resources.ApplyResources(this.lnkShowErrorContent, "lnkShowErrorContent");
            this.lnkShowErrorContent.Font = null;
            this.lnkShowErrorContent.LinkBehavior = System.Windows.Forms.LinkBehavior.HoverUnderline;
            this.lnkShowErrorContent.LinkColor = System.Drawing.Color.RoyalBlue;
            this.lnkShowErrorContent.Name = "lnkShowErrorContent";
            this.lnkShowErrorContent.TabStop = true;
            this.lnkShowErrorContent.VisitedLinkColor = System.Drawing.Color.RoyalBlue;
            this.lnkShowErrorContent.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lnkShowErrorContent_LinkClicked_1);
            // 
            // label3
            // 
            this.label3.AccessibleDescription = null;
            this.label3.AccessibleName = null;
            resources.ApplyResources(this.label3, "label3");
            this.label3.Name = "label3";
            // 
            // label2
            // 
            this.label2.AccessibleDescription = null;
            this.label2.AccessibleName = null;
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            // 
            // btnSend
            // 
            this.btnSend.AccessibleDescription = null;
            this.btnSend.AccessibleName = null;
            resources.ApplyResources(this.btnSend, "btnSend");
            this.btnSend.BackgroundImage = null;
            this.btnSend.Font = null;
            this.btnSend.Name = "btnSend";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            // 
            // pnlHeader
            // 
            this.pnlHeader.AccessibleDescription = null;
            this.pnlHeader.AccessibleName = null;
            resources.ApplyResources(this.pnlHeader, "pnlHeader");
            this.pnlHeader.BackColor = System.Drawing.Color.White;
            this.pnlHeader.BackgroundImage = null;
            this.pnlHeader.Controls.Add(this.lblHeader);
            this.pnlHeader.Controls.Add(this.pictureBox1);
            this.pnlHeader.Font = null;
            this.pnlHeader.Name = "pnlHeader";
            // 
            // lblHeader
            // 
            this.lblHeader.AccessibleDescription = null;
            this.lblHeader.AccessibleName = null;
            resources.ApplyResources(this.lblHeader, "lblHeader");
            this.lblHeader.Name = "lblHeader";
            // 
            // pictureBox1
            // 
            this.pictureBox1.AccessibleDescription = null;
            this.pictureBox1.AccessibleName = null;
            resources.ApplyResources(this.pictureBox1, "pictureBox1");
            this.pictureBox1.BackgroundImage = null;
            this.pictureBox1.Font = null;
            this.pictureBox1.Image = global::VisualAsterisk.ExceptionManagement.Properties.Resources.doctor;
            this.pictureBox1.ImageLocation = null;
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.TabStop = false;
            // 
            // checkBoxSendErrorReport
            // 
            this.checkBoxSendErrorReport.AccessibleDescription = null;
            this.checkBoxSendErrorReport.AccessibleName = null;
            resources.ApplyResources(this.checkBoxSendErrorReport, "checkBoxSendErrorReport");
            this.checkBoxSendErrorReport.BackgroundImage = null;
            this.checkBoxSendErrorReport.Checked = true;
            this.checkBoxSendErrorReport.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBoxSendErrorReport.Font = null;
            this.checkBoxSendErrorReport.Name = "checkBoxSendErrorReport";
            this.checkBoxSendErrorReport.UseVisualStyleBackColor = true;
            // 
            // ErrorCaptureDialog
            // 
            this.AccessibleDescription = null;
            this.AccessibleName = null;
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.BackgroundImage = null;
            this.Controls.Add(this.checkBoxSendErrorReport);
            this.Controls.Add(this.lnkShowErrorContent);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnSend);
            this.Controls.Add(this.pnlHeader);
            this.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(83)))), ((int)(((byte)(83)))), ((int)(((byte)(83)))));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = null;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ErrorCaptureDialog";
            this.ShowInTaskbar = false;
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.LinkLabel lnkShowErrorContent;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnSend;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Label lblHeader;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.CheckBox checkBoxSendErrorReport;
    }
}