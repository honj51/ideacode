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
<title>部门管理</title>
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
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;
	<A onMouseover="return hidestatus()" href="?Operation=lb">房产列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;
	<A onMouseover="return hidestatus()" href="?Operation=tj">添加房产</a>&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>序号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>工业园名称</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>房产类型</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from gyy_fc_lb  order by 工业园名称,房产类型,房号 asc"
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
        <td height="93" colspan="10" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有添加房产</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="57" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("工业园名称")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("房产类型")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("房号")%></td>
        <td width="131" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F ;">
		<a href="?Operation=xg&id=<%=rs0("id")%>">编辑</a>&nbsp;&nbsp;
		<%if rs0("状态")<>"未租" then
		response.Write("<span style='color:#999999'>删除</span>")
		else
		%>
		<a href="?action=sc&id=<%=rs0("id")%>">删除</a>
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
	现在是第<%=epage%>页一共有<%=rs0.pagecount%>页 
	<A onMouseover="return hidestatus()" href="?page=1">首页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>">前一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>">后一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>">末页</a>	</span></td>
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
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房号：</td>
        <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="房号" type="text" id="房号"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">工业园名称：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		
		
<script language="javascript">
//下面函数是演示二，联动菜单的处理代码
function makech(x){
    var form1=document.form1.fh.options.length;//这句解释同上
    var form1l=new Array(form1)//新建一个数组，项数为第一个下拉列表的项数
    for(ii=1;ii<form1;ii++)//循环第一个下拉列表的项数那么多次
        form1l[ii]=new Array();//子循环
        //下面是给每个循环赋值  
    var ch=document.form1.ch;//方便引用
<%   
sql20="select * from  gyy_lb   order by 序号 asc"
set rs20=server.createobject("adodb.recordset")
rs20.open sql20,conn,1,1
rs20.pagesize=1
for aa=1 to rs20.pagecount
    if rs20.bof or rs20.eof then exit for	
	
	sql201="select * from  gyy_lb_fclx_lb   where 工业园名称='"&rs20("工业园名称")&"'  "
	set rs201=server.createobject("adodb.recordset")
	rs201.open sql201,conn,1,1
	rs201.pagesize=1
	
	for bb=1 to rs201.recordcount
    if rs201.bof or rs201.eof then exit for	
	fclelb=rs201("房产类型")
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
    //这个要看清楚,因为要重新填充下拉列表的话必须先清除里面原有的项,清除和增加当然是有区别的了,所以用递减
        ch.options[mm]=null;//将该项设置为空,也就等于清除了
    for(jj=1;jj<form1l[x].length;jj++){//这个循环是填充下拉列表
        ch.options[jj]=new Option(form1l[x][jj].text,form1l[x][jj].value)
        //注意上面这据,列表的当前项等于 新项(数组对象的x,j项的文本为文本，)
    }
    ch.options[1].selected=true;//设置被选中的初始值
}
</script>
  <select name="fh" size="1" onChange="makech(options.selectedIndex)">
          <option value="请选择">请选择</option>
<%   
sql="select * from  gyy_lb  order by 序号 asc"
set rs2=server.createobject("adodb.recordset")
rs2.open sql,conn,1,1
rs2.pagesize=1
for cc=1 to rs2.pagecount
   if rs2.bof or rs2.eof then exit for
%>	
    <option  value="<%=rs2("工业园名称")%>"><%=rs2("工业园名称")%></option>
<%
rs2.movenext
next
%>	
  </select>			

        </label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房产类型：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		
<select name="ch">
          <option value="请选择">请选择</option>
 </select>		
</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">描述：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="描述" type="text" id="描述"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房型：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="房型" type="text" id="房型"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">朝向：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="朝向" type="text" id="朝向"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房屋结构:</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="房屋结构" type="text" id="房屋结构"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onMouseover='return hidestatus()'/>
            <input name="Submit4" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>        </td>
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
          <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房号：</td>
          <td width="83%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="房号" type="text" id="房号"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("房号")%>"  readonly="true"autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">工业园名称：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <input name="fh" type="text" id="fh"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("工业园名称")%>"  readonly="true"autocomplete="off"/>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房产类型：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="ch" type="text" id="ch"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("房产类型")%>"  readonly="true"autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">描述：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="描述" type="text" id="描述"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("描述")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房型：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="房型" type="text" id="房型"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("房型")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">朝向：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="朝向" type="text" id="朝向"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("朝向")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">房屋结构:</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="房屋结构" type="text" id="房屋结构"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("房屋结构")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onmouseover='return hidestatus()'/>
              <input name="Submit42" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>          </td>
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
sql="select * from gyy_fc_lb where 工业园名称='"&request.Form("fh")&"' and 房号='"&request.Form("房号")&"'  and 房号='"&request.Form("ch")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("工业园名称")=request.Form("fh")
rs("房产类型")=request.Form("ch")
rs("房号")=request.Form("房号")
rs("描述")=request.Form("描述")
rs("房型")=request.Form("房型")
rs("朝向")=request.Form("朝向")
rs("房屋结构")=request.Form("房屋结构")
rs("状态")="未租"
rs("业主")="无"
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('添加成功');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('该工业园名称已存在!');history.go(-1);</script>"         
end if
end if

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from gyy_fc_lb where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("工业园名称")=request.Form("fh")
rs6("房产类型")=request.Form("ch")
rs6("房号")=request.Form("房号")
rs6("描述")=request.Form("描述")
rs6("房型")=request.Form("房型")
rs6("朝向")=request.Form("朝向")
rs6("房屋结构")=request.Form("房屋结构")
rs6.update
response.write"<script>alert('修改成功');location.href='?&Operation=lb';</script>"
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
response.write"<script>alert('删除成功');location.href='fcgl.asp';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>