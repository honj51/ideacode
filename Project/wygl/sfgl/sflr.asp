<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
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
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body style="width:100%">
<%
if request.Form("�·�")<>"" then
ny=split(request.Form("�·�"),"-")
else
ny=split(date(),"-")
end if
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11%" height="30"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=lb">�շ��б�</a>&nbsp;&nbsp;</strong></td>
    <td width="89%" height="30" align="left" valign="bottom">
	<form id="form1" name="form1" method="post" action="?action=cx" style="margin:0px">
      <table width="473" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="66" align="right">�ͻ�������</td>
          <td width="202">
 <input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:1px solid #333333; width:200px; height:20px; " autocomplete="off" />
  </td>
          <td width="43" align="right">�·ݣ�</td>
          <td width="73"><label>
		  
<select name="�·�" id="�·�">
<%
if request.Form("�·�")<>"" then
%>
<option value="<%=ny(0)%>-<%=ny(1)%>-01"><%=ny(0)%>-<%=ny(1)%></option>
<%end if%>
<option value="<%=year(now)%>-<%=month(now)%>-01"><%=year(now)%>-<%=month(now)%></option>
<%
  for nn=year(now)-2 to year(now)
      for yy=1 to 12
%>
<option value="<%=nn%>-<%=yy%>-01"><%=nn%>-<%=yy%></option>

<%
next
next
%>
            </select>
          </label></td>
          <td width="57" align="right"><span style="border-bottom:1px solid #00376F;">
            <input name="Submit422" type="submit"  style="border:1px solid #000000; margin-right:3px" value="��ѯ" onClick="fClose()" onmouseover='return hidestatus()'/>
          </span></td>
        </tr>
      </table>
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
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ͻ�����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������ҵ԰</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>
		
		
		<span class="STYLE2">
		<%
			response.Write(""&ny(0)&"-"&ny(1)&"")

		%>
		</span>¼��״̬</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
      </tr>
<%
set rs00=server.createobject("adodb.recordset")
sql00="select * from user_sf"
rs00.open sql00,conn,3

set rs0=server.createobject("adodb.recordset")

if request.QueryString("action")="cx" then
 if request.Form("�ͻ�����")="" then
sql0="select * from zpgl  where ״̬='����' order by ״̬,id desc"
else
sql0="select * from zpgl  where ״̬='����' and �ͻ�����='"&request.Form("�ͻ�����")&"' order by ״̬,id desc"
end if
else
sql0="select * from zpgl  where ״̬='����' order by ״̬,id desc"
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
        <td height="93" colspan="12" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û����Ϣ</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="57" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("�ͻ�����")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("������ҵ԰")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��������")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
set rs000=server.createobject("adodb.recordset")
if request.QueryString("action")="cx" then
   if request.Form("�ͻ�����")<>"" and  request.Form("�·�")=""then
		sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='��¼��' and �ͻ�����='"&request.Form("�ͻ�����")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01'"
    elseif  request.Form("�ͻ�����")="" and request.Form("�·�")<>"" then
   		sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='��¼��'  and �·�='"&ny(0)&"-"&ny(1)&"-01'"
	elseif request.Form("�ͻ�����")<>"" and request.Form("�·�")<>"" then
			sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='��¼��' and �ͻ�����='"&request.Form("�ͻ�����")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01'"
	elseif request.Form("�ͻ�����")="" and request.Form("�·�")="" then
	ny=split(date(),"-")
			sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='��¼��'  and �·�='"&ny(0)&"-"&ny(1)&"-01'"
	end if
else
sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='��¼��'  and �·�='"&ny(0)&"-"&ny(1)&"-01'"
end if
		
rs000.open sql000,conn,3
if rs000.recordcount=0 then
response.Write("<span style='color:#FF0000'>δ¼��</samp>")

else
response.Write("��¼��")
end if
%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><a href="?Operation=xg&id=<%=rs0("id")%>&yf=<%=request.Form("�·�")%>">�鿴����</a></td>
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
%>

<%
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from zpgl where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3

if request.QueryString("yf")<>"" then
ny=split(request.QueryString("yf"),"-")
else
ny=split(date(),"-")
end if
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30"   width="11%" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���룺</td>
          <td height="30" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;">  
		<input name="����" type="text" id="����"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off"  readonly="true"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�ͻ����ƣ�</td>
          <td height="30" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("�ͻ�����")%>" autocomplete="off" readonly="true"/>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������ҵ԰��</td>
          <td width="22%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="������ҵ԰" type="text" id="������ҵ԰"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("������ҵ԰")%>" autocomplete="off" readonly="true"/></td>
          <td width="9%" align="right" valign="middle"style="border-bottom:1px solid #00376F;">������ţ�</td>
          <td width="22%" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="��������" type="text" id="��������"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("��������")%>" autocomplete="off" readonly="true"/></td>
          <td width="11%" align="right" valign="middle"style="border-bottom:1px solid #00376F;">�������ͣ�</td>
          <td width="25%" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  
		  <%
set rs0002=server.createobject("adodb.recordset")
sql0002="select * from gyy_fc_lb  where ��ҵ԰����='"&rs1("������ҵ԰")&"' and ����='"&rs1("��������")&"'"
rs0002.open sql0002,conn,3
response.Write(""&rs0002("��������")&"")
		  %>
		  </td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�·ݣ�</td>
          <td height="30" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>	
<input name="�·�" type="text" id="�·�"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=ny(0)%>-<%=ny(1)%>" autocomplete="off" readonly="true"/>



            </select>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="top"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><br />
            ���ô���</td>
          <td height="100" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  <table width="100%"  style="border:1px solid  #00376F; margin:5px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="35" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td width="102" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�շ���Ŀ</strong></td>
        <td width="52" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�շѱ�׼</strong></td>
        <td width="72" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td width="52" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td width="101" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�շ�˵��</strong></td>
        <td width="134" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ϸ��¶���</strong></td>
        <td width="197" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>���¶���</strong></td>
      </tr>
<%
set rs01=server.createobject("adodb.recordset")
sql01="select * from user_sf  where ������ҵ԰='"&rs1("������ҵ԰")&"' and  ��Ŀ����='"&rs0002("��������")&"' order by id desc"
rs01.open sql01,conn,3
rs01.pagesize=10
if request("page")<>"" then
  epage=cint(request("page"))
   if epage<1 then epage=1
   if epage>rs01.pagecount then epage=rs01.pagecount
else
epage=1
end if
if rs01.recordcount=0 then
%>
      <tr>
        <td height="93" colspan="17" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û����Ŀ</td>
        </tr>
<%
end if
for i=1 to rs01.recordcount
if rs01.bof or rs01.eof then exit for
%>
      <tr>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="�շ���Ŀ<%=i%>" type="text" id="�շ���Ŀ<%=i%>"  style="border:0px solid #333333; width:100px; height:20px " value="<%=rs01("�շ���Ŀ")%>" autocomplete="off" readonly="true"/></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<input name="�շѱ�׼<%=i%>" type="text" id="�շѱ�׼<%=i%>"  style="border:0px solid #333333; width:50px; height:100%" value="<%=FormatNumber(rs01("�շѱ�׼"),2,-1)%>" autocomplete="off" readonly="true"/></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		  <label>
<%
set rs011=server.createobject("adodb.recordset")
sql011="select * from user_sf_lb  where ��ͬid='"&rs1("id")&"' and �շ���Ŀ='"&rs01("�շ���Ŀ")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01'"
rs011.open sql011,conn,3
if rs01("����")="��̬" then
%>	
		  <select name="���<%=i%>" id="���<%=i%>">
		  <%if not rs011.bof and not rs011.eof  then%>
		  <option value="<%=(rs011("���")%>"><%=rs011("���")%>%</option>
		  <%else%>
            <option value="<%=(rs01("���")%>"><%=rs01("���")%>%</option>
		<%end if%>
            <%for k=0 to 15%>
            <option value="<%=k/100%>"><%=k%>%</option>
            <%next%>
          </select>
<%
else
response.Write("��")
end if
		  %>
		  </label></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="����<%=i%>" type="text" id="����<%=i%>"  style="border:0px solid #333333; width:50px; height:20px " value="<%=rs01("����")%>" autocomplete="off" readonly="true"/></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="�շ�˵��<%=i%>" type="text" id="�շ�˵��<%=i%>"  style="border:0px solid #333333; width:150px; height:20px " value="<%=rs01("�շ�˵��")%>" autocomplete="off" readonly="true"/></td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
set rs0110=server.createobject("adodb.recordset")
sql0110="select * from user_sf_lb  where ��ͬid='"&rs1("id")&"' and �շ���Ŀ='"&rs01("�շ���Ŀ")&"' and �·�<'"&ny(0)&"-"&ny(1)&"-01'"
rs0110.open sql0110,conn,3
if rs0110.recordcount=0 then
response.Write("��")
else
 if rs0110("����")="��̬" then
 response.Write(""&rs0110("���¶���")&"")
 else
 response.Write("��")
 end if
 end if
%>
</td>
        <td  height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">

<% if rs01("����")<>"�̶�" then%>
<input name="���¶���<%=i%>" type="text" id="���¶���<%=i%>"  style="border:0px solid #333333; width:100%; height:20px " value="<%=rs011("���¶���")%>" autocomplete="off"/>
<%else
response.Write("��")
end if
%>
</td>
      </tr>
<%
rs01.movenext()
next
%>
    </table>		  </td>
        </tr>

        <tr>
          <td height="30" colspan="8" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onmouseover='return hidestatus()'/>
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

if action="xg" then
if request.Form("�·�")<>"" then
ny=split(request.Form("�·�"),"-")
else
ny=split(date(),"-")
end if
FOR i=1 to 4
suiji=suijishu()
suiji1=suiji1&suiji
next
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from user_sf_lb where ��ͬid='"&request.QueryString("id")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01'",conn,1
rs2.close
set rs2=nothing

set rs61=server.createobject("adodb.recordset")
sql61="select * from user_sf "
rs61.open sql61,conn,1,3
for j=1 to rs61.recordcount-1
   if rs61.bof or rs61.eof then exit for

set rs6=server.createobject("adodb.recordset")
sql6="select * from user_sf_lb "
rs6.open sql6,conn,1,3
rs6.addnew
rs6("�շ���Ŀ")=request.Form("�շ���Ŀ"&j&"")
rs6("�շѱ�׼")=request.Form("�շѱ�׼"&j&"")

if request.Form("����"&j&"")="��̬" then
rs6("���")=request.Form("���"&j&"")
else
rs6("���")=0
end if

rs6("�շ�˵��")=request.Form("�շ�˵��"&j&"")

if request.Form("����"&j&"")="�̶�" then
rs6("���¶���")="0"
else
rs6("���¶���")=request.Form("���¶���"&j&"")
end if
rs6("���ݱ��")="sj"&year(now)&""&month(now)&""&day(now)&""&hour(now)&""&minute(now)&""&second(now)&""&suiji1&""
rs6("�·�")=""&request.Form("�·�")&"-01"
rs6("����")=request.Form("����"&j&"")
rs6("��ͬid")=request.QueryString("id")
rs6("¼��״̬")="��¼��"

set rs611=server.createobject("adodb.recordset")
sql611="select * from user_sf_lb  where ��ͬid='"&request.QueryString("id")&"' and �շ���Ŀ='"&request.Form("�շ���Ŀ"&j&"")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01'"
rs611.open sql611,conn,1,3
if rs611("���¶���")="" or rs611.recordcount=0 then
byds=0 
else
byds=rs611("���¶���")
end if

if request.Form("����"&j&"")="�̶�" then
rs6("Ӧ��ȡ���")=request.Form("�շѱ�׼"&j&"")
elseif request.Form("����"&j&"")="��̬" then
rs6("Ӧ��ȡ���")=(request.Form("���¶���"&j&"")-byds)*(request.Form("�շѱ�׼"&j&""))*(1-(-request.Form("���"&j&"")))
elseif request.Form("����"&j&"")="����" then
rs6("Ӧ��ȡ���")=request.Form("�շѱ�׼"&j&"")*request.Form("���¶���"&j&"")
end if

rs6.update
rs61.movenext()
next
response.write"<script>alert('�޸ĳɹ�');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from zpgl where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('ɾ���ɹ�');location.href='?';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>