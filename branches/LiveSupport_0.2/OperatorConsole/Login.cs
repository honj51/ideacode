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
            if (txtOpName.Text.Length > 0 && txtOpPassword.Text.Length > 0)
            {
                // Check to see if we need to save the config
                if (Properties.Settings.Default.WSUser != txtUserName.Text)
                {
                    Properties.Settings.Default.OperatorConsole_LiveChatWS_Operator = "http://localhost/operator.asmx";
                    Properties.Settings.Default.WSUser = txtUserName.Text;
                    Properties.Settings.Default.Save();
                }
                OperatorWS ws = new OperatorWS();
                // Simple authentication
                AuthenticationHeader auth = new AuthenticationHeader();
                auth.userName = Properties.Settings.Default.WSUser;
                ws.AuthenticationHeaderValue = auth;

                Program.CurrentOperator = ws.LogIn(txtOpName.Text, txtOpPassword.Text);
           
            Operator op = new Operator();
            op.Name = txtOpName.Text;
            op.Password = txtOpPassword.Text;
            op.IsOnline = true;
            op.AccountId = 4;
            
            Program.CurrentOperator = op;
                // if we got an OperatorInfo, we continue
                if (Program.CurrentOperator != null)
                {
                    if (Program.CurrentOperator.IsOnline)
                    {
                        MessageBox.Show("�û��Ѿ���¼,\r\n\r\n���������û���¼...", "Operator Console", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                    }
                    else
                    {
                        this.Hide();
                        MainForm c = new MainForm(op, DateTime.Now);
                        
                        c.Show();
                    }
                }
                else
                {
                   
                        //Invalid credentials
                       MessageBox.Show("�û������������,\r\n\r\n������...", "Operator Console", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  
                     
                   
                    }
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
			// Exit the application
			Application.Exit();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            this.txtOpName.Text = "user1op1";
            txtOpPassword.Text = "abc123";
           // if (Properties.Settings.Default.OperatorConsole_LiveChatWS_Operator.Length == 0)
           // {
                //gbConfig.Visible = true;
                //this.Height = 354;
                //txtWSUrl.Text = "http://localhost/operator.asmx";
                //txtUserName.Text = "wspass";
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