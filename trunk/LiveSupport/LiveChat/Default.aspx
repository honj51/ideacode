<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo Page</title>
    
    <style type="text/css">
        .style1
        {
            height: 549px;
        }
        .style2
        {
            height: 59px;
        }
        .style3
        {
            height: 549px;
            width: 596px;
        }
        .style4
        {
            height: 59px;
            width: 596px;
        }
        .style5
        {
            width: 596px;
        }
    </style>
    
</head>
<body style="font-size:10px;>
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
        
        <script src="http://localhost:3355/livechat/LSBanner.ashx?aid=2&IcoLocation=1"></script>
        
        <%--<script type="text/javascript" language="javascript" src="http://rd01/livechatservice/js/live2.js"></script> --%>       
        <input id="Text1" type="text" />
        <input type="button" value="fdsaf" onclick="visitorLeave()" /><table 
            style="width: 100%; height: 733px;">
            <tr>
                <td class="style1">
                </td>
                <td class="style3">
                </td>
                <td class="style1">
                    范德萨</td>
            </tr>
            <tr>
                <td class="style2">
                </td>
                <td class="style4">
                    范德萨范德萨</td>
                <td class="style2">
                    放大</td>
            </tr>
            <tr>
                <td>
                    范德萨</td>
                <td class="style5">
                    范德萨</td>
                <td>
                <%--<script src="http://miraclew.gicp.net/lcs/LSBanner.ashx?aid=2&IcoLocation=3"></script>--%></td>
            </tr>
        </table>
&nbsp;<div id="trace_div"></div>
    </form>
</body>
</html>
