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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">�����ܱ�ͳ��</a>&nbsp;
	
	    <img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">�������ͳ��</a>&nbsp;</strong></td>
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
          <td width="60" align="right">�շ����ͣ�</td>
          <td width="83"><select name="select" id="select">
            <option  value="��ѡ��">��ѡ��</option>
          </select></td>
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
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>���</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>����</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ͻ�����</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>������ҵ԰</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��������</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ��ʼʱ��</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ����ʱ��</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>��ͬ״̬</strong></td>
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
sql0="select * from zpgl   order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ��������='"&fclx&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&ssfc&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&fclx&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&ssfc&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc="" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc="" and gyy="" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&fclx&"' and  ��������='"&ssfc&"' order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and ��������='"&fclx&"'order by ��ͬ����ʱ��-"&date()&" asc"
elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"'order by ��ͬ����ʱ��-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' and ��������='"&ssfc&"'order by ��ͬ����ʱ��-"&date()&" asc"


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
        <td height="93" colspan="12" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û�к�ͬ</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="31" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="135" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("����")%></td>
        <td width="68" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("�ͻ�����")%></td>
        <td width="76" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("������ҵ԰")%></td>
        <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��������")%>-<%=rs0("��������")%></td>
        <td width="97" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("��ͬ��ʼʱ��")%></td>
        <td width="88" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<% 
		if rs0("��ͬ����ʱ��")<>"" then 
			  response.Write(""&rs0("��ͬ����ʱ��")&"")
		else
		      response.Write("δǩ����ͬ")
		end if
		%>		</td>
        <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
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
%>
</table>
</body>
</html>
<%
conn.close
set conn=nothing
%>