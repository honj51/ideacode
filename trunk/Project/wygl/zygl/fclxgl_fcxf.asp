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
.STYLE1 {
	font-size: 10pt;
	font-weight: bold;
}
a {evt:expression(window.status='������������Ͷ�����޹�˾')}
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="gyygl.asp?Operation=lb">��ҵ԰�б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<A onMouseover="return hidestatus()" href="gyygl.asp?Operation=tj">��ӹ�ҵ԰</a>&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;��ǰλ�ã���ҵ԰�б�&nbsp;��&nbsp;
	<a href="fclxgl.asp?gyymc=<%=request.QueryString("gyymc")%>"><%=request.QueryString("gyymc")%></a>&nbsp;��&nbsp;
	<a href="?fclx=<%=request.QueryString("fclx")%>&gyymc=<%=request.QueryString("gyymc")%>"><%=request.QueryString("fclx")%></a>
  <tr>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	
	
	<form id="form1" name="form1" method="post" action="?action=tj&Operation=tj&gyymc=<%=request.QueryString("gyymc")%>&fclx=<%=request.QueryString("fclx")%>" style="margin:opx" onSubmit="return  denglu()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������Ŀ</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>ֵ</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���ɽ�</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>˵��</strong></td>
          <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
        </tr>
        <tr>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="���" type="text" id="���"  style="border:1px solid #333333; width:50px; height:20px;" autocomplete="off"/>          </td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="������Ŀ" type="text" id="������Ŀ"  style="border:1px solid #333333; width:98%; height:20px; " autocomplete="off"/></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><label>
            <select name="��������" id="��������"  style="border:1px solid #333333; width:98%; height:20px; ">
              <option value="��ѡ��">��ѡ��</option>
			  <option value="����">����</option>
              <option value="�̶�">�̶�</option>
              <option value="����">����</option>
              <option value="��̬">��̬</option>
            </select>
          </label></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="ֵ" type="text" id="ֵ"  style="border:1px solid #333333; width:98%; height:20px; " autocomplete="off"/></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><select name="����" id="����"  style="border:1px solid #333333; width:98%; height:20px; ">
            <option value="0">0</option>
            <%for bl=1 to 10%>
            <option value="<%=bl%>0"><%=bl%>0</option>
            <%next%>
          </select></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		  <select name="���" id="���"  style="border:1px solid #333333; width:98%; height:20px; ">
            <option value="��ѡ��">��ѡ��</option>
			<%for sh=0 to 20%>
            <option value="<%=sh%>"><%=sh%>%</option>
			<%next%>
          </select></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><select name="���ɽ�" id="���ɽ�"  style="border:1px solid #333333; width:98%; height:20px; ">
            <option value="��ѡ��">��ѡ��</option>
			<%for znj=0 to 20%>
            <option value="<%=znj%>"><%=znj%>%</option>
			<%next%>
          </select></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="˵��" type="text" id="˵��"  style="border:1px solid #333333; width:98%; height:20px; " autocomplete="off"/>         </td>
          <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onmouseover='return hidestatus()'/></td>
        </tr>
        <%
set rs0=server.createobject("adodb.recordset")
sql0="select * from gyy_lb_fclx_lb_xflx where ��ҵ԰����='"&request.QueryString("gyymc")&"' and ��������='"&request.QueryString("fclx")&"' order by ��� asc"
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
          <td height="93" colspan="10" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û�������Ŀ</td>
        </tr>
        <%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
        <tr>
          <td width="53" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
          <td width="147" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("������Ŀ")%></td>
          <td width="79" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��������")%></td>
          <td width="147" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=FormatNumber(rs0("ֵ"),2,-1)%></td>
          <td width="79" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
          <td width="79" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		  <%=rs0("���")%>%</td>
          <td width="79" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("���ɽ�")%>%</td>
          <td width="251" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("˵��")%></td>
          <td width="102" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"> 
		   <a href="?action=sc&id=<%=rs0("id")%>&gyymc=<%=request.QueryString("gyymc")%>&fclx=<%=request.QueryString("fclx")%>">ɾ��</a></td>
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
	�����ǵ�<%=epage%>ҳһ����<%=rs0.pagecount%>ҳ 
	<A onMouseover="return hidestatus()" href="?page=1&gyymc=<%=request.QueryString("gyymc")%>&fclx=<%=request.QueryString("fclx")%>">��ҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>&gyymc=<%=request.QueryString("gyymc")%>&fclx=<%=request.QueryString("fclx")%>">ǰһҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>&gyymc=<%=request.QueryString("gyymc")%>&fclx=<%=request.QueryString("fclx")%>">��һҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>&gyymc=<%=request.QueryString("gyymc")%>&fclx=<%=request.QueryString("fclx")%>">ĩҳ</a>	</span></td>
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
sql="select * from gyy_lb_fclx_lb_xflx where  ��ҵ԰����='"&request.QueryString("gyymc")&"' and ��������='"&request.QueryString("fclx")&"' and ������Ŀ='"&request.Form("������Ŀ")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("���")=request.Form("���")
rs("��ҵ԰����")=request.QueryString("gyymc")
rs("��������")=request.QueryString("fclx")
rs("������Ŀ")=request.Form("������Ŀ")
rs("��������")=request.Form("��������")
rs("ֵ")=request.Form("ֵ")
if request.Form("��������")="��̬" then
rs("���")=request.Form("���")
else
rs("���")=0
end if
rs("����")=request.Form("����")
rs("���ɽ�")=request.Form("���ɽ�")
rs("˵��")=request.Form("˵��")
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('��ӳɹ�');location.href='?gyymc="&request.QueryString("gyymc")&"&fclx="&request.QueryString("fclx")&"';</script>"
else
response.write"<script>alert('��������Ŀ�Ѵ���!');history.go(-1);</script>"         
end if
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from gyy_lb_fclx_lb_xflx where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('ɾ���ɹ�');location.href='?gyymc="&request.QueryString("gyymc")&"&fclx="&request.QueryString("fclx")&"';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>