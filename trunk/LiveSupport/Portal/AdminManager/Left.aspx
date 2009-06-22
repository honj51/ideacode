<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="AdminManager_left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link href="../Theme/Default/css/Manager.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Script/Common.js"></script>
<title>江西互动科技有限公司管理系统后台</title>
</head>
<body style="background:url(../Theme/MDZS/Manager/leftbodybg.jpg)" onmousewheel="$('divMenuList').scrollTop +=-1*event.wheelDelta/12;">
<div id="leftContainer">
<div class="leftTop">
</div>
<div style="text-align: center; cursor: pointer;" onclick="$('divMenuList').scrollTop -= 50;"
onmouseup="clearInterval(scrollInterval);" onmousedown="Scroll(-10)">
<img alt="向上滚动" src="../Theme/Icon/up.gif" /></div>
<div id="divMenuList" class="menuList">

<span onclick="DisplayMenu('Module0', this)">基本信息管理</span>
<ul id="Module0" style="display: none">
<li><a href="Main.aspx" target="fraMain">后台管理首页</a></li>
<li><a href="SiteConfig.aspx" target="fraMain">基本信息设置</a></li>
<li><a href="Menu.aspx" target="fraMain">网站菜单设置</a></li>
<li><a href="Plugin.aspx" target="fraMain">网站插件设置</a></li>
<li><a href="ChangePwd.aspx" target="fraMain">修改管理密码</a></li>
<li><a href="Default.aspx?Logout=True" target="_parent">退出管理后台</a></li></ul>

<span onclick="DisplayMenu('Module1', this)">Portal 管理</span>
<ul id="Module1" style="display: none">
<li><a href="FriendLink.aspx" target="fraMain">产品与服务</a></li>
<li><a href="Affiche.aspx" target="fraMain"> 新闻管理</a></li>
<li><a href="SinglePage.aspx" target="fraMain">关于我们</a></li>
<li><a href="Vote.aspx" target="fraMain">联系我们</a></li>
<li><a href="Guestbook.aspx" target="fraMain">成功案例 </a></li>
</ul>

<span onclick="DisplayMenu('Module2', this)">LiveSupport管理</span>
<ul id="Module2" style="display: none">
<li><a href="AccountManager.aspx" target="fraMain">管理所有公司账号</a></li>
<li><a href="LiveSupportCount.aspx" target="fraMain">管理系统统计信息</a></li>
<li><a href="LiveSupportWatch.aspx" target="fraMain">管理系统实时监控状态</a></li>
<li><a href="#" target="fraMain">管理服务器状态</a></li>
</ul>

<span onclick="DisplayMenu('Module3', this)">图片信息管理</span>
<ul id="Module3" style="display: none">
<li><a href="Picture.aspx?op=i" target="fraMain">发布新的图片</a></li>
<li><a href="Picture.aspx" target="fraMain">管理所有图片</a></li>
<li><a href="Picture.aspx?l=|p|" target="fraMain">待审核的图片</a></li>
<li><a href="Sort.aspx?mid=1" target="fraMain">图片类别管理</a></li>
<li><a href="PayList.aspx?mid=1" target="fraMain">图片支付记录</a></li>
</ul>

<span onclick="DisplayMenu('Module4', this)">软件信息管理</span>
<ul id="Module4" style="display: none">
<li><a href="Download.aspx?op=i" target="fraMain">发布新的软件</a></li>
<li><a href="Download.aspx" target="fraMain">管理所有软件</a></li>
<li><a href="Download.aspx?l=|p|" target="fraMain">待审核的软件</a></li>
<li><a href="Sort.aspx?mid=2" target="fraMain">软件类别管理</a></li>
<li><a href="PayList.aspx?mid=2" target="fraMain">软件支付记录</a></li></ul>

<asp:Literal ID="ltlPluginMenu" runat="server" />

<span  onclick="DisplayMenu('Module5', this)">人事会员管理</span>
<ul id="Module5" style="display:none">
<li><a href="Member.aspx" target="fraMain">现有会员管理</a></li>
<li><a href="Member.aspx?op=i" target="fraMain">添加新的会员</a></li>
<li><a href="MemberGroup.aspx" target="fraMain">现有部门管理</a></li>
<li><a href="MemberGroup.aspx?op=i" target="fraMain">添加新的部门</a></li></ul>

<span onclick="DisplayMenu('Module7', this)">软件日志管理</span>
<ul id="Module7" style="display: none">
<li><a href="HandleList.aspx" target="fraMain">网站操作日志</a></li>
<li><a href="ExceptionList.aspx" target="fraMain">软件异常日志</a></li></ul>

<span onclick="DisplayMenu('Module8', this)">数据文件管理</span>
<ul id="Module8" style="display: none">
<li><a href="DBM.aspx" target="fraMain">备份文件列表</a></li>
<li><a href="DBM.aspx?t=b" target="fraMain">备份数据文件</a></li>
<li><a href="DBM.aspx?t=c" target="fraMain">压缩数据文件</a></li></ul>

</div>
<div style="text-align: center; padding-top: 5px; cursor: pointer;" onclick="$('divMenuList').scrollTop += 50;" onmouseup="clearInterval(scrollInterval);" onmousedown="Scroll(10)">
<img src="../Theme/Icon/down.gif" alt="向下滚动" /></div>
<div class="leftBottom">
</div>
</div>


</body>
</html>