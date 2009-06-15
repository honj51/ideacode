using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
    /// <summary>
    ///Payment 的摘要说明
    /// </summary>
    public class Payment
    {
        private Guid id;

        public Guid Id
        {
            get { return id; }
            set { id = value; }
        }
        private Guid AccountId;

        public Guid AccountId1
        {
            get { return AccountId; }
            set { AccountId = value; }
        }
        private Guid OrdeeredServiceId;

        public Guid OrdeeredServiceId1
        {
            get { return OrdeeredServiceId; }
            set { OrdeeredServiceId = value; }
        }
        private DateTime PayDate;
        private DateTime ExpireDate;

        public Payment()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }
    }

}