<%@ Page Title="账号管理" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateAccount.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     客服账号管理</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
  <div style="text-align:left;color: #cccccc; border-bottom: 1px solid; position: relative;">&nbsp;&nbsp;&nbsp;<a href="AccountHome.aspx"><img src="Images/zhuce2.jpg" /></a><img src="Images/mima2.jpg" /></div>
  <!--内容-->
  <TABLE cellSpacing=0 cellPadding=0 border=0 style="text-align:left;" >
        <TBODY >
        <TR>
          <TD >&nbsp;&nbsp; 管理员呢称： </TD>
          <TD ><asp:TextBox ID="txtNickname" runat="server" Width="160px"></asp:TextBox>
&nbsp;</TD>
          <TD>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="txtNickname" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD><FONT color=red>*</FONT> 原始密码： </TD>
          <TD><asp:TextBox ID="txtAgoPwd" runat="server" Width="160px" 
                  TextMode="Password"></asp:TextBox>
&nbsp;</TD>
          <TD>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ControlToValidate="txtAgoPwd" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD><FONT color=red>*</FONT> 新密码： </TD>
          <TD ><asp:TextBox ID="txtPwd" runat="server" Width="160px" TextMode="Password"></asp:TextBox>
&nbsp;</TD>
          <TD >
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                  ControlToValidate="txtPwd" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD><FONT color=red>*</FONT> 密码确认： </TD>
          <TD ><asp:TextBox ID="txtPwds" runat="server" Width="160px" TextMode="Password"></asp:TextBox>
&nbsp;</TD>
          <TD >&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                  ControlToValidate="txtPwds" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
              <asp:CompareValidator ID="CompareValidator1" runat="server" 
                  ControlToCompare="txtPwd" ControlToValidate="txtPwds" 
                  ErrorMessage="确认密码与新密码不一致!"></asp:CompareValidator>
            </TD></TR>
       
                  <TR>
          <TD >&nbsp;&nbsp;&nbsp; </TD>
          <TD >
              <asp:Button ID="btnSave" runat="server" Text="保存" Width="63px" 
                  onclick="btnSave_Click" />
                      </TD>
          <TD>&nbsp;</TD></TR>
          </TBODY></TABLE>
  </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</asp:Content>

 
