<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������������Ͷ�����޹�˾</title>
<!--#INCLUDE FILE="Safe/conn.asp"-->
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
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE5 {font-size: 9pt}
-->
</style></head>

<body>
<table width="900" height="500" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td rowspan="2">
			<img src="images/index_01.jpg" width="492" height="500" alt=""></td>
		<td>
			<img src="images/index_02.jpg" width="408" height="199" alt=""></td>
	</tr>
	<tr>
		<td width="408" height="301" align="center" valign="middle">
		<form id="form1" name="form1" method="post" action="?action=1" style="margin:0px">
		  <table width="79%" height="205" border="0" cellpadding="0" cellspacing="0" style="border:1px solid #009900">
            <tr>
              <td height="40" colspan="2" align="center" bgcolor="#79BD32" style="border-bottom:1px solid #006600"><span class="STYLE4">��&nbsp;��&nbsp;��&nbsp;¼</span></td>
            </tr>
            <tr>
              <td width="26%" height="30" align="right" bgcolor="#79BD32" style="border-bottom:1px dashed #006600 "><span class="STYLE4">�˺ţ�</span></td>
              <td width="74%" height="30" align="left" valign="middle" style="border-bottom:1px dashed #006600 "><label>
                &nbsp;
                <input name="admin_id" type="text" id="admin_id"  style="border:1px solid #00FF00; width:200px; height:20px"/>
              </label></td>
            </tr>
            <tr>
              <td height="30" align="right" bgcolor="#79BD32" style="border-bottom:1px dashed #006600 "><span class="STYLE4">���룺</span></td>
              <td height="30" align="left" valign="middle" style="border-bottom:1px dashed #006600 ">&nbsp;
              <input name="admin_pwd" type="password" id="admin_pwd"  style="border:1px solid #00FF00; width:200px; height:20px"/></td>
            </tr>
            <tr>
              <td height="30" align="right" bgcolor="#79BD32" style="border-bottom:1px dashed #006600 "><span class="STYLE4">��֤�룺</span></td>
              <td height="30" align="left" valign="middle" style="border-bottom:1px dashed #006600 ">&nbsp;
                <input name="reg" type="text" id="reg"  style="border:1px solid #00FF00; width:100px; height:20px"/>
			   <%
		 FOR i=1 to 4
		 suiji=suijishu()
		 suiji1=suiji1&suiji
		 response.Write "<img src='images/suiji/"&cstr(suiji)&".gif'>"
		 next
		
		 %>
              <input name="reg1" type="hidden" id="reg1" value="<%=suiji1%>" />			  </td>
            </tr>
            <tr>
              <td height="30" colspan="2" align="center" valign="middle" ><label>
                <input type="submit" name="Submit" value="��¼" />
              </label>
                <label>&nbsp;
                <input type="reset" name="Submit2" value="����" />
              </label></td>
            </tr>
          </table>
          </form>			</td>
	</tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="63" align="center" valign="middle"  style="border-top:1px solid #00CC00"><span class="STYLE5">ϵͳ��ѷֱ���:1024*768 @2009-12-22 v1.0�� <br />
      <br />
    ������������Ͷ�����޹�˾&nbsp;��Ȩ����</span></td>
  </tr>
</table>
</body>
</html>
<%
if request.QueryString("action")=1 then
	admin_id=request.Form("admin_id")
	admin_pwd=md5(request.Form("admin_pwd"))
	reg=request.Form("reg")
	reg1=request.Form("reg1")
	set rs=Server.CreateObject("ADODB.RecordSet")
	strSql = "select * from admin_admin where admin_id='"&admin_id&"'and admin_pwd='"&admin_pwd&"'"
	rs.open strSql,conn,1,3
	if rs.eof or rs.bof then
	response.write"<script>alert('�˻��������Ȩ�޳��������µ�½');history.go(-1);</script>"	
	else
	   if reg=reg1 then
	     session("admin_id")=rs("admin_id")
	     session("admin_pwd")=rs("admin_pwd")
		 session("admin_name")=rs("admin_name")
		 session("admin_limit")=rs("admin_limit")
		 rs.update
		 rs.close
  	     set rs=nothing
	     conn.close
	     set conn=nothing
		  response.write"<script>window.top.location.href='admin.html'</script>"
	    else
	      response.write"<script>alert('��֤�����');history.go(-1);</script>"
	    end if
	 end if	
end if
%>