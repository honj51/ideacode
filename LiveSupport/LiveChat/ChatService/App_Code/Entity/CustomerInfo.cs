using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.Serialization;

/// <summary>
/// Customer 的摘要说明
/// </summary>
/// 
[Serializable()]
public class CustomerInfo
{
    private int customerID;
    [XmlElement]
    public int CustomerID
    {
        get { return customerID; }
        set { customerID = value; }
    }

    private string customerName;
    [XmlElement]
    public string CustomerName
    {
        get { return customerName; }
        set { customerName = value; }
    }

    private int paymentID;
    [XmlElement]
    public int PaymentID
    {
        get { return paymentID; }
        set { paymentID = value; }
    }

    public CustomerInfo()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public CustomerInfo(SqlDataReader data)
    {
        if (!Convert.IsDBNull(data["CustomerID"])) customerID = (int)data["CustomerID"];
        if (!Convert.IsDBNull(data["Name"])) customerName = (string)data["Name"];
        if (!Convert.IsDBNull(data["PaymentID"])) paymentID = (int)data["PaymentID"];
    }
}
