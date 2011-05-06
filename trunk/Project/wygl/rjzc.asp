<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>软件注册</title>
<style type="text/css">
<!--
.STYLE6 {color: #000000}
-->
</style>
<!--#INCLUDE FILE="Safe/conn1.asp"-->
<!--#include file="Safe/Function.asp"-->
<!--#INCLUDE FILE="Safe/md5.asp"-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-size: 12pt;
	color: #000000;
}
.STYLE4 {
	color: #000000;
	font-weight: bold;
}
-->
</style></head>

<body>
<%
set rs=Server.CreateObject("ADODB.RecordSet")
strSql = "select * from reg where id=1"
rs.open strSql,conn1,1,3	
if request.QueryString("action")="" then
%>

<form id="form2" name="form2" method="post" action="?action=1" style="margin-top:100px">
  <table width="321" height="205" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ECE9D8" style="border:1px solid #B1C3D9">
    <tr>
      <td height="40" colspan="2" align="center" bgcolor="#ECE9D8" style="border-bottom:1px solid #B1C3D9"><span class="STYLE4 STYLE6">软件注册</span></td>
    </tr>
    <tr>
      <td width="31%" height="30" align="right" bgcolor="#ECE9D8"><span class="STYLE4">公司名称：</span></td>
      <td width="69%" height="30" align="left" valign="middle">&nbsp;
<input name="公司名称" type="text" id="公司名称"  style="border:1px solid #B1C3D9; width:200px; height:20px" value="<%=rs("gsmc")%>" autocomplete="off" /> </td>
    </tr>
    <tr>
      <td height="30" align="right" bgcolor="#ECE9D8" ><span class="STYLE4">公司网址：</span></td>
      <td height="30" align="left" valign="middle" >&nbsp;
 <input name="公司网址" type="text" id="公司网址"  style="border:1px solid #B1C3D9; width:200px; height:20px" autocomplete="off" value="<%=rs("gswz")%>"/></td>
    </tr>
    <tr>
      <td height="30" align="right" valign="middle" bgcolor="#ECE9D8" ><span class="STYLE4"> 注册人：</span></td>
      <td height="30" align="left" valign="middle" >&nbsp;
          <input name="注册人" type="text" id="注册人"  style="border:1px solid #B1C3D9; width:200px; height:20px" autocomplete="off" value="<%=rs("zcr")%>"/></td>
    </tr>
    <tr>
      <td height="30" colspan="2" align="center" valign="middle" ><input type="submit" name="Submit2" value="下一步" />
      </td>
    </tr>
  </table>
</form>
<%elseif request.QueryString("action")=2 then%>
<form id="form1" name="form1" method="post" action="?action=3" style="margin-top:100px">
  <table width="321" height="205" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ECE9D8" style="border:1px solid #B1C3D9">
    <tr>
      <td height="40" colspan="2" align="center" bgcolor="#ECE9D8" style="border-bottom:1px solid #B1C3D9">
	  <span class="STYLE4 STYLE6">软件注册</span></td>
    </tr>
    <tr>
      <td width="26%" height="30" align="right" bgcolor="#ECE9D8"><span class="STYLE4">序号：</span></td>
      <td width="74%" height="30" align="left" valign="middle"> &nbsp;

<input name="序号" type="text" id="序号"  style="border:1px solid #B1C3D9; width:200px; height:20px" value="<%=rs("xh")%>" autocomplete="off"  readonly="true"/>
</td>
    </tr>
    <tr>
      <td height="30" align="right" bgcolor="#ECE9D8" ><span class="STYLE4">注册号：</span></td>
      <td height="30" align="left" valign="middle" >&nbsp;
<input name="注册号" type="text" id="注册号"  style="border:1px solid #B1C3D9; width:200px; height:20px" autocomplete="off" value="<%=rs("zch")%>"/>
</td>
    </tr>
    <tr>
      <td height="30" align="right" valign="middle" bgcolor="#ECE9D8" ><span class="STYLE4">  注册码：</span></td>
      <td height="30" align="left" valign="middle" >&nbsp;
      <input name="注册码" type="text" id="注册码"  style="border:1px solid #B1C3D9; width:200px; height:20px" autocomplete="off" value="<%=rs("zcm")%>"/></td>
    </tr>
    <tr>
      <td height="30" colspan="2" align="center" valign="middle" >
        <input type="submit" name="Submit" value="提交注册信息" />
</td>
    </tr>
  </table>
</form>
<%end if%>
</body>
</html>
<%
if request.QueryString("action")=1 then
	set rs=Server.CreateObject("ADODB.RecordSet")
	strSql = "select * from reg where id=1"
	rs.open strSql,conn1,1,3	
	     rs("gsmc")=request.Form("公司名称")
	     rs("gswz")=request.Form("公司网址")
		 rs("zcr")=request.Form("注册人")
	     rs("xh")=md5(""&request.Form("公司名称")&""&request.Form("公司网址")&"")
		 rs.update	 
		  response.write"<script>location.href='?action=2'</script>"
rs.close
set rs=nothing
 conn.close
set conn=nothing
end if

if request.QueryString("action")=3 then
xh=request.Form("序号")
zch=request.Form("注册号")
zcm=request.Form("注册码")
if zch=md5(xh) and zcm=md5(zch) then

	set rs=Server.CreateObject("ADODB.RecordSet")
	strSql = "select * from reg where id=1"
	rs.open strSql,conn,1,3	
	     rs("zch")=zch
		 rs("zcm")=zcm
		 rs.update
		 
		 
		  response.write"<script>alert('注册成功');window.top.location.href='index.html'</script>"
else
	      response.write"<script>alert('注册号和注册码不对');history.go(-1);</script>"
end if
rs.close
set rs=nothing
 conn.close
set conn=nothing
end if
%>