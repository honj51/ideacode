using System;
using System.Data;
using System.Configuration;
using System.Web;


namespace LiveSupport.DAL.Entity
{
    /// <summary>
    ///OrderedService 的摘要说明
    /// </summary>
    public class Service
    {
        private Guid id;

        public Guid Id
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
        private int operatorsAllowed;

        public int OperatorsAllowed
        {
            get { return operatorsAllowed; }
            set { operatorsAllowed = value; }
        }
        private int during;

        public int During
        {
            get { return during; }
            set { during = value; }
        }
        private int charge;

        public int Charge
        {
            get { return charge; }
            set { charge = value; }
        }

        public Service()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }
    }

}