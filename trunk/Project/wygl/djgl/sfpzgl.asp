<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<%
Operation=request.QueryString("Operation")
action=request.QueryString("action")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<SCRIPT src="../js/lj.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/Department.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/Department2.js" type=text/javascript></SCRIPT>
<script language="JavaScript">
function printpr()   //Ԥ������
{
document.all("qingkongyema").click();//��ӡ֮ǰȥ��ҳü��ҳ��
document.all("dayinDiv").style.display="none"; //��ӡ֮ǰ�����ز����ӡ�����Ԫ�أ����������ء���ӡ���͡���ӡԤ����������ť��
document.all("dayinDiv1").style.display="none"; //��ӡ֮ǰ�����ز����ӡ�����Ԫ�أ����������ء���ӡ���͡���ӡԤ����������ť��
var OLECMDID = 7;
var PROMPT = 1; 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
WebBrowser1.ExecWB(OLECMDID, PROMPT);
WebBrowser1.outerHTML = "";
document.all("dayinDiv").style.display="";//��ӡ֮�󽫸�Ԫ����ʾ��������ʾ������ӡ���͡���ӡԤ����������ť����������´δ�ӡ��
document.all("dayinDiv1").style.display="";//��ӡ֮�󽫸�Ԫ����ʾ��������ʾ������ӡ���͡���ӡԤ����������ť����������´δ�ӡ��
}
function printTure()   //��ӡ����
{
    document.all('qingkongyema').click();//ͬ��
    document.all("dayinDiv").style.display="none";//ͬ��
	 document.all("dayinDiv1").style.display="none";//ͬ��
    window.print();
    document.all("dayinDiv").style.display="";
	document.all("dayinDiv1").style.display="";
}
function doPage()
{
    layLoading.style.display = "none";//ͬ��
}
</SCRIPT>


<script language="VBScript">
dim hkey_root,hkey_path,hkey_key
hkey_root="HKEY_CURRENT_USER"
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup"

function pagesetup_null()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
end function

function pagesetup_default()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&bҳ�룬&p/&P"
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"
end function
</script>



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
.STYLE2 {
	font-size: 14pt;
	font-weight: bold;
}
-->
</style>
</head>

<body style="width:100%">
<DIV align="center" id="dayinDiv1" name="dayinDiv1">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11%" height="30"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=lb">�շ��б�</a>&nbsp;&nbsp;</strong></td>
    <td width="89%" height="30"><form id="form1" name="form1" method="post" action="?action=cx" style="margin:0px">
      <table width="473" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="66" align="right">�ͻ�������</td>
          <td width="202">
 <input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:1px solid #333333; width:200px; height:20px; " autocomplete="off" />
  </td>
          <td width="43" align="right">�·ݣ�</td>
          <td width="73"><label>
<%
if request.Form("�·�")<>"" then
ny=split(request.Form("�·�"),"-")
else
ny=split(date(),"-")
end if
%>	  
<select name="�·�" id="�·�">
<%
if request.Form("�·�")<>"" then
%>
<option value="<%=ny(0)%>-<%=ny(1)%>-01"><%=ny(0)%>-<%=ny(1)%></option>
<%end if%>

<option value="<%=ny(0)%>-<%=ny(1)%>-01"><%=ny(0)%>-<%=ny(1)%></option>
<%
set rs0001=server.createobject("adodb.recordset")
sql0001="select distinct �·� from user_sf_lb "
rs0001.open sql0001,conn,3
for a=1 to rs0001.recordcount
    if rs0001.bof or rs0001.eof then exit for 
	sjny=split(rs0001("�·�"),"-")
%>
              <option value="<%=sjny(0)%>-<%=sjny(1)%>-01"><%=sjny(0)%>-<%=sjny(1)%></option>
<%
rs0001.movenext()
next
%>
		  <%if request.QueryString("yf")<>"" then%>
		  <%ny=split(request.QueryString("yf"),"-")%>
		  <%else%>
		  <%ny=split(date(),"-")%>
		  <%end if%>
            </select>
          </label></td>
          <td width="57" align="right"><span style="border-bottom:1px solid #00376F;">
            <input name="Submit422" type="submit"  style="border:1px solid #000000; margin-right:3px" value="��ѯ" onClick="fClose()" onmouseover='return hidestatus()'/>
          </span></td>
        </tr>
      </table>
      </form></td>
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
          <%
		if request.QueryString("action")="cx" then
			response.Write(""&left(request.Form("�·�"),7)&"")
		else
			response.Write(""&left(date(),7)&"")
		end if
		%>
          �ɷ�״̬</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
      </tr>
<%
set rs00=server.createobject("adodb.recordset")
sql00="select * from user_sf"
rs00.open sql00,conn,3

set rs0=server.createobject("adodb.recordset")
sql0="select * from zpgl  where ״̬='����' order by ״̬,id desc"
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
        <td height="93" colspan="12" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û�к�ͬ</td>
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
		sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='�ѽɷ�' and �ͻ�����='"&request.Form("�ͻ�����")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01''"
    elseif  request.Form("�ͻ�����")="" and request.Form("�·�")<>"" then
   		sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='�ѽɷ�'  and �·�='"&ny(0)&"-"&ny(1)&"-01''"
	elseif request.Form("�ͻ�����")<>"" and request.Form("�·�")<>"" then
			sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='�ѽɷ�' and �ͻ�����='"&request.Form("�ͻ�����")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01''"
	elseif request.Form("�ͻ�����")="" and request.Form("�·�")="" then
			sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='�ѽɷ�'  and �·�='"&ny(0)&"-"&ny(1)&"-01''"
	end if
else
sql000="select * from user_sf_lb where ��ͬid='"&rs0("id")&"' and ¼��״̬='�ѽɷ�'  and �·�='"&ny(0)&"-"&ny(1)&"-01''"
end if
		
rs000.open sql000,conn,3
if rs000.recordcount=0 then
response.Write("<span style='color:#FF0000'>δ�ɷ�</samp>")

else
response.Write("�ѽɷ�")
end if
%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><a href="?Operation=xg&amp;id=<%=rs0("id")%>&yf=<%=request.Form("�·�")%>">�鿴����</a></td>
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


<tr>
    <td colspan="2" align="center" valign="middle">



</td>
  </tr>
</table>
</DIV>
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
<DIV align=center>

	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:0px solid  #00376F; margin-top:10px">
        <tr>
          <td height="40" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><span class="STYLE2">������������Ͷ�����޹�˾<%=rs1("������ҵ԰")%>�տ��վݣ�<%=ny(0)%>��-<%=ny(1)%>�£�</span></td>
        </tr>
        <tr>
          <td height="30" align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;���ݱ�ţ�&nbsp;<%=rs1("����")%>&nbsp;&nbsp;&nbsp;&nbsp;�ͻ����ƣ�<%=rs1("�ͻ�����")%></td>
        </tr>
        <tr>
          <td height="30" align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;������ҵ԰��<%=rs1("������ҵ԰")%>&nbsp;&nbsp;&nbsp;&nbsp;����������<%=rs1("��������")%>&nbsp;&nbsp;&nbsp;&nbsp;�������ͣ�
            <%
set rs0002=server.createobject("adodb.recordset")
sql0002="select * from gyy_fc_lb  where ��ҵ԰����='"&rs1("������ҵ԰")&"' and ����='"&rs1("��������")&"'"
rs0002.open sql0002,conn,3
response.Write(""&rs0002("��������")&"")
		  %></td>
        </tr>
        <tr>
          <td height="100" colspan="2" align="right" valign="top"style="border-bottom:1px solid #00376F;"><table width="100%"  style="border:1px solid  #00376F; " cellspacing="0" cellpadding="0">
            <tr>
              <td width="111" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
              <td width="103" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>ǰ�ζ���</strong></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���ζ���</strong></td>
              <td width="158" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
              <td width="173" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
              <td width="142" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���ڽ��</strong></td>
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
              <td height="93" colspan="20" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û����Ŀ</td>
            </tr>
            <%
end if
for i=1 to rs01.recordcount
if rs01.bof or rs01.eof then exit for
%>

            <tr>
              <td height="25"  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs01("�շ���Ŀ")%></td>
              <td height="25"  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%
set rs0110=server.createobject("adodb.recordset")
sql0110="select * from user_sf_lb  where ��ͬid='"&rs1("id")&"' and �շ���Ŀ='"&rs01("�շ���Ŀ")&"' and �·�<'"&ny(0)&"-"&ny(1)&"-01'"&"'"
rs0110.open sql0110,conn,3
if rs0110.recordcount=0 then
response.Write("��")
syds=0
else
 if rs0110("����")="��̬" then
syds=rs0110("���¶���")
response.Write(""&syds&"")
else
response.Write("��")
end if
end if
%></td>
              <td width="109" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
set rs011=server.createobject("adodb.recordset")
sql011="select * from user_sf_lb  where ��ͬid='"&rs1("id")&"' and �շ���Ŀ='"&rs01("�շ���Ŀ")&"' and �·�='"&ny(0)&"-"&ny(1)&"-01'"

rs011.open sql011,conn,3
if rs011.recordcount=0 then
response.Write("��")
else
if rs011("����")="�̶�" then
response.Write("��")
else
response.Write(""&rs011("���¶���")&"")
end if
end if
%></td>
              
              <td height="25"  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs011("����")="�̶�" then 
response.Write("��")
else%>
<%=(rs011("���¶���")-syds)*rs01("���")+(rs011("���¶���")-syds)%>
<%end if%>			  </td>
              <td height="25" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs011("�շѱ�׼")%></td>
              <td height="25" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%=rs011("Ӧ��ȡ���")%>
<%ysqje=ysqje-(-rs011("Ӧ��ȡ���"))%></td>
            </tr>
            <%
rs01.movenext()
next
%>
            <tr>
              <td height="25"  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�����ܼƣ�</td>
              <td height="25" colspan="4"  align="left" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;<%=ysqje-(-scje)-(-znj)%></td>
              <td height="25" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=ysqje%>&nbsp;</td>
            </tr>
          </table></td>
        </tr>

        <tr>
          <td height="30" colspan="3" align="right" valign="middle"style="border-bottom:1px solid #00376F;">��Ʊʱ��:&nbsp;<%=date()%>&nbsp;&nbsp;&nbsp;</td>
        </tr>
      </table>
	</form> 
	<DIV align="center" style="height:30px; vertical-align:middle" id="dayinDiv" name="dayinDiv">
<a href="#" onClick="printTure();">��ӡ</a>
<input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="���ҳ��" onClick="pagesetup_null()">  
</DIV>	 
</div>



	  <% end if
  rs1.close
set rs1=nothing
  %>
</body>
</html>
<%

if action="xg" then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from user_sf_lb where ��ͬid='"&request.QueryString("id")&"' and �·�='"&request.Form("�·�")&"'",conn,1
rs2.close
set rs2=nothing

set rs61=server.createobject("adodb.recordset")
sql61="select * from user_sf "
rs61.open sql61,conn,1,3
for j=1 to rs61.recordcount
   if rs61.bof or rs61.eof then exit for

set rs6=server.createobject("adodb.recordset")
sql6="select * from user_sf_lb "
rs6.open sql6,conn,1,3
rs6.addnew
rs6("�շ���Ŀ")=request.Form("�շ���Ŀ"&j&"")
rs6("�շѱ�׼")=request.Form("�շѱ�׼"&j&"")
rs6("���")=request.Form("���"&j&"")
rs6("�շ�˵��")=request.Form("�շ�˵��"&j&"")
rs6("���¶���")=request.Form("���¶���"&j&"")
rs6("���ݱ��")=request.Form("���ݱ��")
rs6("�·�")=request.Form("�·�")
rs6("����")=request.Form("����"&j&"")
rs6("��ͬid")=request.QueryString("id")
rs6("״̬")="δ��ȡ"

set rs611=server.createobject("adodb.recordset")
sql611="select * from user_sf_lb  where ��ͬid='"&request.QueryString("id")&"' and �շ���Ŀ='"&request.Form("�շ���Ŀ"&j&"")&"' and �·�='"&year(now)&"-"&month(now)-1&"-01'"
rs611.open sql611,conn,1,3
if request.Form("����"&j&"")="�̶�" then
rs6("Ӧ��ȡ���")=request.Form("�շѱ�׼"&j&"")
elseif request.Form("����"&j&"")="��̬" then
rs6("Ӧ��ȡ���")=(request.Form("���¶���"&j&"")-rs611("���¶���"))*(request.Form("�շѱ�׼"&j&""))*(1-request.Form("���"&j&""))
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