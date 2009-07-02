using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace LiveSupport.OperatorConsole
{
    public partial class CloseSettingForm : Form
    {
        public CloseSettingForm()
        {
            InitializeComponent();
            loadConfiguration();
        }

        private void loadConfiguration() 
        {
            radioButton1.Checked = Properties.Settings.Default.CloseState;
            radioButton2.Checked = !Properties.Settings.Default.CloseState;
        }

        private void saveConfiguration() 
        {
            Properties.Settings.Default.CloseSettingState=!cbxCloseSettingState.Checked;
            Properties.Settings.Default.CloseState = radioButton1.Checked;

            Properties.Settings.Default.Save();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            saveConfiguration();
        }
    }
}
