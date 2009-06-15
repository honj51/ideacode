using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// SqlCustomerProvider 的摘要说明
/// </summary>
public class SqlCustomerProvider : CustomerProvider
{
    private string connectionString = string.Empty;

    public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
    {
        // check to ensure config is not null
        if (config == null)
            throw new ArgumentNullException("config");

        if (string.IsNullOrEmpty(name))
            name = "SqlCustomerProvider";

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

    public SqlCustomerProvider()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public override CustomerInfo GetCustomer(string userName)
    {
        throw new Exception("The method or operation is not implemented.");
    }
}
