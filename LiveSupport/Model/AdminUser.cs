using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
    public class AdminUser
    {
        private string adminName;

        public string AdminName
        {
            get { return adminName; }
            set { adminName = value; }
        }
        private string adminPwd;

        public string AdminPwd
        {
            get { return adminPwd; }
            set { adminPwd = value; }
        }
        private int loginCount;

        public int LoginCount
        {
            get { return loginCount; }
            set { loginCount = value; }
        }
        private string loginIP;

        public string LoginIP
        {
            get { return loginIP; }
            set { loginIP = value; }
        }

        private DateTime loginDate;

        public DateTime LoginDate
        {
            get { return loginDate; }
            set { loginDate = value; }
        }

    }
}
