﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    
    </div>
    </form>
</body>
</html>
