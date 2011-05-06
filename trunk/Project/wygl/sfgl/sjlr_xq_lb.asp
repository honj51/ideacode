<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from zpgl where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3

set rs0=server.createobject("adodb.recordset")
sql0="select * from zpgl_lx_lb where 合同编号='"&rs1("编码")&"' order by id asc"
rs0.open sql0,conn,3
Operation=request.QueryString("Operation")
action=request.QueryString("action")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>部门管理</title>
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
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="sjlr.asp?Operation=lb&page=<%=request.QueryString("page")%>">录入列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle"><form id="form3" name="form3" method="post" action="sjlr.asp?&page=<%=request.QueryString("page")%>" style="margin:0px">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="41" align="right" valign="middle">名称：</td>
          <td width="105">
            <input name="客户名称" type="text" id="客户名称"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off"  />     </td>
          <td width="53" align="right">工业园：</td>
          <td width="78">
<script language="javascript">
//下面函数是演示二，联动菜单的处理代码
function makech1(x){
    var form3=document.form3.fh.options.length;//这句解释同上
    var form3l=new Array(form3)//新建一个数组，项数为第一个下拉列表的项数
    for(ii=1;ii<form3;ii++)//循环第一个下拉列表的项数那么多次
        form3l[ii]=new Array();//子循环
        //下面是给每个循环赋值  
    var ch=document.form3.ch;//方便引用
	
<%   
sql20="select * from  gyy_lb   order by 序号 asc"
set rs20=server.createobject("adodb.recordset")
rs20.open sql20,conn,1,1
rs20.pagesize=1
for aa=1 to rs20.pagecount
    if rs20.bof or rs20.eof then exit for	
	
	sql201="select * from  gyy_lb_fclx_lb   where 工业园名称='"&rs20("工业园名称")&"' "
	set rs201=server.createobject("adodb.recordset")
	rs201.open sql201,conn,1,1
	rs201.pagesize=1
	for bb=1 to rs201.pagecount
    if rs201.bof or rs201.eof then exit for	
%>

                 form3l[<%=aa%>][<%=bb%>]=new Option("<%=rs201("房产类型")%>","<%=rs201("房产类型")%>");
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
    for(jj=1;jj<form3l[x].length;jj++){//这个循环是填充下拉列表
        ch.options[jj]=new Option(form3l[x][jj].text,form3l[x][jj].value)
        //注意上面这据,列表的当前项等于 新项(数组对象的x,j项的文本为文本，)
    }
    ch.options[1].selected=true;//设置被选中的初始值
}
</script>
		  
            <select name="fh" size="1" id="fh" onChange="makech1(options.selectedIndex)">
              <option  value="请选择">请选择</option>
              <%   
sql="select * from  gyy_lb   order by 序号 asc"
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
            </select>         </td>
          <td width="43" align="right">类型：</td>
          <td width="78"><select name="ch" id="ch">
            <option  value="请选择">请选择</option>
          </select></td>
          <td width="41" align="right">号码：</td>
          <td width="105">
            <input name="所属房产" type="text" id="所属房产"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off" />         </td>
          <td width="30" align="right">&nbsp;年：</td>
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
          <td width="28" align="right">月：</td>
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
            <input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="搜索" onClick="fClose()" onmouseover='return hidestatus()'/></td>
        </tr>
      </table>
      </form>  
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;合同编号：<a href="sjlr_xq.asp?id=<%=request.QueryString("id")%>&page=<%=request.QueryString("page")%>"><%=rs1("编码")%></a><br />      
      &nbsp;&nbsp;&nbsp;工业园名称：<%=rs1("所属工业园")%>&nbsp;&nbsp;房产类型：<%=rs1("房产类型")%>&nbsp;&nbsp;所属房产：<%=rs1("所属房产")%>&nbsp;&nbsp;用户名称：<%=rs1("客户名称")%>&nbsp;&nbsp;用户编码：<%=rs1("客户编码")%>
  &nbsp;<%=request.QueryString("ny")%>/<%=request.QueryString("yy")%>
  <tr>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	
	
	<form id="form1" name="form1" method="post" action="?action=tj&Operation=tj&id=<%=request.QueryString("id")%>&ny=<%=request.QueryString("ny")%>&yy=<%=request.QueryString("yy")%>&xh=<%=request.QueryString("xh")%>&page=<%=request.QueryString("page")%>" style="margin:opx" onSubmit="return  denglu()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>消费项目</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>消费类型</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>值</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>倍率</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>损耗</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>滞纳金</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>上月读数</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>读数</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>说明</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>读数输入</strong></td>
          </tr>
        <%
if rs0.recordcount=0 then
%>
        <tr>
          <td height="93" colspan="14" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有项目</td>
        </tr>
        <%
end if
for i=1 to rs0.recordcount
if rs0.bof or rs0.eof then exit for
set rs1011=server.createobject("adodb.recordset")
sql1011="select * from user_sf_lb where 单据编号='"&rs0("合同编号")&"_"&request.QueryString("xh")&"' and 收费项目='"&rs0("消费项目")&"' "
rs1011.open sql1011,conn,3

%>
        <tr>
          <td width="39" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
          <td width="165" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="消费项目<%=i%>" type="text" id="消费项目<%=i%>"  style="border:1px solid #333333;  width:150px ; height:20px; background-color:#CCCCCC" value="<%=rs0("消费项目")%>" autocomplete="off" readonly="true"/></td>
          <td width="57" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="消费类型<%=i%>" type="text" id="消费类型<%=i%>"  style="border:1px solid #333333; width:50px ;height:20px; background-color:#CCCCCC" value="<%=rs0("消费类型")%>" autocomplete="off" readonly="true" /></td>
          <td width="57" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<input name="值<%=i%>" type="text" id="值<%=i%>"  style="border:1px solid #333333;  width:50px ;  height:20px; background-color:#CCCCCC" value="<%=FormatNumber(rs0("值"),2,-1)%>" autocomplete="off"  readonly="true"/></td>
          <td width="55" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">

<input name="倍率<%=i%>" type="text" id="倍率<%=i%>"  style="border:1px solid #333333;  width:30px ;  height:20px; background-color:#CCCCCC" value="<%=rs0("倍率")%>" autocomplete="off"  readonly="true"/>&nbsp;	
	  		
		  </td>
          <td width="55" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs0("消费类型")="动态" then%>	
    <input name="损耗<%=i%>" type="text" id="损耗<%=i%>"  style="border:1px solid #333333;  width:30px ;  height:20px; background-color:#CCCCCC" value="<%=rs0("损耗")%>" autocomplete="off"  readonly="true"/>&nbsp;%  
<%

else
response.Write("-")
end if
%>			</td>
          <td width="55" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
set rs00122=server.createobject("adodb.recordset")
sql00122="select * from user_sf_zb where 单据编号='"&rs1("编码")&"_"&request.QueryString("xh")-1&"'"
rs00122.open sql00122,conn,1,3
if rs00122("缴费状态")="已缴费"or rs00122("缴费状态")="不要交费" then
%>
<input name="滞纳金<%=i%>" type="text" id="滞纳金<%=i%>"  style="border:1px solid #333333;  width:30px ;  height:20px; background-color:#CCCCCC" value="0" autocomplete="off"  readonly="true"/>&nbsp;%	
<%else%>
<input name="滞纳金<%=i%>" type="text" id="滞纳金<%=i%>"  style="border:1px solid #333333;  width:30px ;  height:20px; background-color:#CCCCCC" value="<%=rs0("滞纳金")%>" autocomplete="off"  readonly="true"/>&nbsp;%	
<%end if%>		  		</td>
          <td width="83" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		  
<%
set rs0012=server.createobject("adodb.recordset")
sql0012="select * from user_sf_lb where 单据编号='"&rs1("编码")&"_"&request.QueryString("xh")-1&"' and 收费项目='"&rs0("消费项目")&"'"
rs0012.open sql0012,conn,1,3
if rs0("消费类型")="动态" then
response.Write(""&rs0012("读数")&"")
else
response.Write("-")
end if
%>		  </td>
          <td width="83" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs0("消费类型")="动态" or   rs0("消费类型")="单价" then%>
<input name="读数<%=i%>" type="text" id="读数<%=i%>"  style="border:1px solid #333333;  width:80px ;  height:20px; " value="<%=rs1011("读数")%>" autocomplete="off" />
<%else
response.Write("-")
end if
%>		  </td>
          <td width="171" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="说明<%=i%>" type="text" id="说明<%=i%>"  style="border:1px solid #333333; width:100% ;   height:20px; background-color:#CCCCCC" value="<%=rs0("说明")%>" autocomplete="off"  readonly="true"/></td>
          <td width="70" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
if rs1011.recordcount=0 then
response.Write("<span style='color:#CC0000'>×</span>")
else
	if  rs1011("录入状态")="已录入"  then
		response.Write("√")
	else
		response.Write("<span style='color:#CC0000'>×</span>")
	end if
end if
%></td>
          </tr>
        <%
rs0.movenext()
next

%>
<tr>
<td height="40" colspan="12" align="center" valign="middle">
 <input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="提交" onClick="fClose()" onmouseover='return hidestatus()'/></td>
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
set rs11=server.createobject("adodb.recordset")
sql11="select * from zpgl where id='"&request.QueryString("id")&"'"
rs11.open sql11,conn,3

set rs22=server.CreateObject("ADODB.RecordSet")
rs22.open "delete from user_sf_lb where 单据编号='"&rs11("编码")&"_"&request.QueryString("xh")&"'",conn,1
rs22.close
set rs22=nothing


set rs220=server.CreateObject("ADODB.RecordSet")
rs220.open "delete from user_sf_zb where 单据编号='"&rs11("编码")&"_"&request.QueryString("xh")&"'",conn,1
rs220.close
set rs220=nothing


set rs01=server.createobject("adodb.recordset")
sql01="select * from zpgl_lx_lb where 所属工业园='"&rs11("所属工业园")&"' and 房产类型='"&rs11("房产类型")&"' order by id asc"
rs01.open sql01,conn,3
for j=1 to rs01.recordcount
   if rs01.eof or rs01.bof then exit for

set rs1111=server.createobject("adodb.recordset")
sql1111="select * from user_sf_lb "
rs1111.open sql1111,conn,1,3
rs1111.addnew
rs1111("合同编号")=rs11("编码")
rs1111("单据编号")=""&rs11("编码")&"_"&request.QueryString("xh")&""
rs1111("客户编号")=rs11("客户编码")
rs1111("日期年")=request.QueryString("ny")
rs1111("日期月")=request.QueryString("yy")
rs1111("日期日")=day(now)
rs1111("日期")=""&request.QueryString("ny")&"-"&request.QueryString("yy")&"-"&day(now)&""
rs1111("收费项目")=request.Form("消费项目"&j&"")
rs1111("收费类型")=request.Form("消费类型"&j&"")
rs1111("值")=request.Form("值"&j&"")

if request.Form("消费类型"&j&"")="动态" or  request.Form("消费类型"&j&"")="单价"then
if request.Form("读数"&j&"")<>"" then
rs1111("录入状态")="已录入"
else
rs1111("录入状态")="未录入"
end if
else
rs1111("录入状态")="已录入"
end if
rs1111("缴费状态")="未缴费"



if request.Form("消费类型"&j&"")="动态" then
rs1111("损耗")=request.Form("损耗"&j&"")
else 
rs1111("损耗")=0
end if
if request.Form("消费类型"&j&"")="动态" or  request.Form("消费类型"&j&"")="单价" then
rs1111("读数")=request.Form("读数"&j&"")
else
rs1111("读数")=0
end if
rs1111("滞纳金")=request.Form("滞纳金"&j&"")
rs1111("倍率")=request.Form("倍率"&j&"")


set rs001=server.createobject("adodb.recordset")
sql001="select * from user_sf_lb where 单据编号='"&rs11("编码")&"_"&request.QueryString("xh")-1&"' and 收费项目='"&request.Form("消费项目"&j&"")&"'"
rs001.open sql001,conn,1,3
if request.Form("倍率"&j&"")<>0 then
if request.Form("消费类型"&j&"")="动态" then
rs1111("费用")=(request.Form("读数"&j&"")-rs001("读数"))*request.Form("值"&j&"")*(1-(-request.Form("滞纳金"&j&"")/100))*(1-(-request.Form("损耗"&j&"")/100))*request.Form("倍率"&j&"")
elseif request.Form("消费类型"&j&"")="单价" then
rs1111("费用")=request.Form("读数"&j&"")*request.Form("值"&j&"")*(1-(-request.Form("滞纳金"&j&"")/100))*request.Form("倍率"&j&"")
elseif request.Form("消费类型"&j&"")="固定" then
rs1111("费用")=request.Form("值"&j&"")*(1-(-request.Form("滞纳金"&j&"")/100))*request.Form("倍率"&j&"")
elseif request.Form("消费类型"&j&"")="递增" then
rs1111("费用")=(rs1111("费用")-(-request.Form("值"&j&"")*(request.QueryString("xh")-1)))*(1-(-request.Form("滞纳金"&j&"")/100))*request.Form("倍率"&j&"")
end if
else
if request.Form("消费类型"&j&"")="动态" then
rs1111("费用")=(request.Form("读数"&j&"")-rs001("读数"))*request.Form("值"&j&"")*(1-(-request.Form("滞纳金"&j&"")/100))*(1-(-request.Form("损耗"&j&"")/100))
elseif request.Form("消费类型"&j&"")="单价" then
rs1111("费用")=request.Form("读数"&j&"")*request.Form("值"&j&"")*(1-(-request.Form("滞纳金"&j&"")/100))
elseif request.Form("消费类型"&j&"")="固定" then
rs1111("费用")=request.Form("值"&j&"")*(1-(-request.Form("滞纳金"&j&"")/100))
elseif request.Form("消费类型"&j&"")="递增" then
rs1111("费用")=(rs1111("费用")-(-request.Form("值"&j&"")*(request.QueryString("xh")-1)))*(1-(-request.Form("滞纳金"&j&"")/100))
end if
end if
zfy=zfy-(-rs1111("费用"))
rs1111("金额")=0


rs1111.update
rs1111.close
set rs1111=nothing

rs01.movenext()
next
set rs2201=server.createobject("adodb.recordset")
sql2201="select * from user_sf_zb "
rs2201.open sql2201,conn,1,3

set rs22011=server.createobject("adodb.recordset")
sql22011="select * from user_sf_zb where 单据编号='"&rs11("编码")&"_"&request.QueryString("xh")-1&"'"
rs22011.open sql22011,conn,1,3

rs2201.addnew
rs2201("合同编号")=rs11("编码")
rs2201("单据编号")=""&rs11("编码")&"_"&request.QueryString("xh")&""
rs2201("客户编号")=rs11("客户编码")
rs2201("日期年")=request.QueryString("ny")
rs2201("日期月")=request.QueryString("yy")
rs2201("日期日")=day(now)
rs2201("日期")=""&request.QueryString("ny")&"-"&request.QueryString("yy")&"-"&day(now)&""
rs2201("总费用")=zfy
rs2201("缴费金额")=0
rs2201("余额")=rs22011("余额")
rs2201("录入状态")="已录入"
rs2201("缴费状态")="未缴费"
rs2201.update
rs2201.close
set rs2201=nothing

response.write"<script>alert('输入成功');location.href='sjlr_xq.asp?id="&request.QueryString("id")&"&page="&request.QueryString("page")&"';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>