<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Top.aspx.cs" Inherits="AdminManager_Top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link href="../Theme/Default/css/Manager.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Script/Common.js"></script>
<title>江西互动科技有限公司管理系统后台</title>
</head>
<body>
<div id="topMenu">
<div id="topLogo"></div>
<div id="top2"></div>
<div id="menuButton">
	<div class="TopFrameMenu">
		<a href="#" rel="external"><span style="color:#fff">帮助中心</span></a> | <a href="http://cms.19870123.cn/" rel="external"><span style="color:#fff">官方网站</span></a>
	</div>
	<div class="CmsMenu">
		<span><a href="SiteConfig.aspx" target="fraMain">系统设置</a></span> <span><a href="Theme.aspx" target="fraMain">主题管理</a></span> <span><a href="Plugin.aspx" target="fraMain">插件管理</a></span> <span><a href="../Default.aspx" >网站首页</a></span> <span><a href="Default.aspx?Logout=True" target="_top">退出登录</a></span><span class="version" id="spnCurrentVersion">程序内核:1.00</span>
	</div>
</div>
</div>
</body>
</html>