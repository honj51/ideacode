using System;
using System.Data;
using System.Configuration;
using System.Web;

namespace LiveSupport.DAL.Entity
{
    /// <summary>
    ///Operator 的摘要说明
    /// </summary>
    public class Operator
    {
        private int id;
        private int accountId;
        private string name;
        private string password;
        private string email;
        private bool isOnline;
        private bool disabled;

        public bool Disabled
        {
            get { return disabled; }
            set { disabled = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public int AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public bool IsOnline
        {
            get { return isOnline; }
            set { isOnline = value; }
        }

        public Operator()
        {

        }

        public Operator(int id, int accountId)
        {
            this.id = id;
            this.accountId = accountId;
        }
    }
}