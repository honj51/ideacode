﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo Page</title>
    
    <script type="text/javascript" language="javascript" src="http://localhost:3355/livechat/js/live2.js"></script>
</head>
<body>
    <form id="mainForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <%--<div id="service" style="BEHAVIOR:url(http://localhost/livechatservice/js/webservice.htc)"></div>--%>
        <div>
            <%--<script type="text/javascript">
			document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="ProcessImage.ashx?aid=2&referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>');
            </script>--%>
        </div>
    <input id="Text1" type="text" />
    <input type="button" value="fdsaf" onclick="visitorLeave()" />
    </form>
</body>
</html>
