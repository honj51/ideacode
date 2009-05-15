<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetCode.aspx.cs" Inherits="Default2" Title="无标题页" %>

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
     手动安装代码</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px; ">
    <!--头部--->
      <div id="content-main-three-column" style="text-align:left;">
        <!--内容-->
      <TABLE style=" width:475px; text-align:left;" cellSpacing=1 cellPadding=0 border=1>
  <TBODY>
  <TR>
    <TD colSpan=2>客服图标代码</TD></TR>
  <TR>
    <TD >客服图标：</TD>
    <TD><INPUT onclick=editCode() type=radio value=0 name=kf_fixed> 固定客服图标 &nbsp; &nbsp; 
      <INPUT onclick=editCode() type=radio CHECKED value=1 name=kf_fixed> 漂浮客服图标 
<!--
								<input type="radio" name="kf_fixed" value="2" onclick="editCode()" />	列表形式	
								--> </TD></TR>
    <TD >图标位置：</TD>
    <TD ><INPUT id=pos_1 onclick=editCode() type=radio CHECKED value=cn name=locate> 左边 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <INPUT id=language onclick=editCode() type=radio value=en name=locate>右边</TD></TR>
  <TR id=posmodel_tr>
    <TD >代码：</TD>
    <TD ><TEXTAREA class=textarea id=codepic0 name=codepic0 rows=5 readOnly cols=45> &lt;script src="http://kf.5251.net/js/yh.jsp?companyId=6707&amp;style=15131&amp;keyword=1"&gt;&lt;/script&gt;</TEXTAREA></TD></TR>
  <TR>
    <TD id=kflogo vAlign=top align=middle colSpan=2>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD scope=col colSpan=2 
height=22>&nbsp;</TD></TR>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD>&nbsp;</TD>
    <TD><INPUT id=kf_city type=hidden name=kf_city> <INPUT class=green id=Submit onclick=editCode(); type=button value=获取代码 name=Submit> 
<INPUT onClick="javascript:Dr_copy(document.getElementById('codepic0'))" type=button value=复制 name=Submit2> 
      &nbsp;&nbsp;
      <P></P></TD></TR></TBODY></TABLE>
      </div>
       <!--导航结束-->
       </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</td></tr>
   </table>
   </center>
</asp:Content>

