using System;
using System.Web;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Web.Caching;
using LiveSupport.LiveSupportModel;
using System.IO;

/// <summary>
///ChatPageScriptMetod 的摘要说明
/// </summary>
[WebService(Namespace = "http://www.LiveSupport.cn/LiveSupportService/2009/04")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
// [System.Web.Script.Services.ScriptService]
public class ChatPageScriptMetod : System.Web.Services.WebService
{
    public ChatPageScriptMetod()
    {
        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }
    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

}

