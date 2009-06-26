<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="AdminManager_Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link href="../Theme/Default/css/Manager.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Script/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">

<div class="MainBox">

<div class="Content">
<div class="LeftPanel">
<div class="GlobalMessage">
欢迎您：<asp:Label ID="RealName" runat="server" /><br />
登录次数：<asp:Label ID="LoginCount" runat="server" /><br />
上次登录IP：<asp:Label ID="LastLoginIP" runat="server" /><br />
上次登录时间：<asp:Label ID="LastLoginTime" runat="server" /><br />

</div>
</div>
<div class="RightPanel" id="divAnnounce"></div>
</div>
<div class="SmallMenu">部门权限</div>
<div class="Content" id="Powers">
<fieldset><legend>管理权限</legend><asp:Label ID="ManagePower" runat="server" /></fieldset>
<fieldset><legend>模块权限</legend><asp:Label ID="ModulePower" runat="server" /></fieldset>&nbsp;
</div>
<div class="SmallMenu">服务器信息</div>
<div class="Content">
<div class="GlobalMessage">
域名 / IP：<span><%=Request.ServerVariables["Http_Host"]%> / <%=Request.ServerVariables["LOCAL_ADDR"]%> [端口:<%=Request.ServerVariables["Server_Port"]%>]</span><br />
服务器名：<span><%=Server.MachineName%></span><br />
操作系统：<span><%=Environment.OSVersion%></span><br />
系统文件夹：<span><%=Environment.ExpandEnvironmentVariables("%SystemRoot%")%></span><br />
信息服务软件：<span><%=Request.ServerVariables["Server_Download"]%> ( .NET RTL 版本:<%=Environment.Version%>)</span><br />
相对路径：<span><%=Request.Path%></span><br />
物理路径：<span><%=Request.PhysicalApplicationPath%></span><br />
</div>
</div>
</div>
</form>

</body>
</html>