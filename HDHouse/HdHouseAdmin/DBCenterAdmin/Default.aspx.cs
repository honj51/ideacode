using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.Management.Smo;
using System.Diagnostics;
using System.Web.Configuration;
using System.Collections;
public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (! IsPostBack)
        {
            GetData();
            TextBox3.ReadOnly = true;
            SetReadOnly(true);
        } 
      
    }
    public  void SetReadOnly(bool b)
    {
        TextBox4.ReadOnly = b;
        TextBox5.ReadOnly = b;
        TextBox6.ReadOnly = b;
        TextBox7.ReadOnly = b;
        TextBox8.ReadOnly = b;
    }
    public void SetData()
    {
        SMO.winLogin = TextBox6.Text;
        SMO.winPassword = TextBox7.Text;
        SMO.publicationDatabase = TextBox5.Text;
        SMO.publicationName = TextBox4.Text;
        SMO.publisherName = TextBox8.Text;
    }
    public  void GetData()
    {
        TextBox6.Text = SMO.winLogin;
        TextBox7.Text = SMO.winPassword;
        TextBox5.Text = SMO.publicationDatabase;
        TextBox4.Text = SMO.publicationName;
        TextBox8.Text = SMO.publisherName;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SMO.publicationDatabase = TextBox5.Text;
            SMO s = new SMO();
            if (s.IsDBExsit())
            {
                Label1.ForeColor = Color.Green;
                Label1.Text = "数据库已存在";
                TextBox3.Text += "数据库已存在 \r\n";
            }
            else
            {
                Label1.ForeColor = Color.Brown;
                Label1.Text = "数据库不存在";
                TextBox3.Text += "数据库不存在 \r\n";
            }

        }
        catch (Exception ex)
        {
            Label1.ForeColor = Color.Brown;
            Label1.Text = "操作异常: " + ex.Message;
            TextBox3.Text += "操作异常: " + ex.Message + " \r\n";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SMO.publicationDatabase = TextBox5.Text;
            SMO s = new SMO();
            s.CreatDB(Server.MapPath("~/App_Data"));
            Label1.ForeColor = Color.Green;
            Label1.Text = "操作成功";
            TextBox3.Text += "操作成功  \r\n";
        }
        catch (Exception ex)
        {
            Label1.ForeColor = Color.Brown;
            Label1.Text = "操作异常: " + ex.Message;
            TextBox3.Text += "操作异常: " + ex.Message +" \r\n";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            SMO.publicationDatabase = TextBox5.Text;
            SMO s = new SMO();
            s.DeleteDB();
            Label1.ForeColor = Color.Green;
            Label1.Text = "操作成功";
            TextBox3.Text += "操作成功  \r\n";
        }
        catch (Exception ex)
        {
            Label1.ForeColor = Color.Brown;
            TextBox3.Text += "操作异常: " + ex.Message +" \r\n";
        }
    }
    //创建发布
    protected void Button4_Click(object sender, EventArgs e)
    {
        string publisherName = SMO.publisherName;// "rd01";//发布者名
        string publicationName = SMO.publicationName;// "HdHousePub";//发布名
        string publicationDbName = SMO.publicationDatabase;// "HdHouse";//发布的数据库名 
        //创建连接
        ServerConnection conn = new ServerConnection(publisherName);
        ReplicationDatabase replicationDatabase = new ReplicationDatabase();
        replicationDatabase.Name = publicationDbName;
        replicationDatabase.ConnectionContext = conn;
        if (!replicationDatabase.LoadProperties())
        {
            Label5.Text = "请确定发布数据库" + publicationDbName + "已存在";
            TextBox3.Text += "请确定发布数据库" + publicationDbName + "已存在  \r\n";
            return;
        }

        if (!replicationDatabase.EnabledMergePublishing)
        {
            replicationDatabase.EnabledMergePublishing = true;
            replicationDatabase.CommitPropertyChanges();
        }

        MergePublication mergePub = new MergePublication();
        mergePub.ConnectionContext = conn;
        mergePub.DatabaseName = publicationDbName;
        mergePub.Name = publicationName;
        //mergePub.SnapshotGenerationAgentProcessSecurity 
        //mergePub.Attributes |= PublicationAttributes.;
        mergePub.Create();
        mergePub.CreateSnapshotAgent();


    }
    //配置发布和分发服务器
    protected void Button5_Click(object sender, EventArgs e)
    {

        string distributionDbName = "distribution";
        string publisherName =SMO.publisherName;//"rd01";发布者服务器名
        string publicationDbName = SMO.publicationDatabase; //"HdHouse";发布的数据库名 

        DistributionDatabase distributionDb;
        ReplicationServer distributor;
        DistributionPublisher publisher;
        ReplicationDatabase publicationDb;

        // Create a connection to the server using Windows Authentication.
        ServerConnection conn = new ServerConnection(publisherName);

        try
        {
            // Connect to the server acting as the Distributor 
            // and local Publisher.
            conn.Connect();

            // Define the distribution database at the Distributor,
            // but do not create it now.
            distributionDb = new DistributionDatabase(distributionDbName, conn);
            distributionDb.MaxDistributionRetention = 96;
            distributionDb.HistoryRetention = 120;

            // Set the Distributor properties and install the Distributor.
            // This also creates the specified distribution database.
            distributor = new ReplicationServer(conn);
            distributor.InstallDistributor((string)null, distributionDb);

            // Set the Publisher properties and install the Publisher.
            publisher = new DistributionPublisher(publisherName, conn);
            publisher.DistributionDatabase = distributionDb.Name;
            publisher.WorkingDirectory = @"\\" + publisherName + @"\repldata";//用于访问快照文件的共享目录。
            publisher.PublisherSecurity.WindowsAuthentication = true;
            publisher.Create();

            // Enable AdventureWorks as a publication database.
            publicationDb = new ReplicationDatabase(publicationDbName, conn);

            publicationDb.EnabledTransPublishing = true;
            publicationDb.EnabledMergePublishing = true;
        }
        catch (Exception ex)
        {
            // Implement appropriate error handling here.
            throw new ApplicationException("An error occured when installing distribution and publishing.", ex);
            TextBox3.Text += "An error occured when installing distribution and publishing." + ex + " \r\n";
        }
        finally
        {
            conn.Disconnect();
        }
    }
    //创建发布以允许使用 Web 同步
    protected void Button6_Click(object sender, EventArgs e)
    {
        // Set the Publisher, publication database, and publication names.
        string publisherName = SMO.publisherName;// TextBox8.Text; //"rd01";发布者服务器名
        string publicationName = SMO.publicationName;// TextBox4.Text; //"HdHousePub";发布名
        string publicationDbName = SMO.publicationDatabase;// TextBox5.Text;//"HdHouse";发布的数据库名 
        string winLogin = SMO.winLogin;//TextBox6.Text;//"y";系统帐户
        string winPassword = SMO.winPassword; //TextBox7.Text;//"19870312";//该系统帐户密码！

        ReplicationDatabase publicationDb;
        MergePublication publication;

        // Create a connection to the Publisher.
        ServerConnection conn = new ServerConnection(publisherName);

        try
        {
            // Connect to the Publisher.
            conn.Connect();

            // Enable the database for merge publication.                
            publicationDb = new ReplicationDatabase(publicationDbName, conn);
            if (publicationDb.LoadProperties())
            {
                if (!publicationDb.EnabledMergePublishing)
                {
                    publicationDb.EnabledMergePublishing = true;
                }
            }
            else
            {
                // Do something here if the database does not exist. 
                throw new ApplicationException(String.Format(
                    "The {0} database does not exist on {1}.",
                    publicationDb, publisherName));
            }

            // Set the required properties for the merge publication.
            publication = new MergePublication();
            publication.ConnectionContext = conn;
            publication.Name = publicationName;
            publication.DatabaseName = publicationDbName;

            // Enable Web synchronization, if not already enabled.
            if ((publication.Attributes & PublicationAttributes.AllowWebSynchronization) == 0)
            {
                publication.Attributes |= PublicationAttributes.AllowWebSynchronization;
            }

            // Enable pull subscriptions, if not already enabled.
            if ((publication.Attributes & PublicationAttributes.AllowPull) == 0)
            {
                publication.Attributes |= PublicationAttributes.AllowPull;
            }
            
            // Enable Subscriber requested snapshot generation. 
            publication.Attributes |= PublicationAttributes.AllowSubscriberInitiatedSnapshot;

            // Enable anonymous access for Subscribers that cannot make a direct connetion 
            // to the Publisher. 
            publication.Attributes |= PublicationAttributes.AllowAnonymous;

            // Specify the Windows account under which the Snapshot Agent job runs.
            // This account will be used for the local connection to the 
            // Distributor and all agent connections that use Windows Authentication.
            publication.SnapshotGenerationAgentProcessSecurity.Login = winLogin;
            publication.SnapshotGenerationAgentProcessSecurity.Password = winPassword;

            // Explicitly set the security mode for the Publisher connection
            // Windows Authentication (the default).
            publication.SnapshotGenerationAgentPublisherSecurity.WindowsAuthentication = true;

            if (!publication.IsExistingObject)
            {
                // Create the merge publication and the Snapshot Agent job.
                publication.Create();
                publication.CreateSnapshotAgent();
            }
            else
            {
                //throw new ApplicationException(String.Format(
                //    "The {0} publication already exists.", publicationName));
                TextBox3.Text += String.Format("发布 {0} 已经存在  \r\n .", publicationName);
            }
        }

        catch (Exception ex)
        {
            // Implement custom application error handling here.
            throw new ApplicationException(String.Format(
                "The publication {0} could not be created.", publicationName), ex);
        }
        finally
        {
            conn.Disconnect();
        }
    }
    //添加系统本地用户
    protected void Button7_Click(object sender, EventArgs e)
    { 
        ArrayList li = new ArrayList();
        li.Add("net   user   " + TextBox1.Text + "   " + TextBox2.Text + "   /add");
        li.Add("net localgroup administrators " + TextBox1.Text + " /add");
        SMO.winLogin = TextBox1.Text;
        SMO.winPassword= TextBox2.Text;
        TextBox3.Text += ExecuteCmd(li) + " \r\n";
        GetData();
    }
    //删除系统本地用户
    protected void Button12_Click(object sender, EventArgs e)
    {
        
        ArrayList li = new ArrayList();
        li.Add("net   user   " + TextBox1.Text + "   /del");
        SMO.winLogin ="y";
        SMO.winPassword ="19870312";
        TextBox3.Text += ExecuteCmd(li) + " \r\n";
        GetData();
    }
    /// <summary>
    /// 执行系统CMD命令
    /// </summary>
    /// <param name="cmdList">命令集合</param>
    /// <returns>//输出命令日志</returns>
    public static string  ExecuteCmd(ArrayList cmdList)
    {
        Process p = new Process();
        p.StartInfo.FileName = "cmd.exe";
        //   这里是关键点,不用Shell启动/重定向输入/重定向输出/不显示窗口   
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.RedirectStandardInput = true;
        p.StartInfo.RedirectStandardOutput = true;
        p.StartInfo.CreateNoWindow = true;

        p.Start();
        foreach (string item in cmdList)
        {
            p.StandardInput.WriteLine(item);
        }
        p.StandardInput.WriteLine("exit");//退出
        p.WaitForExit(60000);
        string s = p.StandardOutput.ReadToEnd();//   得到cmd.exe的输出   
        p.Close();
        return s;//输出命令日志
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        System.Configuration.Configuration config;
        ConfigurationSection configSection;
        config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
        configSection = config.GetSection("appSettings");
        if (configSection != null)
        {
            if (!(configSection.SectionInformation.IsLocked))
            {
                configSection.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");
                config.Save();
                TextBox3.Text += "配置文件加密成功";
            }
        }
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        System.Configuration.Configuration config;

        ConfigurationSection configSection;

        config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);

        configSection = config.GetSection("appSettings");

        if (configSection != null)
        {

            if (!(configSection.SectionInformation.IsLocked))
            {
                configSection.SectionInformation.UnprotectSection(); config.Save();
                TextBox3.Text += "配置文件解密成功  \r\n";
            }
        }
    }
    //开起代理服务器
    protected void Button10_Click(object sender, EventArgs e)
    {
        ArrayList li = new ArrayList();
        li.Add("net start  \"SQL Server Agent (MSSQLSERVER)\"");
        TextBox3.Text += ExecuteCmd(li) + " \r\n";
    }
    //关闭代理服务器 
    protected void Button11_Click(object sender, EventArgs e)
    {
        ArrayList li = new ArrayList();
        li.Add("net stop  \"SQL Server Agent (MSSQLSERVER)\"");
        TextBox3.Text += ExecuteCmd(li) + " \r\n";
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        SMO smo = new SMO();
        smo.RegisterSubscriptionOnPublisher(TextBox9.Text,TextBox10.Text);
    }
    //设置
    protected void Button14_Click(object sender, EventArgs e)
    {
        if (Button14.Text == "设置")
        {
            SetReadOnly(false);
            GetData();
            Button14.Text = "应用";
        }
        else if (Button14.Text == "应用")
        {
            SetReadOnly(true);
            SetData();
            Button14.Text = "设置";
            GetData();
        }
        else
        {
            Button14.Text = "错误";
        }
    }
    //删除
    protected void Button15_Click(object sender, EventArgs e)
    {
        ServerConnection sconn = new ServerConnection(SMO.publisherName);
        try
        {
            MergePublication mpc = new MergePublication();
            mpc.Name = SMO.publicationName;
            mpc.DatabaseName = SMO.publicationDatabase;
            mpc.ConnectionContext = sconn;
            if (mpc.IsExistingObject)
            {
                mpc.Remove();
            }
            else
            {
                TextBox3.Text = "发布" + SMO.publicationName + "的定义不正确，或者发布不存在。\r\n";
            }
            ReplicationDatabase rld = new ReplicationDatabase();
            rld.ConnectionContext = sconn;
            rld.Name = SMO.publicationName;
            if (rld.LoadProperties())
            {
                rld.EnabledMergePublishing = false;
                rld.CommitPropertyChanges();
            }
            else
            {
                TextBox3.Text = "请验证" + SMO.publicationDatabase + "数据库是否存在。\r\n";
            }
        }
        catch (Exception ex)
        {
            throw new ApplicationException(String.Format(
                "The publication {0} 无法删除.", SMO.publicationName), ex);
        }
        finally
        {
            sconn.Disconnect();
        }        
    }
}
