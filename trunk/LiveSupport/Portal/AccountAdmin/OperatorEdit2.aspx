<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorEdit2.aspx.cs" Inherits="Default2" Title="无标题页" %>

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
			var firstSubmenu = myMenu.submenus[1];
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
<A href="#">客服评分</A> <A href="#">登陆日志</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">风格设置</SPAN> 
<A href="#">风格基本信息设置</A> 
<A href="GetCode.aspx">获取代码设置</A> 
<A href="#">界面风格设置</A> 
<A href="#">简介设置</A> 
<A href="#">对话提示设置</A> 
<A href="#">主动发起设置</A> <A 
href="#">客服图标设置</A> <A 
href="#">自定义客服图标</A> <A 
href="#">指定客服设置</A> <A 
href="#">自定义LOGO</A> 
<A href="#">自定义URL</A> 
</DIV>

<DIV class=collapsed><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">数据分析 (New)</SPAN> 
<A onclick=jump_URL() href="#">流量统计 </A>
<A href="#">咨询量统计</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">聊天记录</SPAN> 
<A href="#">聊天记录</A> <A href="#">访客留言</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客户管理</SPAN> 
<A href="#">添加客户</A> 
<A href="#">客户列表</A> 
<A href="#">分组管理</A> 
<A href="#">IP阻止</A> 
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
     客服信息管理</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px; ">
    <!--头部--->
    <div style="text-align:left; margin-left:60px; margin-top:50px;">
            <TABLE id=ctl00_ContentPlaceHolder1_DetailsView1 
      style="WIDTH: 368px; BORDER-COLLAPSE: collapse; HEIGHT: 50px" 
      cellSpacing=0 rules=all border=1>
        <TBODY>
        <TR>
          <TD style="width: 109px">公司名称：</TD>
          <TD>
              <asp:TextBox ID="txtCompanyName" runat="server" ReadOnly="True"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD style="width: 109px">所属部门：</TD>
          <TD>
              <asp:DropDownList ID="ddlDepartment" runat="server">
              </asp:DropDownList>
            </TD></TR>
        <TR>
          <TD style="width: 109px">客服账号：</TD>
          <TD>
              <asp:TextBox ID="txtLoginName" runat="server" ReadOnly="True"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD style="width: 109px">密码：</TD>
          <TD>
              <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD style="width: 109px">昵称：</TD>
          <TD>
              <asp:TextBox ID="txtNickName" runat="server"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD style="width: 109px">电子邮件：</TD>
          <TD>
              <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD><A </TD><td>
            <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="保存" 
                Width="67px" />
            </td></TR></TBODY></TABLE>
        </div>
 <!--尾部-->
 </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</td></tr>
   </table>
   </center>
</asp:Content>
