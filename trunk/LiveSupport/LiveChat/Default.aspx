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
                <td class="style2" >
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
            <script src='http://localhost:3355/livechat/LSBanner.ashx?aid=ec831c14-b4ee-43e0-90c8-b6a350f7daa5&IconStyle=0&InviteStyle=0&ChatStyle=0&IcoLocation=3'></script>
            </tr>
        </table>
&nbsp;<div id="trace_div"></div>
    </form>
</body>
</html>
