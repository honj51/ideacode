<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->

<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from zpgl where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3

set rs0=server.createobject("adodb.recordset")
sql0="select * from gyy_lb_fclx_lb_xflx where ��ҵ԰����='"&rs1("������ҵ԰")&"' and ��������='"&rs1("��������")&"' order by ��� asc"
rs0.open sql0,conn,3
		
Operation=request.QueryString("Operation")
action=request.QueryString("action")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���Ź���</title>
<SCRIPT src="../js/fclxgl_fcxf.js" type=text/javascript></SCRIPT>
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
a {evt:expression(window.status='������������Ͷ�����޹�˾')}
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="zpht.asp?Operation=lb">��ͬ�б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onMouseOver="return hidestatus()" href="zpht.asp?Operation=tj">��Ӻ�ͬ</a></strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;��ҵ԰���ƣ�<%=rs1("������ҵ԰")%>&nbsp;&nbsp;�������ͣ�<%=rs1("��������")%>&nbsp;&nbsp;����������<%=rs1("��������")%>&nbsp;&nbsp;�û����ƣ�<%=rs1("�ͻ�����")%>&nbsp;&nbsp;�û����룺<%=rs1("�ͻ�����")%>
  <tr>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	
	
	<form id="form1" name="form1" method="post" action="?action=tj&Operation=tj&id=<%=request.QueryString("id")%>" style="margin:opx" onSubmit="return  denglu()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������Ŀ</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>ֵ</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���ɽ�</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>ǰ�ڶ���</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>˵��</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��Ŀ����</strong></td>
          </tr>
        <%
if rs0.recordcount=0 then
%>
        <tr>
          <td height="93" colspan="13" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û����Ŀ</td>
        </tr>
        <%
end if
for i=1 to rs0.recordcount
if rs0.bof or rs0.eof then exit for
set rs101=server.createobject("adodb.recordset")
sql101="select * from zpgl_lx_lb where ��ͬ���='"&rs1("����")&"' and ������Ŀ='"&rs0("������Ŀ")&"' "
rs101.open sql101,conn,3


set rs1011=server.createobject("adodb.recordset")
sql1011="select * from user_sf_lb where ��ͬ���='"&rs1("����")&"' and �շ���Ŀ='"&rs0("������Ŀ")&"' and  ����='"&rs1("��ͬ��ʼʱ��")&"'"
rs1011.open sql1011,conn,3

%>
        <tr>
          <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
          <td width="178" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="������Ŀ<%=i%>" type="text" id="������Ŀ<%=i%>"  style="border:1px solid #333333;  width:150px ; height:20px; background-color:#CCCCCC" value="<%=rs0("������Ŀ")%>" autocomplete="off" readonly="true"/></td>
          <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="��������<%=i%>" type="text" id="��������<%=i%>"  style="border:1px solid #333333; width:50px ;height:20px; background-color:#CCCCCC" value="<%=rs0("��������")%>" autocomplete="off" readonly="true"/></td>
          <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs101("ֵ")="" then%>
<input name="ֵ<%=i%>" type="text" id="ֵ<%=i%>"  style="border:1px solid #333333;  width:50px ;  height:20px; " value="<%=FormatNumber(rs0("ֵ"),2,-1)%>" autocomplete="off" />
<%else%>
<input name="ֵ<%=i%>" type="text" id="ֵ<%=i%>"  style="border:1px solid #333333;  width:50px ;  height:20px; " value="<%=FormatNumber(rs101("ֵ"),2,-1)%>" autocomplete="off" />
<%end if%></td>
          <td width="59" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<select name="����<%=i%>" id="����<%=i%>"  style="border:1px solid #333333; width:50px; height:20px; ">
	<%if rs101("����")="" then%>
            <option value="<%=rs0("����")%>"><%=rs0("����")%></option>
	<%else%>
			<option value="<%=rs101("����")%>"><%=rs101("����")%></option>
	<%end if%>
            <option value="0">0</option>			
			<%for bl=1 to 100%>
            <option value="<%=bl%>"><%=bl%></option>
			<%next%>
          </select>		  
		  </td>
          <td width="59" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs0("��������")="��̬" then%>
	<select name="���<%=i%>" id="���<%=i%>"  style="border:1px solid #333333; width:50px; height:20px; ">
	<%if rs101("���")="" then%>
            <option value="<%=rs0("���")%>"><%=rs0("���")%>%</option>
	<%else%>
			<option value="<%=rs101("���")%>"><%=rs101("���")%>%</option>
	<%end if%>
			
			<%for sh=0 to 20%>
            <option value="<%=sh%>"><%=sh%>%</option>
			<%next%>
          </select>			  
<%

else
response.Write("-")
end if
%>			</td>
          <td width="59" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">

<select name="���ɽ�<%=i%>" id="���ɽ�<%=i%>"  style="border:1px solid #333333; width:50px; height:20px; ">
			<%if rs101("���ɽ�")="" then%>
            <option value="<%=rs0("���ɽ�")%>"><%=rs0("���ɽ�")%>%</option>
			<%else%>
			<option value="<%=rs101("���ɽ�")%>"><%=rs101("���ɽ�")%>%</option>
			<%end if%>
			<%for znj=0 to 20%>
            <option value="<%=znj%>"><%=znj%>%</option>
			<%next%>
          </select>			</td>
          <td width="83" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs0("��������")="��̬" then%>
<input name="����<%=i%>" type="text" id="����<%=i%>"  style="border:1px solid #333333;  width:80px ;  height:20px; " value="<%=rs1011("����")%>" autocomplete="off" />
<%else
response.Write("-")
end if
%>		  </td>
          <td width="226" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs101("˵��")="" then%>
<input name="˵��<%=i%>" type="text" id="˵��<%=i%>"  style="border:1px solid #333333; width:100% ;   height:20px; " value="<%=rs0("˵��")%>" autocomplete="off" />
<%else%>
<input name="˵��<%=i%>" type="text" id="˵��<%=i%>"  style="border:1px solid #333333; width:100% ;   height:20px; " value="<%=rs101("˵��")%>" autocomplete="off" />
<%end if%></td>
          <td width="65" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
if rs1011.recordcount=0 then
response.Write("<span style='color:#CC0000'>��</span>")
else
	if  rs1011("¼��״̬")="��¼��"  then
		response.Write("��")
	else
		response.Write("<span style='color:#CC0000'>��</span>")
	end if
end if
%></td>
          <td width="85" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
if rs101.recordcount=0 then
response.Write("<span style='color:#CC0000'>��</span>")
else
if rs101.recordcount<>0 and rs101("ֵ")<>"" then
response.Write("��")
else
response.Write("<span style='color:#CC0000'>��</span>")
end if
end if
%>
		  &nbsp;</td>
          </tr>
        <%
rs0.movenext()
next

%>
<tr>
<td height="40" colspan="11" align="center" valign="middle">
 <input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="���뵽��ͬ" onClick="fClose()" onmouseover='return hidestatus()'/></td>
</tr>
      </table>
      </form>
    
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
set rs11=server.createobject("adodb.recordset")
sql11="select * from zpgl where id='"&request.QueryString("id")&"'"
rs11.open sql11,conn,3

set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from zpgl_lx_lb where ��ͬ���='"&rs11("����")&"'",conn,1
rs2.close
set rs2=nothing

set rs22=server.CreateObject("ADODB.RecordSet")
rs22.open "delete from user_sf_lb where ���ݱ��='"&rs11("����")&"_1'",conn,1
rs22.close
set rs22=nothing


set rs220=server.CreateObject("ADODB.RecordSet")
rs220.open "delete from user_sf_zb where ���ݱ��='"&rs11("����")&"_1'",conn,1
rs220.close
set rs220=nothing


set rs01=server.createobject("adodb.recordset")
sql01="select * from gyy_lb_fclx_lb_xflx where ��ҵ԰����='"&rs11("������ҵ԰")&"' and ��������='"&rs11("��������")&"' order by ��� asc"
rs01.open sql01,conn,3
for j=1 to rs01.recordcount
   if rs01.eof or rs01.bof then exit for

set rs=server.createobject("adodb.recordset")
sql="select * from zpgl_lx_lb "
rs.open sql,conn,1,3
rs.addnew
rs("��ͬ���")=rs11("����")
rs("�ͻ�����")=rs11("�ͻ�����")
rs("������ҵ԰")=rs01("��ҵ԰����")
rs("��������")=rs01("��������")
rs("��������")=rs11("��������")
rs("�ͻ�����")=rs11("�ͻ�����")
rs("������Ŀ")=request.Form("������Ŀ"&j&"")
rs("��������")=request.Form("��������"&j&"")
rs("ֵ")=request.Form("ֵ"&j&"")
if request.Form("��������"&j&"")="��̬" then
rs("���")=request.Form("���"&j&"")
else 
rs("���")=0
end if
rs("����")=request.Form("����"&j&"")
rs("���ɽ�")=request.Form("���ɽ�"&j&"")
rs("˵��")=request.Form("˵��"&j&"")
rs.update
rs.close
set rs=nothing


set rs1111=server.createobject("adodb.recordset")
sql1111="select * from user_sf_lb "
rs1111.open sql1111,conn,1,3
rs1111.addnew
rs1111("��ͬ���")=rs11("����")
rs1111("���ݱ��")=""&rs11("����")&"_1"
rs1111("�ͻ����")=rs11("�ͻ�����")
rs1111("������")=rs11("��ͬ��ʼʱ��_��")
rs1111("������")=rs11("��ͬ��ʼʱ��_��")
rs1111("������")=rs11("��ͬ��ʼʱ��_��")
rs1111("����")=rs11("��ͬ��ʼʱ��")
rs1111("�շ���Ŀ")=request.Form("������Ŀ"&j&"")
rs1111("�շ�����")=request.Form("��������"&j&"")
rs1111("ֵ")=request.Form("ֵ"&j&"")

if request.Form("��������"&j&"")="��̬" then
if request.Form("����"&j&"")<>"" then
rs1111("¼��״̬")="��¼��"
else
rs1111("¼��״̬")="δ¼��"
end if
else
rs1111("¼��״̬")="��¼��"
end if
rs1111("�ɷ�״̬")="��Ҫ����"



if request.Form("��������"&j&"")="��̬" then
rs1111("���")=request.Form("���"&j&"")
else 
rs1111("���")=0
end if
if request.Form("��������"&j&"")="��̬"  then
rs1111("����")=request.Form("����"&j&"")
else
rs1111("����")=0
end if
rs1111("����")=request.Form("����"&j&"")
rs1111("���ɽ�")=request.Form("���ɽ�"&j&"")
rs1111("����")=0
rs1111("���")=0


rs1111.update
rs1111.close
set rs1111=nothing

rs01.movenext()
next
set rs2201=server.createobject("adodb.recordset")
sql2201="select * from user_sf_zb "
rs2201.open sql2201,conn,1,3
rs2201.addnew
rs2201("��ͬ���")=rs11("����")
rs2201("���ݱ��")=""&rs11("����")&"_1"
rs2201("�ͻ����")=rs11("�ͻ�����")
rs2201("������")=rs11("��ͬ��ʼʱ��_��")
rs2201("������")=rs11("��ͬ��ʼʱ��_��")
rs2201("������")=rs11("��ͬ��ʼʱ��_��")
rs2201("����")=rs11("��ͬ��ʼʱ��")
rs2201("�ܷ���")=0
rs2201("�ɷѽ��")=0
rs2201("���")=0
rs2201("¼��״̬")="��¼��"
rs2201("�ɷ�״̬")="��Ҫ����"
rs2201.update
rs2201.close
set rs2201=nothing

response.write"<script>alert('����ɹ�');location.href='?id="&request.QueryString("id")&"';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>