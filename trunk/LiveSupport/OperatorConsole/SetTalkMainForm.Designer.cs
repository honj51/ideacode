namespace LiveSupport.OperatorConsole
{
    partial class SetTalkMainForm
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
            this.setTalkForm1 = new LiveSupport.OperatorConsole.SetTalkForm();
            this.SuspendLayout();
            // 
            // setTalkForm1
            // 
            this.setTalkForm1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.setTalkForm1.Location = new System.Drawing.Point(0, 0);
            this.setTalkForm1.Name = "setTalkForm1";
            this.setTalkForm1.Size = new System.Drawing.Size(216, 286);
            this.setTalkForm1.TabIndex = 0;
            // 
            // SetTalkMainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(216, 286);
            this.Controls.Add(this.setTalkForm1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "SetTalkMainForm";
            this.ShowInTaskbar = false;
            this.Text = "设置快速回复";
            this.ResumeLayout(false);

        }

        #endregion

        private SetTalkForm setTalkForm1;
    }
}