﻿namespace DBSiteAdmin
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
            this.SuspendLayout();
            // 
            // rtbAboutText
            // 
            this.rtbAboutText.Location = new System.Drawing.Point(13, 8);
            this.rtbAboutText.Name = "rtbAboutText";
            this.rtbAboutText.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
            this.rtbAboutText.Size = new System.Drawing.Size(375, 76);
            this.rtbAboutText.TabIndex = 1;
            this.rtbAboutText.Text = "";
            // 
            // lDisclaimerText
            // 
            this.lDisclaimerText.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lDisclaimerText.Location = new System.Drawing.Point(38, 87);
            this.lDisclaimerText.Name = "lDisclaimerText";
            this.lDisclaimerText.Size = new System.Drawing.Size(325, 70);
            this.lDisclaimerText.TabIndex = 2;
            this.lDisclaimerText.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // okButton
            // 
            this.okButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.okButton.Location = new System.Drawing.Point(163, 160);
            this.okButton.Name = "okButton";
            this.okButton.Size = new System.Drawing.Size(75, 21);
            this.okButton.TabIndex = 3;
            this.okButton.Text = "确定";
            // 
            // AboutBoxSalesOrders
            // 
            this.AcceptButton = this.okButton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.okButton;
            this.ClientSize = new System.Drawing.Size(400, 191);
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
            this.ResumeLayout(false);

		}

        #endregion

		private System.Windows.Forms.RichTextBox rtbAboutText;
        private System.Windows.Forms.Label lDisclaimerText;
        private System.Windows.Forms.Button okButton;
    }
}