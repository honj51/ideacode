<!--#INCLUDE FILE="../Safe/conn.asp"-->
<script language="javascript">
<!--

var subval = new Array();
	
<%   
sql3111="select * from  gyy_lb   order by ��� asc"
set rs3111=server.createobject("adodb.recordset")
rs3111.open sql3111,conn,1,1
rs3111.pagesize=1
for s111=1 to rs3111.pagecount
    if rs3111.bof or rs3111.eof then exit for	
	
	sql321="select * from  gyy_lb_fclx_lb   where ��ҵ԰����='"&rs3111("��ҵ԰����")&"'  "
	set rs321=server.createobject("adodb.recordset")
	rs321.open sql321,conn,1,1
	rs321.pagesize=1
	for s21=1 to rs321.pagecount
    if rs321.bof or rs321.eof then exit for	
	
	sql33="select * from  gyy_fc_lb   where ��ҵ԰����='"&rs321("��ҵ԰����")&"' and ��������='"&rs321("��������")&"' "
	set rs33=server.createobject("adodb.recordset")
	rs33.open sql33,conn,1,1
	rs33.pagesize=1
	for s33=1 to rs33.pagecount
    if rs33.bof or rs33.eof then exit for	
%>
subval[s33] = new Array('<%=rs3111("��ҵ԰����")%>','<%=rs321("��������")%>','<%=rs33("����")%>','<%=rs33("����")%>')
	<%
	rs33.movenext
	next
	%>	
	<%
	rs32.movenext
	next
	%>	
<%
rs31.movenext
next
%>		 

//subval[����] = new Array('һ����ֵ','������ֵ','������ǩ','������ֵ')

function changeselect2()
{
document.form1.s2.length = 0;
document.form1.s2.options[0] = new Option('��ѡ��','��ѡ��');
<%   
sql311="select * from  gyy_lb   order by ��� asc"
set rs311=server.createobject("adodb.recordset")
rs311.open sql311,conn,1,1
rs311.pagesize=1
for s11=1 to rs311.pagecount
    if rs311.bof or rs311.eof then exit for	
	
	sql32="select * from  gyy_lb_fclx_lb   where ��ҵ԰����='"&rs311("��ҵ԰����")&"' order by ��� asc "
	set rs32=server.createobject("adodb.recordset")
	rs32.open sql32,conn,1,1
	rs32.pagesize=1
	for s2=1 to rs32.pagecount
    if rs32.bof or rs32.eof then exit for	
%>

document.form1.s2.options[<%=s2%>] = new Option('<%=rs32("��������")%>','<%=rs32("��������")%>');

	<%
	rs32.movenext
	next
	%>	
<%
rs311.movenext
next
%>		 
document.form1.s3.length = 0;
document.form1.s3.options[0] = new Option('��ѡ��','��ѡ��');
}

function changeselect3(sub1,sub2)
{
document.form1.s3.length = 0;
document.form1.s3.options[0] = new Option('��ѡ��','��ѡ��');
for (i=0; i<subval.length; i++)
{
if ((subval[i][0] == sub1) & (subval[i][1] == sub2))
{document.form1.s3.options[document.form1.s3.length] = new Option(subval[i][2], subval[i][3]);}
}
}
//-->
</script>

<form name="form1">

����������

<select name="s1" onChange="changeselect2()">
<option>��ѡ��</option>
<%   
sql31="select * from  gyy_lb   order by ��� asc"
set rs31=server.createobject("adodb.recordset")
rs31.open sql31,conn,1,1
rs31.pagesize=1
for s1=1 to rs31.pagecount
   if rs31.bof or rs31.eof then exit for
%>	
    <option  value="<%=rs31("��ҵ԰����")%>"><%=rs31("��ҵ԰����")%></option>
<%
rs31.movenext
next
%>	
</select>

<select name="s2" onChange="changeselect3(document.form1.s1.value,this.value)"> 
<option>��ѡ��</option>
</select>

<select name="s3" onChange="alert(this.value)"> 
<option>��ѡ��</option>
</select>

</form>

