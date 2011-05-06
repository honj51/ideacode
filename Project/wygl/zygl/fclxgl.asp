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
<SCRIPT src="../js/fclxgl.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="gyygl.asp?Operation=lb">工业园列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<A onMouseover="return hidestatus()" href="gyygl.asp?Operation=tj">添加工业园</a>&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;当前位置：工业园列表&nbsp;》&nbsp;
	<a href="?gyymc=<%=request.QueryString("gyymc")%>"><%=request.QueryString("gyymc")%></a>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<form id="form1" name="form1" method="post" action="?action=tj&Operation=tj&gyymc=<%=request.QueryString("gyymc")%>" style="margin:opx" onSubmit="return  denglu()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>房产类型</strong></td>
          <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
        </tr>
        <tr>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="序号" type="text" id="序号"  style="border:1px solid #333333; width:98%; height:20px; margin-left:3px" autocomplete="off"/>          </td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="房产类型" type="text" id="房产类型"  style="border:1px solid #333333; width:98%; height:20px; margin-left:3px" autocomplete="off"/>         </td>
          <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onmouseover='return hidestatus()'/></td>
        </tr>
        <%
set rs0=server.createobject("adodb.recordset")
sql0="select * from gyy_lb_fclx_lb where 工业园名称='"&request.QueryString("gyymc")&"' order by 序号 asc"
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
          <td height="93" colspan="4" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有添加房产类型</td>
        </tr>
        <%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
        <tr>
          <td width="124" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
          <td width="519" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("房产类型")%></td>
          <td width="278" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"> 
		   <a href="fclxgl_fcxf.asp?gyymc=<%=request.QueryString("gyymc")%>&fclx=<%=rs0("房产类型")%>">编辑房产消费列表</a>		   &nbsp; 
		   <a href="?action=sc&id=<%=rs0("id")%>&gyymc=<%=request.QueryString("gyymc")%>">删除</a></td>
        </tr>
        <%
rs0.movenext()
next

%>
      </table>
        </form>
  <tr>
    <td height="30" colspan="2" align="center" valign="middle">
	<span class="STYLE1">
	现在是第<%=epage%>页一共有<%=rs0.pagecount%>页 
	<A onMouseover="return hidestatus()" href="?page=1&gyymc=<%=request.QueryString("gyymc")%>">首页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>&gyymc=<%=request.QueryString("gyymc")%>">前一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>&gyymc=<%=request.QueryString("gyymc")%>">后一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>&gyymc=<%=request.QueryString("gyymc")%>">末页</a>	</span></td>
  </tr>		
	</td>
  </tr>

<% 
rs0.close
set rs0=nothing
end if
%>
</table>
</body>
</html>
<%
if action="tj" then
set rs=server.createobject("adodb.recordset")
sql="select * from gyy_lb_fclx_lb where 房产类型='"&request.Form("房产类型")&"' and 工业园名称='"&request.QueryString("gyymc")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("序号")=request.Form("序号")
rs("工业园名称")=request.QueryString("gyymc")
rs("房产类型")=request.Form("房产类型")
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('添加成功');location.href='?gyymc="&request.QueryString("gyymc")&"';</script>"
else
response.write"<script>alert('该类型已存在!');history.go(-1);</script>"         
end if
end if


if action="sc"	then
set rs62=server.createobject("adodb.recordset")
sql62="select * from gyy_lb_fclx_lb where id='"&request.QueryString("id")&"'"
rs62.open sql62,conn,1,3

set rs22=server.CreateObject("ADODB.RecordSet")
rs22.open "delete from gyy_lb_fclx_lb_xflx where 工业园名称='"&rs62("工业园名称")&"' and 房产类型='"&rs62("房产类型")&"'",conn,1
rs22.close
set rs22=nothing


set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from gyy_lb_fclx_lb where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing

response.write"<script>alert('删除成功');location.href='?gyymc="&request.QueryString("gyymc")&"';</script>"
end if


%>


<%
conn.close
set conn=nothing
%>