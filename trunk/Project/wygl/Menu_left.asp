<!--#INCLUDE FILE="Safe/conn.asp"-->
<!--#INCLUDE FILE="Safe/md5.asp"-->
<!--#INCLUDE FILE="Safe/nrbh.asp"-->

<%
sql="select * from  role_lb  where role_name='"&session("admin_limit")&"'"
set rs2=server.createobject("adodb.recordset")
rs2.open sql,conn,1,1
%>
<SCRIPT src="js/lj.js" type=text/javascript></SCRIPT>
<style type="text/css">
<!--
body {
	margin-top: 0px;
	margin-bottom: 10px;
	margin-left: 12px;
}
.aa {
	font-size: 9pt;
	color: #FFFFFF;
}
.aa:link {
	text-decoration: none;
}
.aa:visited {
	text-decoration: none;
	color: #FFFFFF;
}
.aa:hover {
	text-decoration: none;
	color: #FFFFFF;
}
.aa:active {
	text-decoration: none;
	color: #FFFFFF;
}
a {evt:expression(window.status='������������Ͷ�����޹�˾')}
.STYLE2 {color: #FFFFFF}
-->
</style>
<STYLE type="text/css">
A:link { COLOR: #000000; FONT-SIZE: 12px; TEXT-DECORATION: none}
A:visited { COLOR: #000000; FONT-SIZE: 12px; TEXT-DECORATION: none}
A:hover { COLOR: #666666; FONT-SIZE: 12px; TEXT-DECORATION: none}
BODY { FONT-SIZE: 12px;}
TD { FONT-SIZE: 12px; line-height: 150%}
body {background-color: #00CC66;}
</style>
<table border=0 align=center cellpadding=0 cellspacing=0 bgcolor="#3F496D" id=mnuList style="WIDTH:158px;HEIGHT: 100%">
<tr>
<td align="center" valign="top"  height="100%">
<table width="100%"  border=0 align=center cellpadding=0 cellspacing=0>
<tr><td height="30" align="left" valign="middle">
&nbsp;&nbsp;<span class="STYLE2"><strong>���ã�<%=session("admin_name")%></strong></span>
</td>
<td width="50px" height="30" align="center" valign="middle"><A onMouseover="return hidestatus()"  href="out.asp" target="_top"><strong><span style="cursor:hand;" class="aa" id="aa">ע��</span></strong></a></td>
</tr>
</table>
<%
if session("admin_limit")="�ܹ���Ա" or rs2("����¼��")=1 or  rs2("�ɷѹ���")=1 then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>�շѹ���</strong></span></td>
  </tr>
 <%if session("admin_limit")="�ܹ���Ա" or rs2("����¼��")=1 then%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="sfgl/sjlr.asp" target="right">����¼��</a></td>
  </tr>
 <%end if
 if session("admin_limit")="�ܹ���Ա" or rs2("�ɷѹ���")=1 then%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="sfgl/jf.asp" target="right">�ɷѹ���</a></td>
  </tr>
 <%end if%>
</table>

<%
end if
if session("admin_limit")="�ܹ���Ա" or rs2("��ҵ԰����")=1 or  rs2("��������")=1 or  rs2("�ͻ�����")=1 then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>��Դ����</strong></span></td>
  </tr>
<%
if session("admin_limit")="�ܹ���Ա" or rs2("��ҵ԰����")=1  then
%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="zygl/gyygl.asp" target="right">��ҵ԰����</a></td>
  </tr>
<%
end if
if session("admin_limit")="�ܹ���Ա"  or  rs2("��������")=1  then
%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zygl/fcgl.asp" target="right">��������</a></td>
  </tr>
<%
end if 
if session("admin_limit")="�ܹ���Ա" or   rs2("�ͻ�����")=1 then
%>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zygl/khgl.asp" target="right">�ͻ�����</a></td>
  </tr>
<%
end if 
%>
</table>
<%
end if
if session("admin_limit")="�ܹ���Ա" or rs2("Ԥ������")=1 or rs2("��ƾ��ͬ����")=1 or rs2("��ͬ������ʾ")=1 or rs2("�տ����ͳ��")=1 or rs2("�տ���ϸͳ��")=1 then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>��ƾ����</strong></span></td>
  </tr>
 <%
if session("admin_limit")="�ܹ���Ա" or rs2("Ԥ������")=1  then 
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/ydgl.asp" target="right">Ԥ������</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="�ܹ���Ա"  or rs2("��ƾ��ͬ����")=1 then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/zpht.asp" target="right">��ƾ��ͬ����</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="�ܹ���Ա"  or rs2("��ͬ������ʾ")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/htdqts.asp" target="right">��ͬ������ʾ</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="�ܹ���Ա" or rs2("�տ����ͳ��")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18" /></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/zbxxtj.asp" target="right">�տ����ͳ��</a></td>
  </tr>
 <%end if 
 if session("admin_limit")="�ܹ���Ա" or rs2("�տ���ϸͳ��")=1 then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18" /></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="zpgl/fltj.asp" target="right">�տ���ϸͳ��</a></td>
  </tr>
  <%
  end if
  %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="ls/index.asp" target="right">��ʱ��Ʊ</a></td>
  </tr>
</table>
<%
end if
if session("admin_limit")="�ܹ���Ա" or rs2("��ɫȨ��")=1 or rs2("����Ա����")=1 or rs2("�޸ı�������")=1 or rs2("�˳�ϵͳ")=1  then
%>
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border:1px solid #006600; margin-top:10px">
  <tr>
    <td width="15%" align="center" bgcolor="#006600"><img src="images/1.gif" width="22" height="20"></td>
    <td height="25" colspan="2" align="left" bgcolor="#006600"><span class="STYLE2">&nbsp;&nbsp;&nbsp;<strong>ϵͳ����</strong></span></td>
  </tr>
 <%
 if session("admin_limit")="�ܹ���Ա" or rs2("��ɫȨ��")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td width="13%" height="18" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td width="72%" align="left" bgcolor="#009900">&nbsp;<a href="xtgl/Role.asp" target="right">��ɫȨ��</a></td>
  </tr>
 <%
 end if
 if session("admin_limit")="�ܹ���Ա"  or rs2("����Ա����")=1 then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="xtgl/glygl.asp" target="right">����Ա����</a></td>
  </tr>
 <%end if
 if session("admin_limit")="�ܹ���Ա" or rs2("�޸ı�������")=1   then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="xtgl/xgbsmm.asp" target="right">�޸ı�������</a></td>
  </tr>
 <%end if
 if session("admin_limit")="�ܹ���Ա"or rs2("�˳�ϵͳ")=1  then
 %>
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;</td>
    <td height="13" align="left" bgcolor="#009900"><img src="images/1_1.gif" width="18" height="18"></td>
    <td height="13" align="left" bgcolor="#009900">&nbsp;<a href="out.asp" target="_top">�˳�ϵͳ</a></td>
  </tr>
  <%end if%>
</table>
<%end if%>
</td>
</tr>
	<tr> 
		<td bgcolor="#ffffff" id=outLookBarShow style="HEIGHT: 100%" valign=top align="left" name="outLookBarShow">
      </td>
	</tr>
</table>