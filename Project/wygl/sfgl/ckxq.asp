<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from zpgl where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3

set rs0=server.createobject("adodb.recordset")
sql0="select * from zpgl_lx_lb where ��ͬ���='"&rs1("����")&"' order by id asc"
rs0.open sql0,conn,3
Operation=request.QueryString("Operation")
action=request.QueryString("action")


set rs00125=server.createobject("adodb.recordset")
sql00125="select * from user_sf_zb where ���ݱ��='"&rs1("����")&"_"&request.QueryString("xh")&"'"
rs00125.open sql00125,conn,1,3
%>
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
.STYLE2 {
	font-size: 18pt;
	font-weight: bold;
}
.STYLE3 {font-size: 16px}
-->
</style>
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
<DIV align="center" id="dayinDiv1" name="dayinDiv1">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="sjlr.asp?Operation=lb&page=<%=request.QueryString("page")%>">¼���б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle"><form id="form3" name="form3" method="post" action="sjlr.asp" style="margin:0px">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="41" align="right" valign="middle">���ƣ�</td>
          <td width="105">
            <input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off"  />     </td>
          <td width="53" align="right">��ҵ԰��</td>
          <td width="78">
<script language="javascript">
//���溯������ʾ���������˵��Ĵ������
function makech1(x){
    var form3=document.form3.fh.options.length;//������ͬ��
    var form3l=new Array(form3)//�½�һ�����飬����Ϊ��һ�������б������
    for(ii=1;ii<form3;ii++)//ѭ����һ�������б��������ô���
        form3l[ii]=new Array();//��ѭ��
        //�����Ǹ�ÿ��ѭ����ֵ  
    var ch=document.form3.ch;//��������
	
<%   
sql20="select * from  gyy_lb   order by ��� asc"
set rs20=server.createobject("adodb.recordset")
rs20.open sql20,conn,1,1
rs20.pagesize=1
for aa=1 to rs20.pagecount
    if rs20.bof or rs20.eof then exit for	
	
	sql201="select * from  gyy_lb_fclx_lb   where ��ҵ԰����='"&rs20("��ҵ԰����")&"' "
	set rs201=server.createobject("adodb.recordset")
	rs201.open sql201,conn,1,1
	rs201.pagesize=1
	for bb=1 to rs201.pagecount
    if rs201.bof or rs201.eof then exit for	
%>

                 form3l[<%=aa%>][<%=bb%>]=new Option("<%=rs201("��������")%>","<%=rs201("��������")%>");
	<%
	rs201.movenext
	next
	%>	
<%
rs20.movenext
next
%>		 
    for(mm=ch.options.length-1;mm>0;mm--)
    //���Ҫ�����,��ΪҪ������������б�Ļ��������������ԭ�е���,��������ӵ�Ȼ�����������,�����õݼ�
        ch.options[mm]=null;//����������Ϊ��,Ҳ�͵��������
    for(jj=1;jj<form3l[x].length;jj++){//���ѭ������������б�
        ch.options[jj]=new Option(form3l[x][jj].text,form3l[x][jj].value)
        //ע���������,�б�ĵ�ǰ����� ����(��������x,j����ı�Ϊ�ı���)
    }
    ch.options[1].selected=true;//���ñ�ѡ�еĳ�ʼֵ
}
</script>
		  
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
          </select></td>
          <td width="41" align="right">���룺</td>
          <td width="105">
            <input name="��������" type="text" id="��������"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off" />         </td>
          <td width="30" align="right">&nbsp;�꣺</td>
          <td width="59">
		  <select name="n" id="n">
		  <%if request.Form("n")="" and request.QueryString("n")="" then%>
		  <option value="<%=year(now)%>"><%=year(now)%></option>
		  <%else%>
		  <option value="<%=n%>"><%=n%></option>
		  <%end if%>
		  <%for nn=year(now)-5 to year(now)%>
            <option value="<%=nn%>"><%=nn%></option>
		<%next%>
          </select></td>
          <td width="28" align="right">�£�</td>
          <td width="41"><label>
            <select name="y" id="y">
			<%if request.Form("y")="" and request.QueryString("y")="" then%>
			<option value="<%=month(now)%>"><%=month(now)%></option>
		  <%else%>
		  <option value="<%=y%>"><%=y%></option>
		  <%end if%>
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
  <tr>
</table>
</div>
<DIV align=center>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000"><span class="STYLE2"><span class="STYLE3">������������Ͷ�����޹�˾&nbsp;<%=rs1("������ҵ԰")%>&nbsp;�տ��վ�&nbsp;��<%=request.QueryString("ny")%>/<%=request.QueryString("yy")%>��</span>&nbsp;</span></td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;��ͬ��ţ�<a href="sjlr_xq.asp?id=<%=request.QueryString("id")%>&page=<%=request.QueryString("page")%>"><%=rs1("����")%></a>&nbsp;&nbsp;��ҵ԰���ƣ�<%=rs1("������ҵ԰")%>&nbsp;&nbsp;�������ͣ�<%=rs1("��������")%>&nbsp;&nbsp;����������<%=rs1("��������")%>&nbsp;</td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;�û����ƣ�<%=rs1("�ͻ�����")%>&nbsp;&nbsp;�û����룺<%=rs1("�ͻ�����")%> &nbsp;<%=request.QueryString("ny")%>/<%=request.QueryString("yy")%></td>
        </tr>
</table>
      <table width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #000000;">
        <tr>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>���</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>������Ŀ</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>���¶���</strong></strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>���¶���</strong></strong></td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>����</strong></td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>���</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>����</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>ֵ</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong><strong>���ɽ�</strong></strong></strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>����</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; "><strong>˵��</strong></td>
        </tr>
        <%
if rs0.recordcount=0 then
%>
        <tr>
          <td height="93" colspan="20" align="center" valign="middle" style="border-bottom:1px solid #000000; ">û����Ŀ</td>
        </tr>
        <%
end if
for i=1 to rs0.recordcount
if rs0.bof or rs0.eof then exit for
set rs1011=server.createobject("adodb.recordset")
sql1011="select * from user_sf_lb where ���ݱ��='"&rs0("��ͬ���")&"_"&request.QueryString("xh")&"' and �շ���Ŀ='"&rs0("������Ŀ")&"' "
rs1011.open sql1011,conn,3

%>
        <tr>
          <td width="42" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%=i%></td>
          <td width="180" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
            &nbsp;<%=rs0("������Ŀ")%></td>
          <td width="86" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
          &nbsp;
          <%
set rs0012=server.createobject("adodb.recordset")
sql0012="select * from user_sf_lb where ���ݱ��='"&rs1("����")&"_"&request.QueryString("xh")-1&"' and �շ���Ŀ='"&rs0("������Ŀ")&"'"
rs0012.open sql0012,conn,1,3
if rs0012.recordcount=0 then
response.Write("-")
else
if rs0("��������")="��̬" then
response.Write(""&rs0012("����")&"")
else
response.Write("-")
end if
end if
%></td>
          <td width="80" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
            &nbsp;
            <%if rs0("��������")="��̬" or   rs0("��������")="����" then%>
            <%=rs1011("����")%>
          <%else
response.Write("-")
end if
%></td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
&nbsp;<%=rs1011("����")%>		  
		  </td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">&nbsp;
            <%if rs0("��������")="��̬" then%>
            <%=rs1011("���")%>%
          <%

else
response.Write("-")
end if
%></td><td width="70" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
&nbsp;
<%
if rs1011("����")=0 then
if rs0("��������")="��̬" then
response.Write(""&(rs1011("����")-rs0012("����"))*(1-(-rs1011("���")/100))&"")
elseif rs0("��������")="����" then
response.Write(""&FormatNumber(rs1011("����"),2,-1)&"")
else
response.Write("-")
end if
else
if rs0("��������")="��̬" then
response.Write(""&(rs1011("����")-rs0012("����"))*(1-(-rs1011("���")/100))*rs1011("����")&"")
elseif rs0("��������")="����" then
response.Write(""&FormatNumber(rs1011("����"),2,-1)*rs1011("����")&"")
else
response.Write("-")
end if
end if
%>		  </td>
          <td width="44" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
		  &nbsp;<%=FormatNumber(rs1011("ֵ"),2,-1)%></td>
          <td width="70" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
		  &nbsp;<%=rs1011("���ɽ�")%>%</td>
          <td width="85" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
		  &nbsp;<%=FormatNumber(rs1011("����"),2,-1)%></td>
          <td width="200" align="center" valign="middle" style="border-bottom:1px solid #000000; ">&nbsp;<%=rs0("˵��")%></td>
        </tr>
        <%
rs0.movenext()
next

%>

        <tr>
          <td height="40" colspan="12" align="left" valign="middle" style="border-bottom:1px solid #000000">&nbsp;&nbsp;
		  �ܽ���<%=FormatNumber(rs00125("�ܷ���"),2,-1)%>&nbsp;&nbsp;
		  �ϴν��ࣺ��<%=FormatNumber(rs00125("���"),2,-1)%>&nbsp;&nbsp;
		  ��Ҫ���ѽ���<%=FormatNumber(rs00125("�ܷ���")-rs00125("���"),2,-1)%>&nbsp;&nbsp;</td>
        </tr>
</table>
	  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="right" valign="middle">��Ʊ�ˣ�<%=session("admin_name")%>&nbsp;&nbsp;��Ʊʱ�䣺<%=date()%>&nbsp;&nbsp;</td>
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
conn.close
set conn=nothing
%>

