using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.LiveSupportModel;
using System.Net;

namespace LiveSupport.OperatorConsole
{
    public partial class ChangePassword : Form
    {
        public ChangePassword()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (this.txtPassword.Text == "" || this.txtNewPassword.Text == "" || this.txtNewPassword2.Text == "")
            {
                this.Text = "数据不能为空!";
                return;
            }
            else
            {
                if (this.txtNewPassword.Text == this.txtNewPassword2.Text)
                {
                    try
                    {
                        if (Program.OperaterServiceAgent.ChangePassword(this.txtPassword.Text, txtNewPassword.Text) == 0)
                        {
                            MessageBox.Show("更改成功!!\r\n\r\n 新密码为" + this.txtNewPassword.Text);
                            this.Close();
                        }
                        else
                        {
                            this.Text = "修改失败!";
                            return;
                        }
                    }
                    catch (WebException)
                    {
                       this.Text="网络中断,请稍候...";
                    }
                  

                }
                else
                {
                    this.Text = "新密码和确认新密码不一致!";
                    return;
                }
            }
        
        }

    }
}
