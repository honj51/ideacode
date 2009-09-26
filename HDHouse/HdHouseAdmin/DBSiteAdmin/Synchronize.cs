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
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Globalization;
using System.Runtime.Serialization;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.MessageBox;
using DBSiteAdmin.dbCenterWebService;
#endregion

namespace DBSiteAdmin
{
	public delegate void SyncWhenConnectedStatus(object sender, StatusEventArgs e);

    partial class Synchronize : Form
    {
        
        public const string localhost = @"localhost";

		private string outputLogFile = Properties.Settings.Default.OutputFile;
		private int outputLevel = Properties.Settings.Default.OutputVerboseLevel;

		public event SyncWhenConnectedStatus Status;

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
        private string subscriberHostName
            = Properties.Settings.Default.HostName;

        private string internetLogin = Properties.Settings.Default.InternetLogin;
        private string internetPassword = Properties.Settings.Default.InternetPassword;

        private ServerConnection subscriberConn;
        //private ServerConnection publisherConn;
        private MergePullSubscription mergePullSub;
        private string handlerFriendlyName = Properties.Resources.HandlerFriendlyName;

		private static Boolean useWebSync = false;

        // Status message strings.
        private string statusInitialize;
        private string statusCreateDatabase;
        private string statusCreateSubscription;
        private string statusSuccess;
        private string statusReinitialize;
        private string statusFail;


		public Boolean UseWebSynchronization
		{
			get
			{
				return useWebSync;
			}
			set
			{
				useWebSync = value;
			}
		}
		
        /// <summary>
        /// Synchronize subscription with publisher and report status
        /// </summary>
        /// <param name="webSyncChecked"></param>
        public Synchronize()
        {
            // Required for Windows Form Designer support
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

            statusInitialize
                = string.Format(CultureInfo.InvariantCulture,
                Properties.Resources.StatusInitialize,
                publicationDatabase);
            statusCreateDatabase
                = string.Format(CultureInfo.InvariantCulture,
                Properties.Resources.StatusCreateDatabase,
                subscriptionDatabase);
            statusCreateSubscription
                = Properties.Resources.StatusCreateSubscription;
            statusSuccess = Properties.Resources.StatusSuccess;
            statusReinitialize
                = string.Format(CultureInfo.InvariantCulture,
                Properties.Resources.StatusReinitialize,
                publicationDatabase);
            statusFail = Properties.Resources.StatusFail;

            closeButton.Enabled = false;
        }

        /// <summary>
        /// Status event handler for the managed agent wrapper.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Sync_Status(object sender, StatusEventArgs e)
        {
            // Update the Synchronization Status form.
			statusProgressBar.Value = (int)e.PercentCompleted;
            currentStatusTextBox.AppendText(e.Message.ToString()
                + Environment.NewLine);

			// Call the Status event to update the main form 
			// if sync when connected is used.
			if (Status != null)
			{
				Status(this, e);
			}

            Application.DoEvents();
        }

        /// <summary>
        /// Reinitialize an existing subscription with upload 
        /// </summary>
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2201:DoNotRaiseReservedExceptionTypes")]
		public void ReinitializeSubscriptionWithUpload()
        {
            MergeSynchronizationAgent syncAgent;

            try
            {
                // Make the connection and get the subscription properties.
                subscriberConn = new ServerConnection(subscriberServer);
                subscriberConn.Connect();
            }
            catch (Microsoft.SqlServer.Replication.ConnectionFailureException ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionCannotConnectLocal,
                    Properties.Resources.ExceptionSqlServerError,
                    ExceptionMessageBoxButtons.OK);
                emb.InnerException = ex;
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }

            mergePullSub = new MergePullSubscription();

            // Set the properties needed to get the subscription.
            mergePullSub.ConnectionContext = subscriberConn;
            mergePullSub.PublicationName = publicationName;
            mergePullSub.PublisherName = publisherServer;
            mergePullSub.PublicationDBName = publicationDatabase;
            mergePullSub.DatabaseName = subscriptionDatabase;

            // Load the properties of the existing subscription.
            if (!mergePullSub.LoadProperties())
            {
                throw new ApplicationException(
                    Properties.Resources.ExceptionProblemLocalData
                    + Environment.NewLine
                    + Properties.Resources.ExceptionContactTechSupport);
            }

            // Check to make sure that the Merge Agent isn't already running.
            if (mergePullSub.LastAgentStatus
                != (ReplicationStatus.Running | ReplicationStatus.Starting))
            {
                // Mark the subscription for reinitialization after uploading.
                mergePullSub.Reinitialize(true);

                // Get the Merge Agent for synchronous execution.
                syncAgent = mergePullSub.SynchronizationAgent;

                // Define the event handler.
                syncAgent.Status
                    += new AgentCore.StatusEventHandler(Sync_Status);

				syncAgent.Output = outputLogFile;
				syncAgent.OutputVerboseLevel = outputLevel;

                // Start the Merge Agent Job.
                try
                {
                    currentStatusTextBox.Text = statusReinitialize
                        + Environment.NewLine;
                    syncAgent.Synchronize();
                }
                catch (Exception ex)
                {
                    throw new ApplicationException(
                        Properties.Resources.ExceptionCouldNotReInit
                        + Environment.NewLine
                        + Properties.Resources.ExceptionContactTechSupport, ex);
                }
                finally
                {
                    statusProgressBar.Value = 100;
                    closeButton.Enabled = true;
                    subscriberConn.Disconnect();
                }
            }
            else
            {
                currentStatusTextBox.Text
                    = Properties.Resources.StatusSubscriptionAlreadySync;
                closeButton.Enabled = true;
            }
        }

        /// <summary>
        /// Reinitialize an existing subscription without upload.
        /// </summary>
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2201:DoNotRaiseReservedExceptionTypes")]
		public void ReinitializeSubscription()
        {
            MergeSynchronizationAgent syncAgent;

            try
            {
                // Make the connection and get the subscription properties.
                subscriberConn = new ServerConnection(subscriberServer);
                subscriberConn.Connect();
            }
            catch (Microsoft.SqlServer.Replication.ConnectionFailureException ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionCannotConnectLocal,
                    Properties.Resources.ExceptionSqlServerError,
                    ExceptionMessageBoxButtons.OK);
                emb.InnerException = ex;
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }

            mergePullSub = new MergePullSubscription();

            // Set the properties needed to get the subscription.
            mergePullSub.ConnectionContext = subscriberConn;
            mergePullSub.PublicationName = publicationName;
            mergePullSub.PublisherName = publisherServer;
            mergePullSub.PublicationDBName = publicationDatabase;
            mergePullSub.DatabaseName = subscriptionDatabase;

            // Load the properties of the existing subscription.
            if (!mergePullSub.LoadProperties())
            {
                throw new ApplicationException(
                    Properties.Resources.ExceptionProblemLocalData
                    + Environment.NewLine
                    + Properties.Resources.ExceptionContactTechSupport);
            }

            // Mark the subscription for reinitialization after uploading.
            mergePullSub.Reinitialize(false);

            // Get the Merge Agent for synchronous execution.
            syncAgent = mergePullSub.SynchronizationAgent;

			// Generate a troubleshooting log file.
			syncAgent.Output = outputLogFile;
			syncAgent.OutputVerboseLevel = outputLevel;

            // Define the event handler.
            syncAgent.Status += new AgentCore.StatusEventHandler(Sync_Status);

            // Start the Merge Agent Job.
            try
            {
                currentStatusTextBox.Text = statusReinitialize
                    + Environment.NewLine;
                syncAgent.Synchronize();
            }
            catch (Exception ex)
            {
                statusProgressBar.Value = 0;
                throw new ApplicationException(
                    Properties.Resources.ExceptionCouldNotReInit
                    + Environment.NewLine
                    + Properties.Resources.ExceptionContactTechSupport, ex);
            }
            finally
            {
                closeButton.Enabled = true;
                subscriberConn.Disconnect();
            }
        }

        /// <summary>
        /// Synchronize an existing subscription, upload and download.
        /// </summary>
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2201:DoNotRaiseReservedExceptionTypes")]
		public void SynchronizeSubscriptionFull()
        {
            MergeSynchronizationAgent syncAgent;

            try
            {
                // Make the connection and get the subscription properties.
                subscriberConn = new ServerConnection(subscriberServer);
                subscriberConn.Connect();
            }
            catch (Microsoft.SqlServer.Replication.ConnectionFailureException ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionCannotConnectLocal,
                    Properties.Resources.ExceptionSqlServerError,
                    ExceptionMessageBoxButtons.OK);
                emb.InnerException = ex;
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }

            mergePullSub = new MergePullSubscription();

            // Set the properties needed to get the subscription.
            mergePullSub.ConnectionContext = subscriberConn;
            mergePullSub.PublicationName = publicationName;
            mergePullSub.PublisherName = publisherServer;
            mergePullSub.PublicationDBName = publicationDatabase;
            mergePullSub.DatabaseName = subscriptionDatabase;

            // Load the properties of the existing subscription.
            if (!mergePullSub.LoadProperties())
            {
                throw new ApplicationException(
                    Properties.Resources.ExceptionProblemLocalData
                    + Environment.NewLine
                    + Properties.Resources.ExceptionContactTechSupport);
            }

            // Get the Merge Agent for synchronous execution.
            syncAgent = mergePullSub.SynchronizationAgent;

            // Specify upload and download.
            syncAgent.ExchangeType = MergeExchangeType.Bidirectional; //default

			// Generate a troubleshooting log file.
			syncAgent.Output = outputLogFile;
			syncAgent.OutputVerboseLevel = outputLevel;

            // Define the event handler.
            syncAgent.Status += new AgentCore.StatusEventHandler(Sync_Status);

            // Start the Merge Agent Job.
            try
            {
                syncAgent.Synchronize();
            }
            catch (Exception ex)
            {
                statusProgressBar.Value = 0;
                throw new ApplicationException(
                    Properties.Resources.ExceptionSubscriptionNotSync
                    + Environment.NewLine
                    + Properties.Resources.ExceptionContactTechSupport, ex);
            }
            finally
            {
                closeButton.Enabled = true;
                subscriberConn.Disconnect();
            }
        }

        /// <summary>
        /// Synchronize an existing subscription as upload-only.
        /// </summary>
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2201:DoNotRaiseReservedExceptionTypes")]
		public void SynchronizeSubscriptionUploadOnly()
        {
            MergeSynchronizationAgent syncAgent;

            try
            {
                // Make the connection and get the subscription properties.
                subscriberConn = new ServerConnection(subscriberServer);
                subscriberConn.Connect();
            }
            catch (Microsoft.SqlServer.Replication.ConnectionFailureException ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionCannotConnectLocal,
                    Properties.Resources.ExceptionSqlServerError,
                    ExceptionMessageBoxButtons.OK);
                emb.InnerException = ex;
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }

            mergePullSub = new MergePullSubscription();

            // Set the properties needed to get the subscription.
            mergePullSub.ConnectionContext = subscriberConn;
            mergePullSub.PublicationName = publicationName;
            mergePullSub.PublisherName = publisherServer;
            mergePullSub.PublicationDBName = publicationDatabase;
            mergePullSub.DatabaseName = subscriptionDatabase;

            // Load the properties of the existing subscription.
            if (!mergePullSub.LoadProperties())
            {
                throw new ApplicationException(
                    Properties.Resources.ExceptionProblemLocalData
                    + Environment.NewLine
                    + Properties.Resources.ExceptionContactTechSupport);
            }

            // Get the Merge Agent for synchronous execution.
            syncAgent = mergePullSub.SynchronizationAgent;

            // Specify an upload-only exchange type.
            syncAgent.ExchangeType = MergeExchangeType.Upload;

			// Generate a troubleshooting log file.
			syncAgent.Output = outputLogFile;
			syncAgent.OutputVerboseLevel = outputLevel;
			
			// Define the event handler.
            syncAgent.Status += new AgentCore.StatusEventHandler(Sync_Status);

            // Start the Merge Agent Job.
            try
            {
                syncAgent.Synchronize();
            }
            catch (Exception ex)
            {
                statusProgressBar.Value = 0;
                throw new ApplicationException(
                    Properties.Resources.ExceptionMergeAgentFailedSync,
                    ex);
            }
            finally
            {
                closeButton.Enabled = true;
                subscriberConn.Disconnect();
            }
        }

        /// <summary>
        /// Check that the subscription exists and create it if needed.
        /// </summary>
        public void CheckSubscription()
        {
            try
            {
                // We need connections to the Publisher and Distributor.
                subscriberConn = new ServerConnection(subscriberServer);
                subscriberConn.Connect();
            }
            catch (Microsoft.SqlServer.Replication.ConnectionFailureException ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionCannotConnectLocal,
                    Properties.Resources.ExceptionSqlServerError,
                    ExceptionMessageBoxButtons.OK);
                emb.InnerException = ex;
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }

            // Create the subscription database using SMO if it does not exist.
            Server subServer = new Server(subscriberConn);

            // Instantiate a pull subscription object.
            mergePullSub = new MergePullSubscription();

            // Set the properties needed to create the subscription.
            mergePullSub.ConnectionContext = subscriberConn;
            mergePullSub.PublicationName = publicationName;
            mergePullSub.PublisherName = publisherServer;
            mergePullSub.PublicationDBName = publicationDatabase;
            mergePullSub.DatabaseName = subscriptionDatabase;

            if (subServer.Databases.Contains(subscriptionDatabase))
            {
                // If the database exists, check for replication objects.
                if (mergePullSub.IsExistingObject)
                {
					if (mergePullSub.UseWebSynchronization)
					{
						this.UseWebSynchronization = true;
					}
                    this.Close();
                    return;
                }
            }

            CreateSubscription();
        }

        /// <summary>
        /// Create a new subscription, providing the security credentials
        /// used to run the Merge Agent at the Subscriber.
        /// </summary>
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2201:DoNotRaiseReservedExceptionTypes")]
		private void CreateSubscription()
        {
            ReplicationDatabase replDatabase;
            Server subServer;
            Database newDatabase;
            MergeSynchronizationAgent syncAgent;
            ReplicationServer Subscriber;
            BusinessLogicHandler insertUpdateHandler;
            Boolean isRegistered = false;

            this.Show();
            Application.DoEvents();

            // We need to collect valid Windows credentials to be able to 
           //  store Web synchronization information in the database.
            LogonUser logon = new LogonUser();
            DialogResult dr = logon.ShowDialog(this);
            string username = logon.UserName;
            string password = logon.Password;

            if (dr == DialogResult.OK)
            {
                //try
                //{
                //    // Create connections to the Publisher and Distributor.
                //    publisherConn = new ServerConnection(publisherServer);
                //    publisherConn.Connect();
                //}
                //catch (Microsoft.SqlServer.Replication.ConnectionFailureException ex)
                //{
                //    ExceptionMessageBox emb = new ExceptionMessageBox(
                //        Properties.Resources.ExceptionCannotConnectPublisher,
                //        Properties.Resources.ExceptionSqlServerError,
                //        ExceptionMessageBoxButtons.OK);
                //    emb.InnerException = ex;
                //    emb.Show(this);

                //    // Shutdown the application because we can't continue.
                //    Application.Exit();
                //}

                try
                {
                    // Make the connection and get the subscription properties.
                    subscriberConn = new ServerConnection(subscriberServer);
                    subscriberConn.Connect();
                }
                catch (Microsoft.SqlServer.Replication.ConnectionFailureException ex)
                {
                    ExceptionMessageBox emb = new ExceptionMessageBox(
                        Properties.Resources.ExceptionCannotConnectLocal,
                        Properties.Resources.ExceptionSqlServerError,
                        ExceptionMessageBoxButtons.OK);
                    emb.InnerException = ex;
                    emb.Show(this);

                    // Shutdown the application because we can't continue.
                    Application.Exit();
                }

                // Instantiate a pull subscription object.
                mergePullSub = new MergePullSubscription();

                // Set the required properties needed to create the subscription.
                mergePullSub.ConnectionContext = subscriberConn;
                mergePullSub.PublicationName = publicationName;
                mergePullSub.PublisherName = publisherServer;
                mergePullSub.PublicationDBName = publicationDatabase;
                mergePullSub.DatabaseName = subscriptionDatabase;
                // Specify an anonymous Subscriber type since we can't 
                // register at the Publisher with a direct connection.
                mergePullSub.SubscriberType = MergeSubscriberType.Anonymous;
                // Enable Web synchronization.
                mergePullSub.UseWebSynchronization = true;
                mergePullSub.InternetUrl = Properties.Settings.Default.WebSynchronizationUrl;

                // Specify the same Windows credentials to use when connecting to the
                // Web server using HTTPS Basic Authentication.
                mergePullSub.InternetSecurityMode = AuthenticationMethod.BasicAuthentication;
                //mergePullSub.InternetLogin = username;
                //mergePullSub.InternetPassword = password;
                mergePullSub.InternetLogin = internetLogin;
                mergePullSub.InternetPassword = internetPassword;

                // Create the subscription database using SMO if it does not exist.
                subServer = new Server(subscriberConn);

                replDatabase = new ReplicationDatabase(
                    mergePullSub.DatabaseName, subscriberConn);
                newDatabase = subServer.Databases[replDatabase.Name];

                // Create the subscription database.
                if (subServer.Databases.Contains(replDatabase.Name) == false)
                {
                    currentStatusTextBox.Text += statusCreateDatabase
                        + Environment.NewLine;
                    Application.DoEvents();
                    newDatabase = new Database(subServer, replDatabase.Name);
                    newDatabase.Create();
                }

                replDatabase.Load();
                replDatabase.EnabledMergePublishing = false;
                replDatabase.CommitPropertyChanges();

                // This is needed so that we can store Web synchronization 
                // information in the MSsubscription_properties table and access this 
                // information using the MergePullSubscription class. For a SQL Server 2005 
                // Subscriber an agent job will be created. For a SQL Server 2005 Express Edition
                // Subscriber, only the meta data will be created because this edition does not
                // support SQL Server Agent.
                mergePullSub.CreateSyncAgentByDefault = true;

                // Set the process security which is required for the agent job.
                mergePullSub.SynchronizationAgentProcessSecurity.Login = username;
                mergePullSub.SynchronizationAgentProcessSecurity.Password = password;

                // Set the HostName property.
                mergePullSub.HostName = subscriberHostName;

                // 调用 远程接口注册该订阅
                /*DBCenterWebService service = new DBCenterWebService();
                SubscriptionInfo info = new SubscriptionInfo();
                info.subscriberName = mergePullSub.Name;
                info.subscriptionDbName = mergePullSub.DatabaseName;
                service.CreateSubscriptionRequest(info);*/

                //if (!mergePub.SnapshotAvailable)
                //{
                //    throw new ApplicationException(
                //        Properties.Resources.ExceptionSalesDataNotAvailable
                //        + Environment.NewLine
                //        + Properties.Resources.ExceptionContactTechSupport);
                //}

                // Define the handler for inserts and updates at the Subscriber. 
                Subscriber = new ReplicationServer(subscriberConn);
                insertUpdateHandler = new BusinessLogicHandler();
                insertUpdateHandler.FriendlyName = handlerFriendlyName;
                insertUpdateHandler.DotNetAssemblyName = "BusinessLogic.dll";
                insertUpdateHandler.DotNetClassName = "Microsoft.Samples.SqlServer.CustomBusinessLogicHandler";
                insertUpdateHandler.IsDotNetAssembly = true;

                try
                {
                    // Create the pull subscription.
                    currentStatusTextBox.Text += statusCreateSubscription
                        + Environment.NewLine;
                    Application.DoEvents();
                    mergePullSub.Create();

                    mergePullSub.Refresh();

                    // Get the Merge Agent for synchronous execution.
                    syncAgent = mergePullSub.SynchronizationAgent;

                    // We have to set these because of an RMO bug.
                    // Remove for RTM.
                    syncAgent.DistributorSecurityMode = SecurityMode.Integrated;
                    syncAgent.PublisherSecurityMode = SecurityMode.Integrated;
                    syncAgent.SubscriberSecurityMode = SecurityMode.Integrated;

					// Generate a troubleshooting log file.
					syncAgent.OutputVerboseLevel = outputLevel;
					syncAgent.Output = outputLogFile;

                    // Define the event handler.
                    syncAgent.Status
                        += new AgentCore.StatusEventHandler(Sync_Status);

                    currentStatusTextBox.Text += statusInitialize
                        + Environment.NewLine;
                    Application.DoEvents();

                    // Start the Merge Agent synchronously to apply the initial snapshot.
                    syncAgent.Synchronize();

                    // Make sure that the initialization was successful.
                    mergePullSub.Refresh();
                    if (mergePullSub.LastAgentStatus
                        != ReplicationStatus.Succeeded)
                    {
                        throw new SubscriptionInitializationException(
                            Properties.Resources.ExceptionSubscriptionNotSync);
                    }
					currentStatusTextBox.Text += statusSuccess.ToString()
						+ Environment.NewLine;
					statusProgressBar.Value = 100;
                }

                catch (Exception ex)
                {
					currentStatusTextBox.Text += statusFail.ToString()
						+ Environment.NewLine;
					statusProgressBar.Value = 0;

                    // If an exception occurs, undo subscription registration at both 
                    // the Publisher and Subscriber and remove the handler registration.
                    mergePullSub.Remove();
                    
                    if (isRegistered)
                    {
                        Subscriber.UnregisterBusinessLogicHandler(insertUpdateHandler);
                        isRegistered = false;
                    }

                    throw new SubscriptionCreationException(
                        Properties.Resources.ExceptionSubscriptionNotCreated,
                        ex);
                }

                finally
                {
                    closeButton.Enabled = true;
                    subscriberConn.Disconnect();
                    //publisherConn.Disconnect();
                }
            }
            else
            {
                // If we can't create the subscription, close the application.
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionSubscriptionNotCreated);
                emb.Buttons = ExceptionMessageBoxButtons.RetryCancel;
                DialogResult drRetry = emb.Show(this);

                if (drRetry == DialogResult.Retry)
                {
                    this.CreateSubscription();
                }
                else
                {
                    Application.Exit();
                }
            }
        }

        private void CloseButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Synchronize_Load(object sender, EventArgs e)
        {
            closeButton.Enabled = false;
        }
    }

    /// <summary>
    /// Define some custom exceptions.
    /// </summary>
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1058:TypesShouldNotExtendCertainBaseTypes"), Serializable]
    public class SubscriptionCreationException : ApplicationException
    {
        public SubscriptionCreationException()
        {
        }

        public SubscriptionCreationException(string message)
            : base(message)
        {
        }

        public SubscriptionCreationException(string message, Exception inner)
            : base(message, inner)
        {
        }

        protected SubscriptionCreationException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
        }
    }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1058:TypesShouldNotExtendCertainBaseTypes"), Serializable]
    public class SubscriptionInitializationException : ApplicationException
    {
        public SubscriptionInitializationException()
        {
        }

        public SubscriptionInitializationException(string message)
            : base(message)
        {
        }

        public SubscriptionInitializationException(string message, Exception inner)
            : base(message, inner)
        {
        }

        protected SubscriptionInitializationException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
        }
    }
}
