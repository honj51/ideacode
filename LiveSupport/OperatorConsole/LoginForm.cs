#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/24
 * Comment		: Login form for the operators
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Diagnostics;
using System.Net;
using System.Threading;

namespace LiveSupport.OperatorConsole
{
    public partial class LoginForm : Form
    {
        private IOperatorServiceAgent operatorServiceAgent;

        public IOperatorServiceAgent OperatorServiceAgent
        {
            get { return operatorServiceAgent; }
            set { operatorServiceAgent = value; }
        }

        public LoginForm()
        {
            InitializeComponent();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            loginStatusChange(false,"ÕýÔÚµÇÂ¼...");
            this.Cursor = Cursors.WaitCursor;
            login();
            this.Cursor = Cursors.Default;
           
            if (this.cbxPassword.Checked)
            {
                saveConfiguration();
            }            
        }

        private void loginStatusChange(bool state,string text) 
        {
            txtUserName.Enabled = state;
            txtOpName.Enabled = state;
            txtOpPassword.Enabled = state;
            lblMessage.Text = text;
            lblMessage.ForeColor = Color.Red;
            pictureBox1.Visible = !state;
        }
        
        private void login()
        {
            try
            {
                operatorServiceAgent.Login(int.Parse(txtUserName.Text), txtOpName.Text, txtOpPassword.Text);
            }
            catch (WebException e)
            {
                Trace.WriteLine("LoginÒì³£: " + e.Message);
                loginStatusChange(true,"Á¬½ÓÍøÂçÊ§°Ü");
                return;
            }

            if (operatorServiceAgent.CurrentOperator != null)
            {
                this.Visible = false;
                MainForm c = new MainForm(operatorServiceAgent, DateTime.Now);
                Program.MainForm = c;
                Program.MainForm.Show();
            }
            else
            {
                loginStatusChange(true, "µÇÂ¼Ê§°Ü!\r\n\r\nÊý¾ÝÌîÐ´ÓÐÎó...");
                lblMessage.SetBounds(260, 10, 25, 10);
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
			Application.Exit();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            //pictureBox1.Visible=false;

            loadConfiguration();
            if (Properties.Settings.Default.AutoLogin)
            {
                autoLoginTimer.Enabled = true;
            }
        }

        private void saveConfiguration()
        {
            Properties.Settings.Default.WSUser = txtUserName.Text;
            Properties.Settings.Default.OperatorName = txtOpName.Text;
            Properties.Settings.Default.OperatorPassword=txtOpPassword.Text;
            Properties.Settings.Default.RememberPassword=cbxPassword.Checked;
            Properties.Settings.Default.AutoLogin=cbxAutoLogin.Checked;
            Properties.Settings.Default.Save(); 
        }

        private void loadConfiguration()
        {
            txtUserName.Text = Properties.Settings.Default.WSUser;
            txtOpName.Text = Properties.Settings.Default.OperatorName;
            txtOpPassword.Text = Properties.Settings.Default.OperatorPassword;
            cbxPassword.Checked = Properties.Settings.Default.RememberPassword;
            cbxAutoLogin.Checked = Properties.Settings.Default.AutoLogin;
        }

        private void linkLabelPassword_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabelPassword.LinkVisited = true;
                System.Diagnostics.Process.Start(Properties.Settings.Default.SearchPasswordURL);
            }
            catch (Exception ex)
            {
            }
        }

        private void linkLabelRegister_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabelRegister.LinkVisited = true;
                System.Diagnostics.Process.Start(Properties.Settings.Default.RegisterURL);
            }
            catch (Exception ex)
            {
            }
        }

        private void autoLoginTimer_Tick(object sender, EventArgs e)
        {
            login();
            if (operatorServiceAgent.CurrentOperator != null)
            {
                this.Hide();
            }
            autoLoginTimer.Enabled = false;
        }

    }
}