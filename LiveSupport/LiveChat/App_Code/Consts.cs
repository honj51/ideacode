using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
///Consts 的摘要说明
/// </summary>
public class Consts
{
    public const int MessageType_ToAll = 1;
    public const int MessageType_ToOperator = 2;
    public const int MessageType_ToChatPage = 3;


    public const string ChatSystemName = "LiveSupport系统";
}
