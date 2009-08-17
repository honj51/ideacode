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
    public partial class ResetOperatorPasswordForm : Form
    {   
        public ResetOperatorPasswordForm()
        {
            InitializeComponent();
            this.comboBox1.DataSource = Program.OperaterServiceAgent.Operators;
            this.comboBox1.DisplayMember = "NickName";
            Program.OperaterServiceAgent.AsyncCallCompleted += new EventHandler<AsyncCallCompletedEventArg>(OperaterServiceAgent_AsyncCallCompleted);
        }

        void OperaterServiceAgent_AsyncCallCompleted(object sender, AsyncCallCompletedEventArg e)
        {
            if (e.Result.GetType()==typeof(LiveSupport.OperatorConsole.LiveChatWS.ResetOperatorPasswordCompletedEventArgs))
            {
                LiveSupport.OperatorConsole.LiveChatWS.ResetOperatorPasswordCompletedEventArgs arg = e.Result as LiveSupport.OperatorConsole.LiveChatWS.ResetOperatorPasswordCompletedEventArgs;
                if (arg.Error == null)
                {
                    if (arg.Result == 0)
                    {
                        this.Close();
                    }
                    else if (arg.Result==-1)
                    {
                        this.Text = "出现未知错误!";
                    }
                }
                else
                {
                    this.Text = "网络中断! 请稍候...";
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("该操作将重置客服密码，确定继续吗？", "重置客服密码", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                Operator op = comboBox1.SelectedItem as Operator;
                Program.OperaterServiceAgent.ResetOperatorPassword(op.LoginName);
            }
        }
    }
}
