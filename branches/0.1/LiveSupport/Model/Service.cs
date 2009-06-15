using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
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

        }
    }
}