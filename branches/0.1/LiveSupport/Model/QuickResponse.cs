using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public class QuickResponse
    {
        private int quickId;

        public int QuickId
        {
            get { return quickId; }
            set { quickId = value; }
        }

        private string accountId;//--公司ID

        public string AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private string operatorId;//--客服ID

        public string OperatorId
        {
            get { return operatorId; }
            set { operatorId = value; }
        }
        private string submenu; //子菜单

        public string Submenu
        {
            get { return submenu; }
            set { submenu = value; }
        }
        private string node;  //节点消息

        public string Node
        {
            get { return node; }
            set { node = value; }
        }
        public QuickResponse()
        {
 
        }
        public QuickResponse(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["QuickId"])) this.quickId = (int)data["QuickId"];
            if (!Convert.IsDBNull(data["AccountId"])) this.accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["OperatorId"])) this.operatorId = (string)data["OperatorId"];
            if (!Convert.IsDBNull(data["Submenu"])) this.submenu = (string)data["Submenu"];
            if (!Convert.IsDBNull(data["Node"])) this.node = (string)data["Node"];
        }

    }
}
