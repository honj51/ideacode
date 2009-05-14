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
              
            if (Properties.Settings.Default.WSUser != txtUserName.Text)
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
            login();
               
            Properties.Settings.Default.Save();
        }

        private void login()
        {
            OperatorWS ws = new OperatorWS();

            Program.CurrentOperator = ws.Login(Properties.Settings.Default.WSUser, Properties.Settings.Default.OperatorName, Properties.Settings.Default.OperatorPassword);
            // if we got an OperatorInfo, we continue
            if (Program.CurrentOperator != null)
            {
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
                MessageBox.Show("用户名或密码错误,\r\n\r\n请重试...", "Operator Console", MessageBoxButtons.OK, MessageBoxIcon.Warning);

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
    }
}