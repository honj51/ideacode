using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace LiveSupport.OperatorConsole.Dialog
{
    public partial class GetWebSiteCodeDialog : Form
    {
        private string script = string.Empty;
        public GetWebSiteCodeDialog(string accountId)
        {
            InitializeComponent();
            script = "<script src='http://lcs.zxkefu.cn/LSBanner.ashx?aid=" + accountId + "'></script>";
            textBox1.Text = script;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Clipboard.SetDataObject(textBox1.Text);
        }
    }
}
