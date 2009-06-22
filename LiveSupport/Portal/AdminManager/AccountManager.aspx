<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountManager.aspx.cs" Inherits="AdminManager_AccountManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
<tr><td style=" background-color:#0AAFDD; color:#ffffff; width:100%; height:32px;">&nbsp; <b> 公 司 信 息 管 理</b></td></tr>
<tr><td style=" background-color:#BCE0FF; height:27px;">&nbsp;&nbsp;<a href="../Register.aspx" target="_blank">添加新的信息</a> | <a href="AccountManager.aspx" target="fraMain">现有信息查看</a>  | <a href="#" onclick="searchAccount();">搜索</a>
<br />
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
<td><asp:DropDownList ID="ddlKind" runat="server" CssClass="longInput">
<asp:ListItem Text="公司ID" Value="AccountNumber" />
<asp:ListItem Text="公司名称" Value="CompanyName" />
<asp:ListItem Text="联系人" Value="ContactName" />
</asp:DropDownList></td>
</tr>
<tr>
<td>关键字：</td>
<td>
    <asp:TextBox ID="txtValue" runat="server" Width="298px"></asp:TextBox>
    </td>
</tr>
<tr>
<td></td>
<td>
    <asp:ImageButton ID="ibtnSearch" runat="server" 
        ImageUrl="~/images/btnSearch.png" onclick="ibtnSearch_Click" />
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
        onclick="ibtnShang_Click" />
    <asp:ImageButton ID="ibtnXia" runat="server" ImageUrl="~/images/xia.gif" 
        onclick="ibtnXia_Click" />
    </td>
</table>
</div></div>
</form>
</body>
</html>
