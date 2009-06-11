using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
    public partial class ResetOperatorPasswordForm : Form
    {   
        public ResetOperatorPasswordForm()
        {
            InitializeComponent();
            this.comboBox1.DataSource = Program.OperaterServiceAgent.Operators;
            this.comboBox1.DisplayMember = "NickName";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("该操作将重置客服密码，确定继续吗？","重置客服密码", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                Operator op = comboBox1.SelectedItem as Operator;
                Program.OperaterServiceAgent.ResetOperatorPassword(op.LoginName);
            }
        }
    }
}
