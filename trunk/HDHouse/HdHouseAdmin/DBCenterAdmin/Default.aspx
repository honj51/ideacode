<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        数据库HdHouse是否存在： 
        <asp:Label ID="Label1" runat="server" Text="未知"></asp:Label>
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="检测" />
    
    </div>
    <div>
    
        创建数据库： 
        <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="创建" />
    
    </div>
    <div>
    
        删除数据库： 
        <asp:Label ID="Label3" runat="server"></asp:Label>
&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="删除" />
    
        <br />
    
    </div>
    <asp:Label ID="Label10" runat="server" Text="0. 手动创建一个帐号"></asp:Label>
&nbsp; 用户名：<asp:TextBox ID="TextBox1" runat="server" Width="95px"></asp:TextBox>
&nbsp;密码 
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button7" runat="server" onclick="Button7_Click" Text="创建" />
    &nbsp;<asp:Button ID="Button12" runat="server" onclick="Button12_Click" 
        Text="删除" />
    <br />
&nbsp;<asp:Button ID="Button8" runat="server" onclick="Button8_Click" Text="加密" 
        Width="47px" />
&nbsp;&nbsp;
    <asp:Button ID="Button9" runat="server" onclick="Button9_Click" Text="解密" />
    <br />
    <asp:Label ID="Label11" runat="server" Text="0. 起动SQL Server 代理服务"></asp:Label>
&nbsp;<asp:Button ID="Button10" runat="server" onclick="Button10_Click" Text="开起" />
&nbsp;&nbsp;
    <asp:Button ID="Button11" runat="server" onclick="Button11_Click" Text="关闭" />
    <br />
    <asp:Label ID="Label6" runat="server" Text="1. 配置发布和分发"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="配置" />
    <br />
    <asp:Label ID="Label4" runat="server" Text="2. 创建发布服务器"></asp:Label>
&nbsp;<asp:Label ID="Label5" runat="server"></asp:Label>
&nbsp;
    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="创建" />
    <br />
    <asp:Label ID="Label8" runat="server" Text="3. 发布以允许使用 Web 同步"></asp:Label>
&nbsp;
    <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="创建" />
    <br />
    <asp:Label ID="Label9" runat="server" Text="4. 配置IIS,使用SSL"></asp:Label>
    <br />
&nbsp;&nbsp;&nbsp; 1. 使用SelfSsl 生成证书，安装到网站<br />
&nbsp;&nbsp;&nbsp; 2. 执行安装目录下的 CreateWebSyncVDir.bat（创建虚拟目录，配置权限）<br />
    <br />
    <asp:Label ID="Label12" runat="server" Text="5. 注册定阅"></asp:Label>
&nbsp;&nbsp;
    <asp:Button ID="Button13" runat="server" onclick="Button13_Click" Text="定阅" />
    <br />
    <asp:TextBox ID="TextBox3" runat="server" Height="91px" Width="526px"></asp:TextBox>
    <br />
    <br />
    </form>
</body>
</html>
