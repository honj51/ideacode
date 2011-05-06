<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
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
-->
</style>
</head>

<body style="width:100%">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">项目列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=tj">添加项目</a></strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属工业园</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>项目类型</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>收费项目</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>收费标准</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>损耗</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>类型</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>收费说明</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
sql0="select * from user_sf  order by 所属工业园,项目类型 desc"
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
        <td height="93" colspan="18" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有项目</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="57" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("所属工业园")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("项目类型")%></td>
        <td width="233" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("收费项目")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=FormatNumber(rs0("收费标准"),2,-1)%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=FormatNumber(rs0("损耗")*100,2,-1)%>%</td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("类型")%></td>
        <td width="255" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("收费说明")%></td>
        <td width="131" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><a href="?Operation=xg&amp;id=<%=rs0("id")%>">编辑</a>&nbsp;&nbsp;<a href="?action=sc&amp;id=<%=rs0("id")%>">删除</a></td>
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
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">所属工业园：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="所属工业园" id="所属工业园" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
          <option value="请选择">请选择</option>
          <%
set rsjs=server.createobject("adodb.recordset")
sqljs="select * from gyy_lb  order by 序号 asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>
          <option value="<%=rsjs("工业园名称")%>"><%=rsjs("工业园名称")%></option>
          <%
rsjs.movenext()
next
%>
        </select></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">项目类型：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="项目类型" id="项目类型" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
          <option value="请选择">请选择</option>
          <%
set rsjs1=server.createobject("adodb.recordset")
sqljs1="select * from fclx_lb  order by 序号 asc"
rsjs1.open sqljs1,conn,3
for i=0 to rsjs1.recordcount
 if rsjs1.bof or rsjs1.eof then exit for
%>
          <option value="<%=rsjs1("房产类型")%>"><%=rsjs1("房产类型")%></option>
          <%
rsjs1.movenext()
next
%>
        </select></td>
      </tr>
      <tr>
        <td width="14%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">收费项目：</td>
        <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="收费项目" type="text" id="收费项目"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">收费标准：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="收费标准" type="text" id="收费标准"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">损耗：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="损耗" type="text" id="损耗"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>
          %</td>
      </tr>
      <tr></tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">类型：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          &nbsp;
          <input name="类型" type="radio" value="固定" checked="checked" />
          固定
          <input type="radio" name="类型" value="动态" />
        动态
        <input type="radio" name="类型" value="单价" />
        单价</label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">滞纳金：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="滞纳金" type="text" id="滞纳金"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>
%</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">收费说明：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="收费说明" type="text" id="收费说明"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>

      <tr>
        <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit4" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onMouseover='return hidestatus()'/>
            <input name="Submit4" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>        </td>
      </tr>
    </table>
  </form></td>
</tr>
<%end if
if Operation="xg" then
set rs1=server.createobject("adodb.recordset")
sql1="select * from user_sf where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td width="14%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">所属工业园：</td>
          <td width="86%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="所属工业园" id="所属工业园" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
           <option value="<%=rs1("所属工业园")%>"><%=rs1("所属工业园")%></option>
            <%
set rsjs=server.createobject("adodb.recordset")
sqljs="select * from gyy_lb  order by 序号 asc"
rsjs.open sqljs,conn,3
for i=0 to rsjs.recordcount
 if rsjs.bof or rsjs.eof then exit for
%>
            <option value="<%=rsjs("工业园名称")%>"><%=rsjs("工业园名称")%></option>
            <%
rsjs.movenext()
next
%>
          </select></td>
          </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">项目类型：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <select name="项目类型" id="项目类型" style="border:1px solid #333333; width:200px; height:20px; margin-left:3px">
              <option value="<%=rs1("项目类型")%>"><%=rs1("项目类型")%></option>
            <%
set rsjs1=server.createobject("adodb.recordset")
sqljs1="select * from fclx_lb  order by 序号 asc"
rsjs1.open sqljs1,conn,3
for i=0 to rsjs.recordcount
 if rsjs1.bof or rsjs1.eof then exit for
%>
            <option value="<%=rsjs1("房产类型")%>"><%=rsjs1("房产类型")%></option>
            <%
rsjs1.movenext()
next
%>
          </select>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">收费项目：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="收费项目" type="text" id="收费项目"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("收费项目")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">收费标准：:</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="收费标准" type="text" id="收费标准"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=FormatNumber(rs1("收费标准"),2,-1)%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">损耗：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
		  <input name="损耗" type="text" id="损耗"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("损耗")%>" autocomplete="off"/>
            %</td>
        </tr>
        <tr></tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">类型：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">&nbsp;
<%if rs1("类型")="固定" then%>
<input name="类型" type="radio" value="固定" checked="checked" />固定
<input type="radio" name="类型" value="动态" />动态
<input type="radio" name="类型" value="单价" />单价
<%elseif rs1("类型")="动态" then%>
<input name="类型" type="radio" value="固定" />固定
<input type="radio" name="类型" value="动态" checked="checked" />动态
<input type="radio" name="类型" value="单价" />单价
<%elseif rs1("类型")="单价" then%>
<input name="类型" type="radio" value="固定" />固定
<input type="radio" name="类型" value="动态"  />动态
<input type="radio" name="类型" value="单价"checked="checked" />单价
<%end if%></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">滞纳金：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="滞纳金" type="text" id="滞纳金"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("滞纳金")%>" autocomplete="off"/>
%</td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">收费说明：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="收费说明" type="text" id="收费说明"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("收费说明")%>" autocomplete="off"/></td>
        </tr>

        <tr>
          <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onmouseover='return hidestatus()'/>
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
sql="select * from user_sf where 收费项目='"&request.Form("收费项目")&"' and 所属工业园='"&request.Form("所属工业园")&"' and 项目类型='"&request.Form("项目类型")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("所属工业园")=request.Form("所属工业园")
rs("项目类型")=request.Form("项目类型")
rs("收费项目")=request.Form("收费项目")
rs("收费标准")=request.Form("收费标准")
rs("收费说明")=request.Form("收费说明")
rs("损耗")=request.Form("损耗")/100
rs("类型")=request.Form("类型")
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

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from user_sf where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("所属工业园")=request.Form("所属工业园")
rs6("项目类型")=request.Form("项目类型")
rs6("收费项目")=request.Form("收费项目")
rs6("收费标准")=request.Form("收费标准")
rs6("收费说明")=request.Form("收费说明")
rs6("损耗")=request.Form("损耗")/100
rs6("类型")=request.Form("类型")
rs6.update
response.write"<script>alert('修改成功');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from user_sf where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('删除成功');location.href='?';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>