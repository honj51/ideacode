using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace LiveSupport.OperatorConsole
{
    public partial class OptionsForm : Form
    {
        public OptionsForm()
        {
            InitializeComponent();
            loadConfiguration();
            buttonApply.Enabled = false;
        }

        private void loadConfiguration()
        {
           cbxAutoLogin.Checked= Properties.Settings.Default.AutoLogin;
           cbxwhenOfflineGetWebsiteRequests.Checked= Properties.Settings.Default.GetWebRequestOffline;
           cbxplaySoundOnChatMessage.Checked=Properties.Settings.Default.PlaySoundOnChatMsg;
           cbxplaySoundOnChatRequest.Checked=Properties.Settings.Default.PlaySoundOnChatReq;
           cbxAutoStart.Checked= Properties.Settings.Default.StartWithWindows;
           radioButtonCloseSet1.Checked=Properties.Settings.Default.CloseState;
           radioButtonCloseSet2.Checked = !Properties.Settings.Default.CloseState;
        }

        private void saveConfiguration() 
        {
            Properties.Settings.Default.AutoLogin = cbxAutoLogin.Checked;
            Properties.Settings.Default.GetWebRequestOffline=cbxwhenOfflineGetWebsiteRequests.Checked ;
            Properties.Settings.Default.PlaySoundOnChatMsg= cbxplaySoundOnChatMessage.Checked ;
            Properties.Settings.Default.PlaySoundOnChatReq=cbxplaySoundOnChatRequest.Checked ;
            Properties.Settings.Default.StartWithWindows=cbxAutoStart.Checked ;
            Properties.Settings.Default.CloseState=radioButtonCloseSet1.Checked ;
            Properties.Settings.Default.Save();
        }


        private void cbxAutoStart_CheckedChanged(object sender, EventArgs e)
        {
            this.buttonApply.Enabled = true;
        }

        private void buttonApply_Click(object sender, EventArgs e)
        {
            saveConfiguration();
            this.buttonApply.Enabled = false;
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            saveConfiguration();
        }
    }
}
