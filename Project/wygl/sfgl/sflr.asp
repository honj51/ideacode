<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
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
<SCRIPT src="../js/Department.js" type=text/javascript></SCRIPT>
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
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body style="width:100%">
<%
if request.Form("月份")<>"" then
ny=split(request.Form("月份"),"-")
else
ny=split(date(),"-")
end if
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11%" height="30"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<A onMouseover="return hidestatus()" href="?Operation=lb">收费列表</a>&nbsp;&nbsp;</strong></td>
    <td width="89%" height="30" align="left" valign="bottom">
	<form id="form1" name="form1" method="post" action="?action=cx" style="margin:0px">
      <table width="473" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="66" align="right">客户姓名：</td>
          <td width="202">
 <input name="客户名称" type="text" id="客户名称"  style="border:1px solid #333333; width:200px; height:20px; " autocomplete="off" />
  </td>
          <td width="43" align="right">月份：</td>
          <td width="73"><label>
		  
<select name="月份" id="月份">
<%
if request.Form("月份")<>"" then
%>
<option value="<%=ny(0)%>-<%=ny(1)%>-01"><%=ny(0)%>-<%=ny(1)%></option>
<%end if%>
<option value="<%=year(now)%>-<%=month(now)%>-01"><%=year(now)%>-<%=month(now)%></option>
<%
  for nn=year(now)-2 to year(now)
      for yy=1 to 12
%>
<option value="<%=nn%>-<%=yy%>-01"><%=nn%>-<%=yy%></option>

<%
next
next
%>
            </select>
          </label></td>
          <td width="57" align="right"><span style="border-bottom:1px solid #00376F;">
            <input name="Submit422" type="submit"  style="border:1px solid #000000; margin-right:3px" value="查询" onClick="fClose()" onmouseover='return hidestatus()'/>
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
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编码</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>客户名称</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属工业园</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属房产</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>
		
		
		<span class="STYLE2">
		<%
			response.Write(""&ny(0)&"-"&ny(1)&"")

		%>
		</span>录入状态</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs00=server.createobject("adodb.recordset")
sql00="select * from user_sf"
rs00.open sql00,conn,3

set rs0=server.createobject("adodb.recordset")

if request.QueryString("action")="cx" then
 if request.Form("客户名称")="" then
sql0="select * from zpgl  where 状态='正常' order by 状态,id desc"
else
sql0="select * from zpgl  where 状态='正常' and 客户名称='"&request.Form("客户名称")&"' order by 状态,id desc"
end if
else
sql0="select * from zpgl  where 状态='正常' order by 状态,id desc"
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
        <td height="93" colspan="12" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有信息</td>
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
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
set rs000=server.createobject("adodb.recordset")
if request.QueryString("action")="cx" then
   if request.Form("客户名称")<>"" and  request.Form("月份")=""then
		sql000="select * from user_sf_lb where 合同id='"&rs0("id")&"' and 录入状态='已录入' and 客户名称='"&request.Form("客户名称")&"' and 月份='"&ny(0)&"-"&ny(1)&"-01'"
    elseif  request.Form("客户名称")="" and request.Form("月份")<>"" then
   		sql000="select * from user_sf_lb where 合同id='"&rs0("id")&"' and 录入状态='已录入'  and 月份='"&ny(0)&"-"&ny(1)&"-01'"
	elseif request.Form("客户名称")<>"" and request.Form("月份")<>"" then
			sql000="select * from user_sf_lb where 合同id='"&rs0("id")&"' and 录入状态='已录入' and 客户名称='"&request.Form("客户名称")&"' and 月份='"&ny(0)&"-"&ny(1)&"-01'"
	elseif request.Form("客户名称")="" and request.Form("月份")="" then
	ny=split(date(),"-")
			sql000="select * from user_sf_lb where 合同id='"&rs0("id")&"' and 录入状态='已录入'  and 月份='"&ny(0)&"-"&ny(1)&"-01'"
	end if
else
sql000="select * from user_sf_lb where 合同id='"&rs0("id")&"' and 录入状态='已录入'  and 月份='"&ny(0)&"-"&ny(1)&"-01'"
end if
		
rs000.open sql000,conn,3
if rs000.recordcount=0 then
response.Write("<span style='color:#FF0000'>未录入</samp>")

else
response.Write("已录入")
end if
%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><a href="?Operation=xg&id=<%=rs0("id")%>&yf=<%=request.Form("月份")%>">查看详情</a></td>
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
%>

<%
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from zpgl where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3

if request.QueryString("yf")<>"" then
ny=split(request.QueryString("yf"),"-")
else
ny=split(date(),"-")
end if
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30"   width="11%" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">编码：</td>
          <td height="30" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;">  
		<input name="编码" type="text" id="编码"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("编码")%>" autocomplete="off"  readonly="true"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">客户名称：</td>
          <td height="30" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <input name="客户名称" type="text" id="客户名称"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("客户名称")%>" autocomplete="off" readonly="true"/>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">所属工业园：</td>
          <td width="22%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="所属工业园" type="text" id="所属工业园"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("所属工业园")%>" autocomplete="off" readonly="true"/></td>
          <td width="9%" align="right" valign="middle"style="border-bottom:1px solid #00376F;">房产编号：</td>
          <td width="22%" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="所属房产" type="text" id="所属房产"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("所属房产")%>" autocomplete="off" readonly="true"/></td>
          <td width="11%" align="right" valign="middle"style="border-bottom:1px solid #00376F;">房产类型：</td>
          <td width="25%" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  
		  <%
set rs0002=server.createobject("adodb.recordset")
sql0002="select * from gyy_fc_lb  where 工业园名称='"&rs1("所属工业园")&"' and 房号='"&rs1("所属房产")&"'"
rs0002.open sql0002,conn,3
response.Write(""&rs0002("房产类型")&"")
		  %>
		  </td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">月份：</td>
          <td height="30" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>	
<input name="月份" type="text" id="月份"  style="border:0px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=ny(0)%>-<%=ny(1)%>" autocomplete="off" readonly="true"/>



            </select>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="top"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><br />
            费用处理：</td>
          <td height="100" colspan="6" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  <table width="100%"  style="border:1px solid  #00376F; margin:5px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="35" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td width="102" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>收费项目</strong></td>
        <td width="52" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>收费标准</strong></td>
        <td width="72" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>损耗</strong></td>
        <td width="52" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>类型</strong></td>
        <td width="101" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>收费说明</strong></td>
        <td width="134" align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>上个月读数</strong></td>
        <td width="197" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>本月读数</strong></td>
      </tr>
<%
set rs01=server.createobject("adodb.recordset")
sql01="select * from user_sf  where 所属工业园='"&rs1("所属工业园")&"' and  项目类型='"&rs0002("房产类型")&"' order by id desc"
rs01.open sql01,conn,3
rs01.pagesize=10
if request("page")<>"" then
  epage=cint(request("page"))
   if epage<1 then epage=1
   if epage>rs01.pagecount then epage=rs01.pagecount
else
epage=1
end if
if rs01.recordcount=0 then
%>
      <tr>
        <td height="93" colspan="17" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有项目</td>
        </tr>
<%
end if
for i=1 to rs01.recordcount
if rs01.bof or rs01.eof then exit for
%>
      <tr>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="收费项目<%=i%>" type="text" id="收费项目<%=i%>"  style="border:0px solid #333333; width:100px; height:20px " value="<%=rs01("收费项目")%>" autocomplete="off" readonly="true"/></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<input name="收费标准<%=i%>" type="text" id="收费标准<%=i%>"  style="border:0px solid #333333; width:50px; height:100%" value="<%=FormatNumber(rs01("收费标准"),2,-1)%>" autocomplete="off" readonly="true"/></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		  <label>
<%
set rs011=server.createobject("adodb.recordset")
sql011="select * from user_sf_lb  where 合同id='"&rs1("id")&"' and 收费项目='"&rs01("收费项目")&"' and 月份='"&ny(0)&"-"&ny(1)&"-01'"
rs011.open sql011,conn,3
if rs01("类型")="动态" then
%>	
		  <select name="损耗<%=i%>" id="损耗<%=i%>">
		  <%if not rs011.bof and not rs011.eof  then%>
		  <option value="<%=(rs011("损耗")%>"><%=rs011("损耗")%>%</option>
		  <%else%>
            <option value="<%=(rs01("损耗")%>"><%=rs01("损耗")%>%</option>
		<%end if%>
            <%for k=0 to 15%>
            <option value="<%=k/100%>"><%=k%>%</option>
            <%next%>
          </select>
<%
else
response.Write("—")
end if
		  %>
		  </label></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="类型<%=i%>" type="text" id="类型<%=i%>"  style="border:0px solid #333333; width:50px; height:20px " value="<%=rs01("类型")%>" autocomplete="off" readonly="true"/></td>
        <td  align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><input name="收费说明<%=i%>" type="text" id="收费说明<%=i%>"  style="border:0px solid #333333; width:150px; height:20px " value="<%=rs01("收费说明")%>" autocomplete="off" readonly="true"/></td>
        <td align="center" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
set rs0110=server.createobject("adodb.recordset")
sql0110="select * from user_sf_lb  where 合同id='"&rs1("id")&"' and 收费项目='"&rs01("收费项目")&"' and 月份<'"&ny(0)&"-"&ny(1)&"-01'"
rs0110.open sql0110,conn,3
if rs0110.recordcount=0 then
response.Write("无")
else
 if rs0110("类型")="动态" then
 response.Write(""&rs0110("本月读数")&"")
 else
 response.Write("—")
 end if
 end if
%>
</td>
        <td  height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">

<% if rs01("类型")<>"固定" then%>
<input name="本月读数<%=i%>" type="text" id="本月读数<%=i%>"  style="border:0px solid #333333; width:100%; height:20px " value="<%=rs011("本月读数")%>" autocomplete="off"/>
<%else
response.Write("—")
end if
%>
</td>
      </tr>
<%
rs01.movenext()
next
%>
    </table>		  </td>
        </tr>

        <tr>
          <td height="30" colspan="8" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onmouseover='return hidestatus()'/>
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

if action="xg" then
if request.Form("月份")<>"" then
ny=split(request.Form("月份"),"-")
else
ny=split(date(),"-")
end if
FOR i=1 to 4
suiji=suijishu()
suiji1=suiji1&suiji
next
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from user_sf_lb where 合同id='"&request.QueryString("id")&"' and 月份='"&ny(0)&"-"&ny(1)&"-01'",conn,1
rs2.close
set rs2=nothing

set rs61=server.createobject("adodb.recordset")
sql61="select * from user_sf "
rs61.open sql61,conn,1,3
for j=1 to rs61.recordcount-1
   if rs61.bof or rs61.eof then exit for

set rs6=server.createobject("adodb.recordset")
sql6="select * from user_sf_lb "
rs6.open sql6,conn,1,3
rs6.addnew
rs6("收费项目")=request.Form("收费项目"&j&"")
rs6("收费标准")=request.Form("收费标准"&j&"")

if request.Form("类型"&j&"")="动态" then
rs6("损耗")=request.Form("损耗"&j&"")
else
rs6("损耗")=0
end if

rs6("收费说明")=request.Form("收费说明"&j&"")

if request.Form("类型"&j&"")="固定" then
rs6("本月读数")="0"
else
rs6("本月读数")=request.Form("本月读数"&j&"")
end if
rs6("单据编号")="sj"&year(now)&""&month(now)&""&day(now)&""&hour(now)&""&minute(now)&""&second(now)&""&suiji1&""
rs6("月份")=""&request.Form("月份")&"-01"
rs6("类型")=request.Form("类型"&j&"")
rs6("合同id")=request.QueryString("id")
rs6("录入状态")="已录入"

set rs611=server.createobject("adodb.recordset")
sql611="select * from user_sf_lb  where 合同id='"&request.QueryString("id")&"' and 收费项目='"&request.Form("收费项目"&j&"")&"' and 月份='"&ny(0)&"-"&ny(1)&"-01'"
rs611.open sql611,conn,1,3
if rs611("本月读数")="" or rs611.recordcount=0 then
byds=0 
else
byds=rs611("本月读数")
end if

if request.Form("类型"&j&"")="固定" then
rs6("应收取金额")=request.Form("收费标准"&j&"")
elseif request.Form("类型"&j&"")="动态" then
rs6("应收取金额")=(request.Form("本月读数"&j&"")-byds)*(request.Form("收费标准"&j&""))*(1-(-request.Form("损耗"&j&"")))
elseif request.Form("类型"&j&"")="单价" then
rs6("应收取金额")=request.Form("收费标准"&j&"")*request.Form("本月读数"&j&"")
end if

rs6.update
rs61.movenext()
next
response.write"<script>alert('修改成功');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
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