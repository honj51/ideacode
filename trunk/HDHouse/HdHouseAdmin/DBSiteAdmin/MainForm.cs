using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;
using System.Management;
using System.Timers;
using System.Globalization;
using Microsoft.SqlServer;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.MessageBox;

using System.Diagnostics;
using Microsoft.Samples.SqlServer;

namespace DBSiteAdmin
{
    public partial class MainForm : Form
    {
        public const string PublisherInstance = "WWW-0AE597D47F1";
        public string SubscriberInstance = "RD02";
        public string WinLogin = @"rd03\administrators";
        public string WinPassword = "123";

        public MainForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBox2.Text) || string.IsNullOrEmpty(textBox3.Text) || string.IsNullOrEmpty(textBox4.Text) || string.IsNullOrEmpty(textBox5.Text))
            {
                label1.Text = "数据不能为空";
                label1.ForeColor = Color.Red;
                return;
            }
            SubscriberInstance = textBox2.Text;
            WinLogin = textBox4.Text;
            WinPassword = textBox5.Text;
            try
            {
                currentStatusTextBox.AppendText("开始创建订阅");
                
                CreateSubscription();
                label1.Text = "创建订阅完成";

                currentStatusTextBox.AppendText("\r\n\r\n创建订阅结束");

            }
            catch (Exception ex)
            {
                label1.Text = "创建订阅失败";

                currentStatusTextBox.AppendText("\r\n\r\n"+ex.Message+"\r\n\r\n");
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
            string hostname = textBox3.Text;
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

        private void webToolStripMenuItem_Click(object sender, EventArgs e)
        {
            WebSyncOptions subscriptionWebSync = new WebSyncOptions();
            DialogResult dr = subscriptionWebSync.ShowDialog(this);

            if (dr == DialogResult.OK)
            {
                // If Web synchronization is enabled, disable upload only options.
                if (subscriptionWebSync.WebSynchronizationEnabled)
                {
                    mnuSynchronizeOnlyUploadData.Enabled = false;
                }
                else
                {
                    mnuSynchronizeOnlyUploadData.Enabled = true;
                }
            }

         
        }

        private void 退出EToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void 同步所有数据ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                Synchronize syncSub = new Synchronize();

                // Disable the current form
                this.Enabled = false;

                syncSub.Show(this);

                syncSub.SynchronizeSubscriptionFull();
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex,
                    ExceptionMessageBoxButtons.OK);
                emb.Show(this);
            }
            finally
            {
                // Enable the current form
                this.Enabled = true;
            }
        }

        private void 只上传数据ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                Synchronize syncSub = new Synchronize();

                // Disable the current form
                this.Enabled = false;

                syncSub.Show(this);

                syncSub.SynchronizeSubscriptionUploadOnly();

            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex,
                    ExceptionMessageBoxButtons.OK);
                emb.Show(this);
            }
            finally
            {
                // Enable the current form
                this.Enabled = true;
            }
        }

        private void 连接时同步ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Toggle the menu check box.
            //if (mnuSyncWhenConnected.Checked)
            //{
            //    mnuSyncWhenConnected.Checked = false;
            //    syncTimer.Enabled = false;
            //    syncWhenConnectedStrip.Visible = false;
            //    syncWhenConnectedText.Text = "";
            //}
            //else
            //{
            //    mnuSyncWhenConnected.Checked = true;
            //    syncTimer.Enabled = true;
            //    syncTimer.Interval = 1000 * Convert.ToDouble(
            //        Properties.Settings.Default.SyncWhenConnectedInterval,
            //        CultureInfo.InvariantCulture);
            //    syncWhenConnectedStrip.Visible = true;

            //    // Raise timer event immediately.
            //    syncTimer_Elapsed(null, null);

            //}
          
        }

        private void 重新初始化数据RToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                Synchronize syncSub = new Synchronize();

                // Disable the current form
                this.Enabled = false;

                syncSub.Show(this);

                syncSub.ReinitializeSubscription();

              
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex,
                    ExceptionMessageBoxButtons.OK);
                emb.Show(this);
            }
            finally
            {
                // Enable the current form
                this.Enabled = true;
            }
        }

        private void 上传更新并初始化数据UToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                Synchronize syncSub = new Synchronize();

                // Disable the current form
                this.Enabled = false;

                syncSub.Show(this);

                syncSub.ReinitializeSubscriptionWithUpload();
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex,
                    ExceptionMessageBoxButtons.OK);
                emb.Show(this);
            }
            finally
            {
                // Enable the current form
                this.Enabled = true;
            }
        }

        private void 查看同步历史HToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SubscriberMonitor subMonitor = new SubscriberMonitor(
                Properties.Settings.Default.Subscriber,
                Properties.Settings.Default.Publication,
                (Properties.Settings.Default.Publisher == "localhost"
                    ? Environment.MachineName : Properties.Settings.Default.Publisher),
                Properties.Settings.Default.PublicationDatabase,
                Properties.Settings.Default.SubscriptionDatabase);
            subMonitor.Show(this);
            Application.DoEvents();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            try
            {
                Synchronize syncSub = new Synchronize();

                // Disable the current form
                this.Enabled = false;

                syncSub.Show(this);

                // Check that the subscription exists.
                syncSub.CheckSubscription();

                // Disable upload only if Web synchronization is enabled.
                if (syncSub.UseWebSynchronization)
                {
                    mnuSynchronizeOnlyUploadData.Enabled = false;
                }

            }
            catch (SqlException ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(
                    Properties.Resources.ExceptionVerifySqlServerRunning,
                    Properties.Resources.ExceptionSqlServerError,
                    ExceptionMessageBoxButtons.OK);
                emb.InnerException = ex;
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }
            catch (ApplicationException ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex,
                    ExceptionMessageBoxButtons.OK);
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex,
                    ExceptionMessageBoxButtons.OK);
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }
            catch
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(@"CATASTROPHIC FAILURE!",
                    @"CLOSING APPLICATION");
                emb.Show(this);

                // Shutdown the application because we can't continue.
                Application.Exit();
            }
            finally
            {
                // Enable the current form
                this.Enabled = true;
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
           //Properties.Settings.Default. textBox2.Text;
           // textBox3.Text;
           // textBox4.Text;
           // textBox5.Text;
        }
    }
}
