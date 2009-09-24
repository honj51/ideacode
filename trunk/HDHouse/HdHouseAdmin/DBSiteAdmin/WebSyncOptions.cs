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
using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.MessageBox;
using System.Security;

#endregion

namespace DBSiteAdmin
{
    partial class WebSyncOptions : Form
    {
        public const string localhost = @"localhost";

        // Load the local subscription properties from the configuration file.	
        private string publicationDatabase
            = Properties.Settings.Default.PublicationDatabase;
        private string publicationName
            = Properties.Settings.Default.Publication;
        private string publisherServer
            = Properties.Settings.Default.Publisher;
        private string webSynchronizationUrl
            = Properties.Settings.Default.WebSynchronizationUrl;
        private string subscriberServer
            = Properties.Settings.Default.Subscriber;
        private string subscriptionDatabase
            = Properties.Settings.Default.SubscriptionDatabase;

        private ServerConnection subscriberConn;
        private MergePullSubscription mergePullSub;
		private static Boolean useWebSync = false;

		public Boolean WebSynchronizationEnabled
		{
			get
			{
				return useWebSync;
			}
		}

        public WebSyncOptions()
        {
            InitializeComponent();

            if (subscriberServer == localhost)
            {
                subscriberServer = Environment.MachineName;
            }

            if (publisherServer == localhost)
            {
                publisherServer = Environment.MachineName;
            }

            if (webSynchronizationUrl.Contains(localhost))
            {
                webSynchronizationUrl
                    = webSynchronizationUrl.Replace(localhost,
                    Environment.MachineName);
            }
        }

        private void enableWebSyncChkBox_CheckedChanged(object sender, EventArgs e)
        {
            if (enableWebSyncChkBox.Checked == true)
            {
                webSyncUrlTexBox.Enabled = true;
                userNameTextBox.Enabled = true;
                passwordTextBox.Enabled = true;
            }
            else
            {
                webSyncUrlTexBox.Enabled = false;
                userNameTextBox.Enabled = false;
                passwordTextBox.Enabled = false;
            }
        }

        private void okButton_Click(object sender, EventArgs e)
        {
            if (enableWebSyncChkBox.Checked == true &&
                (string.IsNullOrEmpty(userNameTextBox.Text) == true ||
                string.IsNullOrEmpty(passwordTextBox.Text) == true ||
                string.IsNullOrEmpty(webSyncUrlTexBox.Text) == true))
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionFormValidation);
                emb.Show(this);
                return;
            }
            else
            {
                if (enableWebSyncChkBox.Checked)
                {
                    mergePullSub.UseWebSynchronization = true;
                    mergePullSub.InternetLogin = userNameTextBox.Text;
                    mergePullSub.InternetPassword = passwordTextBox.Text;
                    mergePullSub.InternetUrl = webSyncUrlTexBox.Text;
					useWebSync = true;
                }
                else
                {
                    mergePullSub.UseWebSynchronization = false;
                    mergePullSub.InternetLogin = string.Empty;
                    mergePullSub.InternetPassword = string.Empty;
                    mergePullSub.InternetUrl = string.Empty;
					useWebSync = false;
                }
                mergePullSub.CommitPropertyChanges();
                mergePullSub.Refresh();
                subscriberConn.Disconnect();
                this.Close();
            }
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
        private void WebSyncOptions_Load(object sender, EventArgs e)
        {
            passwordTextBox.Text = string.Empty;

            try
            {
                subscriberConn = new ServerConnection(subscriberServer);
                subscriberConn.Connect();

                mergePullSub = new MergePullSubscription(subscriptionDatabase,
                    publisherServer, publicationDatabase, publicationName,
                    subscriberConn);

                mergePullSub.Load();

                if (mergePullSub.UseWebSynchronization)
                {
                    enableWebSyncChkBox.Checked = true;
					useWebSync = true;
                }

                if (string.IsNullOrEmpty(mergePullSub.InternetUrl) == false)
                {
                    webSyncUrlTexBox.Text = mergePullSub.InternetUrl;
                }
                else
                {
                    webSyncUrlTexBox.Text = webSynchronizationUrl;
                }

                if (string.IsNullOrEmpty(mergePullSub.InternetLogin) == false)
                {
                    userNameTextBox.Text = mergePullSub.InternetLogin;
                }
                else
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
                }

                if (mergePullSub.UseWebSynchronization == false)
                {
                    userNameTextBox.Enabled = false;
                    passwordTextBox.Enabled = false;
                }

            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex);
                emb.Show(this);
                this.Close();
            }
        }

        private void cancelButton_Click(object sender, EventArgs e)
        {
            if (subscriberConn.IsOpen) subscriberConn.Disconnect();
            this.Close();
        }

        private void mnuCancel_Click(object sender, EventArgs e)
        {
            if (subscriberConn.IsOpen) subscriberConn.Disconnect();
            this.Close();
        }

        private void mnuTellMeMore_Click(object sender, EventArgs e)
        {
            ExceptionMessageBox emb = new ExceptionMessageBox(
                Properties.Resources.TellMeMoreWebSync);
            emb.Symbol = ExceptionMessageBoxSymbol.Information;
            emb.Show(this);
        }
    }
}