<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<!--#INCLUDE FILE="../Safe/Function.asp"-->
<%
Operation=request.QueryString("Operation")
action=request.QueryString("action")
if request.Form("n")="" and request.QueryString("n")="" then
n=year(now)
elseif request.Form("n")<>"" then
n=request.Form("n")
elseif request.QueryString("n")<>"" then
n=request.QueryString("n")
end if
if request.Form("y")="" and request.QueryString("y")="" then
y=month(now)
elseif request.Form("y")<>"" then
y=request.Form("y")
elseif request.QueryString("y")<>"" then
y=request.QueryString("y")
end if
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
<script type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">�ɷ��б�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
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
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�·�</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>�ɷ�״̬</strong></td>
        <td width="77" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>����</strong></td>
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
sql0="select * from zpgl where  ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"'  order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ��������='"&fclx&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&ssfc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc<>"" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&fclx&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc<>"" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ��������='"&ssfc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc="" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"'and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc="" and gyy="" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where ��������='"&fclx&"' and  ��������='"&ssfc&"' and ��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and ��������='"&fclx&"'��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"
elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&ssfc&"'��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where �ͻ�����='"&khmc&"'and  ������ҵ԰='"&gyy&"' and  ��������='"&fclx&"' and ��������='"&ssfc&"'��ͬ����ʱ��>'"&date()&"' and ��ͬ��ʼʱ��<'"&date()&"' order by ������ҵ԰,��������,�������� asc"


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
        <td height="93" colspan="14" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">û�к�ͬ</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="33" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="152" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;<%=rs0("����")%></td>
        <td width="71" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"> &nbsp;<%=rs0("�ͻ�����")%></td>
        <td width="82" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;<%=rs0("������ҵ԰")%></td>
        <td width="85" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;<%=rs0("��������")%>-<%=rs0("��������")%></td>
        <td width="88" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;<%=rs0("��ͬ��ʼʱ��")%></td>
        <td width="93" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<% 
		if rs0("��ͬ����ʱ��")<>"" then 
			  response.Write(""&rs0("��ͬ����ʱ��")&"")
		else
		      response.Write("δǩ����ͬ")
		end if
		%>		</td>
        <td width="61" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;<%=n%>/<%=y%></td>
        <td width="64" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F ">
&nbsp;
<%
if rs0("��ͬ��ʼʱ��_��")=""&n&"" then
  if rs0("��ͬ��ʼʱ��_��")>""&y&"" then
	zt=0
	else
	zt=1
	end if
elseif 	rs0("��ͬ����ʱ��_��")=""&n&"" then
	if rs0("��ͬ����ʱ��_��")<""&y&"" then
	zt=1
	else
	zt=1
	end if
elseif rs0("��ͬ��ʼʱ��_��")<""&n&"" and  rs0("��ͬ����ʱ��_��")>""&n&"" then
zt=1
end if
if zt=1 then
sql222="select * from  user_sf_zb where ��ͬ���='"&rs0("����")&"' and ������='"&n&"' and ������='"&y&"'"
set rs2222=server.createobject("adodb.recordset")
rs2222.open sql222,conn,1,1
if rs2222.recordcount=0 then
response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")

else
	if rs2222("�ɷ�״̬")="�ѽɷ�" or rs2222("�ɷ�״̬")="��Ҫ�ɷ�" then
	response.Write("�ѽɷ�")
	else
	response.Write("<span style='color:#FF0000'>δ�ɷ�</span>")
	end if
end if
elseif zt=0 then
   	response.Write("<span style='color:#666666'>��Ҫ�ɷ�</span>")
end if
%>
	</td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<a href="jf_xq.asp?id=<%=rs0("id")%>&page=<%=epage%>">�鿴����</a>&nbsp;</td>
      </tr>
<%
rs0.movenext()
next
%>
    </table>
<tr>
    <td height="30" colspan="2" align="center" valign="middle">


<form id="form1" name="form1" method="post" action="?page=<%=request.Form("tzym")%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>&n=<%=n%>&y=<%=y%>">
	  
	<span class="STYLE1">
	�����ǵ�<%=epage%>ҳһ����<%=rs0.pagecount%>ҳ 
	<A onMouseover="return hidestatus()" href="?page=1&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>&n=<%=n%>&y=<%=y%>">��ҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>&n=<%=n%>&y=<%=y%>">ǰһҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>&n=<%=n%>&y=<%=y%>">��һҳ</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>&n=<%=n%>&y=<%=y%>">ĩҳ</a>	</span>	  
	  <label>
	    <select name="tzym">
		<%for ym=1 to rs0.pagecount
		if ym=epage then
		%>
		<option value="<%=ym%>" selected="selected"><%=ym%></option>
		<%else%>
	      <option value="<%=ym%>"><%=ym%></option>
		  <%
		  end if
		  next%>
        </select>
	    </label>
	  <label>
	  &nbsp;
	  <input type="submit" name="Submit" value="go" />
	  </label>
	</form>
	</td>
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