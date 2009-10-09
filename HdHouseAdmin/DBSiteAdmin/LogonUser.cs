//-----------------------------------------------------------------------
//  This file is part of the Microsoft Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//  This source code is intended only as a supplement to Microsoft
//  Development Tools and/or on-line documentation.  See these other
//  materials for detailed information regarding Microsoft code samples.
// 
//  THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//  PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

#region Using directives

using System;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Microsoft.SqlServer.MessageBox;

#endregion

namespace DBSiteAdmin
{
    partial class LogonUser : Form
    {
        public LogonUser()
        {
            InitializeComponent();
        }

        private void LogonUser_Load(object sender, EventArgs e)
        {
            if (Environment.UserDomainName.Length != 0)
            {
                userNameTextBox.Text = Environment.UserDomainName
                    + @"\" + Environment.UserName;
            }
            else
            {
                userNameTextBox.Text = Environment.UserName;
            }

            passwordTextBox.Text = string.Empty;
        }

        public string UserName
        {
            get
            {
                return userNameTextBox.Text;
            }

            set
            {
                userNameTextBox.Text = value;
            }
        }

        public string Password
        {
            get
            {
                return passwordTextBox.Text;
            }

            set
            {
                passwordTextBox.Text = value;
            }
        }

        private void mnuTellMeMore_Click(object sender, EventArgs e)
        {
            ExceptionMessageBox emb = new ExceptionMessageBox(Properties.Resources.TellMeMoreLogin);
            emb.Symbol = ExceptionMessageBoxSymbol.Information;
            emb.Show(this);
        }
    }
}