using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    /// <summary>
    ///Account 的摘要说明
    /// </summary>
    [Serializable]
    public class Account
    {
        private string accountId;

        public string AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private string accountNumber;

        public string AccountNumber
        {
            get { return accountNumber; }
            set { accountNumber = value; }
        }
       
        private string companyName = string.Empty;

        public string CompanyName
        {
            get { return companyName; }
            set { companyName = value; }
        }
        private string industry = string.Empty;

        public string Industry
        {
            get { return industry; }
            set { industry = value; }
        }
        private string email = string.Empty;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string contactName = string.Empty;

        public string ContactName
        {
            get { return contactName; }
            set { contactName = value; }
        }
        private string phone = string.Empty;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string url = string.Empty;

        public string Url
        {
            get { return url; }
            set { url = value; }
        }
        private string domain = string.Empty;

        public string Domain
        {
            get { return domain; }
            set { domain = value; }
        }
        private int operatorCount = 0;

        public int OperatorCount
        {
            get { return operatorCount; }
            set { operatorCount = value; }
        }
        private string province = string.Empty;

        public string Province
        {
            get { return province; }
            set { province = value; }
        }
        private string city = string.Empty;

        public string City
        {
            get { return city; }
            set { city = value; }
        }
        private DateTime registerDate = DateTime.Now;

        public DateTime RegisterDate
        {
            get { return registerDate; }
            set { registerDate = value; }
        }
        private string remark = string.Empty;

        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }
        private string paymentId = string.Empty;

        public string PaymentId
        {
            get { return paymentId; }
            set { paymentId = value; }
        }
        public Account()
        {
            accountId = Guid.NewGuid().ToString();
        }

        public Account(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["AccountId"])) this.accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["AccountNumber"])) this.accountNumber = (string)data["AccountNumber"];
            if (!Convert.IsDBNull(data["CompanyName"])) this.companyName = (string)data["CompanyName"];
            if (!Convert.IsDBNull(data["Industry"])) this.industry = (string)data["Industry"];
            if (!Convert.IsDBNull(data["Email"])) this.email = (string)data["Email"];
            if (!Convert.IsDBNull(data["ContactName"])) this.contactName = (string)data["ContactName"];
            if (!Convert.IsDBNull(data["Phone"])) this.phone = (string)data["Phone"];
            if (!Convert.IsDBNull(data["URL"])) this.url = (string)data["URL"];
            if (!Convert.IsDBNull(data["Domain"])) this.domain = (string)data["Domain"];
            if (!Convert.IsDBNull(data["OperatorCount"])) this.operatorCount = (int)data["OperatorCount"];
            if (!Convert.IsDBNull(data["Province"])) this.province = (string)data["Province"];
            if (!Convert.IsDBNull(data["City"])) this.city = (string)data["City"];
            if (!Convert.IsDBNull(data["RegisterDate"])) this.registerDate = (DateTime)data["RegisterDate"];
            if (!Convert.IsDBNull(data["Remark"])) this.remark = (string)data["Remark"];
            if (!Convert.IsDBNull(data["PaymentId"])) this.paymentId = (string)data["PaymentId"];

        }

    }
}