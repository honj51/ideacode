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
<SCRIPT src="../js/lj.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/fcgl.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;
	<A onMouseover="return hidestatus()" href="?Operation=lb">�����б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;
	<A onMouseover="return hidestatus()" href="?Operation=tj">��ӷ���</a>&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ҵ԰����</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from gyy_fc_lb  order by ��ҵ԰����,��������,���� asc"
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
        <td height="93" colspan="10" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û����ӷ���</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="57" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��ҵ԰����")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��������")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="131" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F ;">
		<a href="?Operation=xg&id=<%=rs0("id")%>">�༭</a>&nbsp;&nbsp;
		<%if rs0("״̬")<>"δ��" then
		response.Write("<span style='color:#999999'>ɾ��</span>")
		else
		%>
		<a href="?action=sc&id=<%=rs0("id")%>">ɾ��</a>
		<%end if%>
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
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ţ�</td>
        <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ҵ԰���ƣ�</td>
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
	
	sql201="select * from  gyy_lb_fclx_lb   where ��ҵ԰����='"&rs20("��ҵ԰����")&"'  "
	set rs201=server.createobject("adodb.recordset")
	rs201.open sql201,conn,1,1
	rs201.pagesize=1
	
	for bb=1 to rs201.recordcount
    if rs201.bof or rs201.eof then exit for	
	fclelb=rs201("��������")
%>

                 form1l[<%=aa%>][<%=bb%>]=new Option("<%=fclelb%>","<%=fclelb%>");
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
  </select>			

        </label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�������ͣ�</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		
<select name="ch">
          <option value="��ѡ��">��ѡ��</option>
 </select>		
</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ͣ�</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">����</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ݽṹ:</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="���ݽṹ" type="text" id="���ݽṹ"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onMouseover='return hidestatus()'/>
            <input name="Submit4" type="reset"  style="border:1px solid #000000; margin-left:3px" value="ȡ��"/>        </td>
      </tr>
    </table>
  </form></td>
</tr>
<%end if
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from gyy_fc_lb where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ţ�</td>
          <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>"  readonly="true"autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ҵ԰���ƣ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <input name="fh" type="text" id="fh"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("��ҵ԰����")%>"  readonly="true"autocomplete="off"/>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�������ͣ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="ch" type="text" id="ch"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("��������")%>"  readonly="true"autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ͣ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">����</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���ݽṹ:</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="���ݽṹ" type="text" id="���ݽṹ"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("���ݽṹ")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onmouseover='return hidestatus()'/>
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
sql="select * from gyy_fc_lb where ��ҵ԰����='"&request.Form("fh")&"' and ����='"&request.Form("����")&"'  and ����='"&request.Form("ch")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("��ҵ԰����")=request.Form("fh")
rs("��������")=request.Form("ch")
rs("����")=request.Form("����")
rs("����")=request.Form("����")
rs("����")=request.Form("����")
rs("����")=request.Form("����")
rs("���ݽṹ")=request.Form("���ݽṹ")
rs("״̬")="δ��"
rs("ҵ��")="��"
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('��ӳɹ�');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('�ù�ҵ԰�����Ѵ���!');history.go(-1);</script>"         
end if
end if

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from gyy_fc_lb where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("��ҵ԰����")=request.Form("fh")
rs6("��������")=request.Form("ch")
rs6("����")=request.Form("����")
rs6("����")=request.Form("����")
rs6("����")=request.Form("����")
rs6("����")=request.Form("����")
rs6("���ݽṹ")=request.Form("���ݽṹ")
rs6.update
response.write"<script>alert('�޸ĳɹ�');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from gyy_fc_lb where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('ɾ���ɹ�');location.href='fcgl.asp';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>