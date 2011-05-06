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
<SCRIPT src="../js/zpht.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/zpht2.js" type=text/javascript></SCRIPT>
<script language="JavaScript">
function printpr()   //预览函数
{
document.all("qingkongyema").click();//打印之前去掉页眉，页脚
document.all("dayinDiv").style.display="none"; //打印之前先隐藏不想打印输出的元素（此例中隐藏“打印”和“打印预览”两个按钮）
document.all("dayinDiv1").style.display="none"; //打印之前先隐藏不想打印输出的元素（此例中隐藏“打印”和“打印预览”两个按钮）
var OLECMDID = 7;
var PROMPT = 1; 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
WebBrowser1.ExecWB(OLECMDID, PROMPT);
WebBrowser1.outerHTML = "";
document.all("dayinDiv").style.display="";//打印之后将该元素显示出来（显示出“打印”和“打印预览”两个按钮，方便别人下次打印）
document.all("dayinDiv1").style.display="";//打印之后将该元素显示出来（显示出“打印”和“打印预览”两个按钮，方便别人下次打印）
}
function printTure()   //打印函数
{
    document.all('qingkongyema').click();//同上
    document.all("dayinDiv").style.display="none";//同上
	 document.all("dayinDiv1").style.display="none";//同上
    window.print();
    document.all("dayinDiv").style.display="";
	document.all("dayinDiv1").style.display="";
}
function doPage()
{
    layLoading.style.display = "none";//同上
}
</SCRIPT>


<script language="VBScript">
dim hkey_root,hkey_path,hkey_key
hkey_root="HKEY_CURRENT_USER"
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup"

function pagesetup_null()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
end function

function pagesetup_default()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P"
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"
end function
</script>
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
.STYLE2 {font-size: 16}
.STYLE3 {
	font-size: 18px;
	font-weight: bold;
}
.STYLE5 {font-size: 18px; }
-->
</style>
</head>

<body style="width:100%">
<DIV align="center" id="dayinDiv1" name="dayinDiv1">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">费用统计列表</a>&nbsp;</strong></td>
  </tr>
  <tr>
    <td height="30">
	<form id="form3" name="form3" method="post" action="zbxxtj.asp" style="margin:0px">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="119" align="right">工业园名称：</td>
          <td width="78">	  
            <select name="工业园名称" size="1" id="工业园名称" onChange="makech1(options.selectedIndex)">
              <option  value=""></option>
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
          <td width="70" align="right">房产类型：</td>
          <td width="78"><select name="房产类型" id="房产类型">
            <option  value=""></option>
<%   
sql10="select distinct 房产类型  from  gyy_lb_fclx_lb_xflx"
set rs210=server.createobject("adodb.recordset")
rs210.open sql10,conn,1,1
rs210.pagesize=1
for dd=1 to rs210.pagecount
   if rs210.bof or rs210.eof then exit for
%>
              <option  value="<%=rs210("房产类型")%>"><%=rs210("房产类型")%></option>
              <%
rs210.movenext
next
%>
          </select></td>
          <td width="66" align="right">消费项目：</td>
          <td width="78" align="right">
<select name="消费项目" id="消费项目">
            <option  value=""></option>
            <%   
sql100="select distinct 消费项目  from  gyy_lb_fclx_lb_xflx"
set rs2100=server.createobject("adodb.recordset")
rs2100.open sql100,conn,1,1
rs2100.pagesize=1
for ddd=1 to rs2100.pagecount
   if rs2100.bof or rs2100.eof then exit for
%>
            <option  value="<%=rs2100("消费项目")%>"><%=rs2100("消费项目")%></option>
            <%
rs2100.movenext
next
%>
          </select></td>
          <td width="34" align="right">&nbsp;年：</td>
          <td width="78">
		  <select name="年" id="年">
		  		  <option value=""></option>
		  <%for nn=year(now)-5 to year(now)%>
            <option value="<%=nn%>"><%=nn%></option>
		<%next%>
          </select></td>
          <td width="33" align="right">月：</td>
          <td width="78"><label>
            <select name="月" id="月">
		  		  <option value=""></option>
			<%for yy=1 to 12%>
              <option value="<%=yy%>"><%=yy%></option>
			  <%next%>
            </select>
          </label></td>
          <td width="76" align="center" valign="middle">
            <input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="搜索" onClick="fClose()" onmouseover='return hidestatus()'/></td>
        </tr>
      </table>
      </form>    </td>
  </tr>


</table>
</DIV>
<%if Operation="lb" or Operation="" then%>
<DIV align=center>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000"><span class="STYLE2"><span class="STYLE3 STYLE2"><span class="STYLE5">深圳市兴联兴投资有限公司&nbsp;</span></span></span></td>
        </tr>
        <tr></tr>
</table>
<table width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #00376F; margin-top:10px">
      <tr>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>序号</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>工业园名称</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>房产类型</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>消费项目</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>月份</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>费用</strong></td>
  </tr>
<%
if request.Form("工业园名称")="" and request.Form("房产类型")=""and request.Form("消费项目")=""then
sql0="select distinct  工业园名称  from  gyy_lb_fclx_lb_xflx"
elseif request.Form("工业园名称")<>"" and request.Form("房产类型")=""and request.Form("消费项目")=""  then
sql0="select distinct 工业园名称 from  gyy_lb_fclx_lb_xflx where 工业园名称='"&request.Form("工业园名称")&"'"
elseif request.Form("工业园名称")="" and request.Form("房产类型")<>""and request.Form("消费项目")="" then
sql0="select distinct 工业园名称,房产类型 from  gyy_lb_fclx_lb_xflx where 房产类型='"&request.Form("房产类型")&"'"
elseif request.Form("工业园名称")="" and request.Form("房产类型")=""and request.Form("消费项目")<>"" then
sql0="select distinct 工业园名称,房产类型,消费项目 from  gyy_lb_fclx_lb_xflx where 消费项目='"&request.Form("消费项目")&"'"

elseif request.Form("工业园名称")<>"" and request.Form("房产类型")<>""and request.Form("消费项目")=""then
sql0="select distinct 工业园名称,房产类型  from  gyy_lb_fclx_lb_xflx where 工业园名称='"&request.Form("工业园名称")&"' and 房产类型='"&request.Form("房产类型")&"'"
elseif request.Form("工业园名称")<>"" and request.Form("房产类型")=""and request.Form("消费项目")<>""then
sql0="select distinct 工业园名称,消费项目 from gyy_lb_fclx_lb_xflx where 工业园名称='"&request.Form("工业园名称")&"'and 消费项目='"&request.Form("消费项目")&"'"
elseif request.Form("工业园名称")="" and request.Form("房产类型")<>""and request.Form("消费项目")<>""then
sql0="select distinct 工业园名称,房产类型,消费项目 from gyy_lb_fclx_lb_xflx where 房产类型='"&request.Form("房产类型")&"' and 消费项目='"&request.Form("消费项目")&"'"

elseif request.Form("工业园名称")<>"" and request.Form("房产类型")<>""and request.Form("消费项目")<>""then
sql0="select distinct 工业园名称,房产类型,消费项目  from  gyy_lb_fclx_lb_xflx where 工业园名称='"&request.Form("工业园名称")&"' and 消费项目='"&request.Form("消费项目")&"'"
end if
set rs0=server.createobject("adodb.recordset")
rs0.open sql0,conn,1,1
rs0.pagesize=1
if rs0.recordcount=0 then
%>
      <tr>
        <td height="100" colspan="15" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有数据</td>
  </tr>
<%
else
for i=1 to rs0.recordcount
   if rs0.bof or rs0.eof then exit for
 fy=0
%>
      <tr>
        <td width="55" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="220" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("工业园名称")%></td>
        <td width="202" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
if request.Form("房产类型")="" and rs0("房产类型")="" then
response.Write("全部")
else
response.Write(""&rs0("房产类型")&"")
end if
%>
</td>
        <td width="146" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
if request.Form("消费项目")="" and  rs0("消费项目")="" then
response.Write("全部")
else
response.Write(""&rs0("消费项目")&"")
end if
%>
</td>
        <td width="146" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
if request.Form("工业园名称")="" and request.Form("房产类型")=""then
sql1="select *  from  zpgl where 所属工业园='"&rs0("工业园名称")&"' and 合同开始时间<'"&date()&"' and 合同结束时间>'"&date()&"'"		
elseif request.Form("工业园名称")<>"" and request.Form("房产类型")=""  then
sql1="select * from  zpgl where 所属工业园='"&rs0("工业园名称")&"' and 合同开始时间<'"&date()&"' and 合同结束时间>'"&date()&"'"	
elseif request.Form("工业园名称")="" and request.Form("房产类型")<>""then
sql1="select * from  zpgl where 房产类型='"&rs0("房产类型")&"'and 合同开始时间<'"&date()&"' and 合同结束时间>'"&date()&"'"	

elseif request.Form("工业园名称")<>"" and request.Form("房产类型")<>""then
sql1="select *  from  zpgl where 所属工业园='"&rs0("工业园名称")&"' and 房产类型='"&rs0("房产类型")&"'and 合同开始时间<'"&date()&"' and 合同结束时间>'"&date()&"'"	
end if

set rs1=server.createobject("adodb.recordset")
rs1.open sql1,conn,1,1
for j=1 to rs1.recordcount
    if rs1.bof or rs1.eof then exit for

if request.Form("消费项目")="" then
	if request.Form("年")="" and  request.Form("月")=""then
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"'"	
	elseif  request.Form("年")<>"" and  request.Form("月")=""then
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"' and 日期年='"&request.Form("年")&"'"
	elseif  request.Form("年")="" and  request.Form("月")<>""then	
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"' and 日期月='"&request.Form("月")&"'"
	elseif  request.Form("年")<>"" and  request.Form("月")<>""then	
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"'and 日期年='"&request.Form("年")&"' and 日期月='"&request.Form("月")&"'"
	end if
elseif request.Form("消费项目")<>"" then
	if request.Form("年")="" and  request.Form("月")=""then
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"' and 收费项目='"&request.Form("消费项目")&"'"	
	elseif  request.Form("年")<>"" and  request.Form("月")=""then
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"' and 日期年='"&request.Form("年")&"'and 收费项目='"&request.Form("消费项目")&"'"	
	elseif  request.Form("年")="" and  request.Form("月")<>""then	
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"' and 日期月='"&request.Form("月")&"'and 收费项目='"&request.Form("消费项目")&"'"	
	elseif  request.Form("年")<>"" and  request.Form("月")<>""then	
	sql112="select *  from  user_sf_lb where 合同编号='"&rs1("编码")&"'and 日期年='"&request.Form("年")&"' and 日期月='"&request.Form("月")&"'and 收费项目='"&request.Form("消费项目")&"'"	
	end if
end if
set rs112=server.createobject("adodb.recordset")
rs112.open sql112,conn,1,1
if rs112.bof or rs112.eof  then exit for
for k=1 to rs112.recordcount 
fy=fy-(-rs112("费用"))
rs112.movenext()
next

rs1.movenext()
next

if request.Form("年")="" then
response.Write("全部/")
else
response.Write(""&request.Form("年")&"/")
end if

if request.Form("月")="" then
response.Write("全部")
else
response.Write(""&request.Form("月")&"")
end if
%>

</td>
        <td width="155" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F ">
<%=fy%>
<%
zfy=zfy-(-fy)
%>
			</td>
  </tr>

<%
rs0.movenext()
next
end if
%>
    <tr>
      <td height="25" colspan="6">&nbsp;&nbsp;共计：<%=zfy%></td>
    </tr> 
</table>
	  <DIV align="center" style="height:30px; vertical-align:middle" id="dayinDiv" name="dayinDiv">
<a href="#" onClick="printTure();">打印</a>
<input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="清空页码" onClick="pagesetup_null()">  
</DIV>	
</DIV>
<% 
rs0.close
set rs0=nothing
end if
%>
</body>
</html>
<%
conn.close
set conn=nothing
%>