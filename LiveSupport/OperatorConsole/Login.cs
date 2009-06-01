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

namespace LiveSupport.OperatorConsole
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
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

            txtUserName.Enabled = false;
            txtOpName.Enabled = false;
            txtOpPassword.Enabled = false;
            lblMessage.Text = "���ڵ�¼...";
            lblMessage.ForeColor = Color.Red;
            lblMessage.SetBounds(221,22, 25, 10);
            pictureBox1.Show();
            login();
            Properties.Settings.Default.Save(); 
           
        }

        private void login()
        {
            //pictureBox1.Show();
            try
            {

             
            OperatorWS ws = new OperatorWS();
            if (Properties.Settings.Default.AutoLogin)
            {
                Program.CurrentOperator = ws.Login(Properties.Settings.Default.WSUser, Properties.Settings.Default.OperatorName, Properties.Settings.Default.OperatorPassword);

            }
            else 
            {

                Program.CurrentOperator = ws.Login(txtUserName.Text, txtOpName.Text, txtOpPassword.Text);

            }
            
            }
            catch (Exception e)
            {

                Trace.WriteLine("Login�쳣: " + e.Message);
                
                lblMessage.Text = "��������ʧ��";
                MessageBox.Show(e.Message);
                txtUserName.Enabled = true;
                txtOpName.Enabled = true;
                txtOpPassword.Enabled = true;
                return;
            }
                // if we got an OperatorInfo, we continue
            if (Program.CurrentOperator != null)
            {
                txtUserName.Enabled = true;
                txtOpName.Enabled = true;
                txtOpPassword.Enabled = true;
                this.Hide();
                MainForm c = new MainForm(DateTime.Now);
                Program.MainForm = c;
                Program.MainForm.Show();
                //if (c.Relogin)
                //{
                //    this.txtOpName.Text = "";
                //    this.txtOpPassword.Text = "";
                //    Properties.Settings.Default.RememberPassword = false;
                //    this.cbxPassword.Checked = false;
                //    this.cbxAutoLogin.Checked = false;
                //    Properties.Settings.Default.AutoLogin = false;
                //    this.Show();
                //}
                //else
                //{
                //    this.Close();
                //}


            }
            else
            {
                //Invalid credentials
                lblMessage.Text = "��¼ʧ��...\r\n\r\n������д����...";
                lblMessage.SetBounds(260, 10, 25, 10);
                txtUserName.Enabled = true;
                txtOpName.Enabled = true;
                txtOpPassword.Enabled = true;
                pictureBox1.Hide();
                

            }

            Properties.Settings.Default.Save();
           
        
        
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
		   // Exit the application
			Application.Exit();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            pictureBox1.Hide();
            if(Properties.Settings.Default.AutoLogin)
            {
                login();
            }


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