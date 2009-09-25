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

using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.MessageBox;
using Microsoft.SqlServer.Management.Smo.Wmi;

namespace DBSiteAdmin
{
    public partial class ConnectDialog : Form
    {
        ArrayList availableSubscriptions;
        ManagedComputer localServer;

        //An integer value that specifies the subscription type for the returned subscription:
        private enum SubscriptionType
        {
            Push = 1,
            PullAndAnonymous = 2,
            Both = 3
        }

        public ConnectDialog()
        {
            InitializeComponent();
        }

        private void ConnectDialog_Load(object sender, EventArgs e)
        {
            // Get available local instance names.
            localServer = new ManagedComputer(Environment.MachineName);

            foreach (ServerInstance instance in localServer.ServerInstances)
            {
                // Display the default server instance as the machine name.
                string instanceName = (instance.Name == "MSSQLSERVER" ?
                    instanceName = Environment.MachineName :
                    instanceName = Environment.MachineName + "\\" + instance.Name);

                // Add the instance to the list.	
                subscriberComboBox.Items.Add(instanceName);
            }

            // Set to the first item to load available subscriptions.
            subscriberComboBox.SelectedIndex = 0;

            UpdateButtons();
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
        private void LoadSubscriptionProperties(string subscriber)
        {
            int subTextLength = 40;
            string subId;

            try
            {
                // Get default values from the current SQL Server
                ServerConnection serverConnection = new ServerConnection(subscriber);
                serverConnection.Connect();
                ReplicationServer replServer = new ReplicationServer(serverConnection);

                // Get the subscriptions on this Subscriber.
                availableSubscriptions =
                    replServer.EnumSubscriberSubscriptions(null,
                    Convert.ToInt32(SubscriptionType.Both,
                    System.Globalization.CultureInfo.InvariantCulture));

                // Enumerate all subscriptions
                this.subscriptionsComboBox.BeginUpdate();

                // Empty the combo box
                this.subscriptionsComboBox.Items.Clear();
                this.subscriptionsComboBox.Text = string.Empty;

                foreach (SubscriberSubscription subscriberSubscription
                    in availableSubscriptions)
                {
                    // Only get subscriptions to merge publications.
                    if (subscriberSubscription.Type == PublicationType.Merge)
                    {
                        subId = "[" + subscriberSubscription.SubscriptionDBName
                            + "]-[" + subscriberSubscription.PublisherName
                            + " ].[" + subscriberSubscription.PublicationDBName
                            + "]:" + subscriberSubscription.PublicationName;

                        subscriberSubscription.UserData = subId;
                        this.subscriptionsComboBox.Items.Add(subscriberSubscription.UserData);

                        if (subId.Length > subTextLength)
                        {
                            subTextLength = subId.Length;
                        }
                    }
                }

                this.subscriptionsComboBox.DropDownWidth = Convert.ToInt32(subTextLength * 5.6);

                // Set to the first item to get subscription properties.
                if (this.subscriptionsComboBox.Items.Count > 0)
                {
                    this.subscriptionsComboBox.SelectedIndex = 0;
                }

                this.subscriptionsComboBox.EndUpdate();
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex);
                emb.Show(this);
            }
        }

        private void UpdateButtons()
        {
            if (this.subscriptionsComboBox.SelectedIndex >= 0)
            {
                connectButton.Enabled = true;
                editButton.Enabled = true;
            }
            else
            {
                connectButton.Enabled = false;
                //editButton.Enabled = false;
                editButton.Text = "创建";
                editButton.Enabled = true;                
            }
        }

        private void subscriberComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubscriptionProperties(
                subscriberComboBox.SelectedItem.ToString() == "Default"
                ? Environment.MachineName
                : subscriberComboBox.SelectedItem.ToString());

            UpdateButtons();
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
        private void subscriptionsComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                foreach (SubscriberSubscription subscription in availableSubscriptions)
                {
                    if (subscription.UserData == this.subscriptionsComboBox.SelectedItem)
                    {
                        subscriberDbTextBox.Text = subscription.SubscriptionDBName;
                        publisherTextBox.Text = subscription.PublisherName;
                        publicationTextBox.Text = subscription.PublicationName;
                        publisherDbTextBox.Text = subscription.PublicationDBName;                        
                    }
                }

                UpdateButtons();
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex);
                emb.Show(this);
            }
        }

        /// <summary>
        /// Handles click on the connect button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OnClickConnect(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        internal string Subscriber
        {
            get
            {
                return (subscriberComboBox.SelectedItem.ToString() != null)
                    ? subscriberComboBox.SelectedItem.ToString() : string.Empty;
            }
        }

        internal string SubscriberDB
        {
            get
            {
                return (subscriberDbTextBox != null)
                    ? subscriberDbTextBox.Text : string.Empty;
            }
        }

        internal string Publisher
        {
            get
            {
                return (publisherTextBox != null)
                    ? publisherTextBox.Text : string.Empty;
            }
        }

        internal string Publication
        {
            get
            {
                return (publicationTextBox != null)
                    ? publicationTextBox.Text : string.Empty;
            }
        }

        internal string PublisherDB
        {
            get
            {
                return (publisherDbTextBox != null)
                    ? publisherDbTextBox.Text : string.Empty;
            }
        }

        internal string WebSyncUrl
        {
            get
            {
                return (webSyncUrlTextBox != null) ? webSyncUrlTextBox.Text : string.Empty;
            }
        }
        // Enable text boxes.
        private void editButton_Click(object sender, EventArgs e)
        {
            publisherTextBox.Enabled = true;
            publisherDbTextBox.Enabled = true;
            subscriberDbTextBox.Enabled = true;
            publicationTextBox.Enabled = true;
            webSyncUrlTextBox.Enabled = true;

            if (editButton.Text == "创建")
            {
                subscriberDbTextBox.Text = Environment.MachineName;
                publisherTextBox.Text = "";
                publicationTextBox.Text = "HdHouse-Pub";
                publisherDbTextBox.Text = "HdHouse";
                webSyncUrlTextBox.Text = "https://xxx/hdhouse/websync/replisapi.dll";
                editButton.Enabled = false;
                connectButton.Enabled = true;
            }
        }
    }
}
