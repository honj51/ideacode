<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->

<%
set rs1=server.createobject("adodb.recordset")
sql1="select * from zpgl where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3

set rs0=server.createobject("adodb.recordset")
sql0="select * from gyy_lb_fclx_lb_xflx where 工业园名称='"&rs1("所属工业园")&"' and 房产类型='"&rs1("房产类型")&"' order by 序号 asc"
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="zpht.asp?Operation=lb">合同列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onMouseOver="return hidestatus()" href="zpht.asp?Operation=tj">添加合同</a></strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;工业园名称：<%=rs1("所属工业园")%>&nbsp;&nbsp;房产类型：<%=rs1("房产类型")%>&nbsp;&nbsp;所属房产：<%=rs1("所属房产")%>&nbsp;&nbsp;用户名称：<%=rs1("客户名称")%>&nbsp;&nbsp;用户编码：<%=rs1("客户编码")%>
  <tr>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	
	
	<form id="form1" name="form1" method="post" action="?action=tj&Operation=tj&id=<%=request.QueryString("id")%>" style="margin:opx" onSubmit="return  denglu()">
      <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>消费项目</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>消费类型</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>值</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>倍率</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>损耗</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>滞纳金</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>前期读数</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>说明</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>读数导入</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>项目导入</strong></td>
          </tr>
        <%
if rs0.recordcount=0 then
%>
        <tr>
          <td height="93" colspan="13" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有项目</td>
        </tr>
        <%
end if
for i=1 to rs0.recordcount
if rs0.bof or rs0.eof then exit for
set rs101=server.createobject("adodb.recordset")
sql101="select * from zpgl_lx_lb where 合同编号='"&rs1("编码")&"' and 消费项目='"&rs0("消费项目")&"' "
rs101.open sql101,conn,3


set rs1011=server.createobject("adodb.recordset")
sql1011="select * from user_sf_lb where 合同编号='"&rs1("编码")&"' and 收费项目='"&rs0("消费项目")&"' and  日期='"&rs1("合同开始时间")&"'"
rs1011.open sql1011,conn,3

%>
        <tr>
          <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
          <td width="178" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="消费项目<%=i%>" type="text" id="消费项目<%=i%>"  style="border:1px solid #333333;  width:150px ; height:20px; background-color:#CCCCCC" value="<%=rs0("消费项目")%>" autocomplete="off" readonly="true"/></td>
          <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            <input name="消费类型<%=i%>" type="text" id="消费类型<%=i%>"  style="border:1px solid #333333; width:50px ;height:20px; background-color:#CCCCCC" value="<%=rs0("消费类型")%>" autocomplete="off" readonly="true"/></td>
          <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs101("值")="" then%>
<input name="值<%=i%>" type="text" id="值<%=i%>"  style="border:1px solid #333333;  width:50px ;  height:20px; " value="<%=FormatNumber(rs0("值"),2,-1)%>" autocomplete="off" />
<%else%>
<input name="值<%=i%>" type="text" id="值<%=i%>"  style="border:1px solid #333333;  width:50px ;  height:20px; " value="<%=FormatNumber(rs101("值"),2,-1)%>" autocomplete="off" />
<%end if%></td>
          <td width="59" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<select name="倍率<%=i%>" id="倍率<%=i%>"  style="border:1px solid #333333; width:50px; height:20px; ">
	<%if rs101("倍率")="" then%>
            <option value="<%=rs0("倍率")%>"><%=rs0("倍率")%></option>
	<%else%>
			<option value="<%=rs101("倍率")%>"><%=rs101("倍率")%></option>
	<%end if%>
            <option value="0">0</option>			
			<%for bl=1 to 100%>
            <option value="<%=bl%>"><%=bl%></option>
			<%next%>
          </select>		  
		  </td>
          <td width="59" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs0("消费类型")="动态" then%>
	<select name="损耗<%=i%>" id="损耗<%=i%>"  style="border:1px solid #333333; width:50px; height:20px; ">
	<%if rs101("损耗")="" then%>
            <option value="<%=rs0("损耗")%>"><%=rs0("损耗")%>%</option>
	<%else%>
			<option value="<%=rs101("损耗")%>"><%=rs101("损耗")%>%</option>
	<%end if%>
			
			<%for sh=0 to 20%>
            <option value="<%=sh%>"><%=sh%>%</option>
			<%next%>
          </select>			  
<%

else
response.Write("-")
end if
%>			</td>
          <td width="59" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">

<select name="滞纳金<%=i%>" id="滞纳金<%=i%>"  style="border:1px solid #333333; width:50px; height:20px; ">
			<%if rs101("滞纳金")="" then%>
            <option value="<%=rs0("滞纳金")%>"><%=rs0("滞纳金")%>%</option>
			<%else%>
			<option value="<%=rs101("滞纳金")%>"><%=rs101("滞纳金")%>%</option>
			<%end if%>
			<%for znj=0 to 20%>
            <option value="<%=znj%>"><%=znj%>%</option>
			<%next%>
          </select>			</td>
          <td width="83" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs0("消费类型")="动态" then%>
<input name="读数<%=i%>" type="text" id="读数<%=i%>"  style="border:1px solid #333333;  width:80px ;  height:20px; " value="<%=rs1011("读数")%>" autocomplete="off" />
<%else
response.Write("-")
end if
%>		  </td>
          <td width="226" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%if rs101("说明")="" then%>
<input name="说明<%=i%>" type="text" id="说明<%=i%>"  style="border:1px solid #333333; width:100% ;   height:20px; " value="<%=rs0("说明")%>" autocomplete="off" />
<%else%>
<input name="说明<%=i%>" type="text" id="说明<%=i%>"  style="border:1px solid #333333; width:100% ;   height:20px; " value="<%=rs101("说明")%>" autocomplete="off" />
<%end if%></td>
          <td width="65" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
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
          <td width="85" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
if rs101.recordcount=0 then
response.Write("<span style='color:#CC0000'>×</span>")
else
if rs101.recordcount<>0 and rs101("值")<>"" then
response.Write("√")
else
response.Write("<span style='color:#CC0000'>×</span>")
end if
end if
%>
		  &nbsp;</td>
          </tr>
        <%
rs0.movenext()
next

%>
<tr>
<td height="40" colspan="11" align="center" valign="middle">
 <input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="导入到合同" onClick="fClose()" onmouseover='return hidestatus()'/></td>
</tr>
      </table>
      </form>
    
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
if action="tj" then
set rs11=server.createobject("adodb.recordset")
sql11="select * from zpgl where id='"&request.QueryString("id")&"'"
rs11.open sql11,conn,3

set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from zpgl_lx_lb where 合同编号='"&rs11("编码")&"'",conn,1
rs2.close
set rs2=nothing

set rs22=server.CreateObject("ADODB.RecordSet")
rs22.open "delete from user_sf_lb where 单据编号='"&rs11("编码")&"_1'",conn,1
rs22.close
set rs22=nothing


set rs220=server.CreateObject("ADODB.RecordSet")
rs220.open "delete from user_sf_zb where 单据编号='"&rs11("编码")&"_1'",conn,1
rs220.close
set rs220=nothing


set rs01=server.createobject("adodb.recordset")
sql01="select * from gyy_lb_fclx_lb_xflx where 工业园名称='"&rs11("所属工业园")&"' and 房产类型='"&rs11("房产类型")&"' order by 序号 asc"
rs01.open sql01,conn,3
for j=1 to rs01.recordcount
   if rs01.eof or rs01.bof then exit for

set rs=server.createobject("adodb.recordset")
sql="select * from zpgl_lx_lb "
rs.open sql,conn,1,3
rs.addnew
rs("合同编号")=rs11("编码")
rs("客户编码")=rs11("客户编码")
rs("所属工业园")=rs01("工业园名称")
rs("房产类型")=rs01("房产类型")
rs("所属房产")=rs11("所属房产")
rs("客户名称")=rs11("客户名称")
rs("消费项目")=request.Form("消费项目"&j&"")
rs("消费类型")=request.Form("消费类型"&j&"")
rs("值")=request.Form("值"&j&"")
if request.Form("消费类型"&j&"")="动态" then
rs("损耗")=request.Form("损耗"&j&"")
else 
rs("损耗")=0
end if
rs("倍率")=request.Form("倍率"&j&"")
rs("滞纳金")=request.Form("滞纳金"&j&"")
rs("说明")=request.Form("说明"&j&"")
rs.update
rs.close
set rs=nothing


set rs1111=server.createobject("adodb.recordset")
sql1111="select * from user_sf_lb "
rs1111.open sql1111,conn,1,3
rs1111.addnew
rs1111("合同编号")=rs11("编码")
rs1111("单据编号")=""&rs11("编码")&"_1"
rs1111("客户编号")=rs11("客户编码")
rs1111("日期年")=rs11("合同开始时间_年")
rs1111("日期月")=rs11("合同开始时间_月")
rs1111("日期日")=rs11("合同开始时间_日")
rs1111("日期")=rs11("合同开始时间")
rs1111("收费项目")=request.Form("消费项目"&j&"")
rs1111("收费类型")=request.Form("消费类型"&j&"")
rs1111("值")=request.Form("值"&j&"")

if request.Form("消费类型"&j&"")="动态" then
if request.Form("读数"&j&"")<>"" then
rs1111("录入状态")="已录入"
else
rs1111("录入状态")="未录入"
end if
else
rs1111("录入状态")="已录入"
end if
rs1111("缴费状态")="不要交费"



if request.Form("消费类型"&j&"")="动态" then
rs1111("损耗")=request.Form("损耗"&j&"")
else 
rs1111("损耗")=0
end if
if request.Form("消费类型"&j&"")="动态"  then
rs1111("读数")=request.Form("读数"&j&"")
else
rs1111("读数")=0
end if
rs1111("倍率")=request.Form("倍率"&j&"")
rs1111("滞纳金")=request.Form("滞纳金"&j&"")
rs1111("费用")=0
rs1111("金额")=0


rs1111.update
rs1111.close
set rs1111=nothing

rs01.movenext()
next
set rs2201=server.createobject("adodb.recordset")
sql2201="select * from user_sf_zb "
rs2201.open sql2201,conn,1,3
rs2201.addnew
rs2201("合同编号")=rs11("编码")
rs2201("单据编号")=""&rs11("编码")&"_1"
rs2201("客户编号")=rs11("客户编码")
rs2201("日期年")=rs11("合同开始时间_年")
rs2201("日期月")=rs11("合同开始时间_月")
rs2201("日期日")=rs11("合同开始时间_日")
rs2201("日期")=rs11("合同开始时间")
rs2201("总费用")=0
rs2201("缴费金额")=0
rs2201("余额")=0
rs2201("录入状态")="已录入"
rs2201("缴费状态")="不要交费"
rs2201.update
rs2201.close
set rs2201=nothing

response.write"<script>alert('导入成功');location.href='?id="&request.QueryString("id")&"';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>