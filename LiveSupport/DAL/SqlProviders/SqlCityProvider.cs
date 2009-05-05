using System;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using LiveSupport.DAL.Entity;

namespace LiveSupport.DAL.SqlProviders
{
    public class SqlCityProvider : CityProvider
    {
        private string connectionString = string.Empty;

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            // check to ensure config is not null
            if (config == null)
                throw new ArgumentNullException("config");

            if (string.IsNullOrEmpty(name))
                name = "SqlChatProvider";

            // Check for the connection string
            if (config["connectionStringName"] != null && !string.IsNullOrEmpty(config["connectionStringName"].ToString()) && !string.IsNullOrEmpty(ConfigurationManager.ConnectionStrings[config["connectionStringName"].ToString()].ToString()))
            {
                connectionString = ConfigurationManager.ConnectionStrings[config["connectionStringName"].ToString()].ToString();
                config.Remove("connectionStringName");
            }
            else
                throw new ArgumentNullException("The ConnectionStringName is not defined");

            base.Initialize(name, config);
        }
    }
}
