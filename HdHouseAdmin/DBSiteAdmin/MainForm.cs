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
        private FormWindowState saveWindowState = FormWindowState.Normal;

        private enum ConnectedState
        {
            Connected,
            Disconnected
        }

        public MainForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            try
            {
                //currentStatusTextBox.AppendText("开始创建订阅");

                CreateSubscription();
                // label1.Text = "创建订阅完成";

                //currentStatusTextBox.AppendText("\r\n\r\n创建订阅结束");

            }
            catch (Exception ex)
            {
                //  label1.Text = "创建订阅失败";

                //currentStatusTextBox.AppendText("\r\n\r\n"+ex.Message+"\r\n\r\n");
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
            string hostname = "RD03";
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
                loadLastAgentSessionSummary();
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
                syncWhenConnectedStatus.Visible = false;

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

        private void mnuSyncWhenConnected_Click(object sender, EventArgs e)
        {
            // Toggle the menu check box.
            if (mnuSyncWhenConnected.Checked)
            {
                mnuSyncWhenConnected.Checked = false;
                syncTimer.Enabled = false;
                syncWhenConnectedStrip.Visible = false;
                syncWhenConnectedText.Text = "";
            }
            else
            {
                mnuSyncWhenConnected.Checked = true;
                syncTimer.Enabled = true;
                syncTimer.Interval = 1000 * Convert.ToDouble(
                    Properties.Settings.Default.SyncWhenConnectedInterval,
                    CultureInfo.InvariantCulture);
                syncWhenConnectedStrip.Visible = true;

                // Raise timer event immediately.
                syncTimer_Elapsed(null, null);
            }

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
                loadLastAgentSessionSummary();
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
                loadLastAgentSessionSummary();
                // Enable the current form
                this.Enabled = true;
            }
        }

        private void 查看同步历史HToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //SubscriberMonitor subMonitor = new SubscriberMonitor();
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
            MyClass c = new MyClass();
            c.HostName = Properties.Settings.Default.HostName;
            c.Publication = Properties.Settings.Default.Publication;
            c.PublicationDatabase = Properties.Settings.Default.PublicationDatabase;
            c.Publisher = Properties.Settings.Default.Publisher;
            c.Subscriber = Properties.Settings.Default.Subscriber;
            c.SubscriptionDatabase = Properties.Settings.Default.SubscriptionDatabase;
            c.WebSynchronizationUrl = Properties.Settings.Default.WebSynchronizationUrl;
            c.UserName = Properties.Settings.Default.InternetLogin;
            c.UserPassword = Properties.Settings.Default.InternetPassword;
            propertyGrid1.SelectedObject = c;
            loadLastAgentSessionSummary();

            if (Properties.Settings.Default.SyncWhenConnected)
            {
                mnuSyncWhenConnected.Checked = true;
                syncTimer.Enabled = true;
                syncTimer.Interval = 1000 * Convert.ToDouble(
                    Properties.Settings.Default.SyncWhenConnectedInterval,
                    CultureInfo.InvariantCulture);
                syncWhenConnectedStrip.Visible = true;
            }
        }

        private void loadLastAgentSessionSummary()
        {
            // Create the connection and monitor objects. 
            ServerConnection conn = new ServerConnection(Properties.Settings.Default.Subscriber);
            MergeSubscriberMonitor msmMonitor = new MergeSubscriberMonitor(conn);

            // Set subscription properties.
            msmMonitor.SubscriberDB = Properties.Settings.Default.SubscriptionDatabase;
            msmMonitor.Publisher = Properties.Settings.Default.Publisher;
            msmMonitor.PublisherDB = Properties.Settings.Default.PublicationDatabase;
            msmMonitor.Publication = Properties.Settings.Default.Publication;
            MergeSessionSummary s = msmMonitor.GetLastSessionSummary();
            if (s == null) return;
            textBox1.Text = s.StartTime.ToString();
            textBox2.Text = s.LastMessage;
            switch (s.Status)
            {
                case MergeSessionStatus.Failed:
                    toolTip1.SetToolTip(pictureBox1, "失败");
                    pictureBox1.BackgroundImage = Properties.Resources.warning_48;
                    break;
                case MergeSessionStatus.Interrupted:
                    toolTip1.SetToolTip(pictureBox1, "中断");
                    pictureBox1.BackgroundImage = Properties.Resources.warning_48;
                    break;
                case MergeSessionStatus.NotStarted:
                    toolTip1.SetToolTip(pictureBox1, "未启动");
                    pictureBox1.BackgroundImage = Properties.Resources.warning_48;
                    break;
                case MergeSessionStatus.Retry:
                    toolTip1.SetToolTip(pictureBox1, "重试");
                    pictureBox1.BackgroundImage = Properties.Resources.warning_48;
                    break;
                case MergeSessionStatus.Idle:
                    toolTip1.SetToolTip(pictureBox1, "空闲");
                    pictureBox1.BackgroundImage = Properties.Resources.accepted_48;
                    break;
                case MergeSessionStatus.Running:
                    toolTip1.SetToolTip(pictureBox1, "运行中");
                    pictureBox1.BackgroundImage = Properties.Resources.accepted_48;
                    break;
                case MergeSessionStatus.Starting:
                    toolTip1.SetToolTip(pictureBox1, "正在启动");
                    pictureBox1.BackgroundImage = Properties.Resources.accepted_48;
                    break;
                case MergeSessionStatus.Succeeded:
                    toolTip1.SetToolTip(pictureBox1, "成功");
                    pictureBox1.BackgroundImage = Properties.Resources.accepted_48;
                    break;
                default:
                    break;
            }

        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Properties.Settings.Default.Save();
        }

        private void 关于我们AToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AboutBoxSalesOrders dlgAbout;

            dlgAbout = new AboutBoxSalesOrders();
            dlgAbout.ShowDialog();
            dlgAbout.Dispose();
        }
        private void LoadSetting()
        {
        }

        private void showSyncDialog()
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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
        private void syncTimer_Elapsed(object sender, ElapsedEventArgs e)
        {
            Synchronize syncSub;

            // Start a background synchronization if an Internet connection is
            // available and data is not being edited.
            if (GetConnectionState() == ConnectedState.Connected)
            {
                syncWhenConnectedIcon.Image = Properties.Resources.connected;

                // Instantiate the replication code without the Form.
                syncSub = new Synchronize();


                syncWhenConnectedText.Text
                   = Properties.Resources.StatusSyncStarting;

                syncWhenConnectedIcon.Image = Properties.Resources.synchronizing;

                try
                {
                    syncSub.Status += new SyncWhenConnectedStatus(syncSub_Status);
                    syncSub.SynchronizeSubscriptionFull();


                    syncWhenConnectedText.Text
                        = Properties.Resources.StatusSyncComplete;
                }
                catch
                {
                    syncWhenConnectedText.Text
                        = Properties.Resources.StatusSyncFailed;
                }
                finally
                {
                    syncWhenConnectedIcon.Image = Properties.Resources.connected;
                    loadLastAgentSessionSummary();
                    // Reload data from database
                }
            }
            else
            {
                syncWhenConnectedIcon.Image = Properties.Resources.disconnected;
                notifyIcon.Text = "网络连接断开";
            }
        }
        void syncSub_Status(object sender, StatusEventArgs e)
        {
            // Update the Synchronization Status form.
            syncWhenConnectedStatus.Value = (int)e.PercentCompleted;

            switch (e.MessageStatus)
            {
                case MessageStatus.Start:
                    syncWhenConnectedStatus.Visible = true;
                    syncWhenConnectedText.Text = Properties.Resources.StatusSyncStarting;
                    break;
                case MessageStatus.InProgress:
                    syncWhenConnectedText.Text = Properties.Resources.StatusSyncInProgress;
                    break;
                case MessageStatus.Succeed:
                    syncWhenConnectedText.Text = Properties.Resources.StatusSyncComplete;
                    syncWhenConnectedStatus.Visible = false;
                    break;
                case MessageStatus.Fail:
                    syncWhenConnectedText.Text = Properties.Resources.StatusSyncFailed;
                    syncWhenConnectedStatus.Visible = false;
                    break;
                default:
                    syncWhenConnectedText.Text = Properties.Resources.StatusSyncComplete;
                    syncWhenConnectedStatus.Visible = false;
                    break;
            }
            Application.DoEvents();
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
        private ConnectedState GetConnectionState()
        {
            SelectQuery wmiQuery;
            ManagementObjectSearcher searcher;
            bool isConnected;

            try
            {
                // Query the WMI provider to determine if we are connected.
                wmiQuery = new SelectQuery("SELECT * FROM Win32_NetworkAdapter");
                searcher = new ManagementObjectSearcher(wmiQuery);

                // Assume that we are not connected.
                isConnected = false;

                // Check the results for a NetConnectionStatus of 2 (connected).
                foreach (ManagementObject result in searcher.Get())
                {
                    if (Convert.ToInt32(result["NetConnectionStatus"],
                        System.Globalization.CultureInfo.InvariantCulture) == 2)
                    {
                        isConnected = true;
                    }
                }

                if (isConnected)
                {
                    return ConnectedState.Connected;
                }
                else
                {
                    return ConnectedState.Disconnected;
                }
            }
            catch (Exception ex)
            {
                ExceptionMessageBox emb = new ExceptionMessageBox(ex);
                emb.Show(this);
                return ConnectedState.Disconnected;
            }
        }

        private void configToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DBConnectForm f = new DBConnectForm();
            if (f.ShowDialog() == DialogResult.OK)
            {
                ConnectDialog d = new ConnectDialog();
                if (d.ShowDialog() == DialogResult.OK)
                {
                    // 1. 保存配置
                    Properties.Settings.Default.Subscriber = f.Connection.ServerInstance;
                    if (!f.Connection.LoginSecure)
                    {
                        Properties.Settings.Default.SqlLoginMode = true;
                        Properties.Settings.Default.SqlUserName = f.Connection.Login;
                        Properties.Settings.Default.SqlUserPassword = f.Connection.Password;
                    }

                    Properties.Settings.Default.Publisher = d.Publisher;
                    Properties.Settings.Default.Publication = d.Publication;
                    Properties.Settings.Default.PublicationDatabase = d.PublisherDB;
                    Properties.Settings.Default.WebSynchronizationUrl = d.WebSyncUrl;
                    Properties.Settings.Default.InternetLogin = d.InternetUserName;
                    Properties.Settings.Default.InternetPassword = d.InternetUserPassword;

                    Properties.Settings.Default.Save();
                    // 2. 
                    MessageBox.Show("配置已经更改，需要重新同步数据！", "同步数据", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    showSyncDialog();

                }
            }
        }

        class MyClass
        {  
            [CategoryAttribute("1.发布标识"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("产生发布的服务器实例")]
            public string Publisher
            {
                get { return publisher; }
                set { publisher = value; }
            }

            [CategoryAttribute("1.发布标识"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("发布名称")]
            public string Publication
            {
                get { return publication; }
                set { publication = value; }
            }

            [CategoryAttribute("1.发布标识"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("产生发布的数据库")]
            public string PublicationDatabase
            {
                get { return publicationDatabase; }
                set { publicationDatabase = value; }
            }

            [CategoryAttribute("2.订阅标识"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("接收订阅的服务器实例")]
            public string Subscriber
            {
                get { return subscriber; }
                set { subscriber = value; }
            }

            [CategoryAttribute("2.订阅标识"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("接收订阅的数据库")]
            public string SubscriptionDatabase
            {
                get { return subscriptionDatabase; }
                set { subscriptionDatabase = value; }
            }

            [CategoryAttribute("3.同步"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("同步地址")]
            public string WebSynchronizationUrl
            {
                get { return webSynchronizationUrl; }
                set { webSynchronizationUrl = value; }
            }

            [CategoryAttribute("3.同步"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("用户名")]
            public string UserName
            {
                get { return userName; }
                set { userName = value; }
            }

            [CategoryAttribute("3.同步"),
            ReadOnlyAttribute(true),
            DescriptionAttribute("密码")]
            public string UserPassword
            {
                get { return "********"; }
                set { userPassword = value; }
            }


            private string publication;
            private string subscriber;
            private string userPassword;
            private string userName;

            private string publisher;

            
            private string publicationDatabase;

            private string subscriptionDatabase;

         
            private string hostName;

            [Browsable(false)]
            public string HostName
            {
                get { return hostName; }
                set { hostName = value; }
            }
            private string webSynchronizationUrl;

           
        }

        private void showMainForm(bool show)
        {
            this.Visible = show;
            if (show)
            {
                this.WindowState = saveWindowState;
                this.Activate();
            }
            else
            {
                saveWindowState = this.WindowState;
            }
        }

        private void httpsDiagToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(Properties.Settings.Default.WebSynchronizationUrl + "?diag");
        }

        private void hostResolveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"notepad", @"C:\WINDOWS\system32\drivers\etc\hosts");
        }

        private void MainForm_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
                showMainForm(false);
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            showMainForm(!this.Visible);
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("确认退出程序吗？", "确认退出", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {                
                this.Close();
            }
        }
    }
}
