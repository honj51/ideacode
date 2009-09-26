namespace DBSiteAdmin
{
	partial class AboutBoxSalesOrders
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AboutBoxSalesOrders));
            this.rtbAboutText = new System.Windows.Forms.RichTextBox();
            this.lDisclaimerText = new System.Windows.Forms.Label();
            this.okButton = new System.Windows.Forms.Button();
            this.splashPicture = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.splashPicture)).BeginInit();
            this.SuspendLayout();
            // 
            // rtbAboutText
            // 
            this.rtbAboutText.Location = new System.Drawing.Point(13, 57);
            this.rtbAboutText.Name = "rtbAboutText";
            this.rtbAboutText.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
            this.rtbAboutText.Size = new System.Drawing.Size(375, 47);
            this.rtbAboutText.TabIndex = 1;
            this.rtbAboutText.Text = "";
            // 
            // lDisclaimerText
            // 
            this.lDisclaimerText.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lDisclaimerText.Location = new System.Drawing.Point(27, 127);
            this.lDisclaimerText.Name = "lDisclaimerText";
            this.lDisclaimerText.Size = new System.Drawing.Size(325, 25);
            this.lDisclaimerText.TabIndex = 2;
            this.lDisclaimerText.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // okButton
            // 
            this.okButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.okButton.Location = new System.Drawing.Point(298, 169);
            this.okButton.Name = "okButton";
            this.okButton.Size = new System.Drawing.Size(75, 21);
            this.okButton.TabIndex = 3;
            this.okButton.Text = "确定";
            // 
            // splashPicture
            // 
            this.splashPicture.Dock = System.Windows.Forms.DockStyle.Top;
            this.splashPicture.Image = global::DBSiteAdmin.Properties.Resources.SubSideMonitoringUI_ConnectDlg;
            this.splashPicture.Location = new System.Drawing.Point(0, 0);
            this.splashPicture.Name = "splashPicture";
            this.splashPicture.Size = new System.Drawing.Size(400, 51);
            this.splashPicture.TabIndex = 4;
            this.splashPicture.TabStop = false;
            // 
            // AboutBoxSalesOrders
            // 
            this.AcceptButton = this.okButton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.okButton;
            this.ClientSize = new System.Drawing.Size(400, 200);
            this.Controls.Add(this.splashPicture);
            this.Controls.Add(this.okButton);
            this.Controls.Add(this.lDisclaimerText);
            this.Controls.Add(this.rtbAboutText);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AboutBoxSalesOrders";
            this.ShowInTaskbar = false;
            this.Text = "关于...";
            ((System.ComponentModel.ISupportInitialize)(this.splashPicture)).EndInit();
            this.ResumeLayout(false);

		}

        #endregion

		private System.Windows.Forms.RichTextBox rtbAboutText;
        private System.Windows.Forms.Label lDisclaimerText;
        private System.Windows.Forms.Button okButton;
        private System.Windows.Forms.PictureBox splashPicture;
    }
}