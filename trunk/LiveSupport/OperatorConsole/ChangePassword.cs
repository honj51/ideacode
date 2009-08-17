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
            Program.OperaterServiceAgent.AsyncCallCompleted += new EventHandler<AsyncCallCompletedEventArg>(OperaterServiceAgent_AsyncCallCompleted);
        }

        void OperaterServiceAgent_AsyncCallCompleted(object sender, AsyncCallCompletedEventArg e)
        {
            if (e.Result.GetType()==typeof(LiveSupport.OperatorConsole.LiveChatWS.ChangePasswordCompletedEventArgs))
            {
                LiveSupport.OperatorConsole.LiveChatWS.ChangePasswordCompletedEventArgs arg= e.Result as LiveSupport.OperatorConsole.LiveChatWS.ChangePasswordCompletedEventArgs;
                if (arg.Error==null)
	             {
		            if (arg.Result==0)
	                  {
		                     MessageBox.Show("更改成功!!\r\n\r\n 新密码为" + this.txtNewPassword.Text);
                                 this.Close();
                      }
                    else
                    {
                         this.Text = "修改失败!";
                    }
	             }
                else
                {
                this.Text="网络中断,请稍候...";
                }
            }
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
                    Program.OperaterServiceAgent.ChangePassword(this.txtPassword.Text, txtNewPassword.Text);
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
