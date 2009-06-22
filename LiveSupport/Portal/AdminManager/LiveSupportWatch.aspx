<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiveSupportWatch.aspx.cs" Inherits="AdminManager_LiveSupportWatch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>公司账号管理</title>
  <link href="../Theme/Default/css/Manager.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../Script/Common.js"></script>

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
  
</head>
<body >
<form id="form1" runat="server">
<div class="MainBox">
<table width="100%" cellpadding="0" cellspacing="0">
<tr><td style=" background-color:#0AAFDD; color:#ffffff; width:100%; height:32px;">&nbsp; <b> 当 前 在 线 客 服 信 息</b></td></tr>

                &nbsp;</td></tr>
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
<td>类　型：</td>
<td>
    <asp:DropDownList ID="ddlOnline" runat="server" CssClass="longInput" 
        Height="20px" Width="114px" AutoPostBack="True" 
        onselectedindexchanged="ddlOnline_SelectedIndexChanged">
        <asp:ListItem Value="*">查找所有公司</asp:ListItem>
        <asp:ListItem Text="公司列表" Value="list" />
        <asp:ListItem Text="公司ID" Value="accountId" />
        <asp:ListItem Text="公司名称" Value="ContactName" />
    </asp:DropDownList>
    &nbsp;
    <asp:DropDownList ID="ddlAccount1" runat="server" CssClass="longInput" 
        Height="20px" Width="114px" Visible="False">
        
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td>关键字：</td>
<td>
    <asp:TextBox ID="txtOnline" runat="server" Width="298px" ReadOnly="True"></asp:TextBox>
    </td>
</tr>
<tr>
<td></td>
<td>
    <asp:ImageButton ID="ibtnSearch" runat="server" 
        ImageUrl="~/images/btnSearch.png" />
    </td>
</tr>
</table>
</div>
</asp:Panel>


<asp:Panel Width="100%" runat="server" ID="PanelAccount" BorderStyle="None">
    <table width="100%" style="height:100px;" cellpadding="0" cellspacing="0" id="tbList">
    <asp:Repeater ID="repAccount" runat="server">
      <HeaderTemplate>
      <tr style="background-color:#BCE0FF;font-weight:bold; "><td>公司ID</td><td>公司名称</td><td>行业类别</td><td>联系人</td><td>省份</td><td>城市</td><td>注册时间</td><td>相关操作</td></tr>
      </HeaderTemplate>
      <ItemTemplate>
      <tr onmouseover="style.backgroundColor='#cccccc'" onmouseout="style.backgroundColor='white'" ><td  ><%# Eval("AccountNumber") %></td><td><a style="color:#999999;" href="ViewAccount.aspx?aid=<%# Eval("AccountId")%>" target="fraMain"><u><%# Eval("CompanyName")%></u></a></td><td><%# Eval("Industry")%></td><td><%# Eval("ContactName")%></td><td><%# Eval("Province")%></td><td><%# Eval("City")%></td><td><%# Eval("RegisterDate")%></td><td><a href="ViewAccount.aspx?aid=<%# Eval("AccountId")%>" target="fraMain"><img src="../AccountAdmin/Images/view.gif" alt="查看" /></a></td></tr>
      </ItemTemplate>
    </asp:Repeater>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMessage" runat="server" Text="对不起,暂时没有数据..." 
        ForeColor="#FF5050" ></asp:Label>
</table>
 </asp:Panel>
<table width="100%">
<td align="right">
    <asp:ImageButton ID="ibtnShang" runat="server" ImageUrl="~/images/shang.gif" 
         />
    <asp:ImageButton ID="ibtnXia" runat="server" ImageUrl="~/images/xia.gif" 
         />
    </td>
</table>
</div>
<br />
<div class="MainBox">
<table width="100%" cellpadding="0" cellspacing="0">
<tr><td style=" background-color:#0AAFDD; color:#ffffff; width:100%; height:32px;">&nbsp; <b> 当 前 对 话 信 息</b></td></tr>

                &nbsp;</td></tr>
</table>
<div class="Content">
<asp:Panel Width="100%" runat="server" ID="Panel1">
<div id="Div1" style="display:block;">
<table border="0" cellpadding="5" cellspacing="1" class="MainTable">
<colgroup>
<col class="tdbg1" />
<col class="tdbg2" />
</colgroup>
<tr><td colspan="2" class="left"><img alt="search" src="../Theme/Icon/search.gif" class="fixIBtn" />　信 息 搜 索 ...</td></tr>

<tr>
<td>类　型：</td>
<td><asp:DropDownList ID="ddlChat" runat="server" CssClass="longInput" 
        Height="20px" Width="114px" AutoPostBack="True" 
        onselectedindexchanged="ddlChat_SelectedIndexChanged">
    <asp:ListItem Value="*">查找所有公司</asp:ListItem>
<asp:ListItem Text="公司列表" Value="list" />
<asp:ListItem Text="公司ID" Value="accountId" />
<asp:ListItem Text="公司名称" Value="ContactName" />
</asp:DropDownList>&nbsp;
    <asp:DropDownList ID="ddlAccount2" runat="server" CssClass="longInput" 
        Height="20px" Width="114px" Visible="False">
        
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td>关键字：</td>
<td>
    <asp:TextBox ID="txtChat" runat="server" Width="298px" ReadOnly="True"></asp:TextBox>
    </td>
</tr>
<tr>
<td></td>
<td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/images/btnSearch.png" onclick="ImageButton1_Click" />
    </td>
</tr>
</table>
</div>
</asp:Panel>


<asp:Panel Width="100%" runat="server" ID="Panel2" BorderStyle="None">
    <table width="100%" style="height:100px;" cellpadding="0" cellspacing="0" id="Table1">
    <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      <tr style="background-color:#BCE0FF;font-weight:bold; "><td>公司ID</td><td>公司名称</td><td>行业类别</td><td>联系人</td><td>省份</td><td>城市</td><td>注册时间</td><td>相关操作</td></tr>
      </HeaderTemplate>
      <ItemTemplate>
      <tr onmouseover="style.backgroundColor='#cccccc'" onmouseout="style.backgroundColor='white'" ><td  ><%# Eval("AccountNumber") %></td><td><a style="color:#999999;" href="ViewAccount.aspx?aid=<%# Eval("AccountId")%>" target="fraMain"><u><%# Eval("CompanyName")%></u></a></td><td><%# Eval("Industry")%></td><td><%# Eval("ContactName")%></td><td><%# Eval("Province")%></td><td><%# Eval("City")%></td><td><%# Eval("RegisterDate")%></td><td><a href="ViewAccount.aspx?aid=<%# Eval("AccountId")%>" target="fraMain"><img src="../AccountAdmin/Images/view.gif" alt="查看" /></a></td></tr>
      </ItemTemplate>
    </asp:Repeater>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="对不起,暂时没有数据..." 
        ForeColor="#FF5050" ></asp:Label>
</table>
 </asp:Panel>
<table width="100%">
<td align="right">
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/shang.gif" 
         />
    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/xia.gif" 
         />
    </td>
</table>
</div>
</div>
</form>
</body>
</html>
