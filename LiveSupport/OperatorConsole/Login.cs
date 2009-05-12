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
          
            //if (txtOpName.Text.Length > 0 && txtOpPassword.Text.Length > 0)
            //{
                //// Check to see if we need to save the config
                //if (Properties.Settings.Default.WSUser != txtUserName.Text)
                //{
                //    Properties.Settings.Default.OperatorConsole_LiveChatWS_Operator = "http://localhost:1575/LiveChat/Operator.asmx";
                //    Properties.Settings.Default.WSUser = txtUserName.Text;
                //    Properties.Settings.Default.Save();
                //}
                OperatorWS ws = new OperatorWS();
                //// Simple authentication
                //AuthenticationHeader auth = new AuthenticationHeader();
                //auth.userName = Properties.Settings.Default.WSUser;
                //ws.AuthenticationHeaderValue = auth;
                 // Operator op=  ws.LogIn(txtOpName.Text, txtOpPassword.Text);
                 

                Program.CurrentOperator=  ws.Login(Properties.Settings.Default.WSUser,txtOpName.Text,txtOpPassword.Text);
                // if we got an OperatorInfo, we continue
                if (Program.CurrentOperator != null)
                {
                //    if (Program.CurrentOperator.IsOnline)
                //    {
                //        MessageBox.Show("用户已经登录,\r\n\r\n请用其他用户登录...", "Operator Console", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                //    }
                //    else
                //    {
                        this.Hide();
                        
                        MainForm c = new MainForm(DateTime.Now);
                        Program.MainForm = c;
                        Program.MainForm.ShowDialog();
                        if (c.Relogin)
                        {
                            this.txtOpName.Text = "";
                            this.txtOpPassword.Text = "";
                            Properties.Settings.Default.RememberPassword = false;
                            this.cbxPassword.Checked = false;
                            this.cbxAutoLogin.Checked = false;
                            Properties.Settings.Default.AutoLogin=false;
                            this.Show();                            
                        }
                        else
                        {
                            this.Close();
                        }
       
                  //  }
               }
               else
               {
                   
                        //Invalid credentials
                       MessageBox.Show("用户名或密码错误,\r\n\r\n请重试...", "Operator Console", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  
                     
                   
                   }
            //}

                        Properties.Settings.Default.Save();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
			// Exit the application
			Application.Exit();
        }

        private void Login_Load(object sender, EventArgs e)
        {
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
            //this.txtOpName.Text = "user1op1";
          //  txtOpPassword.Text = "abc123";
           // if (Properties.Settings.Default.OperatorConsole_LiveChatWS_Operator.Length == 0)
           // {
                //gbConfig.Visible = true;
                //this.Height = 354;
                //txtWSUrl.Text = "http://localhost/operator.asmx";
            txtUserName.Text = Properties.Settings.Default.WSUser;
                //txtWSUrl.SelectAll();
                //txtWSUrl.Focus();
            //}
            //else
            //{
            //    gbConfig.Visible = false;
            //    this.Height = 214;
            //    txtOpName.Focus();
            //    txtWSUrl.Text = Properties.Settings.Default.OperatorConsole_LiveChatWS_Operator;
            //    txtUserName.Text = Properties.Settings.Default.WSUser;
            //}
        }

        //private void lnkShowConfig_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        //{
        //    if (gbConfig.Visible)
        //    {
        //        gbConfig.Visible = false;
        //        this.Height = 214;
        //    }
        //    else
        //    {
        //        gbConfig.Visible = true;
        //        this.Height = 354;
        //    }
        //}
    }
}