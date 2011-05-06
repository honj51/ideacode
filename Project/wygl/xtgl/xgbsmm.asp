<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<%
Operation=request.QueryString("Operation")
action=request.QueryString("action")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>部门管理</title>
<SCRIPT src="../js/lj.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/xgbsmm.js" type=text/javascript></SCRIPT>
<style type="text/css">
<!--
body,td,th {
	font-size: 9pt;
	color: #000000;
}
body {
	margin-left: 0px;
	margin-top: 20px;
	margin-right: 0px;
	margin-bottom: 20px;
}
a {
	font-size: 9pt;
}
a:link {
	color: #000000;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: underline;
	color: #666666;
}
a:active {
	text-decoration: none;
	color: #666666;
}
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
.STYLE1 {color: #666666}
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=lb">修改本身密码</a>&nbsp;&nbsp;</strong></td>
  </tr>
<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from admin_admin where admin_id='"&session("admin_id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">密码：</td>
          <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_pwd" type="password" id="admin_pwd"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="******" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">再次输入密码：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_pwd1" type="password" id="admin_pwd1"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="******" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onmouseover='return hidestatus()'/>
              <input name="Submit42" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>          </td>
        </tr>
      </table>
	</form>    </td>
  </tr>
  <% 
  rs1.close
set rs1=nothing
  %>
</table>
</body>
</html>
<%


if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from admin_admin where admin_id='"&session("admin_id")&"'"
rs6.open sql6,conn,1,3
if request.Form("admin_pwd")<>"******" then
rs6("admin_pwd")=md5(request.Form("admin_pwd"))
end if
set rs62=server.CreateObject("ADODB.RecordSet")
sql62= "delete from admin_admin_lb where admin_id='"&request.Form("admin_id")&"'"
rs62.open sql62,conn,1,3
rs62.close

rs6.update
response.write"<script>alert('修改成功');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if
%>
<%
conn.close
set conn=nothing
%>