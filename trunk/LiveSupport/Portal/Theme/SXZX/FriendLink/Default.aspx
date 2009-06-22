<%@ Page Language="C#" MasterPageFile="~/Theme/SXZX/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.FriendLink.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="15" SqlPageEnabled="True">
<HeaderTemplate>
<table cellspacing="0" cellpadding="2" border="0" id="tbList">
<colgroup>
<col style="width: 11%;" />
<col style="width: 35%;" />
<col style="width: 14%;" />
<col style="width: 8%;" />
<col style="width: 19%;" />
<col style="width: 5%;" />
<col style="width: 8%;" />
</colgroup>
<tbody>
<tr>
<td><input id="ckbAll" type="checkbox" onclick="CheckAll('IDBatch');" /><label for="ckbAll">标识(全选)</label></td>
<td>网站名</td>
<td>Logo</td>
<td>链接类型</td>
<td>提交时间</td>
<td>审核</td>
<td>相关操作</td>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr>
<td><input type="checkbox" name="IDBatch" value="<%#Eval("ID") %>" id="ckb<%#Eval("ID") %>" onclick="Check(this);" /><label for="ckb<%#Eval("ID") %>"><%#Eval("ID") %></label></td>
<td><a href="<%#Eval("ID") %>.aspx" title="<%#Eval("Description") %>" rel="external"><%#Eval("IDName")%></a></td>
<td><%#Eval("LinkType").ToString() == "1" ? "　" : "<img class=\"logoImg\" src=\"" + Eval("Logo") + "\" />"%></td>
<td><%#Eval("LinkType").ToString().Replace("1", "文字链接").Replace("2", "图片链接")%></td>
<td><%#Eval("PostTime") %></td>
<td> </td>
<td> </td>
</tr>
</ItemTemplate>
<FooterTemplate>
</tbody>
</table>
<script type="text/javascript">VariegationTable("tbList");</script>
</FooterTemplate>
</LeeHom:LHRepeater>
</asp:Content>