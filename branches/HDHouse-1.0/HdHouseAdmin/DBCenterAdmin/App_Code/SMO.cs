using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Replication;

/// <summary>
///SMO 的摘要说明
/// </summary>
public class SMO
{
    public static string publicationName = "HdHousePub";//发布名
    public static  string publicationDatabase = "HdHouse";//发布的数据库名 
    public static string winLogin ="y";//系统帐户
    public static string winPassword ="19870312";//该系统帐户密码！    
    public static string publisherName = "rd01";//发布服务器名

	public SMO()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public void CreatDB(string dataFileDir)
    {
        ServerConnection c = new ServerConnection(".", "sa", "hudongsoft");
        Server s = new Server(c);
        //s.AttachDatabase(
        //Database db = new Database(s, DataBaseName);
        //db.Create();
        System.Collections.Specialized.StringCollection sc = new System.Collections.Specialized.StringCollection();
        sc.Add(dataFileDir + @"\HdHouse.mdf");
        sc.Add(dataFileDir + @"\HdHouse_log.ldf");
        s.AttachDatabase(publicationDatabase, sc);
    }

    public void DeleteDB()
    {
        ServerConnection c = new ServerConnection(".", "sa", "hudongsoft");
        Server s = new Server(c);
        if (s.Databases[publicationDatabase] != null)
        {
            s.DetachDatabase(publicationDatabase, false);
        }
    }

    public bool IsDBExsit()
    {
        ServerConnection c = new ServerConnection(".","sa","hudongsoft");
        Server s = new Server(c);
        if(s.Databases[publicationDatabase] == null)
            return false;
        else
            return true;
    }
    /// <summary>
    /// 处理请求的定阅
    /// </summary>
    /// <param name="subscriberServer">定阅者服务器名</param>
    /// <param name="subscriptionDatabase">定阅者本地数据库名</param>
    /// <returns></returns>
    public bool RegisterSubscriptionOnPublisher(string subscriberServer, string subscriptionDatabase)
    {
        //string subscriptionDatabase = "SHdHouse";//定阅者本地数据库名
        //string subscriberServer = "rd01";//定阅者服务器
        Boolean isSubKnown = false;
        ServerConnection con = new ServerConnection(publisherName);
        MergePublication mergePub = new MergePublication(publicationName,
                    publicationDatabase, con);
        // Load publication properties from the Publisher.
        try
        {
            if (!mergePub.LoadProperties())
            {
                throw new ApplicationException(Environment.NewLine );
            }

            // Determine if the subscription is already registered at the Publisher.
            foreach (MergeSubscription regSub in mergePub.EnumSubscriptions())
            {
                if (regSub.DatabaseName == publicationDatabase &&
                    regSub.SubscriptionDBName == subscriptionDatabase &&
                    regSub.SubscriberName == subscriberServer &&
                    regSub.SubscriberType == MergeSubscriberType.Local &&
                    regSub.SubscriptionType == SubscriptionOption.Pull)
                {
                    // Subscription is already registered at the Publisher.
                    isSubKnown = true;
                }
            }

            if (!isSubKnown)
            {
                // Register the new subscription at the Publisher. 
                mergePub.MakePullSubscriptionWellKnown(subscriberServer,
                     subscriptionDatabase, SubscriptionSyncType.Automatic,
                    MergeSubscriberType.Local, 80.0f);
            }
        }
        catch (InvalidCastException ex)
        {
            throw new ApplicationException(ex.ToString());
        }
        return true;
    }
}
