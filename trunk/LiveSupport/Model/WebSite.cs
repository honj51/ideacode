using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
    [Serializable]
    public class WebSite
    {
        public WebSite()
        { }
        #region Model
        private string domainname;
        private string companyName;
        private string registerid;
        private string iconstyle;
        private string invitestyle;
        private string chatstyle;
        private string icolocation;
        /// <summary>
        /// 域名
        /// </summary>
        public string DomainName
        {
            set { domainname = value; }
            get { return domainname; }
        }
        /// <summary>
        /// 公司名
        /// </summary>
        public string CompanyName
        {
            get { return companyName; }
            set { companyName = value; }
        }
        /// <summary>
        /// 注册ID
        /// </summary>
        public string RegisterId
        {
            set { registerid = value; }
            get { return registerid; }
        }
        /// <summary>
        /// 客服样式(图片)
        /// </summary>
        public string IconStyle
        {
            set { iconstyle = value; }
            get { return iconstyle; }
        }
        /// <summary>
        /// 主动邀请样式
        /// </summary>
        public string InviteStyle
        {
            set { invitestyle = value; }
            get { return invitestyle; }
        }
        /// <summary>
        /// 聊天样式
        /// </summary>
        public string ChatStyle
        {
            set { chatstyle = value; }
            get { return chatstyle; }
        }
        /// <summary>
        /// 显示的位置样式
        /// </summary>
        public string IcoLocation
        {
            set { icolocation = value; }
            get { return icolocation; }
        }
        #endregion Model
    }
}
