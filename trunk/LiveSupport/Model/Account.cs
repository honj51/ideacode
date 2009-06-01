﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

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
        private string loginName = string.Empty;

        public string LoginName
        {
            get { return loginName; }
            set { loginName = value; }
        }
        private string password = string.Empty;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string nickName = string.Empty;

        public string NickName
        {
            get { return nickName; }
            set { nickName = value; }
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
        private int operatorCount;

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
        private DateTime registerDate;

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
            registerDate = DateTime.Now;
        }

        public Account(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["AccountId"])) this.accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["LoginName"])) this.loginName = (string)data["LoginName"];
            if (!Convert.IsDBNull(data["Password"])) this.password = (string)data["Password"];
            if (!Convert.IsDBNull(data["NickName"])) this.nickName = (string)data["NickName"];
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