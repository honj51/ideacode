﻿<%@ Page Title="客服中心-LiveSupport在线客服系统" Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="CallerLeaveWord.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <SCRIPT type="text/javascript">
    // <![CDATA[
    var myMenu;
    window.onload = function() {
        myMenu = new SDMenu("my_menu");
        //myMenu.remember = true
        myMenu.oneSmOnly = true;
        myMenu.init();
        var firstSubmenu = myMenu.submenus[4];
        myMenu.expandMenu(firstSubmenu);

    };</SCRIPT>
<script src="../js/Mycalendar.js"></script>
    <!--内容开始-->
   <!--内容-->
  <table cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">留言记录查询</td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>

<table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td><table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center"> 
  <!--内容-->
   <TABLE class=setting_tb cellSpacing=1 cellPadding=0 border=0 
        style="width: 560px">
  <TBODY>

  <TR id=tr_time>
  <td class=setting_td_left vAlign=center align=right>
  &nbsp;选择域名：
  </td>
  <td class=setting_td_right vAlign=center align=left>
   <asp:DropDownList ID="ddlDomainName" runat="server" AutoPostBack="True">
       <asp:ListItem Value="0">请选择域名</asp:ListItem>
          </asp:DropDownList>
  </td>
    <TD class=setting_td_left vAlign=center align=right>&nbsp;选择时间：</TD>
    <TD class=setting_td_right vAlign=center align=left>
        <asp:TextBox ID="txtBeginDate" runat="server" Width="98px"  onfocus="calendar()"></asp:TextBox>
        至<asp:TextBox ID="txtEndDate" runat="server" Width="98px"  onfocus="calendar()"></asp:TextBox>
&nbsp;<asp:Button ID="btnSelect" runat="server" Text="搜索" Width="64px" 
            onclick="btnSelect_Click"  />
      </TD></TR></TBODY></TABLE>
      
<!--聊天记录内容-->
<table width="560">
<tr><td align="left" style=" background-color:#ebf1fa; height: 20px;"><b>留言记录</b> &gt;&gt;</td>
<tr><td align="center">
    <asp:GridView ID="gvLeaveWord" runat="server" AutoGenerateColumns="False" 
          onrowcommand="gvLeaveWord_RowCommand" AllowPaging="True" 
        Font-Size="13px" onpageindexchanging="gvLeaveWord_PageIndexChanging" 
        Width="555px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                Visible="False" />
            <asp:BoundField DataField="CallerName" HeaderText="访客名称" 
                SortExpression="CallerName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" 
                Visible="False" />
            <asp:BoundField DataField="Subject" HeaderText="主题" SortExpression="Subject" />
            <asp:BoundField DataField="Content" HeaderText="Content" 
                SortExpression="Content" Visible="False" />
            <asp:BoundField DataField="DomainName" HeaderText="域名" 
                SortExpression="DomainName" />
            <asp:BoundField DataField="Ip" HeaderText="IP地址" SortExpression="Ip" />
            <asp:BoundField DataField="CallerDate" HeaderText="留言时间" 
                SortExpression="CallerDate" />
            <asp:BoundField DataField="Senddate" HeaderText="回复时间" 
                SortExpression="Senddate" Visible="False" />
            <asp:BoundField DataField="OperatorName" HeaderText="回复客服名称" 
                SortExpression="OperatorName" Visible="False" />
            <asp:BoundField DataField="IsSend" HeaderText="是否回复" SortExpression="IsSend" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="cmdView" CommandArgument='<%# Eval("Id") %>' 
                        ImageUrl="~/AccountAdmin/Images/view.gif" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </td></tr>
</tr>
</table>
  <!--内容结束-->
  
 </td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
</asp:Content>

 
 

