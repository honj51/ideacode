using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Collections.Generic;

namespace LiveSupport.DAL.Entity
{
    /// <summary>
    ///Account 的摘要说明
    /// </summary>
    public class Account
    {

        private int id;                 //用户编号

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string companyName;     //公司名称

        public string CompanyName
        {
            get { return companyName; }
            set { companyName = value; }
        }
        private string webAddress;      //公司网址

        public string WebAddress
        {
            get { return webAddress; }
            set { webAddress = value; }
        }
        private string phone;           //电话

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string contactName;            //联系人 

        public string ContactName
        {
            get { return contactName; }
            set { contactName = value; }
        }


        private string email;           //电子邮件 

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string city;            //省份

        public string City
        {
            get { return city; }
            set { city = value; }
        }
        private string region;          //城市

        public string Region
        {
            get { return region; }
            set { region = value; }
        }
        private string calling;         //行业类别

        public string Calling
        {
            get { return calling; }
            set { calling = value; }
        }
        private string loginId;         //账号

        public string LoginId
        {
            get { return loginId; }
            set { loginId = value; }
        }

        private string password;        //密码

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string adminUserName;   //昵称

        public string AdminUserName
        {
            get { return adminUserName; }
            set { adminUserName = value; }
        }
        private int paymentId;          //支付id

        public int PaymentId
        {
            get { return paymentId; }
            set { paymentId = value; }
        }
        private string registerDate;    //注册日期

        public string RegisterDate
        {
            get { return registerDate; }
            set { registerDate = value; }
        }
        private string notes;           //

        public string Notes
        {
            get { return notes; }
            set { notes = value; }
        }
        private List<Operator> operators = new List<Operator>();

        public List<Operator> Operators
        {
            get { return operators; }
        }

        public void AddOperator(Operator op)
        {
            operators.Add(op);
        }

        public void RemoveOperator(Operator op)
        {
            operators.Remove(op);
        }
    }
}