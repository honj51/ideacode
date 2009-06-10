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

namespace LiveSupport.OperatorConsole
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
            if (Properties.Settings.Default.AutoLogin)
            {
                login();
                this.Visible = false;
            }
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.RememberPassword = this.cbxPassword.Checked;
            Properties.Settings.Default.AutoLogin = this.cbxAutoLogin.Checked;
            if((!string.IsNullOrEmpty(this.txtOpName.Text))&&(!string.IsNullOrEmpty(this.txtOpPassword.Text)))
            {
               
                Properties.Settings.Default.AutoLogin=this.cbxAutoLogin.Checked;
            
            }

            if (Properties.Settings.Default.WSUser != txtUserName.Text )
            {
                Properties.Settings.Default.WSUser = txtUserName.Text;

            }

            if(Properties.Settings.Default.OperatorName!=txtOpName.Text||Properties.Settings.Default.OperatorPassword!=txtOpPassword.Text)
            {
                if ((!string.IsNullOrEmpty(txtOpName.Text)) && (!string.IsNullOrEmpty(txtOpPassword.Text)))
                {

                    Properties.Settings.Default.OperatorName = txtOpName.Text;
                    Properties.Settings.Default.OperatorPassword = txtOpPassword.Text;

                }
 
             }

            loginChange(false,"���ڵ�¼...");
            lblMessage.SetBounds(221, 22, 25, 10);
            login();
            Properties.Settings.Default.Save(); 
           
        }
        private void loginChange(bool state,string text) 
        {
            txtUserName.Enabled = state;
            txtOpName.Enabled = state;
            txtOpPassword.Enabled = state;
            lblMessage.Text = text;
            lblMessage.ForeColor = Color.Red;
            pictureBox1.Visible=!state;
        
        
        }
        
        private void login()
        {
            OperatorWS ws = new OperatorWS();
            try
            {
                if (Properties.Settings.Default.AutoLogin)
                {
                    Program.CurrentOperator = ws.Login(Properties.Settings.Default.WSUser, Properties.Settings.Default.OperatorName, Properties.Settings.Default.OperatorPassword);

                }
                else
                {
                    Program.CurrentOperator = ws.Login(txtUserName.Text, txtOpName.Text, txtOpPassword.Text);
                }
            }
            catch (WebException e)
            {
                Trace.WriteLine("Login�쳣: " + e.Message);
                lblMessage.Text = "��������ʧ��";
                txtUserName.Enabled = true;
                txtOpName.Enabled = true;
                txtOpPassword.Enabled = true;
                this.Visible = true;
                return;
            }
                // if we got an OperatorInfo, we continue
            if (Program.CurrentOperator != null)
            {
                txtUserName.Enabled = true;
                txtOpName.Enabled = true;
                txtOpPassword.Enabled = true;
                this.Visible = false;
                MainForm c = new MainForm(DateTime.Now);
                Program.MainForm = c;
                Program.MainForm.Show();
            }
            else
            {
                //Invalid credentials
                loginChange(true, "��¼ʧ��...\r\n\r\n������д����...");
                lblMessage.SetBounds(260, 10, 25, 10);
                this.Visible = true;
            }

            Properties.Settings.Default.Save();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
			Application.Exit();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            pictureBox1.Visible=false;
            if (Properties.Settings.Default.RememberPassword)
            {
               
                if ((!string.IsNullOrEmpty(Properties.Settings.Default.OperatorName)) && (!string.IsNullOrEmpty(Properties.Settings.Default.OperatorPassword)))
                {
                    this.txtOpName.Text = Properties.Settings.Default.OperatorName;
                    this.txtOpPassword.Text = Properties.Settings.Default.OperatorPassword;
                }
            }
            else 
            {
                txtOpName.Text = "";
                txtOpPassword.Text= "";
            
            }
            
            this.cbxPassword.Checked = Properties.Settings.Default.RememberPassword;
            txtUserName.Text = Properties.Settings.Default.WSUser;
        }

        private void linkLabelPassword_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabelPassword.LinkVisited = true;
                System.Diagnostics.Process.Start(Properties.Settings.Default.SearchPasswordURL);
            }
            catch (Exception)
            {
                MessageBox.Show("Unable to open link that was clicked.");

            }
        }

        private void linkLabelRegister_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabelRegister.LinkVisited = true;
                System.Diagnostics.Process.Start(Properties.Settings.Default.RegisterURL);
            }
            catch (Exception)
            {
                MessageBox.Show("Unable to open link that was clicked.");

            }
        }

    }
}