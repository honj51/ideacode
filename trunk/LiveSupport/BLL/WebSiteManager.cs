using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.BLL
{
    #region NewWebSite
    public class NewWebSite
    {
        public Banner banners;
        public Invite invites;
        public ChatPage chatpage;
        public string domainName;
        public string accountId;
        public string icoLocation;
    }
    public class Banner
    {
        private string state;

        public string State
        {
            get { return state; }
            set { state = value; }
        }
        private string online;

        public string Online
        {
            get { return online; }
            set { online = value; }
        }
        private string offline;

        public string Offline
        {
            get { return offline; }
            set { offline = value; }
        }
    }
    public class Invite
    {
        private string state;

        public string State
        {
            get { return state; }
            set { state = value; }
        }
        private string bgimg;

        public string Bgimg
        {
            get { return bgimg; }
            set { bgimg = value; }
        }
        private string okimg;

        public string Okimg
        {
            get { return okimg; }
            set { okimg = value; }
        }
        private string noimg;

        public string Noimg
        {
            get { return noimg; }
            set { noimg = value; }
        }
    }
    public class ChatPage
    {
        private string state;

        public string State
        {
            get { return state; }
            set { state = value; }
        }
        string chatPageRightImg;

        public string ChatPageRightImg
        {
            get { return chatPageRightImg; }
            set { chatPageRightImg = value; }
        }

        string leavePageTopImg;

        public string LeavePageTopImg
        {
            get { return leavePageTopImg; }
            set { leavePageTopImg = value; }
        }
    }
    #endregion
    public class WebSiteManager
    {
        
        private static IWebSiteProvider Provider = new SqlWebSiteProvider();
        public const string WebSite_Default ="Default";
        public const string WebSite_UserDefined = "UserDefined";
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public static bool NewWebSite(WebSite model)
        {
           int i= Provider.Add(model);
           if (i > 0)
           {
               return true;
           }
           else
               return false;
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public static bool Update(WebSite model)
        {
           int i= Provider.Update(model);
           if (i > 0)
           {
               return true;
           }
           else
               return false;
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public static void Delete(string domainName)
        {
            Provider.Delete(domainName);
        }
        public static WebSite GetWebSiteByDomainName(string domainName)
        {
           return Provider.GetModel(domainName);
        }

        public static List<WebSite> GetAllWebSiteByRegisterId(string accountId)
        {
            return Provider.GetAllWebSiteByRegisterId(accountId);
        }
        public static List<WebSite> GetAllWebSiteByRegisterId(Operator op)
        {
            if (op != null)
            {
                return Provider.GetAllWebSiteByRegisterId(op.Account.AccountId);
            }
            return null;
        }
        //取一行数据
        public static NewWebSite GetNewWebSiteByDomainName(string domainName)
        {
           
            WebSite website=Provider.GetModel(domainName);
            if (website == null)
            {
                return null;
            }
            NewWebSite nwbt = new NewWebSite();
            string[] bannerStyle = website.IconStyle.Split('|');
            Banner ban = new Banner();
            ban.State = bannerStyle[0];
            ban.Online = bannerStyle[1];
            ban.Offline = bannerStyle[2];
            nwbt.banners = ban;
            Invite ivt = new Invite();
            string[] invateStyle = website.InviteStyle.Split('|');
            ivt.State = invateStyle[0];
            ivt.Bgimg = invateStyle[1];
            ivt.Okimg = invateStyle[2];
            ivt.Noimg = invateStyle[3];
            nwbt.invites = ivt;
            ChatPage cpe = new ChatPage();
            string[] chatPageStyle = website.ChatStyle.Split('|');
            cpe.State = chatPageStyle[0];
            cpe.ChatPageRightImg = chatPageStyle[1];
            cpe.LeavePageTopImg = chatPageStyle[2];
            nwbt.chatpage = cpe;
            nwbt.accountId = website.RegisterId;
            nwbt.icoLocation = website.IcoLocation;
            nwbt.domainName = website.DomainName;
            return nwbt;
        }
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="nwst"></param>
        /// <returns></returns>
        public static bool AddNewWebSite(NewWebSite nwst)
        {
            WebSite website = new WebSite();
            website.IconStyle =nwst.banners.State+"|"+ nwst.banners.Online + "|" + nwst.banners.Offline;
            website.InviteStyle = nwst.invites.State + "|" + nwst.invites.Bgimg + "|" + nwst.invites.Okimg + "|" + nwst.invites.Noimg;
            website.ChatStyle = nwst.chatpage.State + "|" + nwst.chatpage.ChatPageRightImg + "|" + nwst.chatpage.LeavePageTopImg;
            website.DomainName = nwst.domainName;
            website.RegisterId = nwst.accountId;
            website.IcoLocation = nwst.icoLocation;
            return NewWebSite(website);
        }
        public static bool UpdateNewWebSite(NewWebSite nwst) 
        {
            WebSite website = new WebSite();
            website.IconStyle = nwst.banners.State + "|" + nwst.banners.Online + "|" + nwst.banners.Offline;
            website.InviteStyle = nwst.invites.State + "|" + nwst.invites.Bgimg + "|" + nwst.invites.Okimg + "|" + nwst.invites.Noimg;
            website.ChatStyle = nwst.chatpage.State + "|" + nwst.chatpage.ChatPageRightImg + "|" + nwst.chatpage.LeavePageTopImg;
            website.DomainName = nwst.domainName;
            website.RegisterId = nwst.accountId;
            website.IcoLocation = nwst.icoLocation;
            return Update(website);
        }

    }
}
