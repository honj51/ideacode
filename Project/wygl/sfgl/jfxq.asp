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


set rs00125=server.createobject("adodb.recordset")
sql00125="select * from user_sf_zb where 单据编号='"&rs1("编码")&"_"&request.QueryString("xh")&"'"
rs00125.open sql00125,conn,1,3
%>
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
.STYLE2 {
	font-size: 18pt;
	font-weight: bold;
}
.STYLE3 {font-size: 16px}
-->
</style>
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
<DIV align="center" id="dayinDiv1" name="dayinDiv1">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="sjlr.asp?Operation=lb&page=<%=request.QueryString("page")%>">缴费列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle"><form id="form3" name="form3" method="post" action="sjlr.asp" style="margin:0px">
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
</table>
</div>
<DIV align=center>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000"><span class="STYLE2"><span class="STYLE3">深圳市兴联兴投资有限公司&nbsp;<%=rs1("所属工业园")%>&nbsp;收款收据&nbsp;（<%=request.QueryString("ny")%>/<%=request.QueryString("yy")%>）</span>&nbsp;</span></td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;合同编号：<a href="jf_xq.asp?id=<%=request.QueryString("id")%>&page=<%=request.QueryString("page")%>"><%=rs1("编码")%></a>&nbsp;&nbsp;工业园名称：<%=rs1("所属工业园")%>&nbsp;&nbsp;房产类型：<%=rs1("房产类型")%>&nbsp;&nbsp;所属房产：<%=rs1("所属房产")%>&nbsp;</td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;用户名称：<%=rs1("客户名称")%>&nbsp;&nbsp;用户编码：<%=rs1("客户编码")%> &nbsp;<%=request.QueryString("ny")%>/<%=request.QueryString("yy")%></td>
        </tr>
</table>
      <table width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #000000;">
        <tr>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>编号</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>消费项目</strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>上月读数</strong></strong></td>
          <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>本月读数</strong></strong></td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>倍率</strong></td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>损耗</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>总量</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>值</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong><strong>滞纳金</strong></strong></strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>费用</strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #000000; "><strong>说明</strong></td>
        </tr>
        <%
if rs0.recordcount=0 then
%>
        <tr>
          <td height="93" colspan="20" align="center" valign="middle" style="border-bottom:1px solid #000000; ">没有项目</td>
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
          <td width="42" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%=i%></td>
          <td width="183" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
            &nbsp;<%=rs0("消费项目")%></td>
          <td width="83" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
&nbsp;
<%
set rs0012=server.createobject("adodb.recordset")
sql0012="select * from user_sf_lb where 单据编号='"&rs1("编码")&"_"&request.QueryString("xh")-1&"' and 收费项目='"&rs0("消费项目")&"'"
rs0012.open sql0012,conn,1,3
if rs0012.recordcount=0 then
response.Write("-")
else
if rs0("消费类型")="动态" then
response.Write(""&rs0012("读数")&"")
else
response.Write("-")
end if
end if
%></td>
          <td width="80" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
            &nbsp;
            <%if rs0("消费类型")="动态" or   rs0("消费类型")="单价" then%>
            <%=rs1011("读数")%>
          <%else
response.Write("-")
end if
%></td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
&nbsp;<%=rs1011("倍率")%>			  
		  </td>
          <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">&nbsp;
            <%if rs0("消费类型")="动态" then%>
            <%=rs1011("损耗")%>%
          <%

else
response.Write("-")
end if
%></td><td width="70" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">
&nbsp;
<%
if rs1011("倍率")=0 then
if rs0("消费类型")="动态" then
response.Write(""&(rs1011("读数")-rs0012("读数"))*(1-(-rs1011("损耗")/100))&"")
elseif rs0("消费类型")="单价" then
response.Write(""&FormatNumber(rs1011("读数"),2,-1)&"")
else
response.Write("-")
end if
else
if rs0("消费类型")="动态" then
response.Write(""&(rs1011("读数")-rs0012("读数"))*(1-(-rs1011("损耗")/100))*rs1011("倍率")&"")
elseif rs0("消费类型")="单价" then
response.Write(""&FormatNumber(rs1011("读数"),2,-1)*rs1011("倍率")&"")
else
response.Write("-")
end if
end if
%>		  </td>
          <td width="44" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">&nbsp;<%=FormatNumber(rs1011("值"),2,-1)%></td>
          <td width="70" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">&nbsp;<%=rs1011("滞纳金")%>%</td>
          <td width="85" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000">&nbsp;<%=FormatNumber(rs1011("费用"),2,-1)%></td>
          <td width="200" align="center" valign="middle" style="border-bottom:1px solid #000000; ">&nbsp;<%=rs0("说明")%></td>
        </tr>
        <%
rs0.movenext()
next

%>

        <tr>
          <td height="40" colspan="12" align="left" valign="middle" style="border-bottom:1px solid #000000">&nbsp;&nbsp;
		  总金额：￥<%=rs00125("总费用")%>&nbsp;&nbsp;
		  上次结余：￥<%=rs00125("余额")%>&nbsp;&nbsp;
		  需要交费金额：￥<%=rs00125("总费用")-rs00125("余额")%>&nbsp;&nbsp;
		  实收金额：￥<%=rs00125("缴费金额")%>&nbsp;&nbsp;
		  本次结余：￥<%=rs00125("缴费金额")-rs00125("总费用")-rs00125("余额")%>          </td>
        </tr>
</table>
	  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="right" valign="middle">开票人：<%=session("admin_name")%>&nbsp;&nbsp;开票时间：<%=date()%>&nbsp;&nbsp;</td>
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
conn.close
set conn=nothing
%>

