using System;
using System.Xml;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;

[Serializable]
public class Province
{
    private int id;
    [XmlElement]
    public int Id
    {
        get { return id; }
        set { id = value; }
    }

    private int name;
    [XmlElement]
    public int Name
    {
        get { return name; }
        set { name = value; }
    }

}

