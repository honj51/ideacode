using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.Management.Smo;

namespace DBSiteAdmin
{
    public partial class Form1 : Form
    {
        public const string PublisherInstance = "WWW-0AE597D47F1";
        public const string SubscriberInstance = "RD02";
        public const string WinLogin = @"rd02\bob";
        public const string WinPassword = "123";

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                textBox1.AppendText("开始创建订阅");
                
                CreateSubscription();
                label1.Text = "创建订阅完成";
                textBox1.AppendText("创建订阅结束");
            }
            catch (Exception ex)
            {
                label1.Text = "创建订阅失败";
                textBox1.AppendText(ex.Message);
            }
        }

        public void CreateSubscription()
        {
            // The publication must support anonymous Subscribers, pull 
            // subscriptions, and Web synchronization.
            // Define the Publisher, publication, and databases.
            string publicationName = "HdHouse-Pub";
            string publisherName = PublisherInstance;
            string subscriberName = SubscriberInstance;
            string subscriptionDbName = "HdHouseReplica";
            string publicationDbName = "HdHouse";
            string hostname = @"Rd02";
            string webSyncUrl = "https://" + PublisherInstance + "/hdhouse-dbpub/replisapi.dll";

            //Create the Subscriber connection.
            ServerConnection conn = new ServerConnection(subscriberName);

            // Create the objects that we need.
            MergePullSubscription subscription;

            try
            {
                // Connect to the Subscriber.
                conn.Connect();

                // Define the pull subscription.
                subscription = new MergePullSubscription();
                subscription.ConnectionContext = conn;
                subscription.PublisherName = publisherName;
                subscription.PublicationName = publicationName;
                subscription.PublicationDBName = publicationDbName;
                subscription.DatabaseName = subscriptionDbName;
                subscription.HostName = hostname;

                // Specify an anonymous Subscriber type since we can't 
                // register at the Publisher with a direct connection.
                subscription.SubscriberType = MergeSubscriberType.Anonymous;

                // Specify the Windows login credentials for the Merge Agent job.
                subscription.SynchronizationAgentProcessSecurity.Login = WinLogin;
                subscription.SynchronizationAgentProcessSecurity.Password = WinPassword;

                // Enable Web synchronization.
                subscription.UseWebSynchronization = true;
                subscription.InternetUrl = webSyncUrl;

                // Specify the same Windows credentials to use when connecting to the
                // Web server using HTTPS Basic Authentication.
                subscription.InternetSecurityMode = AuthenticationMethod.BasicAuthentication;
                subscription.InternetLogin = WinLogin;
                subscription.InternetPassword = WinPassword;

                // Create the subscription database using SMO if it does not exist.
                ReplicationDatabase replDatabase;
                Database newDatabase;
                Server subServer = new Server(conn);

                replDatabase = new ReplicationDatabase(
                    subscription.DatabaseName, conn);
                newDatabase = subServer.Databases[replDatabase.Name];

                // Create the subscription database.
                if (subServer.Databases.Contains(replDatabase.Name) == false)
                {
                    //currentStatusTextBox.Text += statusCreateDatabase
                    //    + Environment.NewLine;
                    //Application.DoEvents();
                    newDatabase = new Database(subServer, replDatabase.Name);
                    newDatabase.Create();
                }

                replDatabase.Load();
                replDatabase.EnabledMergePublishing = false;
                replDatabase.CommitPropertyChanges();


                // Ensure that we create a job for this subscription.
                subscription.CreateSyncAgentByDefault = true;

                // Create the pull subscription at the Subscriber.
                subscription.Create();

                // 订阅创建成功，进行初始化同步

            }
            catch (Exception ex)
            {
                // Implement the appropriate error handling here.
                throw new ApplicationException(String.Format(
                    "The subscription to {0} could not be created.", publicationName), ex);
            }
            finally
            {
                conn.Disconnect();
            }
        }
        /*
        public void InitSync()
        {
            // Define the handler for inserts and updates at the Subscriber. 
            ReplicationServer Subscriber = new ReplicationServer(subscriberConn);
            //insertUpdateHandler = new BusinessLogicHandler();
            //insertUpdateHandler.FriendlyName = handlerFriendlyName;
            //insertUpdateHandler.DotNetAssemblyName = "BusinessLogic.dll";
            //insertUpdateHandler.DotNetClassName = "Microsoft.Samples.SqlServer.CustomBusinessLogicHandler";
            //insertUpdateHandler.IsDotNetAssembly = true;

            try
            {
                // Create the pull subscription.
                //currentStatusTextBox.Text += statusCreateSubscription
                //    + Environment.NewLine;
                //Application.DoEvents();
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
                mergePub.RemovePullSubscription(subscriberServer,
                    subscriptionDatabase);
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
                publisherConn.Disconnect();
            }
        }
         * */
    }
}
