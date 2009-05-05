using System;
using System.Xml;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;
[Serializable]
public class City
{
    private int id;
    [XmlElement]
    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    private string name;
    [XmlElement]
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private int pid;
    [XmlElement]
    public int Pid
    {
        get { return pid; }
        set { pid = value; }
    }
}

