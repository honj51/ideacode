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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���Ź���</title>
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
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="jf.asp?Operation=lb&page=<%=request.QueryString("page")%>">�ɷ��б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle"><form id="form3" name="form3" method="post" action="sjlr.asp?&page=<%=request.QueryString("page")%>" style="margin:0px">
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
            <input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="����" onClick="fClose()" onmouseover='return hidestatus()'/>
            1</td>
        </tr>
      </table>
      </form>  
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;��ͬ��ţ�<a href="jf_xq.asp?id=<%=request.QueryString("id")%>&page=<%=request.QueryString("page")%>"><%=rs1("����")%></a><br />      
      &nbsp;&nbsp;&nbsp;��ҵ԰���ƣ�<%=rs1("������ҵ԰")%>&nbsp;&nbsp;�������ͣ�<%=rs1("��������")%>&nbsp;&nbsp;����������<%=rs1("��������")%>&nbsp;&nbsp;�û����ƣ�<%=rs1("�ͻ�����")%>&nbsp;&nbsp;�û����룺<%=rs1("�ͻ�����")%>
  &nbsp;<%=request.QueryString("ny")%>/<%=request.QueryString("yy")%>
  <tr>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	
	
	<form id="form1" name="form1" method="post" action="?action=tj&Operation=tj&id=<%=request.QueryString("id")%>&xh=<%=request.QueryString("xh")%>&uid=<%=rs00125("id")%>&page=<%=request.QueryString("page")%>" style="margin:opx" onSubmit="return  denglu()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������Ŀ</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>ֵ</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���ɽ�</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���¶���</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong><strong>����</strong></strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>˵��</strong></td>
          </tr>
        <%
if rs0.recordcount=0 then
%>
        <tr>
          <td height="93" colspan="14" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û����Ŀ</td>
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
          <td width="43" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
          <td width="182" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            &nbsp;<%=rs1011("�շ���Ŀ")%></td>
          <td width="63" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            &nbsp;<%=rs1011("�շ�����")%></td>
          <td width="63" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;&nbsp;<%=FormatNumber(rs1011("ֵ"),2,-1)%></td>
          <td width="60" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;<%=rs1011("����")%>		  
		  </td>
          <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;
<%if rs1011("�շ�����")="��̬" then%>
<%=rs1011("���")%>%		  
<%

else
response.Write("-")
end if
%>			</td>
          <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;<%=rs1011("���ɽ�")%>%</td>
          <td width="91" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		  
&nbsp;
<%
set rs0012=server.createobject("adodb.recordset")
sql0012="select * from user_sf_lb where ���ݱ��='"&rs1("����")&"_"&request.QueryString("xh")-1&"' and �շ���Ŀ='"&rs0("������Ŀ")&"'"
rs0012.open sql0012,conn,1,3
if rs0("��������")="��̬" then
response.Write(""&rs0012("����")&"")
else
response.Write("-")
end if
%>		  </td>
          <td width="91" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;
<%if rs0("��������")="��̬" or   rs0("��������")="����" then%>
<%=rs1011("����")%>
<%else
response.Write("-")
end if
%>		  </td>
          <td width="71" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		 &nbsp;<%=FormatNumber(rs1011("����"),2,-1)%></td>
          <td width="200" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;<%=rs0("˵��")%></td>
          </tr>
        <%
rs0.movenext()
next

%>
        <tr>
          <td height="40" colspan="12" align="left" valign="middle" style="border-bottom:1px solid #00376F">&nbsp;&nbsp;�ܽ���&nbsp;<%=FormatNumber(rs00125("�ܷ���"),2,-1)%>
            <input name="�ܷ���" type="text" id="�ܷ���"  style=" display:none" value="<%=rs00125("�ܷ���")%>"  autocomplete="off"  readonly="true" />            &nbsp;&nbsp;
			�ϴν��ࣺ��<%=FormatNumber(rs00125("���"),2,-1)%>&nbsp;&nbsp;&nbsp;��Ҫ���ѽ���<%=FormatNumber(rs00125("�ܷ���")-rs00125("���"),2,-1)%>
            <input name="���" type="text" id="���"  style=" display:none" value="<%=rs00125("���")%>"  autocomplete="off"  readonly="true" />
			ʵ�ս�&nbsp;
            <input name="�ɷѽ��" type="text" id="�ɷѽ��"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off" /></td>
        </tr>
        <tr>
<td height="40" colspan="12" align="center" valign="middle">
 <input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="�ύ" onClick="fClose()" onmouseover='return hidestatus()'/></td>
</tr>
      </table>
      </form>	</td>
  </tr>

<% 
rs0.close
set rs0=nothing
end if
%>
</table>
</body>
</html>
<%
if action="tj" then
if request.Form("�ɷѽ��")-(request.Form("�ܷ���")-request.Form("���"))<0 then
response.write"<script>alert('�ɷѽ���');history.go(-1);</script>"
else
set rs22011=server.createobject("adodb.recordset")
sql22011="select * from user_sf_zb where id='"&request.QueryString("uid")&"'"
rs22011.open sql22011,conn,1,3
rs22011("�ɷѽ��")=request.Form("�ɷѽ��")
rs22011("���")=request.Form("�ɷѽ��")-(request.Form("�ܷ���")-request.Form("���"))
rs22011("�ɷ�״̬")="�ѽɷ�"
rs22011.update
response.write"<script>alert('�ɷѳɹ�');location.href='jfxq.asp?id="&request.QueryString("id")&"&ny="&rs22011("������")&"&yy="&rs22011("������")&"&xh="&request.QueryString("xh")&"&page="&request.QueryString("page")&"';</script>"
rs22011.close
set rs2201=nothing
end if
end if
%>
<%
conn.close
set conn=nothing
%>