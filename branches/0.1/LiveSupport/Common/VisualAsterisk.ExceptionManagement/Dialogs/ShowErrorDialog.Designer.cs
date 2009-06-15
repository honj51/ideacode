namespace VisualAsterisk.ExceptionManagement.Dialogs
{
    partial class ShowErrorDialog
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ShowErrorDialog));
            this.txtErrorInfo = new System.Windows.Forms.TextBox();
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.lblHeader = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtErrorInfo
            // 
            this.txtErrorInfo.AccessibleDescription = null;
            this.txtErrorInfo.AccessibleName = null;
            resources.ApplyResources(this.txtErrorInfo, "txtErrorInfo");
            this.txtErrorInfo.BackColor = System.Drawing.Color.WhiteSmoke;
            this.txtErrorInfo.BackgroundImage = null;
            this.txtErrorInfo.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtErrorInfo.Font = null;
            this.txtErrorInfo.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(83)))), ((int)(((byte)(83)))), ((int)(((byte)(83)))));
            this.txtErrorInfo.Name = "txtErrorInfo";
            this.txtErrorInfo.ReadOnly = true;
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
            // ShowErrorDialog
            // 
            this.AccessibleDescription = null;
            this.AccessibleName = null;
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = null;
            this.Controls.Add(this.txtErrorInfo);
            this.Controls.Add(this.pnlHeader);
            this.Font = null;
            this.Icon = null;
            this.Name = "ShowErrorDialog";
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtErrorInfo;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Label lblHeader;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}