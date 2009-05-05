#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Entity representing a chat request
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Xml;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;

public class Visitor
{
    private int visitorId;
    [XmlElement]
    public int VisitorId
    {
        get { return visitorId; }
        set { visitorId = value; }
    }

    private int accountId;
    [XmlElement]
    public int AccountId
    {
        get { return accountId; }
        set { accountId = value; }
    }

    private string name;
    [XmlElement]
    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    private string iP;
    [XmlElement]
    public string IP
    {
        get { return iP; }
        set { iP = value; }
    }

    private string email;
    [XmlElement]
    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    private string browser;
    [XmlElement]
    public string Browser
    {
        get { return browser; }
        set { browser = value; }
    }

    private string status;
    [XmlElement]
    public string Status
    {
        get { return status; }
        set { status = value; }
    }

    private string location;
    [XmlElement]
    public string Location
    {
        get { return location; }
        set { location = value; }
    }

    private int operators;
    [XmlElement]
    public int Operators
    {
        get { return operators; }
        set { operators = value; }
    }

    private DateTime visitingTime;
    [XmlElement]
    public DateTime VisitingTime
    {
        get { return visitingTime; }
        set { visitingTime = value; }
    }

    private DateTime leaveTime;
    [XmlElement]
    public DateTime LeaveTime
    {
        get { return leaveTime; }
        set { leaveTime = value; }
    }

    private DateTime requestTime;
    [XmlElement]
    public DateTime RequestTime
    {
        get { return requestTime; }
        set { requestTime = value; }
    }

    private DateTime chatingTime;
    [XmlElement]
    public DateTime ChatingTime
    {
        get { return chatingTime; }
        set { chatingTime = value; }
    }

    private DateTime waitingDuring;
    [XmlElement]
    public DateTime WaitingDuring
    {
        get { return waitingDuring; }
        set { waitingDuring = value; }
    }

    private DateTime chattingDuring;
    [XmlElement]
    public DateTime ChattingDuring
    {
        get { return chattingDuring; }
        set { chattingDuring = value; }
    }

    private int visitCount;
    [XmlElement]
    public int VisitCount
    {
        get { return visitCount; }
        set { visitCount = value; }
    }

    private string mark;
    [XmlElement]
    public string Mark
    {
        get { return mark; }
        set { mark = value; }
    }

    private int pageRequestCount;
    [XmlElement]
    public int PageRequestCount
    {
        get { return pageRequestCount; }
        set { pageRequestCount = value; }
    }

    private bool isVIP;
    [XmlElement]
    public bool IsVIP
    {
        get { return isVIP; }
        set { isVIP = value; }
    }

    public Visitor()
    {
        
    }

    public Visitor(SqlDataReader data)
    {
        if (!Convert.IsDBNull(data["VisitorId"])) VisitorId = (int)data["VisitorId"];
        if (!Convert.IsDBNull(data["AccountId"])) AccountId = (int)data["AccountId"];
        if (!Convert.IsDBNull(data["Name"])) Name = (string)data["Name"];
        if (!Convert.IsDBNull(data["IP"])) IP = (string)data["IP"];
        if (!Convert.IsDBNull(data["Email"])) Email = (string)data["Email"];
        if (!Convert.IsDBNull(data["Browser"])) Browser = (string)data["Browser"];
        if (!Convert.IsDBNull(data["Status"])) Status = (string)data["Status"];
        if (!Convert.IsDBNull(data["Location"])) Location = (string)data["Location"];
        if (!Convert.IsDBNull(data["Operator"])) Operators = (int)data["Operator"];
        if (!Convert.IsDBNull(data["VisitingTime"])) VisitingTime = (DateTime)data["VisitingTime"];
        if (!Convert.IsDBNull(data["LeaveTime"])) LeaveTime = (DateTime)data["LeaveTime"];
        if (!Convert.IsDBNull(data["RequestTime"])) RequestTime = (DateTime)data["RequestTime"];
        if (!Convert.IsDBNull(data["ChatingTime"])) ChatingTime = (DateTime)data["ChatingTime"];
        if (!Convert.IsDBNull(data["WaitingDuring"])) WaitingDuring = (DateTime)data["WaitingDuring"];
        if (!Convert.IsDBNull(data["ChattingDuring"])) ChattingDuring = (DateTime)data["ChattingDuring"];
        if (!Convert.IsDBNull(data["VisitCount"])) VisitCount = (int)data["MessageID"];
        if (!Convert.IsDBNull(data["Mark"])) Mark = (string)data["Mark"];
        if (!Convert.IsDBNull(data["PageRequestCount"])) PageRequestCount = (int)data["PageRequestCount"];
        if (!Convert.IsDBNull(data["IsVIP"])) IsVIP = (bool)data["IsVIP"];
    }
}

