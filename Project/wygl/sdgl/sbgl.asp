<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<%
if session("role_name")<>"管理员" then
set rsqxgl=server.createobject("adodb.recordset")
sqlqxgl="select * from Jurisdiction where role_name='"&session("role_name")&"'"
rsqxgl.open sqlqxgl,conn,1,3
if rsqxgl.recordcount=0 then
response.write"<script>alert('您没有该权限');history.go(-1)</script>"
elseif rsqxgl("jsgl")<>1 then
response.write"<script>alert('您没有该权限');history.go(-1)</script>"
end if
end if
rsqxgl.close
set rsqxgl=nothing
%>
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<%
Operation=request.QueryString("Operation")
action=request.QueryString("action")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<SCRIPT src="../js/Role.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/Role2.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/lj.js" type=text/javascript></SCRIPT>
<title>无标题文档</title>
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
.STYLE1 {
	font-size: 10pt;
	font-weight: bold;
}
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
-->
</style>

</head>
<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2" align="left" valign="middle"><strong><img src="../images/1_1.gif" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="Role.asp?Operation=lb">用户水表总汇&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onMouseOver="return hidestatus()" href="Role.asp?Operation=tj">添加本月用户水表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/1_1.gif" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="Role.asp?Operation=lb">水表基本规则管理</a></strong></td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">
	<form id="form3" name="form3" method="post" action=""  style="margin:0px">
	  <table width="616" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="86" height="30" align="right" valign="middle"><strong>工业园区：</strong></td>
          <td width="119" height="30"><label>
            <select name="select">
            </select>
          </label></td>
          <td width="45" height="30" align="right" valign="middle"><strong>房间：</strong></td>
          <td width="61" height="30"><span style="border-bottom:1px solid #00376F;">
            <input name="role_id2" type="text" id="role_id2"  style="border:1px solid #333333; width:50px; height:20px; margin-left:3px" autocomplete="off"/>
          </span></td>
          <td width="46" height="30" align="right" valign="middle"><strong>客户：</strong></td>
          <td width="90" height="30"><span style="border-bottom:1px solid #00376F;">
            <input name="role_id3" type="text" id="role_id3"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px" autocomplete="off"/>
          </span></td>
          <td width="42" height="30" align="right" valign="middle"><strong>月份：</strong></td>
          <td width="78" height="30"><select name="select2">
          </select></td>
          <td width="49" height="30"><label>
            <input type="submit" name="Submit" value="查询" />
          </label></td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5%" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td width="16%" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>工业园区</strong></td>
        <td width="10%" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>房间</strong></td>
        <td width="9%" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>客户</strong></td>
        <td width="15%" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>月份</strong></td>
        <td width="15%" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>吨数</strong></td>
        <td width="15%" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>应收费</strong></td>
        <td width="15%" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from role order by role_id asc"
rs0.open sql0,conn,3
rs0.pagesize=10
if request("page")<>"" then
  epage=cint(request("page"))
   if epage<1 then epage=1
   if epage>rs0.pagecount then epage=rs0.pagecount
else
epage=1
end if
rs0.absolutepage=epage
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>  
      <tr>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;</td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;</td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;</td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;</td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;</td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;</td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F;">&nbsp;</td>
      </tr>
<%
rs0.movenext()
next
rs0.close
set rs0=nothing
%>
    </table></td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="center" valign="middle">
	<span class="STYLE1">
	现在是第<%=epage%>页一共有<%=rs0.pagecount%>页 
	<A onMouseover="return hidestatus()" href="Role.asp?page=1">首页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="Role.asp?page=<%=epage-1%>">前一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="Role.asp?page=<%=epage+1%>">后一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="Role.asp?page=<%=rs0.pagecount%>">末页</a>	</span></td>
  </tr>

<% end if
if Operation="tj" then
%>
<tr>
  <td colspan="2" align="center" valign="middle"><form action="Role.asp?action=tj&Operation=tj" method="post"  name="form1" id="form1" style="margin:0px;"  onsubmit="return denglu()">
    <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">角色排列序号：</td>
        <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="role_id" type="text" id="role_id"  style="border:1px solid #333333; width:50px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">角色名称：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="role_name" type="text" id="role_name"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" maxlength="3" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit2" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onMouseover="return hidestatus()"/>
            <input name="Submit2" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消" onMouseover="return hidestatus()"/>        </td>
      </tr>
    </table>
  </form></td>
</tr>
<% end if
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from role where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
  <td colspan="2" align="center" valign="middle">  </td>
</tr>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="Role.asp?action=xg&id=<%=rs1("id")%>&Operation=xg&page=<%=epage%>" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu1()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">角色排列序号：</td>
          <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
            <input name="role_id1" type="text" id="role_id1"  style="border:1px solid #333333; width:50px; height:20px; margin-left:3px" value="<%=rs1("role_id")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">角色名称：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="role_name1" type="text" id="role_name1"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("role_name")%>" maxlength="3" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
            <input name="Submit1" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onMouseover="return hidestatus()"/> <input name="Submit1" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消" onMouseover="return hidestatus()"/>          </td>
        </tr>
      </table>
      </form>    </td>
  </tr>
<%end if
rs1.close
set rs1=nothing
%>
</table>
</body>
</html>
<%
if action="tj" then
set rs=server.createobject("adodb.recordset")
sql="select * from role where role_name='"&request.Form("role_name")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("role_id")=request.Form("role_id")
rs("role_name")=request.Form("role_name")
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('添加成功');location.href='role.asp?Operation=tj';</script>"
else
response.write"<script>alert('该角色已存在!');history.go(-1);</script>"         
end if
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from role where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('删除成功');location.href='role.asp?page="&epage&"';</script>"
end if


if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from role where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("role_id")=request.Form("role_id1")
rs6("role_name")=request.Form("role_name1")
rs6.update
response.write"<script>alert('修改成功');location.href='role.asp?Operation=lb&page="&epage&"';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if
conn.close
set conn=nothing
%>