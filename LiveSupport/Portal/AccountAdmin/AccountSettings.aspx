<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountSettings.aspx.cs" Inherits="AccountAdmin_AccountSettings" Title="帐户设置" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="pagetitle">&#36134;&#25143;&#35774;&#32622;</div>
    <div id="content-container-three-column" style="height: 568px">
        <div id="content-side1-three-column">
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
<div><img src="Images/2.jpg" /></div>
<DIV class=sdmenu id=my_menu style="margin-left:0px;"> 

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">基本设置</SPAN> 
<A href="#" target=_blank>账户首页</A>

</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客服管理</SPAN> 
<A href="DepartmentManager.aspx">部门设置</A> 
<A href="OperatorsManagment.aspx">客服管理</A> 
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
<img src="Images/4.jpg" />
</DIV>
        </div>
        <div id="content-main-three-column">
        </div>
        <div id="content-side2-three-column">
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>

