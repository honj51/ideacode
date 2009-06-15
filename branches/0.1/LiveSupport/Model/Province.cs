using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public class Province
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
        public Province(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["id"])) id = (int)data["id"];
            if (!Convert.IsDBNull(data["name"])) name = (string)data["name"];
        }

    }
}
