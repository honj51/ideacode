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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="jf.asp?Operation=lb&page=<%=request.QueryString("page")%>">�ɷ��б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
  <tr>
    <td height="30" colspan="2">
	<form id="form3" name="form3" method="post" action="jf.asp" style="margin:0px">
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
    </td>
  </tr>
<%if Operation="lb" or Operation="" then
set rs01=server.createobject("adodb.recordset")
sql01="select * from zpgl where id="&request.QueryString("id")&""
rs01.open sql01,conn,3

set rs011=server.createobject("adodb.recordset")
if left(rs01("�ͻ�����"),3)="zrr" then
sql011="select * from user_zrr where ����='"&rs01("�ͻ�����")&"'"
elseif left(rs01("�ͻ�����"),2)="gs" then
sql011="select * from user_gs where ����='"&rs01("�ͻ�����")&"'"
end if
rs011.open sql011,conn,3
%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="681" height="30" align="left" valign="middle" style="border-bottom:1px solid #00376F; ">&nbsp;&nbsp;
		  <strong>��ͬ���룺</strong><a href="?id=<%=request.QueryString("id")%>&page=<%=request.QueryString("page")%>"><%=rs01("����")%></a>&nbsp;&nbsp;
		  <strong>�ͻ���ţ�</strong><%=rs01("�ͻ�����")%>&nbsp;&nbsp;<strong>
		�ͻ����ƣ�</strong><%=rs01("�ͻ�����")%> </td>
      </tr>
      <tr>
        <td height="30" align="left" valign="middle" style="border-bottom:1px solid #00376F; ">&nbsp;&nbsp;
		  <strong>��ϵ�绰��</strong><%=rs011("��ϵ�绰")%>&nbsp;&nbsp;
		  <strong>��ϵ��ַ��</strong><%=rs011("��ϵ��ַ")%><%=rs011("�칫��ַ")%></td>
      </tr>
      <tr>
        <td height="30" align="left" valign="middle" >&nbsp;&nbsp;
		  <strong>������ҵ԰��</strong><%=rs01("������ҵ԰")%>&nbsp;&nbsp;
		  <strong>�������ͣ�</strong><%=rs01("��������")%>&nbsp;&nbsp;
		  <strong>����������</strong><%=rs01("��������")%>&nbsp;&nbsp;
		  <strong>��ͬ��ʼʱ�䣺</strong><%=rs01("��ͬ��ʼʱ��")%>&nbsp;&nbsp;
		  <strong>��ͬ����ʱ��:</strong><%=rs01("��ͬ����ʱ��")%></td>
        </tr>

<%
if rs01("��ͬ��ʼʱ��_��")=rs01("��ͬ����ʱ��_��") then
	for j=rs01("��ͬ��ʼʱ��_��") to rs01("��ͬ����ʱ��_��")
%>
<%
	next
elseif rs01("��ͬ��ʼʱ��_��")<rs01("��ͬ����ʱ��_��") then
	for i=rs01("��ͬ��ʼʱ��_��") to rs01("��ͬ����ʱ��_��")-1
    	 for j=rs01("��ͬ��ʼʱ��_��") to 12
%>
<%		next
		next
		for k=1 to rs01("��ͬ����ʱ��_��")
%>
<%
next
end if
%>
    </table>
<div style="WIDTH: 100%; HEIGHT: 350; OVERFLOW: scroll; SCROLLBAR-FACE-COLOR: EAECEC; SCROLLBAR-HIGHLIGHT-COLOR: EAECEC; SCROLLBAR-SHADOW-COLOR: BLACK; SCROLLBAR-3DLIGHT-COLOR: EAECEC; SCROLLBAR-ARROW-COLOR: EAECEC; SCROLLBAR-TRACK-COLOR: FFFFFF; SCROLLBAR-DARKSHADOW-COLOR: EAECEC">
    <table width="100%"  style="border:1px solid  #00376F;" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����·�</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ܷ���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ɷѽ��</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>¼��״̬</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ɷ�״̬</strong></td>
        <td width="232" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
      </tr>
      <%
if rs01("��ͬ��ʼʱ��_��")=rs01("��ͬ����ʱ��_��") then
	for ii=rs01("��ͬ��ʼʱ��_��") to rs01("��ͬ����ʱ��_��")
	xh=0
	xh=xh+1
set rssj01=server.createobject("adodb.recordset")
sqlsj01="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh&"'"
rssj01.open sqlsj01,conn,3

set rssj011=server.createobject("adodb.recordset")
sqlsj011="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh-1&"'"
rssj011.open sqlsj011,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs01("��ͬ��ʼʱ��_��")%>/<%=ii%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%
		if rssj01("�ܷ���")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj01("�ܷ���"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%if rssj01("�ɷѽ��")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj01("�ɷѽ��"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		 &nbsp;
		 <%if rssj01("���")="" then
		response.Write("-")
		else
		response.Write(""&rssj01("���")&"")
		end if
		%></td>
        <td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%
	if rs01("��ͬ��ʼʱ��_��")<year(now) then
			if rssj01("¼��״̬")="" then
				response.Write("<span style='color:#FF0000'>δ¼��</span>")
			else
				response.Write(""&rssj01("¼��״̬")&"")
			end if	
	elseif rs01("��ͬ��ʼʱ��_��")=year(now) then
			if ii<=month(now) then
				if rssj01("¼��״̬")="" then
					response.Write("<span style='color:#FF0000'>δ¼��</span>")
				else
					response.Write(""&rssj01("¼��״̬")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>����¼��</span>")
			end if
	else
	response.Write("<span style='color:#666666'>����¼��</span>")
	end if
		%></td>
        <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%		
	if rs01("��ͬ��ʼʱ��_��")<year(now) then
			if rssj01("�ɷ�״̬")="" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
			else
			  if rssj01("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj01("�ɷ�״̬")&"")
				end if
			end if	
	elseif ii=year(now) then
			if j<=month(now) then
				if rssj01("�ɷ�״̬")="" then
					response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
			  if rssj01("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj01("�ɷ�״̬")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>���ܽɷ�</span>")
			end if
	else
	response.Write("<span style='color:#666666'>���ܽɷ�</span>")
	end if	
		%></td><td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">		
<%		
	if rs01("��ͬ��ʼʱ��_��")<year(now) then
			if rssj01("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj01("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ��ʼʱ��_��")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
			else
			  if rssj01("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj01("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ��ʼʱ��_��")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else

		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&rs01("��ͬ��ʼʱ��_��")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if

		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
			end if	
	elseif ii=year(now) then
			if j<=month(now) then
			if rssj01("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj01("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ��ʼʱ��_��")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
			else
			  if rssj01("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj01("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ��ʼʱ��_��")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&rs01("��ͬ��ʼʱ��_��")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
			end if	
			else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
			end if
	else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
	end if	
		%>		
		
      </tr>
      <%
	next
elseif rs01("��ͬ��ʼʱ��_��")<rs01("��ͬ����ʱ��_��") then
	for i=rs01("��ͬ��ʼʱ��_��") to rs01("��ͬ��ʼʱ��_��")
    	 for j=rs01("��ͬ��ʼʱ��_��") to 12
		 xh=xh+1
set rssj02=server.createobject("adodb.recordset")
sqlsj02="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh&"'"
rssj02.open sqlsj02,conn,3

set rssj021=server.createobject("adodb.recordset")
sqlsj021="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh-1&"'"
rssj021.open sqlsj021,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%>/<%=j%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"> &nbsp;
          <%if rssj02("�ܷ���")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("�ܷ���"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("�ɷѽ��")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("�ɷѽ��"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("���")="" then
		response.Write("-")
		else
		response.Write(""&rssj02("���")&"")
		end if
		%></td><td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%
	if i<year(now) then
			if rssj02("¼��״̬")="" then
				response.Write("<span style='color:#FF0000'>δ¼��</span>")
			else
				response.Write(""&rssj02("¼��״̬")&"")
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("¼��״̬")="" then
					response.Write("<span style='color:#FF0000'>δ¼��</span>")
				else
				
					response.Write(""&rssj02("¼��״̬")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>����¼��</span>")
			end if
	else
	response.Write("<span style='color:#666666'>����¼��</span>")
	end if
		%></td>
          <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
            <%
	if i<year(now) then
			if rssj02("�ɷ�״̬")="" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
			else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj02("�ɷ�״̬")&"")
				end if
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("�ɷ�״̬")="" then
					response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj02("�ɷ�״̬")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>���ܽɷ�</span>")
			end if
	else
	response.Write("<span style='color:#666666'>���ܽɷ�</span>")
	end if
		%></td><td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
<%
	if i<year(now) then
			if rssj02("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
			else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
				end if	
			else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
			end if
	else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
	end if
		%>
		</td>
      </tr>
      <%		next
		next
for i=rs01("��ͬ��ʼʱ��_��")+1 to rs01("��ͬ����ʱ��_��")-1
    	 for j=1 to 12
		 xh=xh+1
set rssj02=server.createobject("adodb.recordset")
sqlsj02="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh&"'"
rssj02.open sqlsj02,conn,3

set rssj021=server.createobject("adodb.recordset")
sqlsj021="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh-1&"'"
rssj021.open sqlsj021,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%>/<%=j%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"> &nbsp;
          <%if rssj02("�ܷ���")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("�ܷ���"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("�ɷѽ��")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("�ɷѽ��"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("���")="" then
		response.Write("-")
		else
		response.Write(""&rssj02("���")&"")
		end if
		%></td><td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%
	if i<year(now) then
			if rssj02("¼��״̬")="" then
				response.Write("<span style='color:#FF0000'>δ¼��</span>")
			else
				response.Write(""&rssj02("¼��״̬")&"")
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("¼��״̬")="" then
					response.Write("<span style='color:#FF0000'>δ¼��</span>")
				else
				
					response.Write(""&rssj02("¼��״̬")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>����¼��</span>")
			end if
	else
	response.Write("<span style='color:#666666'>����¼��</span>")
	end if
		%></td>
          <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
            <%
	if i<year(now) then
			if rssj02("�ɷ�״̬")="" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
			else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj02("�ɷ�״̬")&"")
				end if
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("�ɷ�״̬")="" then
					response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj02("�ɷ�״̬")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>���ܽɷ�</span>")
			end if
	else
	response.Write("<span style='color:#666666'>���ܽɷ�</span>")
	end if
		%></td><td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
<%
	if i<year(now) then
			if rssj02("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
			else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
			  if rssj02("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj02("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
				end if	
			else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
			end if
	else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
	end if
		%>
		</td>
      </tr>
      <%		next
		next		
		
		for k=1 to rs01("��ͬ����ʱ��_��")
xh=xh+1
set rssj03=server.createobject("adodb.recordset")
sqlsj03="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh&"'"
rssj03.open sqlsj03,conn,3

set rssj031=server.createobject("adodb.recordset")
sqlsj031="select * from user_sf_zb where ���ݱ��='"&rs01("����")&"_"&xh-1&"'"
rssj031.open sqlsj031,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs01("��ͬ����ʱ��_��")%>/<%=k%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj03("�ܷ���")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj03("�ܷ���"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj03("�ɷѽ��")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj03("�ɷѽ��"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj03("���")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj03("���"),2,-1)&"")
		end if
		%></td><td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;
<%
	if rs01("��ͬ����ʱ��_��")<year(now) then
			if rssj03("¼��״̬")="" then
				response.Write("<span style='color:#FF0000'>δ¼��</span>")
			else
				response.Write(""&rssj03("¼��״̬")&"")
			end if	
	elseif rs01("��ͬ����ʱ��_��")=year(now) then
			if k<=month(now) then
				if rssj02("¼��״̬")="" then
					response.Write("<span style='color:#FF0000'>δ¼��</span>")
				else
					response.Write(""&rssj03("¼��״̬")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>����¼��</span>")
			end if
	else
	response.Write("<span style='color:#666666'>����¼��</span>")
	end if
		%>		
		</td>
          <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
            <%
	if rs01("��ͬ����ʱ��_��")<year(now) then
			if rssj03("�ɷ�״̬")="" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
			else
			  if rssj03("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj03("�ɷ�״̬")&"")
				end if
			end if	
	elseif rs01("��ͬ����ʱ��_��")=year(now) then
			if k<=month(now) then
				if rssj03("�ɷ�״̬")="" then
					response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
			  if rssj03("�ɷ�״̬")="δ�ɷ�" then
				response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
				else
				response.Write(""&rssj03("�ɷ�״̬")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>���ܽɷ�</span>")
			end if
	else
	response.Write("<span style='color:#666666'>���ܽɷ�</span>")
	end if
		%></td><td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
			
			
		
<%
	if rs01("��ͬ����ʱ��_��")<year(now) then
			if rssj03("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj03("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ����ʱ��_��")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
			else
			  if rssj03("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj03("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ����ʱ��_��")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&rs01("��ͬ����ʱ��_��")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
			end if	
	elseif rs01("��ͬ����ʱ��_��")=year(now) then
			if k<=month(now) then
				if rssj03("�ɷ�״̬")="" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj03("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ����ʱ��_��")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
			  if rssj03("�ɷ�״̬")="δ�ɷ�" then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		if rssj03("¼��״̬")<>"��¼��" then
		response.Write("<span style='color:#666666'>�ɷ�</span>")
		else
		response.Write("<a href='jf_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("��ͬ����ʱ��_��")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>�ɷ�</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")
		else
		response.Write("<a href='jfxq.asp?id="&rs01("id")&"&ny="&rs01("��ͬ����ʱ��_��")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>�鿴����</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>�ɷ�</span>")
				end if
				end if	
			else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
			end if
	else

		response.Write("<span style='color:#666666'>�鿴����</span>&nbsp;")

		response.Write("<span style='color:#666666'>�ɷ�</span>")
	end if
		%>
		</td>
      </tr>
      <%
next
end if
%>
    </table>
</div>

<% 
rs0.close
set rs0=nothing
end if
%>
</table>
</body>
</html>
<%
conn.close
set conn=nothing
%>