<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<%
role_name=request.QueryString("role_name")
role_id=request.QueryString("role_id")

set rs1=server.createobject("adodb.recordset")
sql1="select * from role_lb where role_name='"&role_name&"'"
rs1.open sql1,conn,1,3
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<SCRIPT src="../js/lj.js" type=text/javascript></SCRIPT>
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
    <td><img src="../images/1_1.gif" width="18" height="18">&nbsp;<strong>�༭Ȩ�ޡ�����<%=role_name%>��</strong></td>
  </tr>
<tr>
  <td align="center" valign="middle">
  <form action="Jurisdiction.asp?action=1&role_id=<%=role_id%>&role_name=<%=role_name%>" method="post"  name="form1" id="form1" style="margin:0px;">
  <%if rs1.bof or rs1.eof then%>
  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>ˮ�ɷѹ���</strong></td>

        <td width="20%" align="center" valign="middle" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><strong>��Դ����</strong></td>
        <td width="20%" align="center" valign="middle"style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><strong>��ƾ����</strong></td>
        <td width="20%" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>ϵͳ����</strong></td>
      </tr>
      <tr>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
            <input name="����¼��" type="checkbox" id="����¼��" value="1" />
            </label>
              ����¼��</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="�ɷѹ���" type="checkbox" id="�ɷѹ���" value="1" />
              �ɷѹ���</td>
          </tr>
        </table></td>
        <td align="center" valign="top" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
            <input name="��ҵ԰����" type="checkbox" id="��ҵ԰����" value="1" />
            </label>
              ��ҵ԰����</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="��������" type="checkbox" id="��������" value="1" />
��������</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="�ͻ�����" type="checkbox" id="�ͻ�����" value="1" />
              �ͻ�����</td>
          </tr>

        </table></td>
        <td align="center" valign="top"style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">

          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
              <input name="Ԥ������" type="checkbox" id="Ԥ������" value="1" />
              </label>
              Ԥ������</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="��ƾ��ͬ����" type="checkbox" id="��ƾ��ͬ����" value="1" />
��ƾ��ͬ����</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="��ͬ������ʾ" type="checkbox" id="��ͬ������ʾ" value="1" />
              ��ͬ������ʾ</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="�տ����ͳ��" type="checkbox" id="�տ����ͳ��" value="1" />
�տ����ͳ��</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="�տ���ϸͳ��" type="checkbox" id="�տ���ϸͳ��" value="1" />
�տ���ϸͳ��</td>
          </tr>
        </table></td>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F;"><table width="80%" border="0" cellpadding="0" cellspacing="0">

          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
              <input name="��ɫȨ��" type="checkbox" id="��ɫȨ��" value="1" />
              </label>
              ��ɫȨ��</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="����Ա����" type="checkbox" id="����Ա����" value="1" />
              ����Ա����</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="�޸ı�������" type="checkbox" id="�޸ı�������" value="1" />
              �޸ı�������</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="�˳�ϵͳ" type="checkbox" id="�˳�ϵͳ" value="1" />
              �˳�ϵͳ</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30" colspan="5" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<input name="Submit2" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��"/>
            <input name="Submit2" type="reset"  style="border:1px solid #000000; margin-left:3px; margin-right:3px" value="ȡ��"/>
            <input name="Submit22" type="button"  style="border:1px solid #000000; margin-left:3px" value="����" onClick="<script>window.location(Role.asp)</script>"/></td>
      </tr>
    </table>
	<%else%>
    <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>ˮ�ɷѹ���</strong></td>

        <td width="20%" align="center" valign="middle" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><strong>��Դ����</strong></td>
        <td width="20%" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>��ƾ����</strong></td>
        <td width="20%" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>ϵͳ����</strong></td>
      </tr>
      <tr>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
			   <%if rs1("����¼��")=1 then%>
			  <input name="����¼��" type="checkbox" id="����¼��" value="1" checked="checked" />
			  <%else%>
              <input name="����¼��" type="checkbox" id="����¼��" value="1" />
			  <%end if%>
            </label>
              ����¼��</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("�ɷѹ���")=1 then%>
			<input name="�ɷѹ���" type="checkbox" id="�ɷѹ���" value="1" checked="checked" />
			<%else%>
			<input name="�ɷѹ���" type="checkbox" id="�ɷѹ���" value="1" />
			<%end if%>
			�ɷѹ���</td>
          </tr>
        </table></td>
        <td align="center" valign="top" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
			<%if rs1("��ҵ԰����")=1 then%>
              <input name="��ҵ԰����" type="checkbox" id="��ҵ԰����" value="1" checked="checked" />
			  <%else%>
			  <input name="��ҵ԰����" type="checkbox" id="��ҵ԰����" value="1" />
			  <%end if%>
              </label>
              ��ҵ԰����</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("��������")=1 then%>
              <input name="��������" type="checkbox" id="��������" value="1"  checked="checked"/>
              <%else%>
              <input name="��������" type="checkbox" id="��������" value="1" />
              <%end if%>
              ��������</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("�ͻ�����")=1 then%>
			<input name="�ͻ�����" type="checkbox" id="�ͻ�����" value="1"  checked="checked"/>
			<%else%>
			<input name="�ͻ�����" type="checkbox" id="�ͻ�����" value="1" />
			<%end if%>
			�ͻ�����</td>
          </tr>

        </table></td>
        <td align="center" valign="top"style="border-bottom:1px solid #00376F;"><table width="80%" border="0" cellpadding="0" cellspacing="0">

          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
              <%if rs1("Ԥ������")=1 then%>
              <input name="Ԥ������" type="checkbox" id="Ԥ������" value="1" checked="checked" />
              <%else%>
              <input name="Ԥ������" type="checkbox" id="Ԥ������" value="1" />
              <%end if%>
              </label>
              Ԥ������</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("��ƾ��ͬ����")=1 then%>
                <input name="��ƾ��ͬ����" type="checkbox" id="��ƾ��ͬ����" value="1"  checked="checked"/>
                <%else%>
                <input name="��ƾ��ͬ����" type="checkbox" id="��ƾ��ͬ����" value="1" />
                <%end if%>
                ��ƾ��ͬ����</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("��ͬ������ʾ")=1 then%>
              <input name="��ͬ������ʾ" type="checkbox" id="��ͬ������ʾ" value="1"  checked="checked"/>
              <%else%>
              <input name="��ͬ������ʾ" type="checkbox" id="��ͬ������ʾ" value="1" />
              <%end if%>
              ��ͬ������ʾ</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><%if rs1("�տ����ͳ��")=1 then%>
              <input name="�տ����ͳ��" type="checkbox" id="�տ����ͳ��" value="1"  checked="checked"/>
              <%else%>
              <input name="�տ����ͳ��" type="checkbox" id="�տ����ͳ��" value="1" />
              <%end if%>
�տ����ͳ��</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><%if rs1("�տ���ϸͳ��")=1 then%>
              <input name="�տ���ϸͳ��" type="checkbox" id="�տ���ϸͳ��" value="1"  checked="checked"/>
              <%else%>
              <input name="�տ���ϸͳ��" type="checkbox" id="�տ���ϸͳ��" value="1" />
              <%end if%>
              �տ���ϸͳ��</td>
          </tr>
        </table></td>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F;"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
			<%if rs1("��ɫȨ��")=1 then%>
              <input name="��ɫȨ��" type="checkbox" id="��ɫȨ��" value="1"  checked="checked"/>
			  <%else%>
			  <input name="��ɫȨ��" type="checkbox" id="��ɫȨ��" value="1" />
			  <%end if%>
              </label>
              ��ɫȨ��</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("����Ա����")=1 then%>
              <input name="����Ա����" type="checkbox" id="����Ա����" value="1"  checked="checked"/>
              <%else%>
              <input name="����Ա����" type="checkbox" id="����Ա����" value="1" />
              <%end if%>
              ����Ա����</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("�޸ı�������")=1 then%>
              <input name="�޸ı�������" type="checkbox" id="�޸ı�������" value="1"  checked="checked"/>
              <%else%>
              <input name="�޸ı�������" type="checkbox" id="�޸ı�������" value="1" />
              <%end if%>
              �޸ı�������</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("�˳�ϵͳ")=1 then%>
			<input name="�˳�ϵͳ" type="checkbox" id="�˳�ϵͳ" value="1"  checked="checked"/>             <%else%>
			<input name="�˳�ϵͳ" type="checkbox" id="�˳�ϵͳ" value="1" />
			<%end if%>
			�˳�ϵͳ</td>
          </tr>

        </table></td>
      </tr>
      <tr>
        <td height="30" colspan="5" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<input name="Submit2" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��"/>
            <input name="Submit2" type="reset"  style="border:1px solid #000000; margin-left:3px; margin-right:3px" value="ȡ��"/>
            <input name="Submit22" type="button"  style="border:1px solid #000000; margin-left:3px" value="����" onClick="<script>window.location(Role.asp)</script>"/></td>
      </tr>
    </table>
<%end if%>
  </form></td>
</tr>
</table>
<%
rs1.close
set rsq1=nothing
%>
</body>
</html>
<%
if request.QueryString("action")=1 then
role_id=request.QueryString("role_id")
role_name=request.QueryString("role_name")
set rs=server.createobject("adodb.recordset")
sql="select * from role_lb where role_name='"&role_name&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("role_name")=role_name
rs("����¼��")=request.Form("����¼��")
rs("�ɷѹ���")=request.Form("�ɷѹ���")
rs("��ҵ԰����")=request.Form("��ҵ԰����")
rs("��������")=request.Form("��������")
rs("�ͻ�����")=request.Form("�ͻ�����")
rs("Ԥ������")=request.Form("Ԥ������")
rs("��ƾ��ͬ����")=request.Form("��ƾ��ͬ����")
rs("��ͬ������ʾ")=request.Form("��ͬ������ʾ")
rs("�տ����ͳ��")=request.Form("�տ����ͳ��")
rs("�տ���ϸͳ��")=request.Form("�տ���ϸͳ��")
rs("��ɫȨ��")=request.Form("��ɫȨ��")
rs("����Ա����")=request.Form("����Ա����")
rs("�޸ı�������")=request.Form("�޸ı�������")
rs("�˳�ϵͳ")=request.Form("�˳�ϵͳ")
rs.update
response.write"<script>alert('Ȩ�޸��³ɹ�');location.href='Jurisdiction.asp?role_id="&role_id&"&role_name="&role_name&"';</script>"
else
rs("role_name")=role_name
rs("����¼��")=request.Form("����¼��")
rs("�ɷѹ���")=request.Form("�ɷѹ���")
rs("��ҵ԰����")=request.Form("��ҵ԰����")
rs("��������")=request.Form("��������")
rs("�ͻ�����")=request.Form("�ͻ�����")
rs("Ԥ������")=request.Form("Ԥ������")
rs("��ƾ��ͬ����")=request.Form("��ƾ��ͬ����")
rs("��ͬ������ʾ")=request.Form("��ͬ������ʾ")
rs("�տ����ͳ��")=request.Form("�տ����ͳ��")
rs("�տ���ϸͳ��")=request.Form("�տ���ϸͳ��")
rs("��ɫȨ��")=request.Form("��ɫȨ��")
rs("����Ա����")=request.Form("����Ա����")
rs("�޸ı�������")=request.Form("�޸ı�������")
rs("�˳�ϵͳ")=request.Form("�˳�ϵͳ")
rs.update
response.write"<script>alert('Ȩ�޸��³ɹ�');location.href='Jurisdiction.asp?role_id="&role_id&"&role_name="&role_name&"';</script>"
end if
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>