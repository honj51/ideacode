using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public enum OperatorStatus
    {
        Idle, Chatting, BeRightBack, Away, Offline
    }
    /// <summary>
    ///Operator 的摘要说明
    /// </summary>
    public class Operator
    {
        private string operatorId;
         
        public string OperatorId
        {
            get { return operatorId; }
            set { operatorId = value; }
        }
        private string accountId;
         
        public string AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private string loginName;
         
        public string LoginName
        {
            get { return loginName; }
            set { loginName = value; }
        }
        private string password;
         
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string nickName;
         
        public string NickName
        {
            get { return nickName; }
            set { nickName = value; }
        }
        private string email;
         
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private OperatorStatus status;
         
        public OperatorStatus Status
        {
            get { return status; }
            set { status = value; }
        }
        private string aVChatStatus;
         
        public string AVChatStatus
        {
            get { return aVChatStatus; }
            set { aVChatStatus = value; }
        }
        private bool isAdmin;

        public bool IsAdmin
        {
            get { return isAdmin; }
            set { isAdmin = value; }
        }
        private Department department;

        public Department Department
        {
            get { return department; }
            set { department = value; }
        } 

        public Operator()
        {
            this.status = OperatorStatus.Offline;
        }

        public Operator(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["OperatorId"])) operatorId = (string)data["OperatorId"];
            if (!Convert.IsDBNull(data["AccountId"])) accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["LoginName"])) loginName = (string)data["LoginName"];
            if (!Convert.IsDBNull(data["Password"])) password = (string)data["Password"];
            if (!Convert.IsDBNull(data["NickName"])) nickName = (string)data["NickName"];
            if (!Convert.IsDBNull(data["Email"])) email = (string)data["Email"];
            if (!Convert.IsDBNull(data["IsAdmin"])) isAdmin = (bool)data["IsAdmin"];
            if (!Convert.IsDBNull(data["Status"])) status = (OperatorStatus) Enum.Parse((typeof(OperatorStatus)),data["Status"].ToString());
            if (!Convert.IsDBNull(data["AVChatStatus"])) aVChatStatus = (string)data["AVChatStatus"];
        }
    }
}