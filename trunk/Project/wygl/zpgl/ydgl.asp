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
<title>部门管理</title>
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
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=lb">预定列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=tj">添加预定</a></strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编码</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>预定客户名称</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属工业园</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属房产</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>预定时间</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>操作时间</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from zpgl where 合同结束时间_年='无' order by 客户名称 asc"
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
        <td height="93" colspan="11" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有预定</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="57" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("编码")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("客户名称")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("所属工业园")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("所属房产")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("合同开始时间")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("操作时间")%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><a href="?action=sc&amp;id=<%=rs0("id")%>">删除</a></td>
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
        <td width="14%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">编码：</td>
        <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
			   <%
		 FOR i=1 to 4
		 suiji=suijishu()
		 suiji1=suiji1&suiji
		 next
		
		 %>
			   <input name="编码" type="text" id="编码"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="ht<%=year(now)%><%=month(now)%><%=day(now)%><%=hour(now)%><%=minute(now)%><%=second(now)%><%=suiji1%>" autocomplete="off"  readonly="true"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">预定客户名称：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="客户名称" id="客户名称" style="border:1px solid #333333; height:20px; margin-left:3px">
          <option value="请选择">请选择</option>
          <%
set rsjs=server.createobject("adodb.recordset")
sqljs="select 编码,名称 from user_zrr  order by 名称 asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>
          <option value="<%=rsjs("编码")%>-<%=rsjs("名称")%>"><%=rsjs("编码")%>&nbsp;-&nbsp;<%=rsjs("名称")%></option>
<%
rsjs.movenext()
next
%>

 <%
set rsjs1=server.createobject("adodb.recordset")
sqljs1="select 编码,名称 from user_gs  order by 名称 asc"
rsjs1.open sqljs1,conn,3
for i=0 to rsjs1.recordcount
 if rsjs1.bof or rsjs1.eof then exit for
%>
          <option value="<%=rsjs1("编码")%>-<%=rsjs1("名称")%>"><%=rsjs1("编码")%>&nbsp;-&nbsp;<%=rsjs1("名称")%></option>
<%
rsjs1.movenext()
next
%>

        </select></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">所属工业园：</td>
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
	
	sql201="select * from  gyy_fc_lb   where 工业园名称='"&rs20("工业园名称")&"' and  状态='未租' "
	set rs201=server.createobject("adodb.recordset")
	rs201.open sql201,conn,1,1
	rs201.pagesize=1
	for bb=1 to rs201.pagecount
    if rs201.bof or rs201.eof then exit for	
%>

                 form1l[<%=aa%>][<%=bb%>]=new Option("<%=rs201("房产类型")%>-<%=rs201("房号")%>","<%=rs201("房产类型")%>-<%=rs201("房号")%>");
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
  </select>		</td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">所属房产：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
<select name="ch">
          <option value="请选择">请选择</option>
 </select></label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">预定时间：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="年" id="年" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
          <%for n=year(now) to  year(now)+2%>
          <option value="<%=n%>"><%=n%></option>
          <%next%>
        </select>
年
<select name="月" id="月" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
月
<select name="日" id="日" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
  <%for r=1 to  31%>
  <option value="<%=r%>"><%=r%></option>
  <%next%>
</select>
日</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">操作时间：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="操作时间" type="text" id="操作时间"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=date()%>" autocomplete="off" readonly="true"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">备注：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><textarea name="备注" id="备注" style="border:1px solid #333333; width:400px; height:50px; margin-left:3px" autocomplete="off"></textarea></td>
      </tr>
      <tr>
        <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onMouseover='return hidestatus()'/>
            <input name="Submit4" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>        </td>
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
sql="select * from zpgl where 所属工业园='"&request.Form("fh")&"' and 房产类型='"&fclxcf(0)&"' and 所属房产='"&fclxcf(1)&"' "
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("编码")=request.Form("编码")
khmc=split(request.Form("客户名称"),"-")
rs("客户名称")=khmc(1)
rs("客户编码")=khmc(0)
rs("所属工业园")=request.Form("fh")
fclxcf=split(request.Form("ch"),"-")
rs("房产类型")=fclxcf(0)
rs("所属房产")=fclxcf(1)
rs("合同开始时间")=""&request.Form("年")&"-"&request.Form("月")&"-"&request.Form("日")&""
rs("合同开始时间_年")=request.Form("年")
rs("合同开始时间_月")=request.Form("月")
rs("合同开始时间_日")=request.Form("日")
rs("合同结束时间_年")="无"
rs("合同结束时间_月")="无"
rs("合同结束时间_日")="无"
rs("操作时间")=request.Form("操作时间")
rs("操作人")=session("admin_id")
rs("状态")="预定"
rs("备注")=request.Form("备注")

set rsz=server.createobject("adodb.recordset")
sqlz="select * from gyy_fc_lb where 工业园名称='"&request.Form("fh")&"' and 房号='"&fclxcf(1)&"' and 房产类型='"&fclxcf(0)&"'"
rsz.open sqlz,conn,1,3
rsz("状态")="预定"
rsz("业主")=khmc(0)
rsz.update
rsz.close
rsz=nothing

rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('添加成功');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('房间已经有人预定货还未到预定时间!');history.go(-1);</script>"         
end if
end if

if action="sc"	then
set rs=server.createobject("adodb.recordset")
sql="select * from zpgl where id="&request.QueryString("id")
rs.open sql,conn,1,3
set rsz=server.createobject("adodb.recordset")
sqlz="select * from gyy_fc_lb where 工业园名称='"&rs("所属工业园")&"' and 房号='"&rs("所属房产")&"'"
rsz.open sqlz,conn,1,3
rsz("状态")="未租"
rsz("业主")=""
rsz.update
rsz.close
rsz=nothing


set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from zpgl where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('删除成功');location.href='?';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>