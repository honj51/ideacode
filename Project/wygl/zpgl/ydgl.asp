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
<SCRIPT src="../js/ydgl.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=lb">Ԥ���б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=tj">���Ԥ��</a></strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>Ԥ���ͻ�����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������ҵ԰</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>Ԥ��ʱ��</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����ʱ��</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from zpgl where ��ͬ����ʱ��_��='��' order by �ͻ����� asc"
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
        <td height="93" colspan="11" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û��Ԥ��</td>
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
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��ͬ��ʼʱ��")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����ʱ��")%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><a href="?action=sc&amp;id=<%=rs0("id")%>">ɾ��</a></td>
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
        <td width="14%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���룺</td>
        <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
			   <%
		 FOR i=1 to 4
		 suiji=suijishu()
		 suiji1=suiji1&suiji
		 next
		
		 %>
			   <input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="ht<%=year(now)%><%=month(now)%><%=day(now)%><%=hour(now)%><%=minute(now)%><%=second(now)%><%=suiji1%>" autocomplete="off"  readonly="true"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">Ԥ���ͻ����ƣ�</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="�ͻ�����" id="�ͻ�����" style="border:1px solid #333333; height:20px; margin-left:3px">
          <option value="��ѡ��">��ѡ��</option>
          <%
set rsjs=server.createobject("adodb.recordset")
sqljs="select ����,���� from user_zrr  order by ���� asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>
          <option value="<%=rsjs("����")%>-<%=rsjs("����")%>"><%=rsjs("����")%>&nbsp;-&nbsp;<%=rsjs("����")%></option>
<%
rsjs.movenext()
next
%>

 <%
set rsjs1=server.createobject("adodb.recordset")
sqljs1="select ����,���� from user_gs  order by ���� asc"
rsjs1.open sqljs1,conn,3
for i=0 to rsjs1.recordcount
 if rsjs1.bof or rsjs1.eof then exit for
%>
          <option value="<%=rsjs1("����")%>-<%=rsjs1("����")%>"><%=rsjs1("����")%>&nbsp;-&nbsp;<%=rsjs1("����")%></option>
<%
rsjs1.movenext()
next
%>

        </select></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������ҵ԰��</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		
<script language="javascript">
//���溯������ʾ���������˵��Ĵ������
function makech(x){
    var form1=document.form1.fh.options.length;//������ͬ��
    var form1l=new Array(form1)//�½�һ�����飬����Ϊ��һ�������б������
    for(ii=1;ii<form1;ii++)//ѭ����һ�������б��������ô���
        form1l[ii]=new Array();//��ѭ��
        //�����Ǹ�ÿ��ѭ����ֵ  
    var ch=document.form1.ch;//��������
	
<%   
sql20="select * from  gyy_lb   order by ��� asc"
set rs20=server.createobject("adodb.recordset")
rs20.open sql20,conn,1,1
rs20.pagesize=1
for aa=1 to rs20.pagecount
    if rs20.bof or rs20.eof then exit for	
	
	sql201="select * from  gyy_fc_lb   where ��ҵ԰����='"&rs20("��ҵ԰����")&"' and  ״̬='δ��' "
	set rs201=server.createobject("adodb.recordset")
	rs201.open sql201,conn,1,1
	rs201.pagesize=1
	for bb=1 to rs201.pagecount
    if rs201.bof or rs201.eof then exit for	
%>

                 form1l[<%=aa%>][<%=bb%>]=new Option("<%=rs201("��������")%>-<%=rs201("����")%>","<%=rs201("��������")%>-<%=rs201("����")%>");
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
    for(jj=1;jj<form1l[x].length;jj++){//���ѭ������������б�
        ch.options[jj]=new Option(form1l[x][jj].text,form1l[x][jj].value)
        //ע���������,�б�ĵ�ǰ����� ����(��������x,j����ı�Ϊ�ı���)
    }
    ch.options[1].selected=true;//���ñ�ѡ�еĳ�ʼֵ
}
</script>
  <select name="fh" size="1" onChange="makech(options.selectedIndex)">
          <option value="��ѡ��">��ѡ��</option>
<%   
sql="select * from  gyy_lb  order by ��� asc"
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
  </select>		</td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">����������</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
<select name="ch">
          <option value="��ѡ��">��ѡ��</option>
 </select></label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">Ԥ��ʱ�䣺</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
          <%for n=year(now) to  year(now)+2%>
          <option value="<%=n%>"><%=n%></option>
          <%next%>
        </select>
��
<select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
��
<select name="��" id="��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
  <%for r=1 to  31%>
  <option value="<%=r%>"><%=r%></option>
  <%next%>
</select>
��</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">����ʱ�䣺</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����ʱ��" type="text" id="����ʱ��"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=date()%>" autocomplete="off" readonly="true"/></td>
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
%>


</table>
</body>
</html>
<%
if action="tj" then
fclxcf=split(request.Form("ch"),"-")
set rs=server.createobject("adodb.recordset")
sql="select * from zpgl where ������ҵ԰='"&request.Form("fh")&"' and ��������='"&fclxcf(0)&"' and ��������='"&fclxcf(1)&"' "
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("����")=request.Form("����")
khmc=split(request.Form("�ͻ�����"),"-")
rs("�ͻ�����")=khmc(1)
rs("�ͻ�����")=khmc(0)
rs("������ҵ԰")=request.Form("fh")
fclxcf=split(request.Form("ch"),"-")
rs("��������")=fclxcf(0)
rs("��������")=fclxcf(1)
rs("��ͬ��ʼʱ��")=""&request.Form("��")&"-"&request.Form("��")&"-"&request.Form("��")&""
rs("��ͬ��ʼʱ��_��")=request.Form("��")
rs("��ͬ��ʼʱ��_��")=request.Form("��")
rs("��ͬ��ʼʱ��_��")=request.Form("��")
rs("��ͬ����ʱ��_��")="��"
rs("��ͬ����ʱ��_��")="��"
rs("��ͬ����ʱ��_��")="��"
rs("����ʱ��")=request.Form("����ʱ��")
rs("������")=session("admin_id")
rs("״̬")="Ԥ��"
rs("��ע")=request.Form("��ע")

set rsz=server.createobject("adodb.recordset")
sqlz="select * from gyy_fc_lb where ��ҵ԰����='"&request.Form("fh")&"' and ����='"&fclxcf(1)&"' and ��������='"&fclxcf(0)&"'"
rsz.open sqlz,conn,1,3
rsz("״̬")="Ԥ��"
rsz("ҵ��")=khmc(0)
rsz.update
rsz.close
rsz=nothing

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

if action="sc"	then
set rs=server.createobject("adodb.recordset")
sql="select * from zpgl where id="&request.QueryString("id")
rs.open sql,conn,1,3
set rsz=server.createobject("adodb.recordset")
sqlz="select * from gyy_fc_lb where ��ҵ԰����='"&rs("������ҵ԰")&"' and ����='"&rs("��������")&"'"
rsz.open sqlz,conn,1,3
rsz("״̬")="δ��"
rsz("ҵ��")=""
rsz.update
rsz.close
rsz=nothing


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