<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
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
<SCRIPT src="../js/lj.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/Department.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/Department2.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">��Ŀ�б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=tj">�����Ŀ</a></strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������ҵ԰</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��Ŀ����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�շ���Ŀ</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�շѱ�׼</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�շ�˵��</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from user_sf  order by ������ҵ԰,��Ŀ���� desc"
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
        <td height="93" colspan="18" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û����Ŀ</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="57" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("������ҵ԰")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��Ŀ����")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("�շ���Ŀ")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=FormatNumber(rs0("�շѱ�׼"),2,-1)%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=FormatNumber(rs0("���")*100,2,-1)%>%</td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("�շ�˵��")%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><a href="?Operation=xg&amp;id=<%=rs0("id")%>">�༭</a>&nbsp;&nbsp;<a href="?action=sc&amp;id=<%=rs0("id")%>">ɾ��</a></td>
      </tr>
<%
rs0.movenext()
next
%>
    </table>
	
<tr>
    <td height="30" colspan="2" align="center" valign="middle">
	<span class="STYLE1">
	�����ǵ�<%=epage%>ҳһ����<%=rs0.pagecount%>ҳ 
	<A onMouseover="return hidestatus()" href="?page=1">��ҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>">ǰһҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>">��һҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>">ĩҳ</a>	</span></td>
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
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������ҵ԰��</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="������ҵ԰" id="������ҵ԰" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
          <option value="��ѡ��">��ѡ��</option>
          <%
set rsjs=server.createobject("adodb.recordset")
sqljs="select * from gyy_lb  order by ��� asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>
          <option value="<%=rsjs("��ҵ԰����")%>"><%=rsjs("��ҵ԰����")%></option>
          <%
rsjs.movenext()
next
%>
        </select></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��Ŀ���ͣ�</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="��Ŀ����" id="��Ŀ����" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
          <option value="��ѡ��">��ѡ��</option>
          <%
set rsjs1=server.createobject("adodb.recordset")
sqljs1="select * from fclx_lb  order by ��� asc"
rsjs1.open sqljs1,conn,3
for i=0 to rsjs1.recordcount
 if rsjs1.bof or rsjs1.eof then exit for
%>
          <option value="<%=rsjs1("��������")%>"><%=rsjs1("��������")%></option>
          <%
rsjs1.movenext()
next
%>
        </select></td>
      </tr>
      <tr>
        <td width="14%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�շ���Ŀ��</td>
        <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="�շ���Ŀ" type="text" id="�շ���Ŀ"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�շѱ�׼��</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="�շѱ�׼" type="text" id="�շѱ�׼"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ģ�</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="���" type="text" id="���"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>
          %</td>
      </tr>
      <tr></tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ͣ�</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          &nbsp;
          <input name="����" type="radio" value="�̶�" checked="checked" />
          �̶�
          <input type="radio" name="����" value="��̬" />
        ��̬
        <input type="radio" name="����" value="����" />
        ����</label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ɽ�</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="���ɽ�" type="text" id="���ɽ�"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>
%</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�շ�˵����</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="�շ�˵��" type="text" id="�շ�˵��"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>

      <tr>
        <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onMouseover='return hidestatus()'/>
            <input name="Submit4" type="reset"  style="border:1px solid #000000; margin-left:3px" value="ȡ��"/>        </td>
      </tr>
    </table>
  </form></td>
</tr>
<%end if
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from user_sf where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td width="14%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������ҵ԰��</td>
          <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="������ҵ԰" id="������ҵ԰" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
           <option value="<%=rs1("������ҵ԰")%>"><%=rs1("������ҵ԰")%></option>
            <%
set rsjs=server.createobject("adodb.recordset")
sqljs="select * from gyy_lb  order by ��� asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>
            <option value="<%=rsjs("��ҵ԰����")%>"><%=rsjs("��ҵ԰����")%></option>
            <%
rsjs.movenext()
next
%>
          </select></td>
          </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��Ŀ���ͣ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <select name="��Ŀ����" id="��Ŀ����" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
              <option value="<%=rs1("��Ŀ����")%>"><%=rs1("��Ŀ����")%></option>
            <%
set rsjs1=server.createobject("adodb.recordset")
sqljs1="select * from fclx_lb  order by ��� asc"
rsjs1.open sqljs1,conn,3
for i=0 to rsjs.recordcount
 if rsjs1.bof or rsjs1.eof then exit for
%>
            <option value="<%=rsjs1("��������")%>"><%=rsjs1("��������")%></option>
            <%
rsjs1.movenext()
next
%>
          </select>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�շ���Ŀ��</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="�շ���Ŀ" type="text" id="�շ���Ŀ"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("�շ���Ŀ")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�շѱ�׼��:</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="�շѱ�׼" type="text" id="�շѱ�׼"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=FormatNumber(rs1("�շѱ�׼"),2,-1)%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ģ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  <input name="���" type="text" id="���"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("���")%>" autocomplete="off"/>
            %</td>
        </tr>
        <tr></tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ͣ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">&nbsp;
<%if rs1("����")="�̶�" then%>
<input name="����" type="radio" value="�̶�" checked="checked" />�̶�
<input type="radio" name="����" value="��̬" />��̬
<input type="radio" name="����" value="����" />����
<%elseif rs1("����")="��̬" then%>
<input name="����" type="radio" value="�̶�" />�̶�
<input type="radio" name="����" value="��̬" checked="checked" />��̬
<input type="radio" name="����" value="����" />����
<%elseif rs1("����")="����" then%>
<input name="����" type="radio" value="�̶�" />�̶�
<input type="radio" name="����" value="��̬"  />��̬
<input type="radio" name="����" value="����"checked="checked" />����
<%end if%></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ɽ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="���ɽ�" type="text" id="���ɽ�"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("���ɽ�")%>" autocomplete="off"/>
%</td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�շ�˵����</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="�շ�˵��" type="text" id="�շ�˵��"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("�շ�˵��")%>" autocomplete="off"/></td>
        </tr>

        <tr>
          <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onmouseover='return hidestatus()'/>
              <input name="Submit42" type="reset"  style="border:1px solid #000000; margin-left:3px" value="ȡ��"/>          </td>
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
sql="select * from user_sf where �շ���Ŀ='"&request.Form("�շ���Ŀ")&"' and ������ҵ԰='"&request.Form("������ҵ԰")&"' and ��Ŀ����='"&request.Form("��Ŀ����")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("������ҵ԰")=request.Form("������ҵ԰")
rs("��Ŀ����")=request.Form("��Ŀ����")
rs("�շ���Ŀ")=request.Form("�շ���Ŀ")
rs("�շѱ�׼")=request.Form("�շѱ�׼")
rs("�շ�˵��")=request.Form("�շ�˵��")
rs("���")=request.Form("���")/100
rs("����")=request.Form("����")
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('��ӳɹ�');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('�����Ѿ�����Ԥ������δ��Ԥ��ʱ��!');history.go(-1);</script>"         
end if
end if

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from user_sf where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("������ҵ԰")=request.Form("������ҵ԰")
rs6("��Ŀ����")=request.Form("��Ŀ����")
rs6("�շ���Ŀ")=request.Form("�շ���Ŀ")
rs6("�շѱ�׼")=request.Form("�շѱ�׼")
rs6("�շ�˵��")=request.Form("�շ�˵��")
rs6("���")=request.Form("���")/100
rs6("����")=request.Form("����")
rs6.update
response.write"<script>alert('�޸ĳɹ�');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from user_sf where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('ɾ���ɹ�');location.href='?';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>