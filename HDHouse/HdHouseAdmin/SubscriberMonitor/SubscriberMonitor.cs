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
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.MessageBox;

namespace Microsoft.Samples.SqlServer
{
    public partial class SubscriberMonitor : Form
    {
        private MergeSessionSummary[] rgSessionSummary;
        private static MergeSubscriberMonitor msmMonitor;
        private Boolean showDialog;

        // Connection property variables.
        private string publisherName;
        private string publicationName;
        private string publicationDBName;
        private string subscriptionDBName;
        private string subscriberName = Environment.MachineName;
        private ServerConnection conn;

        /// <summary>
        /// Default constructor.
        /// </summary>
        public SubscriberMonitor()
        {
            // Initialize the form.
            InitializeComponent();

            // Add columns to the ListView.
            AddColumnsToListView();

            showDialog = true;
        }

        public SubscriberMonitor(string subscriber,
            SubscriberSubscription subscription)
        {
            this.publisherName = subscription.PublisherName;
            this.publicationName = subscription.PublicationDBName;
            this.publicationDBName = subscription.PublicationDBName;
            this.subscriptionDBName = subscription.SubscriptionDBName;
            this.subscriberName = subscriber;

            // Initialize the form.
            InitializeComponent();

            // Add columns to the ListView.
            AddColumnsToListView();

            // If connection properties are passed, don't show the connection dialog
            // and hide the menus.
            //showDialog = false;

            foreach (ToolStripMenuItem menuItem in menuStrip1.Items)
            {
                menuItem.Visible = false;
            }
        }

        public SubscriberMonitor(string subscriber, string publication,
            string publisher, string publicationDb, string subscriptionDb)
        {
            this.subscriberName = subscriber;
            this.publisherName = publisher;
            this.publicationName = publication;
            this.publicationDBName = publicationDb;
            this.subscriptionDBName = subscriptionDb;

            // Initialize the form.
            InitializeComponent();

            // Add columns to the ListView.
            AddColumnsToListView();

            // If connection properties are passed, don't show the connection dialog
            // and hide the menus.
            //showDialog = false;

            foreach (ToolStripMenuItem menuItem in menuStrip1.Items)
            {
                menuItem.Visible = false;
            }
        }

        private void AddColumnsToListView()
        {
            ColumnHeader ch = this.detailsListView.Columns.Add("   ", -2, 
                HorizontalAlignment.Left);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.ColumnContent);

            ch = this.detailsListView.Columns.Add("Article", 200, 
                HorizontalAlignment.Left);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);

            ch = this.detailsListView.Columns.Add("% of Total", 60, 
                HorizontalAlignment.Center);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);

            ch = this.detailsListView.Columns.Add("Duration", 70, 
                HorizontalAlignment.Center);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);

            ch = this.detailsListView.Columns.Add("Inserts", 55, 
                HorizontalAlignment.Center);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);

            ch = this.detailsListView.Columns.Add("Deletes", 55, 
                HorizontalAlignment.Center);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);

            ch = this.detailsListView.Columns.Add("Updates", 55, 
                HorizontalAlignment.Center);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);

            ch = this.detailsListView.Columns.Add("Conflicts", 55, 
                HorizontalAlignment.Center);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);

            ch = this.detailsListView.Columns.Add("Schema Changes", 55, 
                HorizontalAlignment.Center);
            ch.AutoResize(ColumnHeaderAutoResizeStyle.None);
        }

        // Displays the connection dialog (if needed) and defines the 
        // MergeSubscriptionMonitor object.
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
		private void GetSubscriptionConnection()
        {
            try
            {
                // Show the connect dialog, if needed.
                if (showDialog)
                {
                    ConnectDialog connectDialog = new ConnectDialog();
                    if (DialogResult.OK == connectDialog.ShowDialog())
                    {
                        // Create the connection and monitor objects. 
                        conn = new ServerConnection(connectDialog.Subscriber);
                        msmMonitor = new MergeSubscriberMonitor(conn);

                        // Set subscription properties.
                        msmMonitor.SubscriberDB = connectDialog.SubscriberDB;
                        msmMonitor.Publisher = connectDialog.Publisher;
                        msmMonitor.PublisherDB = connectDialog.PublisherDB;
                        msmMonitor.Publication = connectDialog.Publication;
                    }
                    else
                    {
                        this.Close();
                        return;
                    }
                }
                // Otherwise, use the passed-in values.
                else
                {
                    // Create the connection and monitor objects. 
                    conn = new ServerConnection(subscriberName);
                    msmMonitor = new MergeSubscriberMonitor(conn);

                    // Set subscription properties.
                    msmMonitor.SubscriberDB = subscriptionDBName;
                    msmMonitor.Publisher = publisherName;
                    msmMonitor.PublisherDB = publicationDBName;
                    msmMonitor.Publication = publicationName;
                }

                // Get the session summary details
                this.rgSessionSummary = msmMonitor.GetSessionsSummary();
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex);
                emb.Show(this);
                return;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Disconnect();
                }
            }
        }

        private void MergeSubscriberMonitor_Load(object sender, EventArgs e)
        {
            GetSubscriptionConnection();

            if (conn != null)
            {
                RefreshTreeView();
            }
        }

        /// <summary>
        /// Handle File->Exit menu item
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// Handle Refresh menu item
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void refreshToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.rgSessionSummary = msmMonitor.GetSessionsSummary();

            SetLastRefreshTime();

            RefreshTreeView();
        }

        /// <summary>
        /// Handle About menu item
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AboutBox dlgAbout;

            dlgAbout = new AboutBox();
            dlgAbout.ShowDialog();
            dlgAbout.Dispose();
        }

        /// <summary>
        /// Handler for after selection of a node on the tree view pane
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void summaryTreeView_AfterSelect(object sender, TreeViewEventArgs e)
        {
            TreeNode summaryTreeNode = this.summaryTreeView.SelectedNode;

            // If a valid summary node is selected, display details grid on the right
            if (summaryTreeNode != null
                && this.rgSessionSummary != null
                && (int)summaryTreeNode.Tag != -1)
            {
                foreach (MergeSessionSummary mss in this.rgSessionSummary)
                {
                    if ((int)summaryTreeNode.Tag == mss.SessionId)
                    {
                        RefreshPane(mss);
                        return;
                    }
                }
            }

            RefreshPane(null);
        }

        private void RefreshTreeView()
        {
            SetLastRefreshTime();

            SetStatusText(Properties.Resources.NoSuccessSyncs);

            if (this.rgSessionSummary != null)
            {
                foreach (MergeSessionSummary mss in this.rgSessionSummary)
                {
                    if (mss.Status == MergeSessionStatus.Succeeded)
                    {
                        SetStatusText(Properties.Resources.LastSync 
                            + mss.StartTime.ToString());
                        break;
                    }
                }
            }

            RefreshNodes(this.rgSessionSummary);

            RefreshPane(null);
        }

        private void RefreshNodes(MergeSessionSummary[] rgMss)
        {
            int imageIndex = -1;

            this.summaryTreeView.BeginUpdate();

            // Empty the Tree Nodes first
            this.summaryTreeView.Nodes.Clear();

            if (rgMss == null)
            {
                return;
            }

            // Add the root node and the sessions as children 
            TreeNode parent = new TreeNode(Properties.Resources.MergeSessions, 0, 0);
            parent.Tag = -1;
            foreach (MergeSessionSummary mss in rgMss)
            {
                switch (mss.Status)
                {
                    case MergeSessionStatus.Succeeded:
                        imageIndex = 1;
                        break;

                    case MergeSessionStatus.Running:
                        imageIndex = 2;
                        break;

                    case MergeSessionStatus.Failed:
                        imageIndex = 3;
                        break;

                    case MergeSessionStatus.Interrupted:
                        imageIndex = 4;
                        break;
                }

                TreeNode treeNode = new TreeNode(Properties.Resources.Completed
                    + mss.StartTime.ToString(), imageIndex, imageIndex);
                treeNode.Tag = mss.SessionId;
                parent.Nodes.Add(treeNode);
            }

            this.summaryTreeView.Nodes.Add(parent);
            this.summaryTreeView.ExpandAll();
            this.summaryTreeView.EndUpdate();
        }

        private void SetLastRefreshTime()
        {
            lastRefreshTimeToolStripStatusLabel.Text
                = Properties.Resources.LastRefresh + DateTime.Now.ToString();
        }

        private void SetStatusText(string statusText)
        {
            statusToolStripStatusLabel.Text = statusText;
        }

        private void RefreshPane(MergeSessionSummary mssSummary)
        {
            RefreshSummary(mssSummary);

            lastMessageTextBox.Text = mssSummary != null 
                ? mssSummary.LastMessage : string.Empty;

            RefreshDetails(mssSummary != null ? mssSummary.SessionId : -1);
        }

        private void RefreshSummary(MergeSessionSummary mssSummary)
        {
            if (mssSummary != null)
            {
                if (mssSummary.Status == MergeSessionStatus.Succeeded)
                {
                    this.statusLabel.ImageIndex = 0;
                }

                this.statusLabel.Text = mssSummary.Status.ToString();
                this.durationLabel.Text = (new TimeSpan(mssSummary.Duration 
                    * TimeSpan.TicksPerSecond).ToString());
				this.uploadsLabel.Text = mssSummary.NumberOfUploads.ToString(
					System.Globalization.CultureInfo.InvariantCulture);
				this.downloadsLabel.Text = mssSummary.NumberOfDownloads.ToString(
					System.Globalization.CultureInfo.InvariantCulture);
            }
            else
            {
                this.statusLabel.Text = string.Empty;
                this.durationLabel.Text = string.Empty;
                this.uploadsLabel.Text = string.Empty;
                this.downloadsLabel.Text = string.Empty;
            }
        }

        private void RefreshDetails(int SessionId)
        {
            MergeSessionDetail[] rgDetails;
            ListViewItem listViewItem;

            this.detailsListView.Items.Clear();

            rgDetails = msmMonitor.GetSessionDetails(SessionId);
            if (rgDetails == null)
            {
                return;
            }

            foreach (MergeSessionDetail msd in rgDetails)
            {
                if (msd.DetailType == MergeSessionDetailType.UploadArticle ||
                    msd.DetailType == MergeSessionDetailType.DownloadArticle)
                {
                    listViewItem = new ListViewItem(string.Empty, 0);
                }
                else
                {
                    listViewItem = new ListViewItem(string.Empty);
                }

                switch (msd.DetailType)
                {
                    case MergeSessionDetailType.Initialization:
                    case MergeSessionDetailType.Upload:
                    case MergeSessionDetailType.Download:
                    case MergeSessionDetailType.SchemaChanges:
                    case MergeSessionDetailType.PreparingSnapshot:
                        listViewItem.Font = new Font(listViewItem.Font,
                            listViewItem.Font.Style | FontStyle.Bold);
                        listViewItem.SubItems.Add(msd.Message);
                        break;

                    case MergeSessionDetailType.UploadArticle:
                    case MergeSessionDetailType.DownloadArticle:
                        listViewItem.SubItems.Add(Properties.Resources.ArticleName + msd.Message);
                        break;
                }

                listViewItem.SubItems.Add(msd.PercentOfTotalTime.ToString(
					System.Globalization.CultureInfo.InvariantCulture));
                listViewItem.SubItems.Add(new TimeSpan(msd.Duration 
                    * TimeSpan.TicksPerSecond).ToString());
                listViewItem.SubItems.Add(msd.Inserts.ToString(
					System.Globalization.CultureInfo.InvariantCulture));
                listViewItem.SubItems.Add(msd.Deletes.ToString(
					System.Globalization.CultureInfo.InvariantCulture));
                listViewItem.SubItems.Add(msd.Updates.ToString(
					System.Globalization.CultureInfo.InvariantCulture));
				listViewItem.SubItems.Add(msd.Conflicts.ToString(
					System.Globalization.CultureInfo.InvariantCulture));
				listViewItem.SubItems.Add(msd.SchemaChanges.ToString(
					System.Globalization.CultureInfo.InvariantCulture));

                this.detailsListView.Items.Add(listViewItem);
            }
        }

        /// <summary>
        /// Public accessors for connection properties.
        /// Gets or sets the publication name.
        /// </summary>
        public string PublicationName
        {
            get { return this.publicationName; }
            set { this.publicationName = value; }
        }

        /// <summary>
        /// Gets or sets the publication database name.
        /// </summary>
        public string PublicationDBName
        {
            get { return this.publicationDBName; }
            set { this.publicationDBName = value; }
        }

        /// <summary>
        /// Gets or sets the Publisher database name.
        /// </summary>
        public string PublisherName
        {
            get { return this.publisherName; }
            set { this.publisherName = value; }
        }

        /// <summary>
        /// Gets or sets the subscription database name.
        /// </summary>
        public string SubscriptionDBName
        {
            get { return this.subscriptionDBName; }
			set { this.subscriptionDBName = value; }
        }

        /// <summary>
        /// Gets or sets the Subscriber name.
        /// </summary>
        public string SubscriberName
        {
            get { return this.subscriberName; }
			set { this.subscriberName = value; }
        }

        private void changeSubscriptionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GetSubscriptionConnection();

            SetLastRefreshTime();

            RefreshTreeView();
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void refreshButton_Click(object sender, EventArgs e)
        {
            this.rgSessionSummary = msmMonitor.GetSessionsSummary();

            SetLastRefreshTime();

            RefreshTreeView();
        }
    }
}
