<%@ Page Language="C#" MasterPageFile="~/Theme/MD/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Vote.Default" Title="无标题页" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="15" SqlPageEnabled="True">
<HeaderTemplate>
<table cellspacing="0" cellpadding="2" border="0" id="tbList">
<colgroup>
<col style="width: 10%;" />
<col style="width: 24%;" />
<col style="width: 8%;" />
<col style="width: 36%;" />
<col style="width: 9%;" />
<col style="width: 5%;" />
<col style="width: 8%;" />
</colgroup>
<tbody>
<tr>
<td><input id="ckbAll" type="checkbox" onclick="CheckAll('IDBatch');" /><label for="ckbAll">标识(全)</label></td>
<td>调查</td>
<td>总票数</td>
<td>调查时间</td>
<td>参数</td>
<td>审核</td>
<td>相关操作</td>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr>
<td><input type="checkbox" name="IDBatch" value="<%#Eval("ID") %>" id="ckb<%#Eval("ID") %>" onclick="Check(this);" /><label for="ckb<%#Eval("ID") %>"><%#Eval("ID") %></label></td>
<td><a rel="external" href="VoteOption.aspx?sid=<%#Eval("ID")%>"><%#Eval("IDName")%></a></td>
<td><%#Eval("VoteCount").ToString() == "" ? 0 : Eval("VoteCount")%></td>
<td><%#Eval("BeginTime")%>-<%#Eval("EndTime")%></td>
<td><label class="greenText"><%#Eval("IsImage").ToString()=="1"?"图":"文" %></label><label class="redText"><%#Eval("IsMult").ToString() == "1" ? "多" : "单"%></label><label class="blueText"><%#Eval("CanRepeat").ToString() == "1" ? "重" : ""%></label><label class="orangeText"><%#Eval("IsMember").ToString()=="1"?"会":"" %></label></td>
<td><%#Eval("IsPassed")%></td>
<td><%#Eval("ID")%></td>
</tr>
</ItemTemplate>
<FooterTemplate>
</tbody>
</table>
<script type="text/javascript">VariegationTable("tbList");</script>
</FooterTemplate>
</LeeHom:LHRepeater>
</asp:Content>
