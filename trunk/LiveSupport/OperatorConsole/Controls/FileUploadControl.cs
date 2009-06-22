using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace LiveSupport.OperatorConsole.Controls
{
    public partial class FileUploadControl : UserControl
    {
        string fileName;
        string url;
        Byte[] file;
        TabPage tabPage;

        public enum UploadStatus 
        {
            Succeed,Cancel,Error
        
        }

        public FileUploadControl()
        {
            InitializeComponent();
        }

        public FileUploadControl(Byte[] file,string fileName,string url,TabPage tabPage) 
        {
            InitializeComponent();
            this.tabPage = tabPage;
            this.file = file;
            this.fileName = fileName;
            this.url = url;
        
        }

        private void FileUploadControl_Load(object sender, EventArgs e)
        {
            this.lblFileName.Text = this.fileName;
            this.lblSpeed.Text = (50000/1024) + "Kb/s";
            progressBar1.Maximum = this.file.Length;//设置最大长度值
            progressBar1.Value = 0;//设置当前值
            progressBar1.Step = 50000;//设置没次增长多少
            
           
        }

        private void lblCancel_Click(object sender, EventArgs e)
        {
            timer.Enabled = false;
            this.tabPage.Controls.Remove(this);
            if (this.tabPage.Controls.Count == 0)
            {
                this.tabPage.Parent.Controls.Remove(this.tabPage);
            }
            else
            {
                foreach (Control item in this.tabPage.Controls)
                {
                    if (item.Location == new System.Drawing.Point(4, this.Height + 10))
                    {
                        item.Location = new System.Drawing.Point(4, 21);

                    }

                }
            }
        }

        private void timer_Tick(object sender, EventArgs e)
        {
          
               // System.Threading.Thread.Sleep(1000);//暂停1秒
            if (progressBar1.Step > progressBar1.Maximum||progressBar1.Step>progressBar1.Maximum-progressBar1.Value)
            {
              progressDone();
            }
            else
            {
                progressBar1.Value += progressBar1.Step;//让进度条增加一次
                this.lblProgress.Text = (progressBar1.Value / 1024) + "Kb /" + (this.file.Length / 1024) + "Kb";
            }
        
         

        }

        private void progressDone()
        {
            progressBar1.Value = progressBar1.Maximum;
            this.lblProgress.Text = (progressBar1.Value / 1024) + "Kb /" + (this.file.Length / 1024) + "Kb";
            timer.Enabled = false;
         if (MessageBox.Show(this.fileName + "已传输完毕","提示") == DialogResult.OK)
         {
             
                    this.tabPage.Controls.Remove(this);
                    if (this.tabPage.Controls.Count == 0)
                    {
                        this.tabPage.Parent.Controls.Remove(this.tabPage);
                    }
                    else
                    {
                        foreach (Control item in this.tabPage.Controls)
                        {
                            if (item.Location == new System.Drawing.Point(4, this.Height + 10))
                            {
                                item.Location = new System.Drawing.Point(4, 21);

                            }

                        }
                    }
                }
                  
                
    
        }

    }
}
