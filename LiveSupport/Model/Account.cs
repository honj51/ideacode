using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
    /// <summary>
    ///Account 的摘要说明
    /// </summary>
    public class Account
    {
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
        private string companyName;

        public string CompanyName
        {
            get { return companyName; }
            set { companyName = value; }
        }
        private string industry;

        public string Industry
        {
            get { return industry; }
            set { industry = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string contactName;

        public string ContactName
        {
            get { return contactName; }
            set { contactName = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string url;

        public string Url
        {
            get { return url; }
            set { url = value; }
        }
        private string domain;

        public string Domain
        {
            get { return domain; }
            set { domain = value; }
        }
        private string operatorCount;

        public string OperatorCount
        {
            get { return operatorCount; }
            set { operatorCount = value; }
        }
        private string province;

        public string Province
        {
            get { return province; }
            set { province = value; }
        }
        private string city;

        public string City
        {
            get { return city; }
            set { city = value; }
        }
        private string registerDate;

        public string RegisterDate
        {
            get { return registerDate; }
            set { registerDate = value; }
        }
        private string remark;

        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }
        private string paymentId;

        public string PaymentId
        {
            get { return paymentId; }
            set { paymentId = value; }
        }
    }
}