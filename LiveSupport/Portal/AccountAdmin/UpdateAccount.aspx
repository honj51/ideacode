﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateAccount.aspx.cs" Inherits="Default2" Title="客服中心-公司账号管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
   <center style="">
   <img src="Images/bg3.jpg" style="width: 765px" />
   <table style="width:765px;" >
   <tr>
 <!--Left-->
 <td valign="top">
<div><img src="Images/left_12.gif" /></div>
<!--导航-->
<div style="height: 180px; background-image:url('Images/zhongjian.bmp'); ">
<LINK href="Images/sdmenu.css" type=text/css rel=stylesheet>
<SCRIPT src="Images/sdmenu.js" type="text/javascript">
</SCRIPT>
<SCRIPT type="text/javascript">
		// <![CDATA[
    var myMenu;
    window.onload = function() {
        myMenu = new SDMenu("my_menu");
        //myMenu.remember = true
        myMenu.oneSmOnly = true;
        myMenu.init();
        var firstSubmenu = myMenu.submenus[0];
        myMenu.expandMenu(firstSubmenu);  
			
		};
	</SCRIPT>
<DIV class=sdmenu id=my_menu> 

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">基本设置</SPAN> 
<A href="AccountHome.aspx" >公司信息</A>
<A href="UpdateAccount.aspx" >公司账号管理</A>

</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客服管理</SPAN> 
<A href="DepartmentManager.aspx">部门设置</A> 
<A href="OperatorsManagment.aspx" >客服管理</A> 
 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">风格设置</SPAN> 
 
<A href="GetCode.aspx">获取代码设置</A> 
<A href="#">界面风格设置</A> 
<A href="#">简介设置
<A href="#">主动发起设置</A> <A 
href="#">自定义客服图标</A>
 
 
</DIV>


<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">聊天记录</SPAN> 
<A href="ChatAnnal.aspx">聊天记录 </A> <A href="#">访客留言</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客户管理</SPAN> 
<A href="#">添加客户</A> 
<A href="#">客户列表</A> 
</DIV>
<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">免费电话管理</SPAN> 
<A onclick="return open_url('#')" href="#">免费电话管理</A> 
<A onclick="return open_url('#')" href="#">设置公司免费电话</A> 
</DIV> 
&nbsp;</DIV>
</div>
</div>
<!--导航结束-->
<div><img src="Images/abc.bmp" /></div>
 
   </td>
<!--right-->
<td style="width: 583px;" valign="top">
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
</td></tr>
   </table>
   </center>
</asp:Content>
