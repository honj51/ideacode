<%@ Page Title="" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="CallerLeaveWord.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">
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
<script src="../js/My97DatePicker/WdatePicker.js"></script>
    <!--内容开始-->
   <!--内容-->
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
          留言记录查询 </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
  <!--内容-->
   <TABLE class=setting_tb cellSpacing=1 cellPadding=0 border=0 
        style="width: 570px">
  <TBODY>
  <TR>
    <TD class=setting_td_top vAlign=center align=left colSpan=2>&nbsp;</TD></TR>
  <TR id=tr_time>
    <TD class=setting_td_left vAlign=center align=right>&nbsp;时间：</TD>
    <TD class=setting_td_right vAlign=center align=left>
        <asp:TextBox ID="txtBeginDate" runat="server" Width="98px" CssClass="Wdate" onFocus="new WdatePicker

(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
        至<asp:TextBox ID="txtEndDate" runat="server" Width="98px" CssClass="Wdate" onFocus="new WdatePicker

(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
&nbsp;<asp:Button ID="btnSelect" runat="server" Text="搜索" Width="64px" 
            onclick="btnSelect_Click"  />
      </TD></TR></TBODY></TABLE>
<!--聊天记录内容-->
<table width="570">
<tr><td align="left" style=" background-color:#ebf1fa; height: 20px;">留言记录 &gt;&gt;</td>
<tr><td align="center">
    <asp:GridView ID="gvLeaveWord" runat="server" AutoGenerateColumns="False" 
          onrowcommand="gvLeaveWord_RowCommand" AllowPaging="True" 
        Font-Size="12px" onpageindexchanging="gvLeaveWord_PageIndexChanging" 
        Width="555px">
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
    </asp:GridView>
    </td></tr>
</tr>
</table>
  <!--内容结束-->
  </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>



</asp:Content>

 
 
