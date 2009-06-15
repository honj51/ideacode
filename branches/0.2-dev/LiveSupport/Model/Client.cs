using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public class Client
    {
        private string id;

        public string Id
        {
            get { return id; }
            set { id = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string job;

        public string Job
        {
            get { return job; }
            set { job = value; }
        }
        private string unit;

        public string Unit
        {
            get { return unit; }
            set { unit = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private ClientGrounp clientGrounp;

        public ClientGrounp ClientGrounp
        {
            get { return clientGrounp; }
            set { clientGrounp = value; }
        }

        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private int age;

        public int Age
        {
            get { return age; }
            set { age = value; }
        }
        private int sex;

        public int Sex
        {
            get { return sex; }
            set { sex = value; }
        }
        private string qq;

        public string Qq
        {
            get { return qq; }
            set { qq = value; }
        }
        private string remark;

        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        public Client(SqlDataReader sdr)
        {

        }
    }
}
