using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public class ClientGrounp
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
        private Account account;

        public Account Account
        {
            get { return account; }
            set { account = value; }
        }

        private string addDate;

        public string AddDate
        {
            get { return addDate; }
            set { addDate = value; }
        }
        public ClientGrounp(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["Id"])) Id = (string)data["Id"];
            if (!Convert.IsDBNull(data["Name"])) Name = (string)data["Name"];
            if (!Convert.IsDBNull(data["addDate"])) addDate = (string)data["addDate"];
        }
    }
}
