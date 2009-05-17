<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo Page</title>
    
</head>
<body>
    <form id="mainForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
<%--        <script type ="text/javascript" >
            var bannerType = 1; // 1: 简单按钮, 2: 客服列表, 3: 部门列表
            var bannerStyle = 1; // 1,2,3
            var invitePanelStyle = 1; // 1,2,3
            var bannerPos = 0; // 0:固定, 1:左上角, 2:右上角,3:左边 ,4:右边, 5:左下角, 6:右下角
            var accountId = 2;
        </script> 
--%>      
        <%--<script src="http://rd01/livechatservice/LSBanner.ashx?aid=2"></script> --%> 
        <script src="http://localhost:3355/livechat/LSBanner.ashx?aid=2"></script> 
        
        <%--<script type="text/javascript" language="javascript" src="http://rd01/livechatservice/js/live2.js"></script> --%>       
        <input id="Text1" type="text" />
        <input type="button" value="fdsaf" onclick="visitorLeave()" />
        <div id="trace_div"></div>
    </form>
</body>
</html>
