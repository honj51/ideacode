<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<!--#INCLUDE FILE="../Safe/Function.asp"-->
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
<SCRIPT src="../js/khgl.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/khgl2.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><form id="form3" name="form3" method="post" action="?xmcx=yes" style="margin:0px">
      <strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onmouseover="return hidestatus()" href="khgl.asp?Operation=lb">��Ȼ���б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onmouseover="return hidestatus()" href="khgl.asp?Operation=tj">�����Ȼ��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onmouseover="return hidestatus()" href="khgl_gs.asp?Operation=lb">��˾�б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onmouseover="return hidestatus()" href="khgl_gs.asp?Operation=tj">��ӹ�˾</a></strong>&nbsp;&nbsp;
      <label>
      &nbsp;������
      <input name="textname" type="text" id="textname" />
      </label>
                            <label>
                            <input type="submit" name="Submit" value="����" />
                            </label>
    </form>
    </td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ϵ��</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ϵ�绰</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
if request.QueryString("xmcx")="yes" then
sql0="select * from user_zrr  where ���� like '%"&request.Form("textname")&"%' order by id asc"
else
sql0="select * from user_zrr  order by id asc"
end if
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
        <td height="93" colspan="9" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û�������Ȼ��</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="44" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="149" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="149" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="162" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="118" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��ϵ��")%></td>
        <td width="133" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��ϵ�绰")%></td>
        <td width="166" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
<a href="../zpgl/zpht.asp?Operation=tj&id=<%=rs0("id")%>&hylx=zrr">��Ӻ�ͬ</a>|	
<a href="?Operation=xg&id=<%=rs0("id")%>">�༭</a>|
<%
set rs0111=server.createobject("adodb.recordset")
sql0111="select * from gyy_fc_lb where ҵ��='"&rs0("����")&"'"
rs0111.open sql0111,conn,3
if rs0111.bof or rs0111.eof   then%>
<a href="?action=sc&id=<%=rs0("id")%>">ɾ��</a>
<%
else
response.Write("<span style='color:#999999'>ɾ��</span>")
end if
%>
</td>
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
        <td width="17%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���룺</td>
        <td width="28%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
			   <%
		 FOR i=1 to 4
		 suiji=suijishu()
		 suiji1=suiji1&suiji
		 next
		
		 %>
		<input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="zrr<%=year(now)%><%=month(now)%><%=day(now)%><%=hour(now)%><%=minute(now)%><%=second(now)%><%=suiji1%>" autocomplete="off"  readonly="true"/></td>
        <td width="55%" rowspan="5" align="left" valign="middle" style="border-bottom:1px solid #00376F; border-left:1px solid #00376F">&nbsp;</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ƣ�</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>
        </label></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�����룺</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="������" type="text" id="������"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�Ա�</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          &nbsp;
          <input name="�Ա�" type="radio" value="��" checked="checked" />
        ��
        <input type="radio" name="�Ա�" value="Ů" />
        Ů</label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�������ڣ�</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <option value="��ѡ��">��ѡ��</option>
		  <%for n=year(now)-70 to  year(now)%>
            <option value="<%=n%>"><%=n%></option>
			<%next%>
          </select>
          ��
          <select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <option value="��ѡ��">��ѡ��</option>
        		  <%for y=1 to  12%>
            <option value="<%=y%>"><%=y%></option>
			<%next%>
                              </select>
          ��
          <select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <option value="��ѡ��">��ѡ��</option>
        		<%for r=1 to  31%>
            <option value="<%=r%>"><%=r%></option>
			<%next%>
                              </select>
          ��</label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">֤�����ƣ�</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="֤������" id="֤������" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		<option value="��ѡ��">��ѡ��</option>
          <option value="���֤">���֤</option>

        </select></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">֤�����룺</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="֤������" type="text" id="֤������"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���᣺</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="����" id="����" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		<option value="��ѡ��" selected="selected">��ѡ��</option>
          <option value="����">����</option>
          <option value="���">���</option>
		  <option value="�Ϻ�">�Ϻ�</option>
		  <option value="����">����</option>
		  <option value="������">������</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="�ӱ�">�ӱ�</option>
		  <option value="ɽ��">ɽ��</option>
		  <option value="�ຣ">�ຣ</option>
		  <option value="ɽ��">ɽ��</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="�㽭">�㽭</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="�㶫">�㶫</option>
		  <option value="̨��">̨��</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="�Ĵ�">�Ĵ�</option>
		  <option value="����">����</option>
		  <option value="����">����</option>
		  <option value="���ɹ�������">���ɹ�������</option>
		  <option value="ά���������">ά���������</option>
		  <option value="����������">����������</option>
		  <option value="���Ļ���������">���Ļ���������</option>
		  <option value="����׳��������">����׳��������</option>
		  <option value="����ر�������">����ر�������</option>
		  <option value="�����ر�������">�����ر�������</option>
                </select></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ϵ�绰��</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="��ϵ�绰" type="text" id="��ϵ�绰"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ϵ��ַ��</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="��ϵ��ַ" type="text" id="��ϵ��ַ"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ϵ�ˣ�</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="��ϵ��" type="text" id="��ϵ��"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ע��</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><textarea name="��ע" id="��ע" style="border:1px solid #333333; width:400px; height:50px; margin-left:3px" autocomplete="off"></textarea></td>
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
sql1="select * from user_zrr where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td width="17%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���룺</td>
          <td width="28%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off" readonly="true"/></td>
          <td width="55%" rowspan="5" align="left" valign="middle" style="border-bottom:1px solid #00376F; border-left:1px solid #00376F">&nbsp;</td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ƣ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
            <input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off" readonly="true"/>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�����룺</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="������" type="text" id="������"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("������")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�Ա�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label> &nbsp;
            <% if rs1("�Ա�")="��" then%>
			<input type="radio" name="�Ա�" value="��" checked="checked" />
            ��
            <input type="radio" name="�Ա�" value="Ů" />
            Ů
			<%else%>
						<input type="radio" name="�Ա�" value="��"  />
            ��
            <input type="radio" name="�Ա�" value="Ů"  checked="checked"/>
            Ů
			<%end if%>
			</label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�������ڣ�</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
			<option value="<%=rs1("��������_��")%>"><%=rs1("��������_��")%></option>
              <%for n=year(now)-70 to  year(now)%>
              <option value="<%=n%>"><%=n%></option>
              <%next%>
            </select>
��
<select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option value="<%=rs1("��������_��")%>"><%=rs1("��������_��")%></option>
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
��
<select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option value="<%=rs1("��������_��")%>"><%=rs1("��������_��")%></option>
  <%for r=1 to  31%>
  <option value="<%=r%>"><%=r%></option>
  <%next%>
</select>
��</td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">֤�����ƣ�</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="֤������" id="֤������" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
              <option value="<%=rs1("֤������")%>"><%=rs1("֤������")%></option>
              <option value="���֤">���֤</option>
            </select></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">֤�����룺</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="֤������" type="text" id="֤������"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("֤������")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���᣺</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="����" id="����" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
              <option value="<%=rs1("����")%>" selected="selected"><%=rs1("����")%></option>
              <option value="����">����</option>
              <option value="���">���</option>
              <option value="�Ϻ�">�Ϻ�</option>
              <option value="����">����</option>
              <option value="������">������</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="�ӱ�">�ӱ�</option>
              <option value="ɽ��">ɽ��</option>
              <option value="�ຣ">�ຣ</option>
              <option value="ɽ��">ɽ��</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="�㽭">�㽭</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="�㶫">�㶫</option>
              <option value="̨��">̨��</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="�Ĵ�">�Ĵ�</option>
              <option value="����">����</option>
              <option value="����">����</option>
              <option value="���ɹ�������">���ɹ�������</option>
              <option value="ά���������">ά���������</option>
              <option value="����������">����������</option>
              <option value="���Ļ���������">���Ļ���������</option>
              <option value="����׳��������">����׳��������</option>
              <option value="����ر�������">����ر�������</option>
              <option value="�����ر�������">�����ر�������</option>
            </select></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ϵ�绰��</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="��ϵ�绰" type="text" id="��ϵ�绰"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("��ϵ�绰")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ϵ��ַ��</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="��ϵ��ַ" type="text" id="��ϵ��ַ"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("��ϵ��ַ")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ϵ�ˣ�</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="��ϵ��" type="text" id="��ϵ��"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("��ϵ��")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ע��</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><textarea name="��ע" id="��ע" style="border:1px solid #333333; width:400px; height:50px; margin-left:3px" autocomplete="off"><%=rs1("��ע")%></textarea></td>
        </tr>
        <tr>
          <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onmouseover='return hidestatus()'/>
              <input name="Submit42" type="reset"  style="border:1px solid #000000; margin-left:3px" value="ȡ��"/>
          </td>
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
sql="select * from user_zrr where ֤������='"&request.Form("֤������")&"' and ֤������='"&request.Form("֤������")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("����")=request.Form("����")
rs("����")=request.Form("����")
rs("������")=request.Form("������")
rs("����")=request.Form("����")
rs("�Ա�")=request.Form("�Ա�")
rs("��������_��")=request.Form("��")
rs("��������_��")=request.Form("��")
rs("��������_��")=request.Form("��")
rs("֤������")=request.Form("֤������")
rs("֤������")=request.Form("֤������")
rs("����")=request.Form("����")
rs("��ϵ�绰")=request.Form("��ϵ�绰")
rs("��ϵ��ַ")=request.Form("��ϵ��ַ")
rs("��ϵ��")=request.Form("��ϵ��")
rs("��ע")=request.Form("��ע")
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('��ӳɹ�');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('֤�������Ѵ��ڣ�����ϸ�˶�!');history.go(-1);</script>"         
end if
end if

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from user_zrr where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("����")=request.Form("����")
rs6("����")=request.Form("����")
rs6("������")=request.Form("������")
rs6("����")=request.Form("����")
rs6("�Ա�")=request.Form("�Ա�")
rs6("��������_��")=request.Form("��")
rs6("��������_��")=request.Form("��")
rs6("��������_��")=request.Form("��")
rs6("֤������")=request.Form("֤������")
rs6("֤������")=request.Form("֤������")
rs6("����")=request.Form("����")
rs6("��ϵ�绰")=request.Form("��ϵ�绰")
rs6("��ϵ��ַ")=request.Form("��ϵ��ַ")
rs6("��ϵ��")=request.Form("��ϵ��")
rs6("��ע")=request.Form("��ע")
rs6.update
response.write"<script>alert('�޸ĳɹ�');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from user_zrr where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('ɾ���ɹ�');location.href='khgl.asp';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>