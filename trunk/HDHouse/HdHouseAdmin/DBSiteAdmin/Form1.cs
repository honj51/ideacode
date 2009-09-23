﻿using System;
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
                currentStatusTextBox.AppendText("开始创建订阅");
                
                CreateSubscription();
                label1.Text = "创建订阅完成";
                currentStatusTextBox.AppendText("创建订阅结束");
            }
            catch (Exception ex)
            {
                label1.Text = "创建订阅失败";
                currentStatusTextBox.AppendText(ex.Message);
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


    }
}
