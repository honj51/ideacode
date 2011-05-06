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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="jf.asp?Operation=lb&page=<%=request.QueryString("page")%>">缴费列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
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
            <input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="搜索" onClick="fClose()" onmouseover='return hidestatus()'/>
            1</td>
        </tr>
      </table>
      </form>  
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;合同编号：<a href="jf_xq.asp?id=<%=request.QueryString("id")%>&page=<%=request.QueryString("page")%>"><%=rs1("编码")%></a><br />      
      &nbsp;&nbsp;&nbsp;工业园名称：<%=rs1("所属工业园")%>&nbsp;&nbsp;房产类型：<%=rs1("房产类型")%>&nbsp;&nbsp;所属房产：<%=rs1("所属房产")%>&nbsp;&nbsp;用户名称：<%=rs1("客户名称")%>&nbsp;&nbsp;用户编码：<%=rs1("客户编码")%>
  &nbsp;<%=request.QueryString("ny")%>/<%=request.QueryString("yy")%>
  <tr>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	
	
	<form id="form1" name="form1" method="post" action="?action=tj&Operation=tj&id=<%=request.QueryString("id")%>&xh=<%=request.QueryString("xh")%>&uid=<%=rs00125("id")%>&page=<%=request.QueryString("page")%>" style="margin:opx" onSubmit="return  denglu()">
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
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong><strong>费用</strong></strong></td>
          <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>说明</strong></td>
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
          <td width="43" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
          <td width="182" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            &nbsp;<%=rs1011("收费项目")%></td>
          <td width="63" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
            &nbsp;<%=rs1011("收费类型")%></td>
          <td width="63" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;&nbsp;<%=FormatNumber(rs1011("值"),2,-1)%></td>
          <td width="60" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;<%=rs1011("倍率")%>		  
		  </td>
          <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;
<%if rs1011("收费类型")="动态" then%>
<%=rs1011("损耗")%>%		  
<%

else
response.Write("-")
end if
%>			</td>
          <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;<%=rs1011("滞纳金")%>%</td>
          <td width="91" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		  
&nbsp;
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
          <td width="91" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
&nbsp;
<%if rs0("消费类型")="动态" or   rs0("消费类型")="单价" then%>
<%=rs1011("读数")%>
<%else
response.Write("-")
end if
%>		  </td>
          <td width="71" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		 &nbsp;<%=FormatNumber(rs1011("费用"),2,-1)%></td>
          <td width="200" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;<%=rs0("说明")%></td>
          </tr>
        <%
rs0.movenext()
next

%>
        <tr>
          <td height="40" colspan="12" align="left" valign="middle" style="border-bottom:1px solid #00376F">&nbsp;&nbsp;总金额：￥&nbsp;<%=FormatNumber(rs00125("总费用"),2,-1)%>
            <input name="总费用" type="text" id="总费用"  style=" display:none" value="<%=rs00125("总费用")%>"  autocomplete="off"  readonly="true" />            &nbsp;&nbsp;
			上次结余：￥<%=FormatNumber(rs00125("余额"),2,-1)%>&nbsp;&nbsp;&nbsp;需要交费金额：￥<%=FormatNumber(rs00125("总费用")-rs00125("余额"),2,-1)%>
            <input name="余额" type="text" id="余额"  style=" display:none" value="<%=rs00125("余额")%>"  autocomplete="off"  readonly="true" />
			实收金额：&nbsp;
            <input name="缴费金额" type="text" id="缴费金额"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off" /></td>
        </tr>
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
if request.Form("缴费金额")-(request.Form("总费用")-request.Form("余额"))<0 then
response.write"<script>alert('缴费金额不对');history.go(-1);</script>"
else
set rs22011=server.createobject("adodb.recordset")
sql22011="select * from user_sf_zb where id='"&request.QueryString("uid")&"'"
rs22011.open sql22011,conn,1,3
rs22011("缴费金额")=request.Form("缴费金额")
rs22011("余额")=request.Form("缴费金额")-(request.Form("总费用")-request.Form("余额"))
rs22011("缴费状态")="已缴费"
rs22011.update
response.write"<script>alert('缴费成功');location.href='jfxq.asp?id="&request.QueryString("id")&"&ny="&rs22011("日期年")&"&yy="&rs22011("日期月")&"&xh="&request.QueryString("xh")&"&page="&request.QueryString("page")&"';</script>"
rs22011.close
set rs2201=nothing
end if
end if
%>
<%
conn.close
set conn=nothing
%>