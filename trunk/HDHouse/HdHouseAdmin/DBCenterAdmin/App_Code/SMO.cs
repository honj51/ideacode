using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;

/// <summary>
///SMO 的摘要说明
/// </summary>
public class SMO
{
    public const string DataBaseName = "HdHouse";

	public SMO()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public void CreatDB()
    {
        ServerConnection c = new ServerConnection(".", "sa", "hudongsoft");
        Server s = new Server(c);
        //s.AttachDatabase(
        Database db = new Database(s, DataBaseName);
        db.Create();
    }

    public void DeleteDB()
    {
        ServerConnection c = new ServerConnection(".", "sa", "hudongsoft");
        Server s = new Server(c);
        if (s.Databases[DataBaseName] != null)
        {
            s.Databases[DataBaseName].Drop();
        }
    }

    public bool IsDBExsit()
    {
        ServerConnection c = new ServerConnection(".","sa","hudongsoft");
        Server s = new Server(c);
        if(s.Databases[DataBaseName] == null)
            return false;
        else
            return true;
    }
}
