<%@ Page Language="C#" AutoEventWireup="false" Inherits="LiveSupportInstall.install" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<script language="javascript" src="../templates/default/common.js"></script>

<script type="text/javascript">
var ok=true;
function hideall()
{
            hide("tr1");
            hide("tr2");
            hide("tr3");
            hide("tr4");
            hide("tr5");
}
function DbTypeChange(type)
{
    switch(type)
    {
        case "MySql":
         alert("目前暂不支持");
        case "SqlServer":
            show("tr1");
            show("tr2");
            show("tr3");
            show("tr4");
            hide("tr5");
            break;
        case "Access":
        alert("目前暂不支持");
//            hide("tr1");
//            hide("tr2");
//            hide("tr3");
//            hide("tr4");
//            show("tr5");
        break;
        default:
            hideall();
            break;
    }
}

function SelectChange()
{
    DbTypeChange(document.getElementById("ddlDbType").value);
    ok=true;
}

function hide(id)
{
    document.getElementById(id).style.display = "none";
}

function show(id)
{
    document.getElementById(id).style.display = "";
}

function checkid(obj,id)
{
    var v = obj.value;
    
    if(v.length == 0)
    {
        document.getElementById('msg'+id).innerHTML='<span style=\'color:#ff0000\'>此处不能为空！</span>';
        ok=false;
    }
    else
    {
        document.getElementById('msg'+id).innerHTML='';
        ok=true;
    }
}

function isempty(id)
{
    if (document.getElementById(id).value.length==0)
        return true;
    else
        return false;
}

function checknull()
{
    if (document.getElementById("systemadminpws").value == "" || document.getElementById("systemadminpws").value.length < 6)
    {
        alert("系统管理员密码不能少于6位");
        document.getElementById("systemadminpws").focus();
        return false;
    }
    if (document.getElementById("repwd").value == "")
    {
        alert("确认密码不能为空");
        document.getElementById("repwd").focus();
        return false;
    }
    if (document.getElementById("systemadminpws").value != document.getElementById("repwd").value)
    {
        alert("系统管理员密码两次输入不同,请重新输入");
        document.getElementById("systemadminpws").focus();
        document.getElementById("systemadminpws").value = "";
        document.getElementById("repwd").value = "";
        return false;
    }
    if (document.getElementById("ddlDbType").value == 'Access')
    {
        if (!isempty('txtDbFileName')) 
            document.Form1.submit();
        else
            return false;
    }
    else
    {
        if (!isempty('datasource') && !isempty('initialcatalog') && !isempty('userid'))
            document.Form1.submit();
        else
            return false;
    }
    
}
</script>

<%=header%>
<body onload="hideall()">
    <form id="Form1" method="post" runat="server" onsubmit="return checknull();">
        <table cellspacing="1" cellpadding="0" width="700" align="center" bgcolor="#666666"
            border="0">
            <tr>
                <td bgcolor="#ffffff">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td bgcolor="#333" colspan="2">
                                <table cellspacing="0" cellpadding="8" width="100%" border="0">
                                    <tr>
                                        <td>
                                            <font color="#ffffff">初始化</font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="180">
                                <%=logo%>
                            </td>
                            <td valign="top" width="520">
                                <br>
                                <asp:Literal ID="msg" runat="server" Text="您当前论坛的Web.config文件设置不正确, 请您确保其文件内容正确<BR><FONT color=#996600>详见《安装说明》</FONT>"
                                    Visible="False"></asp:Literal>
                                <table cellspacing="0" cellpadding="8" width="100%" border="0">
                                    <tr>
                                        <td>
                                            <p>
                                            </p>
                                            <table cellspacing="0" cellpadding="8" width="100%" border="0">
                                                <tr>
                                                    <td width="30%">论坛的名称:</td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="forumtitle" runat="server" CanBeNull="可为空" RequiredFieldType="暂无校验"
                                                            Width="150px">LiveSupport!NT 2.0</asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>系统管理员名称:</td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="systemadminname" runat="server" CanBeNull="必填" RequiredFieldType="暂无校验"
                                                            Text="admin" MaxLength="20" Size="20" Width="150px"></asp:TextBox>*&nbsp;
                                                        <input type="checkbox" id="sponsercheck" name="sponsercheck" runat="server" checked
                                                            style="height: 18px" readonly="readonly">设置为创始人</td>
                                                </tr>
                                                <tr>
                                                    <td>系统管理员密码:<br />
                                                        (不得少于6位)</td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="systemadminpws" runat="server"  
                                                            MaxLength="32" Size="20" Width="150px" TextMode="Password" Text="123456"></asp:TextBox>*<br />
                                                        密码强度:<span id="showmsg"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>确认密码:</td>
                                                    <td style="width: 352px">
                                                        <input name="repwd" type="password" maxlength="32" id="repwd" class="FormBase" onfocus="this.className='FormFocus';" onblur="this.className='FormBase';" maxlength="32" size="20" style="width:150px;"  value="123456"/>*
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>管理员邮箱:</td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="adminemail" runat="server" RequiredFieldType="电子邮箱" MaxLength="50"
                                                            Size="20">tao410396629@126.com</asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td style="background-color: #f5f5f5">
                                                        数据库类型:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:DropDownList ID="ddlDbType" runat="server" onchange="SelectChange(this)">
                                                            <asp:ListItem Value="0">请选择数据库类型</asp:ListItem>
                                                            <asp:ListItem Value="SqlServer">SqlServer</asp:ListItem>
															<asp:ListItem Value="MySql">MySql</asp:ListItem>
                                                            <asp:ListItem Value="Access">Access</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr id="tr1">
                                                    <td style="background-color: #f5f5f5">
                                                        服务器名或IP地址:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="datasource" runat="server" RequiredFieldType="暂无校验"
                                                            Width="150" Enabled="true" onblur="checkid(this,'1')">.</asp:TextBox>*<span id="msg1"></span></td>
                                                </tr>
                                                <tr id="tr2">
                                                    <td style="background-color: #f5f5f5">
                                                        数据库名称:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="initialcatalog" runat="server" RequiredFieldType="暂无校验"
                                                            Width="150" Enabled="true" onblur="checkid(this,'2')">LiveSupport</asp:TextBox>*<span id="msg2"></span></td>
                                                </tr>
                                                <tr id="tr3">
                                                    <td style="background-color: #f5f5f5">
                                                        数据库用户名称:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="userid" runat="server" RequiredFieldType="暂无校验" Width="150"
                                                            Enabled="true" onblur="checkid(this,'3')">sa</asp:TextBox>*<span id="msg3"></span></td>
                                                </tr>
                                                <tr id="tr4">
                                                    <td style="background-color: #f5f5f5">
                                                        数据库用户密码:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="password" runat="server" RequiredFieldType="暂无校验" Width="150" Enabled="true"
                                                            TextMode="Password"></asp:TextBox></td>
                                                </tr>
                                                <tr id="tr5">
                                                    <td style="background-color: #f5f5f5">
                                                        数据库文件:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="txtDbFileName" runat="server" RequiredFieldType="暂无校验" Width="150px" onblur="checkid(this,'5')">access_db.config</asp:TextBox>
                                                        <span id="msg5"></span>( 默认:access_db.config )</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <table cellspacing="0" cellpadding="8" width="60%" border="0">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="ClearDBInfo" runat="server" Text="开始安装" OnClick="ClearDBInfo_Click" ></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <%=footer%>
    </form>
</body>
</html>
