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
<SCRIPT src="../js/zpht.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/zpht2.js" type=text/javascript></SCRIPT>
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
.STYLE2 {font-size: 16}
.STYLE3 {	font-size: 18px;
	font-weight: bold;
}
.STYLE5 {font-size: 18px; }
-->
</style>
</head>

<body style="width:100%">
<DIV align="center" id="dayinDiv1" name="dayinDiv1">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="fltj.asp?Operation=lb">�ܷ���ͳ���б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="fltj_xx.asp?Operation=lb">��ϸ������ͳ���б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
  <tr>
    <td height="30" colspan="2">
	<form id="form3" name="form3" method="post" action="fltj.asp" style="margin:0px">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="41" align="right" valign="middle">���ƣ�</td>
          <td width="105">
            <input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off"  />     </td>
          <td width="53" align="right">��ҵ԰��</td>
          <td width="78">	  
            <select name="fh" size="1" id="fh" onChange="makech1(options.selectedIndex)">
              <option  value="��ѡ��">��ѡ��</option>
              <%   
sql="select * from  gyy_lb   order by ��� asc"
set rs2=server.createobject("adodb.recordset")
rs2.open sql,conn,1,1
rs2.pagesize=1
for cc=1 to rs2.pagecount
   if rs2.bof or rs2.eof then exit for
%>
              <option  value="<%=rs2("��ҵ԰����")%>"><%=rs2("��ҵ԰����")%></option>
              <%
rs2.movenext
next
%>
            </select>         </td>
          <td width="43" align="right">���ͣ�</td>
          <td width="78"><select name="ch" id="ch">
            <option  value="��ѡ��">��ѡ��</option>
<%   
sql10="select distinct ��������  from  gyy_lb_fclx_lb_xflx"
set rs210=server.createobject("adodb.recordset")
rs210.open sql10,conn,1,1
rs210.pagesize=1
for dd=1 to rs210.pagecount
   if rs210.bof or rs210.eof then exit for
%>
              <option  value="<%=rs210("��������")%>"><%=rs210("��������")%></option>
              <%
rs210.movenext
next
%>
          </select></td>
          <td width="30" align="right">&nbsp;�꣺</td>
          <td width="59">
		  <select name="n" id="n">
		  		  <option value="��ѡ��">��ѡ��</option>
		  <%for nn=year(now)-5 to year(now)%>
            <option value="<%=nn%>"><%=nn%></option>
		<%next%>
          </select></td>
          <td width="28" align="right">�£�</td>
          <td width="41"><label>
            <select name="y" id="y">
		  		  <option value="��ѡ��">��ѡ��</option>
			<%for yy=1 to 12%>
              <option value="<%=yy%>"><%=yy%></option>
			  <%next%>
            </select>
          </label></td>
          <td width="96" align="center" valign="middle">
            <input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="����" onClick="fClose()" onmouseover='return hidestatus()'/></td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
</table>
</DIV>
<%if Operation="lb" or Operation="" then%>
<DIV align=center>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000"><span class="STYLE2"><span class="STYLE3 STYLE2"><span class="STYLE5">������������Ͷ�����޹�˾&nbsp;</span></span></span></td>
  </tr>
  <tr></tr>
</table>
<table width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #00376F; margin-top:10px">
      <tr>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ͻ�����</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������ҵ԰</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ��ʼʱ��</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ����ʱ��</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�·�</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
  </tr>
<%
if request.QueryString("khmc")="" and request.Form("�ͻ�����")="" then
khmc=""
elseif  request.QueryString("khmc")<>"" and request.Form("�ͻ�����")="" then
khmc=request.QueryString("khmc")
elseif  request.QueryString("khmc")="" and request.Form("�ͻ�����")<>"" then
khmc=request.Form("�ͻ�����")
end if

if request.QueryString("gyy")="" and request.Form("fh")="��ѡ��" then
gyy=""
elseif  request.QueryString("gyy")<>"" and request.Form("fh")="��ѡ��" then
gyy=request.QueryString("gyy")
elseif  request.QueryString("gyy")<>"" and request.Form("fh")="" then
gyy=request.QueryString("gyy")
elseif  request.QueryString("gyy")="" and request.Form("fh")<>"��ѡ��" then
gyy=request.Form("fh")

end if

if request.QueryString("fclx")="" and request.Form("ch")="��ѡ��" then
fclx=""
elseif  request.QueryString("fclx")<>"" and request.Form("ch")="��ѡ��" then
fclx=request.QueryString("fclx")
elseif  request.QueryString("fclx")<>"" and request.Form("ch")="" then
fclx=request.QueryString("fclx")
elseif  request.QueryString("fclx")="" and request.Form("ch")<>"��ѡ��" then
fclx=request.Form("ch")
end if

if request.QueryString("ssfc")="" and request.Form("��������")="" then
ssfc=""
elseif  request.QueryString("ssfc")<>"" and request.Form("��������")="" then
ssfc=request.QueryString("ssfc")
elseif  request.QueryString("ssfc")="" and request.Form("��������")<>"" then
ssfc=request.Form("��������")
end if

if request.Form("n")="��ѡ��" and  request.Form("y")="��ѡ��" then
sql00="select * from  user_sf_zb where  �ɷ�״̬='�ѽɷ�'"
else
if request.Form("n")="" and request.QueryString("n")="" and  request.Form("y")="" and request.QueryString("y")="" then
sql00="select * from  user_sf_zb where  �ɷ�״̬='�ѽɷ�'"
elseif request.Form("n")<>"" and  request.Form("y")="��ѡ��"then
sql00="select * from  user_sf_zb where ������='"&request.Form("n")&"' and �ɷ�״̬='�ѽɷ�'"
elseif request.Form("n")="��ѡ��" and  request.Form("y")<>""then
sql00="select * from  user_sf_zb where ������='"&request.Form("y")&"' and �ɷ�״̬='�ѽɷ�'"
elseif request.QueryString("n")="" and  request.QueryString("y")<>""then
sql00="select * from  user_sf_zb where ������='"&request.QueryString("y")&"' and �ɷ�״̬='�ѽɷ�'"
elseif request.QueryString("n")<>"" and  request.QueryString("y")=""then
sql00="select * from  user_sf_zb where ������='"&request.QueryString("n")&"' and �ɷ�״̬='�ѽɷ�'"
elseif request.QueryString("n")<>"" and  request.QueryString("y")<>""then
sql00="select * from  user_sf_zb where ������='"&request.QueryString("n")&"'and  ������='"&request.QueryString("y")&"'and  �ɷ�״̬='�ѽɷ�'"
elseif request.Form("n")<>"��ѡ��" and  request.Form("y")<>"��ѡ��"then
sql00="select * from  user_sf_zb where ������='"&request.Form("n")&"'and  ������='"&request.Form("y")&"'and  �ɷ�״̬='�ѽɷ�'"
end if
end if

if request.Form("y")="��ѡ��"  then
y=rs00("������")
else
if request.Form("y")="" and request.QueryString("y")="" then
y=rs00("������")
elseif request.Form("y")<>"" then
y=request.Form("y")
elseif request.QueryString("y")<>"" then
y=request.QueryString("y")
end if
end if

sql00="select * from  user_sf_zb where  �ɷ�״̬='�ѽɷ�'"

set rs00=server.createobject("adodb.recordset")
rs00.open sql00,conn,3
rs00.pagesize=1
if rs00.recordcount=0 then

%>
      <tr>
        <td height="100" colspan="14" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û������</td>
  </tr>
<%
end if
for i=1 to rs00.recordcount
if rs00.bof or rs00.eof then exit for

if request.Form("n")="��ѡ��" then
n=rs00("������")
else
if request.Form("n")="" and request.QueryString("n")="" then
n=rs00("������")
elseif request.Form("n")<>"" then
n=request.Form("n")
elseif request.QueryString("n")<>"" then
n=request.QueryString("n")
end if
end if

if request.Form("y")="��ѡ��"  then
y=rs00("������")
else
if request.Form("y")="" and request.QueryString("y")="" then
y=rs00("������")
elseif request.Form("y")<>"" then
y=request.Form("y")
elseif request.QueryString("y")<>"" then
y=request.QueryString("y")
end if
end if

set rs0=server.createobject("adodb.recordset")
if khmc="" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl where  ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ��������='"&fclx&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&ssfc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&fclx&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&ssfc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc="" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"'and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc="" and gyy="" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&fclx&"' and  ��������='"&ssfc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and ��������='"&fclx&"'��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"'��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' and ��������='"&ssfc&"'��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' and ����='"&rs00("��ͬ���")&"' order by ��ͬ����ʱ��-"&date()&" asc"
end if
rs0.open sql0,conn,3
if rs0.recordcount<>0 then

if rs0("��ͬ��ʼʱ��_��")=""&n&"" then
  if rs0("��ͬ��ʼʱ��_��")>""&y&"" then
	zt=0
	else
	zt=1
	end if
elseif 	rs0("��ͬ����ʱ��_��")=""&n&"" then
	if rs0("��ͬ����ʱ��_��")<""&y&"" then
	zt=0
	else
	zt=1
	end if
elseif rs0("��ͬ��ʼʱ��_��")<""&n&"" and  rs0("��ͬ����ʱ��_��")>""&n&"" then
zt=1
end if
if zt=1 then

sql222="select * from  user_sf_zb where ��ͬ���='"&rs00("��ͬ���")&"' and ������='"&n&"' and ������='"&y&"' and �ɷ�״̬='�ѽɷ�'"
set rs2222=server.createobject("adodb.recordset")
rs2222.open sql222,conn,1,1
if rs2222.recordcount<>0 then
sxh=sxh+1
%>
      <tr>
        <td width="33" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=sxh%></td>
        <td width="152" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="71" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("�ͻ�����")%></td>
        <td width="82" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("������ҵ԰")%></td>
        <td width="85" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��������")%>-<%=rs0("��������")%></td>
        <td width="88" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��ͬ��ʼʱ��")%></td>
        <td width="93" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<% 
		if rs0("��ͬ����ʱ��")<>"" then 
			  response.Write(""&rs0("��ͬ����ʱ��")&"")
		else
		      response.Write("δǩ����ͬ")
		end if
		%>		</td>
        <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<%=n%>/<%=y%></td>
        <td width="64" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F ">
<%
response.Write(""&rs2222("�ܷ���")&"")
zfy=zfy-(-rs2222("�ܷ���"))
%>	</td>
  </tr>
<%
end if
end if
end if
rs00.movenext()
next
%>

      <tr>
        <td height="25" colspan="8" align="left" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;�ܼƣ�</td>
        <td width="64" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F ">
<%
response.Write(""&zfy&"")
%>	</td>
  </tr>
</table>
	  <DIV align="center" style="height:30px; vertical-align:middle" id="dayinDiv" name="dayinDiv">
<a href="#" onClick="printTure();">��ӡ</a>
<input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="���ҳ��" onClick="pagesetup_null()">  
</DIV>
</DIV>
<% 
rs0.close
set rs0=nothing
end if
%>
</body>
</html>
<%
conn.close
set conn=nothing
%>