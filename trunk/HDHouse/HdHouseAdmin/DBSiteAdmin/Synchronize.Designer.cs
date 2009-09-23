namespace DBSiteAdmin
{
    partial class Synchronize
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Synchronize));
            this.statusLabel = new System.Windows.Forms.Label();
            this.statusProgressBar = new System.Windows.Forms.ProgressBar();
            this.closeButton = new System.Windows.Forms.Button();
            this.currentStatusTextBox = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // statusLabel
            // 
            resources.ApplyResources(this.statusLabel, "statusLabel");
            this.statusLabel.Name = "statusLabel";
            // 
            // statusProgressBar
            // 
            resources.ApplyResources(this.statusProgressBar, "statusProgressBar");
            this.statusProgressBar.Name = "statusProgressBar";
            // 
            // closeButton
            // 
            resources.ApplyResources(this.closeButton, "closeButton");
            this.closeButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.closeButton.Name = "closeButton";
            this.closeButton.Click += new System.EventHandler(this.CloseButton_Click);
            // 
            // currentStatusTextBox
            // 
            resources.ApplyResources(this.currentStatusTextBox, "currentStatusTextBox");
            this.currentStatusTextBox.Name = "currentStatusTextBox";
            // 
            // Synchronize
            // 
            resources.ApplyResources(this, "$this");
            this.CancelButton = this.closeButton;
            this.ControlBox = false;
            this.Controls.Add(this.currentStatusTextBox);
            this.Controls.Add(this.closeButton);
            this.Controls.Add(this.statusLabel);
            this.Controls.Add(this.statusProgressBar);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Synchronize";
            this.ShowInTaskbar = false;
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.Load += new System.EventHandler(this.Synchronize_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label statusLabel;
        private System.Windows.Forms.ProgressBar statusProgressBar;
        private System.Windows.Forms.Button closeButton;
        private System.Windows.Forms.RichTextBox currentStatusTextBox;
    }
}