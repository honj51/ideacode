using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
    public class City
    {
        private int id;
        public int Id
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
        private int pid;

        public int Pid
        {
            get { return pid; }
            set { pid = value; }
        }
    }
}

