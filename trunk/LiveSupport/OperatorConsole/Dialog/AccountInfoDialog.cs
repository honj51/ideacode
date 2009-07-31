using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole.Dialog
{
    public partial class AccountInfoDialog : Form
    {
        public bool GotoModifyAccountInfoPage = false;

        public AccountInfoDialog(Operator op)
        {
            InitializeComponent();
            this.operatorBindingSource.DataSource = op;
        }

        private void AccountInfoDialog_Load(object sender, EventArgs e)
        {
        }

        private void buttonModifyAccountInfo_Click(object sender, EventArgs e)
        {
            GotoModifyAccountInfoPage = true;
            this.Close();
        }
    }
}
