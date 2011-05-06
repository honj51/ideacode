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
<SCRIPT src="../js/glygl.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/glygl2.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=lb">管理员列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=tj">添加管理员</a></strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>管理员账号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>名称</strong></td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>角色</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from admin_admin  order by id asc"
rs0.open sql0,conn,3
if rs0.recordcount=0 then
%>
      <tr>
        <td height="93" colspan="5" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有添加管理员</td>
        </tr>
<%
end if
for i=1 to rs0.recordcount
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="57" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("admin_id")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("admin_name")%></td>
        <td width="131" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("admin_limit")%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<%if  rs0("admin_id")="admin" then%>
		<a href="?Operation=xg&id=<%=rs0("id")%>">编辑</a>&nbsp;&nbsp;
		<span style="color:#999999">删除</span>
		<%else%>
		<a href="?Operation=xg&id=<%=rs0("id")%>">编辑</a>&nbsp;&nbsp;
		<a href="?action=sc&id=<%=rs0("id")%>">删除</a>
		<%end if%>
		</td>
      </tr>
<%
rs0.movenext()
next
rs0.close
set rs0=nothing
%>
    </table></td>
  </tr>

<% end if
if Operation="tj" then
%>
<tr>
  <td colspan="2" align="center" valign="middle">
  <form action="?action=tj&Operation=tj" method="post"  name="form1" id="form1" style="margin:0px;" onSubmit="return  denglu()">
    <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">账号：</td>
        <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_id" type="text" id="admin_id"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>        </td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">名称：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_name" type="text" id="admin_name"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">密码：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_pwd" type="password" id="admin_pwd"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">再次输入密码：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_pwd1" type="password" id="admin_pwd1"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">角色：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
	
		<label>
          <select name="admin_limit" id="admin_limit" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
		   <option value="请选择">请选择</option>
<%
set rsjs=server.createobject("adodb.recordset")
sqljs="select * from role where role_name<>'总管理员' order by role_id asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>	
            <option value="<%=rsjs("role_name")%>"><%=rsjs("role_name")%></option>
<%
rsjs.movenext()
next
%>
          </select>
        </label></td>
      </tr>
      <tr></tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">电话：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="tel" type="text" id="tel"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">qq：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="qq" type="text" id="qq"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">邮箱：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="email" type="text" id="email"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onMouseover='return hidestatus()'/>
            <input name="Submit4" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>        </td>
      </tr>
    </table>
  </form></td>
</tr>
<%end if
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from admin_admin where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">账号：</td>
          <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_id" type="text" id="admin_id"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("admin_id")%>" autocomplete="off" readonly="true"/>          </td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">名称：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_name" type="text" id="admin_name"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("admin_name")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">密码：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_pwd" type="password" id="admin_pwd"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="******" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">再次输入密码：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="admin_pwd1" type="password" id="admin_pwd1"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="******" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">角色：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
            <select name="admin_limit" id="admin_limit">
              <option value="<%=rs1("admin_limit")%>"><%=rs1("admin_limit")%></option>
              <%
set rsjs=server.createobject("adodb.recordset")
sqljs="select * from role where role_name<>'总管理员' order by role_id asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>
              <option value="<%=rsjs("role_name")%>"><%=rsjs("role_name")%></option>
              <%
rsjs.movenext()
next
%>
            </select>
          </label></td>
        </tr>
        <tr></tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">电话：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="tel" type="text" id="tel"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("tel")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">qq：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="qq" type="text" id="qq"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("qq")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">邮箱：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="email" type="text" id="email"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("email")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onmouseover='return hidestatus()'/>
              <input name="Submit42" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>          </td>
        </tr>
      </table>
	</form>    </td>
  </tr>
  <% end if
  rs1.close
set rs1=nothing
  %>
</table>
</body>
</html>
<%
if action="tj" then
set rs=server.createobject("adodb.recordset")
sql="select * from admin_admin where admin_id='"&request.Form("admin_id")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("admin_id")=request.Form("admin_id")
rs("admin_name")=request.Form("admin_name")
rs("admin_pwd")=md5(request.Form("admin_pwd"))
rs("admin_limit")=request.Form("admin_limit")
rs("tel")=request.Form("tel")
rs("qq")=request.Form("qq")
rs("email")=request.Form("email")




rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('添加成功');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('该账号已存在!');history.go(-1);</script>"         
end if
end if

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from admin_admin where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("admin_id")=request.Form("admin_id")
rs6("admin_name")=request.Form("admin_name")
if request.Form("admin_pwd")<>"******" then
rs6("admin_pwd")=md5(request.Form("admin_pwd"))
end if
rs6("admin_limit")=request.Form("admin_limit")
rs6("tel")=request.Form("tel")
rs6("qq")=request.Form("qq")
rs6("email")=request.Form("email")

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

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from admin_admin where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('删除成功');location.href='glygl.asp';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>