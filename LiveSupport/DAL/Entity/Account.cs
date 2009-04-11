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
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private Guid userId;

        public Guid UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        private int paymentId;

        public int PaymentId
        {
            get { return paymentId; }
            set { paymentId = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private DateTime registerData;

        public DateTime RegisterData
        {
            get { return registerData; }
            set { registerData = value; }
        }

        private List<Operator> operators = new List<Operator>();

        public List<Operator> Operators
        {
            get { return operators; }
        }



        // Address
        private string address;
        private string city;
        private string region;
        private string postCode;
        private string country;
        private string phone;

        public Account(int id, Guid userId)
        {
            this.id = id;
            this.userId = userId;
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