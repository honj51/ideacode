using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
    public class MyDate
    {
        private int accountCount;

        public int AccountCount
        {
            get { return accountCount; }
            set { accountCount = value; }
        }
        private int visitorCount;

        public int VisitorCount
        {
            get { return visitorCount; }
            set { visitorCount = value; }
        }
        private int chatCount;

        public int ChatCount
        {
            get { return chatCount; }
            set { chatCount = value; }
        }
    }
}
