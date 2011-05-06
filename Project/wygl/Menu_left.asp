<!--#INCLUDE FILE="Safe/conn.asp"-->
<!--#INCLUDE FILE="Safe/md5.asp"-->
<!--#INCLUDE FILE="Safe/nrbh.asp"-->

<%
sql="select * from  role_lb  where role_name='"&session("admin_limit")&"'"
set rs2=server.createobject("adodb.recordset")
rs2.open sql,conn,1,1
%>
<SCRIPT src="js/lj.js" type=text/javascript></SCRIPT>
<style type="text/css">
<!--
body {
	margin-top: 0px;
	margin-bottom: 10px;
	margin-left: 12px;
}
.aa {
	font-size: 9pt;
	color: #FFFFFF;
}
.aa:link {
	text-decoration: none;
}
.aa:visited {
	text-decoration: none;
	color: #FFFFFF;
}
.aa:hover {
	text-decoration: none;
	color: #FFFFFF;
}
.aa:active {
	text-decoration: none;
	color: #FFFFFF;
}
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
.STYLE2 {color: #FFFFFF}
-->
</style>
<STYLE type="text/css">
A:link { COLOR: #000000; FONT-SIZE: 12px; TEXT-DECORATION: none}
A:visited { COLOR: #000000; FONT-SIZE: 12px; TEXT-DECORATION: none}
A:hover { COLOR: #666666; FONT-SIZE: 12px; TEXT-DECORATION: none}
BODY { FONT-SIZE: 12px;}
TD { FONT-SIZE: 12px; line-height: 150%}
body {background-color: #00CC66;}
</style>
<table border=0 align=center cellpadding=0 cellspacing=0 bgcolor="#3F496D" id=mnuList style="WIDTH:158px;HEIGHT: 100%">
<tr>
<td align="center" valign="top"  height="100%">
<table width="100%"  border=0 align=center cellpadding=0 cellspacing=0>
<tr><td height="30" align="left" valign="middle">
&nbsp;&nbsp;<span class="STYLE2"><strong>您好：<%=session("admin_name")%></strong></span>
</td>
<td width="50px" height="30" align="center" valign="middle"><A onMouseover="return hidestatus()"  href="out.asp" target="_top"><strong><span style="cursor:hand;" class="aa" id="aa">注销</span></strong></a></td>
</tr>
</table>
<%
if session("admin_limit")="总管理员" or rs2("数据录入")=1 or  rs2("缴费管理")=1 then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>收费管理</strong></span></td>
  </tr>
 <%if session("admin_limit")="总管理员" or rs2("数据录入")=1 then%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="sfgl/sjlr.asp" target="right">数据录入</a></td>
  </tr>
 <%end if
 if session("admin_limit")="总管理员" or rs2("缴费管理")=1 then%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="sfgl/jf.asp" target="right">缴费管理</a></td>
  </tr>
 <%end if%>
</table>

<%
end if
if session("admin_limit")="总管理员" or rs2("工业园管理")=1 or  rs2("房产管理")=1 or  rs2("客户管理")=1 then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>资源管理</strong></span></td>
  </tr>
<%
if session("admin_limit")="总管理员" or rs2("工业园管理")=1  then
%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="zygl/gyygl.asp" target="right">工业园管理</a></td>
  </tr>
<%
end if
if session("admin_limit")="总管理员"  or  rs2("房产管理")=1  then
%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zygl/fcgl.asp" target="right">房产管理</a></td>
  </tr>
<%
end if 
if session("admin_limit")="总管理员" or   rs2("客户管理")=1 then
%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zygl/khgl.asp" target="right">客户管理</a></td>
  </tr>
<%
end if 
%>
</table>
<%
end if
if session("admin_limit")="总管理员" or rs2("预定管理")=1 or rs2("租凭合同管理")=1 or rs2("合同到期提示")=1 or rs2("收款分类统计")=1 or rs2("收款详细统计")=1 then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>租凭管理</strong></span></td>
  </tr>
 <%
if session("admin_limit")="总管理员" or rs2("预定管理")=1  then 
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/ydgl.asp" target="right">预定管理</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="总管理员"  or rs2("租凭合同管理")=1 then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/zpht.asp" target="right">租凭合同管理</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="总管理员"  or rs2("合同到期提示")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/htdqts.asp" target="right">合同到期提示</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="总管理员" or rs2("收款分类统计")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18" /></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/zbxxtj.asp" target="right">收款分类统计</a></td>
  </tr>
 <%end if 
 if session("admin_limit")="总管理员" or rs2("收款详细统计")=1 then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18" /></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/fltj.asp" target="right">收款详细统计</a></td>
  </tr>
  <%
  end if
  %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="ls/index.asp" target="right">临时开票</a></td>
  </tr>
</table>
<%
end if
if session("admin_limit")="总管理员" or rs2("角色权限")=1 or rs2("管理员管理")=1 or rs2("修改本身密码")=1 or rs2("退出系统")=1  then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>系统管理</strong></span></td>
  </tr>
 <%
 if session("admin_limit")="总管理员" or rs2("角色权限")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="xtgl/Role.asp" target="right">角色权限</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="总管理员"  or rs2("管理员管理")=1 then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="xtgl/glygl.asp" target="right">管理员管理</a></td>
  </tr>
 <%end if
 if session("admin_limit")="总管理员" or rs2("修改本身密码")=1   then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="xtgl/xgbsmm.asp" target="right">修改本身密码</a></td>
  </tr>
 <%end if
 if session("admin_limit")="总管理员"or rs2("退出系统")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="out.asp" target="_top">退出系统</a></td>
  </tr>
  <%end if%>
</table>
<%end if%>
</td>
</tr>
	<tr> 
		<td bgcolor="#ffffff" id=outLookBarShow style="HEIGHT: 100%" valign=top align="left" name="outLookBarShow">
      </td>
	</tr>
</table>