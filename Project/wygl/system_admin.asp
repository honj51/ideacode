<html><head>
<style type="text/css">
<!--
body,td,th {
	font-size: 9pt;
	color: #000000;
}
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
.STYLE2 {
	font-size: 20pt;
	font-weight: bold;
}
-->
</style>
<!--#INCLUDE FILE="Safe/conn.asp"-->
<!--#INCLUDE FILE="Safe/md5.asp"-->
<%
	set rsnrbh=Server.CreateObject("adodb.recordset")
	sqlnrbh="select * from admin_admin where admin_id='"&session("admin_id")&"' and admin_pwd='"& session("admin_pwd")&"'"
	rsnrbh.open sqlnrbh,conn,1,3
	if rsnrbh.bof or rsnrbh.eof then
	response.Write("<script>alert('使用超时，请重新登录');location.href='index.html'</script>")
	end if
%>
<meta http-equiv=Content-Type content=text/html; charset=gb2312 charset=gb2312>
<title>系统后台管理</title>
<SCRIPT src="js/times.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/lj.js" type=text/javascript></SCRIPT>
</head>
<%
select case Request("menu")
case ""
index
case "top"
top2
end select
%>
<%sub top2 %>
<% end sub %>
<% sub index %>
<body style="MARGIN: 0px" scroll=no onResize=javascript:parent.carnoc.location.reload()>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="90" colspan="3" align="left" valign="middle"  bgcolor="#00CC66"><span class="STYLE2">&nbsp;&nbsp;深圳市兴联兴投资有限公司</span></td>
  </tr>
  <tr>
    <td width="18%" noWrap id="frmTitle">
<iframe frameborder="0" id="carnoc" name="carnoc" scrolling="auto" src="Menu_left.asp" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 180px; Z-INDEX: 2"> </iframe></td>
<td width="100%">
<iframe frameborder="0" id="right" name="right" scrolling="Auto" src="welcome.asp" style="HEIGHT:100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 2"> </iframe></td>
  </tr>
</table>
<script>
if(window.screen.width<'1024'){switchSysBar()}
</script>
</body>
<%
end sub
Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
%></html>

