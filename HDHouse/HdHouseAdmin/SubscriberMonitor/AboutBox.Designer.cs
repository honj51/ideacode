﻿namespace Microsoft.Samples.SqlServer
{
    partial class AboutBox
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AboutBox));
			this.rtbAboutText = new System.Windows.Forms.RichTextBox();
			this.lDisclaimerText = new System.Windows.Forms.Label();
			this.okButton = new System.Windows.Forms.Button();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
			this.SuspendLayout();
			// 
			// rtbAboutText
			// 
			this.rtbAboutText.Location = new System.Drawing.Point(12, 66);
			this.rtbAboutText.Name = "rtbAboutText";
			this.rtbAboutText.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
			this.rtbAboutText.Size = new System.Drawing.Size(375, 73);
			this.rtbAboutText.TabIndex = 1;
			this.rtbAboutText.Text = "";
			// 
			// lDisclaimerText
			// 
			this.lDisclaimerText.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.lDisclaimerText.Location = new System.Drawing.Point(37, 142);
			this.lDisclaimerText.Name = "lDisclaimerText";
			this.lDisclaimerText.Size = new System.Drawing.Size(325, 67);
			this.lDisclaimerText.TabIndex = 2;
			this.lDisclaimerText.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// okButton
			// 
			this.okButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.okButton.Location = new System.Drawing.Point(162, 212);
			this.okButton.Name = "okButton";
			this.okButton.Size = new System.Drawing.Size(75, 23);
			this.okButton.TabIndex = 3;
			this.okButton.Text = "OK";
			// 
			// pictureBox1
			// 
			this.pictureBox1.Dock = System.Windows.Forms.DockStyle.Top;
			this.pictureBox1.Image = Microsoft.Samples.SqlServer.Properties.Resources.SubSideMonitoringUI_ConnectDlg;
			this.pictureBox1.Location = new System.Drawing.Point(0, 0);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(400, 60);
			this.pictureBox1.TabIndex = 0;
			this.pictureBox1.TabStop = false;
			// 
			// AboutBox
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(400, 247);
			this.Controls.Add(this.okButton);
			this.Controls.Add(this.lDisclaimerText);
			this.Controls.Add(this.rtbAboutText);
			this.Controls.Add(this.pictureBox1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "AboutBox";
			this.ShowInTaskbar = false;
			this.Text = "About...";
			((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
			this.ResumeLayout(false);

		}

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.RichTextBox rtbAboutText;
        private System.Windows.Forms.Label lDisclaimerText;
        private System.Windows.Forms.Button okButton;
    }
}