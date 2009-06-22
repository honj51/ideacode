<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiveSupportCount.aspx.cs" Inherits="AdminManager_LiveSupportCount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>公司账号管理</title>
  <link href="../Theme/Default/css/Manager.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../Script/Common.js"></script>
  <script src="../js/Mycalendar.js"></script>
  <script>
   function searchAccount()
   {
        if(document.getElementById("Search").style.display=="block"){ 
            document.getElementById("Search").style.display="none";
        }
        else
        {
            document.getElementById("Search").style.display="block";
        }
   }
  </script>
  
    <style type="text/css">
        .style1
        {
            width: 84px;
        }
    </style>
  
</head>
<body >
<form id="form1" runat="server">
<div class="MainBox">
<table cellpadding="0" cellspacing="0" width="100%">
<tr><td style=" background-color:#0AAFDD; color:#ffffff;  height:32px;">&nbsp; <b> 统 计 管 理</b></td></tr>
</table>
<div class="Content">
<asp:Panel Width="100%" runat="server" ID="pnlSearch">
<div id="Search" style="display:block;">
<table border="0" cellpadding="5" cellspacing="1" class="MainTable">
<colgroup>
<col class="tdbg1" />
<col class="tdbg2" />
</colgroup>
<tr><td colspan="2" class="left"><img alt="search" src="../Theme/Icon/search.gif" class="fixIBtn" />　信 息 搜 索 ...</td></tr>

<tr>
<td >日&nbsp;&nbsp; 期：</td>
<td >开始时间：<asp:TextBox ID="txtBeginDate" runat="server" Width="98px"  onFocus="calendar()"></asp:TextBox>结束时间：<asp:TextBox ID="txtEndDate" runat="server" Width="98px"  onFocus="calendar()"></asp:TextBox>

    &nbsp;
    <asp:ImageButton ID="ibtnSearch" runat="server" 
        ImageUrl="~/images/btnSearch.png" onclick="ibtnSearch_Click" />
    </td>
</tr>
</table>
</div>
</asp:Panel>


<asp:Panel Width="100%" runat="server" ID="PanelAccount" BorderStyle="None">
<table width="100%" style="height:100px;" cellpadding="0" cellspacing="0" id="tbList">
<tr><td valign="top">

<table>
<tr><td>开通账户统计</td><td>访问量统计</td><td>对话统计</td></tr>
<tr><td><asp:Label ID="lblAccountCount" runat="server" Text="0"></asp:Label></td><td><asp:Label ID="lblVisitorCount" runat="server" Text="0"></asp:Label></td><td><asp:Label ID="lblChatCount" runat="server" Text="0"></asp:Label></td></tr>
</table>

</td></tr>
</table>
 </asp:Panel>
</div></div>
</form>
</body>
</html>
