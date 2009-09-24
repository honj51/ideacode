using System;
using System.Collections;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

/// <summary>
///DBCenterWebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class DBCenterWebService : System.Web.Services.WebService
{

    public DBCenterWebService()
    {
        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    /// <summary>
    /// 定阅
    /// </summary>
    /// <param name="info"></param>
    /// <returns></returns>
    [WebMethod]
    public Boolean CreateSubscriptionRequest(SubscriptionInfo info)
    {
      //  SMO smo=new SMO();
       // return smo.RegisterSubscriptionOnPublisher(info);
        return true;
    }
    /// <summary>
    /// 获取发布信息
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public PublicationInfo GetPublicationInfo()
    {
        PublicationInfo pi = new PublicationInfo("HdHousePub", "HdHouse");
        return pi;
    }

    //发布信息
    public class PublicationInfo
    {
        /// <summary>
        ///  创建发布信息
        /// </summary>
        /// <param name="pcName">发布名</param>
        /// <param name="pdbName">所发布的数据库名</param>
        public PublicationInfo(string pcName,string pdbName)
        {
             publicationName = pcName;//发布名
             publisherName = Environment.MachineName;
             publicationDbName = pdbName;//数据库名
             webSyncUrl= "https://" + publisherName + "/HdHouse/replisapi.dll";
        }
        string publicationName;
        string publisherName;
        string publicationDbName;
        string webSyncUrl;
    }
    //定阅信息
    public class SubscriptionInfo
    {
        /// <summary>
        /// 创建定阅信息
        /// </summary>
        /// <param name="sbn">定阅机器名</param>
        /// <param name="sdbName">定阅数据库</param>
        public SubscriptionInfo(string sbn, string sdbName)
        {
            subscriberName = sbn;
            subscriptionDbName = sdbName;
        }
        string subscriberName;
        string subscriptionDbName;
    }

}

