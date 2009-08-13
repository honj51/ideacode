<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OperatorStatistic.aspx.cs" Inherits="AccountAdmin_Statistic_OperatorStatistic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>LiveSupport数据分析与统计-客服对话量统计</title>
<script src="../Js/Mycalendar.js"></script>
<script language="Javascript" type="text/javascript" src="../JS/FusionCharts/FusionCharts.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <!--Manager-->
     <table width="100%" style="border:1px solid;  border-color:#ACD8FF" cellpadding="0" cellspacing="0">
        <tr><td style=" border-bottom: 1px solid;  border-color:#ACD8FF; background-image:url('../Images/tdBgImg.jpg');">>> &nbsp;&nbsp;设置分析条件 </td></tr>
        <tr><td>
        提示：对比每个客服的对话量,可以分析出最好的客服。  
             
            <br />
            <label>
            简易方式&nbsp;&nbsp; 
            </label>
            <span>&nbsp;<asp:RadioButton ID="radDay" runat="server" GroupName="RadDate" 
                Text="统计当日" AutoPostBack="True" oncheckedchanged="radWeek_CheckedChanged" />
&nbsp;
            <asp:RadioButton ID="radWeek" runat="server" GroupName="RadDate" Text="以本周进行统计" 
                AutoPostBack="True" oncheckedchanged="radWeek_CheckedChanged" />
&nbsp;
            <asp:RadioButton ID="radMonth" runat="server" GroupName="RadDate" 
                Text="以本月进行统计" AutoPostBack="True" 
                oncheckedchanged="radWeek_CheckedChanged" />
&nbsp;
            <asp:RadioButton ID="radThreeMonth" runat="server" GroupName="RadDate" 
                Text="按最近3个月统计" AutoPostBack="True" 
                oncheckedchanged="radWeek_CheckedChanged" />
&nbsp;</span><br />
            <br />
        开始时间：<asp:TextBox ID="txtBeginDate" runat="server" Width="98px"  onfocus="calendar()"></asp:TextBox>
            结束时间：
        <asp:TextBox ID="txtEndDate" runat="server" Width="98px"  onfocus="calendar()"></asp:TextBox>
            <br />
            <br />
             <div style="margin-left:650px;">
                 <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/AccountAdmin/Images/btnStatistic.gif" onclick="ImageButton1_Click"/>
                 <br />
            </div>

        </td></tr>
     </table>
    </div><br />
        <asp:Panel ID="Panel1" runat="server" BorderStyle="None">
        <center>
        <asp:Literal ID="FCLiteral" runat="server"></asp:Literal>
        </center>
        </asp:Panel>
        <br />
    </form>
</body>
</html>
