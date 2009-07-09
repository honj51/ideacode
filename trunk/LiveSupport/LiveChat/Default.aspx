<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
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
        <input type="button" value="fdsaf" onclick="visitorLeave()" />&nbsp;<div id="trace_div"></div>
    </form>
        <table 
            style="width: 100%; height: 1501px;">
            <tr>
                <td class="style1">
                </td>
                <td class="style3">
                </td>
                <img src="file:///C:\Documents%20and%20Settings\y\Application%20Data\Tencent\QQ\Temp\4D623265-9CC5-498A-86AC-2BA5DE26A11B.png" />
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
             <script src='http://localhost:3355/livechat/LSBanner.ashx?aid=a055a2ca-f531-4ad6-8048-a7556866372c&IconStyle=0&InviteStyle=0&ChatStyle=0&IcoLocation=4'></script>
            </tr>
        </table>
 <script language=javascript>
function window.onbeforeunload()
{
if(event.clientX>document.body.clientWidth&&event.clientY<0||event.altKey||event.ctrlKey)
{
     //判断event.altKey是为了Alt+F4关闭的情况；判断event.ctrlKey是为了Ctrl+W关闭的情况
     //document.body.clientWidth不包括滚动条，而关闭按钮恰好在滚动条右侧。
     window.event.returnValue="";
     alert("aa");
}
alert("vv");
}
</script> 
</body>
</html>
