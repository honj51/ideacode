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
        <asp:ListItem Text="公司列表" Value="accountList" />
        <asp:ListItem Text="公司ID" Value="accountNumber" />
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
        ImageUrl="~/images/btnSearch.png" onclick="ibtnSearch_Click" />
    </td>
</tr>
</table>
</div>
</asp:Panel>


<asp:Panel Width="100%" runat="server" ID="PanelAccount" BorderStyle="None">
    <table width="100%" style="height:100px;" cellpadding="0" cellspacing="0" id="tbList">
    <asp:Repeater ID="repOperator" runat="server">
      <HeaderTemplate>
      <tr style="background-color:#BCE0FF;font-weight:bold; "><td>公司ID</td><td>公司名称</td><td>公司部门</td><td>账号</td><td>昵称</td><td>邮箱</td><td>相关操作</td></tr>
      </HeaderTemplate>
      <ItemTemplate>
      <tr onmouseover="style.backgroundColor='#cccccc'" onmouseout="style.backgroundColor='white'" ><td><%# Eval("Account.AccountNumber")%></td><td><%# Eval("Account.CompanyName")%></td><td><%# Eval("Department.DepartmentName")%></td><td><%# Eval("LoginName")%></td><td><%# Eval("NickName")%></td><td><%# Eval("Email")%></td><td><img src="../AccountAdmin/Images/view.gif" alt="查看" /></td></tr>
      </ItemTemplate>
    </asp:Repeater>
            <caption>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMessage" runat="server" ForeColor="#FF5050" 
                    Text="对不起,暂时没有数据..."></asp:Label>
        </caption>
</table>
 </asp:Panel>
 <asp:Panel Width="100%" runat="server" ID="PanelAccountDown" BorderStyle="None" Visible="False">
<table width="100%">
    <tr>
        <td align="right">
            当前在线客服:<asp:Label ID="lblOperatorCount" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            位 当前索引:<asp:Label ID="lblOpageIndex" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            /<asp:Label ID="lblOpageIndexCount" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            <asp:ImageButton ID="ibtnOshang" runat="server" ImageUrl="~/images/shang.gif" 
                onclick="ibtnOshang_Click" />
            <asp:ImageButton ID="ibtnOxia" runat="server" ImageUrl="~/images/xia.gif" 
                onclick="ibtnOxia_Click" />
        </td>
    </tr>
</table>
</asp:Panel>
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
<asp:ListItem Text="公司列表" Value="accountList" />
<asp:ListItem Text="公司ID" Value="accountNumber" />
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
    <table width="100%" style="height:100px;" cellpadding="0" cellspacing="0" >
    <asp:Repeater ID="repChat" runat="server">
      <HeaderTemplate>
      <tr style="background-color:#BCE0FF;font-weight:bold; "><td>对话ID</td><td>公司名称</td><td>发起会话者</td><td>开始时间</td><td>IP</td><td>地理位置</td><td>当前客服</td><td>相关操作</td></tr>
      </HeaderTemplate>
      <ItemTemplate>
      <tr onmouseover="style.backgroundColor='#cccccc'" onmouseout="style.backgroundColor='white'" ><td><%# Eval("ChatId")%></td><td ><%# this.GetAccountNameById(Eval("AccountId").ToString()) %></td><td><%# Eval("CreateBy")%></td><td><%# Eval("CreateTime")%></td><td><%# Eval("Vs.IP")%></td><td><%# Eval("Vs.Location")%></td><td><%# this.GetOperatorNameById(Eval("OperatorId").ToString()) %></td><td><img src="../AccountAdmin/Images/view.gif" alt="查看" /></td></tr>
      </ItemTemplate>
    </asp:Repeater>
        <caption>
          <asp:Label ID="lblChatMessage" runat="server" ForeColor="#FF5050" Text="对不起,暂时没有数据..."></asp:Label>
        </caption>
</table>
 </asp:Panel>
  <asp:Panel Width="100%" runat="server" ID="PanelChatDown" BorderStyle="None" Visible="False">
<table width="100%">
    <tr>
        <td align="right">
         当前正在对话:<asp:Label ID="lblChatCount" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            对 当前页:<asp:Label ID="lblChatIndex" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            /<asp:Label ID="lblChatIndexCount" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            <asp:ImageButton ID="ibtnCshang" runat="server" ImageUrl="~/images/shang.gif" 
                onclick="ibtnCshang_Click" />
            <asp:ImageButton ID="ibtnCxia" runat="server" ImageUrl="~/images/xia.gif" 
                onclick="ibtnCxia_Click" />
        </td>
    </tr>
</table>
</asp:Panel>
</div>
</div>
</form>
</body>
</html>
