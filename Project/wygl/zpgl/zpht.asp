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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">��ͬ�б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=tj">��Ӻ�ͬ</a></strong></td>
  </tr>
  <tr>
    <td height="30" colspan="2">
	<form id="form3" name="form3" method="post" action="zpht.asp" style="margin:0px">
      <table width="715" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="101">&nbsp;�๦��������</td>
          <td width="41" align="right" valign="middle">���ƣ�</td>
          <td width="105">
            <input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off"  />
     </td>
          <td width="49" align="right">��ҵ԰��</td>
          <td width="79">
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
            </select>
         </td>
          <td width="43" align="right">���ͣ�</td>
          <td width="78"><select name="ch" id="ch">
            <option  value="��ѡ��">��ѡ��</option>
          </select></td>
          <td width="38" align="right">���룺</td>
          <td width="105">
            <input name="��������" type="text" id="��������"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off" />
         </td>
          <td width="76"><span style="border-bottom:1px solid #00376F;">
            <input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="����" onClick="fClose()" onmouseover='return hidestatus()'/>
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
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ��ʼʱ��</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ����ʱ��</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ״̬</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
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

set rs0=server.createobject("adodb.recordset")
if khmc="" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl  order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ��������='"&fclx&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&ssfc&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc<>"" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&fclx&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc<>"" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&ssfc&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc="" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc="" and gyy="" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&fclx&"' and  ��������='"&ssfc&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and ��������='"&fclx&"'order by ������ҵ԰,��������,�������� asc"
elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"'order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' and ��������='"&ssfc&"'order by ������ҵ԰,��������,�������� asc"
end if
rs0.open sql0,conn,1,3
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
        <td width="31" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="135" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="68" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("�ͻ�����")%></td>
        <td width="76" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("������ҵ԰")%></td>
        <td width="60" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��������")%>-<%=rs0("��������")%></td>
        <td width="97" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��ͬ��ʼʱ��")%></td>
        <td width="88" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<% 
		if rs0("��ͬ����ʱ��")<>"" then 
			  response.Write(""&rs0("��ͬ����ʱ��")&"")
		else
		      response.Write("δǩ����ͬ")
		end if
		%>		</td>
        <td width="61" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<%
		if rs0("��ͬ����ʱ��")<>"" then
		   if rs0("��ͬ����ʱ��")- date()=0 then
				response.Write("<span style='color:FF0000'>����</span>")
			elseif 	rs0("��ͬ����ʱ��")- date()<0 then
			response.Write("<span style='color:FF0000'>����</span>")
			elseif rs0("��ͬ����ʱ��")- date()>0 then
			
				if rs0("��ͬ����ʱ��")- date()<90 then
					response.Write("<span style='color:FF0000'>"&rs0("��ͬ����ʱ��")- date()&"�쵽��</span>")
				else
					response.Write("����")
				end if
			
			end if
		else
		response.Write("<span style='color:#3399FF'>Ԥ��</span>")
		end if
		%></td>
        <td width="190" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		

			<a href="zpht_xm.asp?id=<%=rs0("id")%>">�༭�̶�������Ŀ</a>&nbsp;
		<a href="?Operation=xg&id=<%=rs0("id")%>">�༭</a>&nbsp;
		<a href="?action=sc&id=<%=rs0("id")%>">ɾ��</a>
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
	<A onMouseover="return hidestatus()" href="?page=1&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">��ҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">ǰһҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">��һҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">ĩҳ</a>	</span></td>
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
        <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><%
		 FOR i=1 to 4
		 suiji=suijishu()
		 suiji1=suiji1&suiji
		 next
		
		 %>
			   <input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="ht<%=year(now)%><%=month(now)%><%=day(now)%><%=hour(now)%><%=minute(now)%><%=second(now)%><%=suiji1%>" autocomplete="off"  readonly="true"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�ͻ����ƣ�</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
<select name="�ͻ�����" id="�ͻ�����" style="border:1px solid #333333; height:20px; margin-left:3px">
<%if request.QueryString("hylx")<>"zrr" and request.QueryString("hylx")<>"gs" then%>
<option value="��ѡ��">��ѡ��</option>
<%else%>
<%
set rsjs=server.createobject("adodb.recordset")
if request.QueryString("hylx")="zrr" then
sqljs="select ����,���� from user_zrr where id="&request.QueryString("id")&""
else
sqljs="select ����,���� from user_zrr  order by ���� asc"
end if
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
if request.QueryString("hylx")="gs" then
sqljs1="select ����,���� from user_gs   where id="&request.QueryString("id")&""
else
sqljs1="select ����,���� from user_gs  order by ���� asc"
end if
rsjs1.open sqljs1,conn,3
for i=0 to rsjs1.recordcount
 if rsjs1.bof or rsjs1.eof then exit for
%>
          <option value="<%=rsjs1("����")%>-<%=rsjs1("����")%>"><%=rsjs1("����")%>&nbsp;-&nbsp;<%=rsjs1("����")%></option>
<%
rsjs1.movenext()
next
%>
<%end if%>

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
  </select>	</td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">����������</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
        <select name="ch">
          <option  value="��ѡ��">��ѡ��</option>
        </select>
        </label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ͬ��ʼʱ�䣺</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
<select name="��ʼ��" id="��ʼ��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="��ѡ��">��ѡ��</option>
            <%for n=year(now)-10 to  year(now)+10%>
            <option value="<%=n%>"><%=n%></option>
            <%next%>
          </select>
��
<select name="��ʼ��" id="select6" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="��ѡ��">��ѡ��</option>
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
��
<select name="��ʼ��" id="select7" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="��ѡ��">��ѡ��</option>
  <%for r=1 to  31%>
  <option value="<%=r%>"><%=r%></option>
  <%next%>
</select>
��</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ͬ����ʱ�䣺</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="������" id="������" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		<option  value="��ѡ��">��ѡ��</option>
          <%for n=year(now) to  year(now)+10%>
          <option value="<%=n%>"><%=n%></option>
          <%next%>
        </select>
��
<select name="������" id="select2" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="��ѡ��">��ѡ��</option>
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
��
<select name="������" id="select3" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="��ѡ��">��ѡ��</option>
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
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from zpgl where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td width="14%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">���룺</td>
          <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="����" type="text" id="����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("����")%>" autocomplete="off"/></td>
          </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">�ͻ����ƣ�</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
  <input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("�ͻ�����")%>-<%=rs1("�ͻ�����")%>" autocomplete="off" readonly="true"/>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">������ҵ԰��</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="������ҵ԰" type="text" id="������ҵ԰"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("������ҵ԰")%>" autocomplete="off" readonly="true"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">����������</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
	<input name="��������" type="text" id="��������"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("��������")%>-<%=rs1("��������")%>" autocomplete="off" readonly="true"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ͬ��ʼʱ�䣺</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  <select name="��ʼ��" id="��ʼ��" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="<%=rs1("��ͬ��ʼʱ��_��")%>"><%=rs1("��ͬ��ʼʱ��_��")%></option>
            <%for n=year(now)-10 to  year(now)+10%>
            <option value="<%=n%>"><%=n%></option>
            <%next%>
          </select>
��
<select name="��ʼ��" id="select6" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="<%=rs1("��ͬ��ʼʱ��_��")%>"><%=rs1("��ͬ��ʼʱ��_��")%></option>
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
��
<select name="��ʼ��" id="select7" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option  value="<%=rs1("��ͬ��ʼʱ��_��")%>"><%=rs1("��ͬ��ʼʱ��_��")%></option>
  <%for r=1 to  31%>
  <option value="<%=r%>"><%=r%></option>
  <%next%>
</select>
��		  </td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">��ͬ����ʱ�䣺</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  <select name="������" id="������" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <%if rs1("��ͬ����ʱ��_��")<>"" then%>
		  <option  value="<%=rs1("��ͬ����ʱ��_��")%>"><%=rs1("��ͬ����ʱ��_��")%></option>
		  <%else%>
		<option  value="��ѡ��">��ѡ��</option>
		<%end if%>
          <%for n=year(now) to  year(now)+10%>
          <option value="<%=n%>"><%=n%></option>
          <%next%>
        </select>
��
<select name="������" id="select2" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <%if rs1("��ͬ����ʱ��_��")<>"" then%>
		  <option  value="<%=rs1("��ͬ����ʱ��_��")%>"><%=rs1("��ͬ����ʱ��_��")%></option>
		  <%else%>
		<option  value="��ѡ��">��ѡ��</option>
		<%end if%>
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
��
<select name="������" id="select3" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <%if rs1("��ͬ����ʱ��_��")<>"" then%>
		  <option  value="<%=rs1("��ͬ����ʱ��_��")%>"><%=rs1("��ͬ����ʱ��_��")%></option>
		  <%else%>
		<option  value="��ѡ��">��ѡ��</option>
		<%end if%>
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
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><textarea name="��ע" id="��ע" style="border:1px solid #333333; width:400px; height:50px; margin-left:3px" autocomplete="off"><%=rs1("��ע")%></textarea></td>
        </tr>
        <tr>
          <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="ȷ��" onClick="fClose()" onmouseover='return hidestatus()'/>
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
if request.Form("��ʼ��")<request.Form("������")  then
zx=1
elseif request.Form("��ʼ��")=request.Form("������") then

	if request.Form("��ʼ��")<request.Form("������") then
	zx=1
	elseif request.Form("��ʼ��")=request.Form("������") then
	
		if request.Form("��ʼ��")<request.Form("������") then
			zx=1
		elseif request.Form("��ʼ��")=request.Form("������") then
		response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
		elseif request.Form("��ʼ��")>request.Form("������") then
		response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
		end if
	elseif request.Form("��ʼ��")>request.Form("������") then	
	response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
	end if
elseif request.Form("��ʼ��")>request.Form("������") then
response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
end if
if zx=1 then
if request.Form("ch")="" then
response.write"<script>alert('��ѡ����������!');history.go(-1);</script>"  
else
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
rs("��������")=fclxcf(0)
rs("��������")=fclxcf(1)
rs("��ͬ��ʼʱ��_��")=request.Form("��ʼ��")
rs("��ͬ��ʼʱ��_��")=request.Form("��ʼ��")
rs("��ͬ��ʼʱ��_��")=request.Form("��ʼ��")
rs("��ͬ��ʼʱ��")=""&request.Form("��ʼ��")&"-"&request.Form("��ʼ��")&"-"&request.Form("��ʼ��")&""
rs("��ͬ����ʱ��_��")=request.Form("������")
rs("��ͬ����ʱ��_��")=request.Form("������")
rs("��ͬ����ʱ��_��")=request.Form("������")
rs("��ͬ����ʱ��")=""&request.Form("������")&"-"&request.Form("������")&"-"&request.Form("������")&""
rs("����ʱ��")=request.Form("����ʱ��")
rs("������")=session("admin_id")
rs("��ע")=request.Form("��ע")

set rsz=server.createobject("adodb.recordset")
sqlz="select * from gyy_fc_lb where ��ҵ԰����='"&request.Form("fh")&"' and ����='"&fclxcf(1)&"' and ��������='"&fclxcf(0)&"'"
rsz.open sqlz,conn,1,3
rsz("״̬")="����"
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
end if
end if

if action="xg" then
if request.Form("��ʼ��")<request.Form("������")  then
zx=1
elseif request.Form("��ʼ��")=request.Form("������") then

	if request.Form("��ʼ��")<request.Form("������") then
	zx=1
	elseif request.Form("��ʼ��")=request.Form("������") then
	
		if request.Form("��ʼ��")<request.Form("������") then
			zx=1
		elseif request.Form("��ʼ��")=request.Form("������") then
		response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
		elseif request.Form("��ʼ��")>request.Form("������") then
		response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
		end if
	elseif request.Form("��ʼ��")>request.Form("������") then	
	response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
	end if
elseif request.Form("��ʼ��")>request.Form("������") then
response.write"<script>alert('��ͬʱ����������ϸ�˶�!');history.go(-1);</script>" 
end if
if zx=1 then
set rs6=server.createobject("adodb.recordset")
sql6="select * from zpgl where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("����")=request.Form("����")
khmc=split(request.Form("�ͻ�����"),"-")
rs6("�ͻ�����")=khmc(1)
rs6("�ͻ�����")=khmc(0)
rs6("������ҵ԰")=request.Form("������ҵ԰")
fclxcf=split(request.Form("��������"),"-")
rs6("��������")=fclxcf(0)
rs6("��������")=fclxcf(1)
rs6("��ͬ��ʼʱ��_��")=request.Form("��ʼ��")
rs6("��ͬ��ʼʱ��_��")=request.Form("��ʼ��")
rs6("��ͬ��ʼʱ��_��")=request.Form("��ʼ��")
rs6("��ͬ��ʼʱ��")=""&request.Form("��ʼ��")&"-"&request.Form("��ʼ��")&"-"&request.Form("��ʼ��")&""
rs6("��ͬ����ʱ��_��")=request.Form("������")
rs6("��ͬ����ʱ��_��")=request.Form("������")
rs6("��ͬ����ʱ��_��")=request.Form("������")
rs6("��ͬ����ʱ��")=""&request.Form("������")&"-"&request.Form("������")&"-"&request.Form("������")&""
rs6("����ʱ��")=request.Form("����ʱ��")
rs6("������")=session("admin_id")
rs6("��ע")=request.Form("��ע")
rs6.update
response.write"<script>alert('�޸ĳɹ�');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
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
rsz("ҵ��")="��"
rsz.update
rsz.close
rsz=nothing

set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from zpgl_lx_lb where ��ͬ���='"&rs("����")&"'",conn,1
rs2.close
set rs2=nothing


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