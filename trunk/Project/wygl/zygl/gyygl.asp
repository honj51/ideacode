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
<SCRIPT src="../js/gyygl.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/gyygl2.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="gyygl.asp?Operation=lb">工业园列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<A onMouseover="return hidestatus()" href="gyygl.asp?Operation=tj">添加工业园</a>&nbsp;&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>工业园名称</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>工业面积（平方米）</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from gyy_lb  order by 序号 asc"
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
if rs0.recordcount=0 then
%>
      <tr>
        <td height="93" colspan="4" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有添加工业园</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="77" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("序号")%></td>
        <td width="317" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("工业园名称")%></td>
        <td width="293" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("工业园面积")%></td>
        <td width="234" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<a href="fclxgl.asp?Operation=lb&gyymc=<%=rs0("工业园名称")%>">编辑房产类型</a>&nbsp;
		<a href="?Operation=xg&id=<%=rs0("id")%>">编辑</a>&nbsp;
		<a href="?action=sc&id=<%=rs0("id")%>">删除</a></td>
      </tr>
<%
rs0.movenext()
next
%>
    </table>
	
<tr>
    <td height="30" colspan="2" align="center" valign="middle">
	<span class="STYLE1">
	现在是第<%=epage%>页一共有<%=rs0.pagecount%>页 
	<A onMouseover="return hidestatus()" href="?page=1">首页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>">前一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>">后一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>">末页</a>	</span></td>
  </tr>		
	</td>
  </tr>

<%
rs0.close
set rs0=nothing
 end if
if Operation="tj" then
%>
<tr>
  <td colspan="2" align="center" valign="middle">
  <form action="?action=tj&Operation=tj" method="post"  name="form1" id="form1" style="margin:0px;" onSubmit="return  denglu()">
    <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">序号：</td>
        <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="序号" type="text" id="序号"  style="border:1px solid #333333; width:50px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">工业园名称：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="工业园名称" type="text" id="工业园名称"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>        </td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">工业园面积：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="工业园面积" type="text" id="工业园面积"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>
          &nbsp;平方米 </td>
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
sql1="select * from gyy_lb where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">序号：</td>
          <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
            <input name="序号" type="text" id="序号"  style="border:1px solid #333333; width:50px; height:20px; margin-left:3px" value="<%=rs1("序号")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">工业园名称：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
            <input name="工业园名称" type="text" id="工业园名称"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("工业园名称")%>" autocomplete="off" readonly="true"/>
            &nbsp;不可更改 </td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">工业园面积：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
            <input name="工业园面积" type="text" id="工业园面积"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("工业园面积")%>" autocomplete="off"/>
            &nbsp;平方米 </td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
            <input name="Submit" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定"  onMouseover="return hidestatus()"/> <input name="Submit" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消" onMouseover="return hidestatus()"/>          </td>
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
sql="select * from gyy_lb where 工业园名称='"&request.Form("工业园名称")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("序号")=request.Form("序号")
rs("工业园名称")=request.Form("工业园名称")
rs("工业园面积")=request.Form("工业园面积")
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('添加成功');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('该工业园名称已存在!');history.go(-1);</script>"         
end if
end if

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from gyy_lb where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("序号")=request.Form("序号")
rs6("工业园名称")=request.Form("工业园名称")
rs6("工业园面积")=request.Form("工业园面积")
rs6.update
response.write"<script>alert('修改成功');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
set rs62=server.createobject("adodb.recordset")
sql62="select * from gyy_lb where id='"&request.QueryString("id")&"'"
rs62.open sql62,conn,1,3

set rs22=server.CreateObject("ADODB.RecordSet")
rs22.open "delete from gyy_fc_lb where 工业园名称='"&rs62("工业园名称")&"'",conn,1
rs22.close
set rs22=nothing

set rs222=server.CreateObject("ADODB.RecordSet")
rs222.open "delete from gyy_lb_fclx_lb_xflx where 工业园名称='"&rs62("工业园名称")&"'",conn,1
rs222.close
set rs222=nothing


set rs23=server.CreateObject("ADODB.RecordSet")
rs23.open "delete from gyy_lb_fclx_lb where 工业园名称='"&rs62("工业园名称")&"'",conn,1
rs23.close
set rs23=nothing

set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from gyy_lb where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing


response.write"<script>alert('删除成功');location.href='gyygl.asp';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>