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
.STYLE1 {
	font-size: 10pt;
	font-weight: bold;
}
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
.STYLE2 {font-size: 16}
.STYLE3 {	font-size: 18px;
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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="fltj.asp?Operation=lb">总费用统计列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="fltj_xx.asp?Operation=lb">详细费用用统计列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
  <tr>
    <td height="30" colspan="2">
	<form id="form3" name="form3" method="post" action="fltj.asp" style="margin:0px">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="41" align="right" valign="middle">名称：</td>
          <td width="105">
            <input name="客户名称" type="text" id="客户名称"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off"  />     </td>
          <td width="53" align="right">工业园：</td>
          <td width="78">	  
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
          <td width="30" align="right">&nbsp;年：</td>
          <td width="59">
		  <select name="n" id="n">
		  		  <option value="请选择">请选择</option>
		  <%for nn=year(now)-5 to year(now)%>
            <option value="<%=nn%>"><%=nn%></option>
		<%next%>
          </select></td>
          <td width="28" align="right">月：</td>
          <td width="41"><label>
            <select name="y" id="y">
		  		  <option value="请选择">请选择</option>
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
    </td>
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
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编码</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>客户名称</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属工业园</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属房产</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>合同开始时间</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>合同结束时间</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>月份</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>费用</strong></td>
  </tr>
<%
if request.QueryString("khmc")="" and request.Form("客户名称")="" then
khmc=""
elseif  request.QueryString("khmc")<>"" and request.Form("客户名称")="" then
khmc=request.QueryString("khmc")
elseif  request.QueryString("khmc")="" and request.Form("客户名称")<>"" then
khmc=request.Form("客户名称")
end if

if request.QueryString("gyy")="" and request.Form("fh")="请选择" then
gyy=""
elseif  request.QueryString("gyy")<>"" and request.Form("fh")="请选择" then
gyy=request.QueryString("gyy")
elseif  request.QueryString("gyy")<>"" and request.Form("fh")="" then
gyy=request.QueryString("gyy")
elseif  request.QueryString("gyy")="" and request.Form("fh")<>"请选择" then
gyy=request.Form("fh")

end if

if request.QueryString("fclx")="" and request.Form("ch")="请选择" then
fclx=""
elseif  request.QueryString("fclx")<>"" and request.Form("ch")="请选择" then
fclx=request.QueryString("fclx")
elseif  request.QueryString("fclx")<>"" and request.Form("ch")="" then
fclx=request.QueryString("fclx")
elseif  request.QueryString("fclx")="" and request.Form("ch")<>"请选择" then
fclx=request.Form("ch")
end if

if request.QueryString("ssfc")="" and request.Form("所属房产")="" then
ssfc=""
elseif  request.QueryString("ssfc")<>"" and request.Form("所属房产")="" then
ssfc=request.QueryString("ssfc")
elseif  request.QueryString("ssfc")="" and request.Form("所属房产")<>"" then
ssfc=request.Form("所属房产")
end if

if request.Form("n")="请选择" and  request.Form("y")="请选择" then
sql00="select * from  user_sf_zb where  缴费状态='已缴费'"
else
if request.Form("n")="" and request.QueryString("n")="" and  request.Form("y")="" and request.QueryString("y")="" then
sql00="select * from  user_sf_zb where  缴费状态='已缴费'"
elseif request.Form("n")<>"" and  request.Form("y")="请选择"then
sql00="select * from  user_sf_zb where 日期年='"&request.Form("n")&"' and 缴费状态='已缴费'"
elseif request.Form("n")="请选择" and  request.Form("y")<>""then
sql00="select * from  user_sf_zb where 日期月='"&request.Form("y")&"' and 缴费状态='已缴费'"
elseif request.QueryString("n")="" and  request.QueryString("y")<>""then
sql00="select * from  user_sf_zb where 日期月='"&request.QueryString("y")&"' and 缴费状态='已缴费'"
elseif request.QueryString("n")<>"" and  request.QueryString("y")=""then
sql00="select * from  user_sf_zb where 日期年='"&request.QueryString("n")&"' and 缴费状态='已缴费'"
elseif request.QueryString("n")<>"" and  request.QueryString("y")<>""then
sql00="select * from  user_sf_zb where 日期年='"&request.QueryString("n")&"'and  日期月='"&request.QueryString("y")&"'and  缴费状态='已缴费'"
elseif request.Form("n")<>"请选择" and  request.Form("y")<>"请选择"then
sql00="select * from  user_sf_zb where 日期年='"&request.Form("n")&"'and  日期月='"&request.Form("y")&"'and  缴费状态='已缴费'"
end if
end if

if request.Form("y")="请选择"  then
y=rs00("日期月")
else
if request.Form("y")="" and request.QueryString("y")="" then
y=rs00("日期月")
elseif request.Form("y")<>"" then
y=request.Form("y")
elseif request.QueryString("y")<>"" then
y=request.QueryString("y")
end if
end if

sql00="select * from  user_sf_zb where  缴费状态='已缴费'"

set rs00=server.createobject("adodb.recordset")
rs00.open sql00,conn,3
rs00.pagesize=1
if rs00.recordcount=0 then

%>
      <tr>
        <td height="100" colspan="14" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有数据</td>
  </tr>
<%
end if
for i=1 to rs00.recordcount
if rs00.bof or rs00.eof then exit for

if request.Form("n")="请选择" then
n=rs00("日期年")
else
if request.Form("n")="" and request.QueryString("n")="" then
n=rs00("日期年")
elseif request.Form("n")<>"" then
n=request.Form("n")
elseif request.QueryString("n")<>"" then
n=request.QueryString("n")
end if
end if

if request.Form("y")="请选择"  then
y=rs00("日期月")
else
if request.Form("y")="" and request.QueryString("y")="" then
y=rs00("日期月")
elseif request.Form("y")<>"" then
y=request.Form("y")
elseif request.QueryString("y")<>"" then
y=request.QueryString("y")
end if
end if

set rs0=server.createobject("adodb.recordset")
if khmc="" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl where  合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where 所属工业园='"&gyy&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 房产类型='"&fclx&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where 所属房产='"&ssfc&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  房产类型='"&fclx&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属房产='"&ssfc&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"

elseif khmc="" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 所属工业园='"&gyy&"' and  房产类型='"&fclx&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where 所属工业园='"&gyy&"' and  所属房产='"&ssfc&"'and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"

elseif khmc="" and gyy="" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where 房产类型='"&fclx&"' and  所属房产='"&ssfc&"' and 合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' and 房产类型='"&fclx&"'合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' and  所属房产='"&ssfc&"'合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' and  房产类型='"&fclx&"' and 所属房产='"&ssfc&"'合同结束时间>'"&date()&"' and 合同开始时间<'"&date()&"' and 编码='"&rs00("合同编号")&"' order by 合同结束时间-"&date()&" asc"
end if
rs0.open sql0,conn,3
if rs0.recordcount<>0 then

if rs0("合同开始时间_年")=""&n&"" then
  if rs0("合同开始时间_月")>""&y&"" then
	zt=0
	else
	zt=1
	end if
elseif 	rs0("合同结束时间_年")=""&n&"" then
	if rs0("合同结束时间_月")<""&y&"" then
	zt=0
	else
	zt=1
	end if
elseif rs0("合同开始时间_年")<""&n&"" and  rs0("合同结束时间_年")>""&n&"" then
zt=1
end if
if zt=1 then

sql222="select * from  user_sf_zb where 合同编号='"&rs00("合同编号")&"' and 日期年='"&n&"' and 日期月='"&y&"' and 缴费状态='已缴费'"
set rs2222=server.createobject("adodb.recordset")
rs2222.open sql222,conn,1,1
if rs2222.recordcount<>0 then
sxh=sxh+1
%>
      <tr>
        <td width="33" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=sxh%></td>
        <td width="152" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("编码")%></td>
        <td width="71" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("客户名称")%></td>
        <td width="82" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("所属工业园")%></td>
        <td width="85" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("房产类型")%>-<%=rs0("所属房产")%></td>
        <td width="88" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("合同开始时间")%></td>
        <td width="93" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<% 
		if rs0("合同结束时间")<>"" then 
			  response.Write(""&rs0("合同结束时间")&"")
		else
		      response.Write("未签订合同")
		end if
		%>		</td>
        <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<%=n%>/<%=y%></td>
        <td width="64" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F ">
<%
response.Write(""&rs2222("总费用")&"")
zfy=zfy-(-rs2222("总费用"))
%>	</td>
  </tr>
<%
end if
end if
end if
rs00.movenext()
next
%>

      <tr>
        <td height="25" colspan="8" align="left" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;总计：</td>
        <td width="64" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F ">
<%
response.Write(""&zfy&"")
%>	</td>
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