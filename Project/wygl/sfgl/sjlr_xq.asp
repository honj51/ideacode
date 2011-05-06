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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="sjlr.asp?Operation=lb&page=<%=request.QueryString("page")%>">录入列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
  </tr>
  <tr>
    <td height="30" colspan="2">
	<form id="form3" name="form3" method="post" action="sjlr.asp" style="margin:0px">
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
    </td>
  </tr>
<%if Operation="lb" or Operation="" then
set rs01=server.createobject("adodb.recordset")
sql01="select * from zpgl where id="&request.QueryString("id")&""
rs01.open sql01,conn,3

set rs011=server.createobject("adodb.recordset")
if left(rs01("客户编码"),3)="zrr" then
sql011="select * from user_zrr where 编码='"&rs01("客户编码")&"'"
elseif left(rs01("客户编码"),2)="gs" then
sql011="select * from user_gs where 编码='"&rs01("客户编码")&"'"
end if
rs011.open sql011,conn,3
%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="681" height="30" align="left" valign="middle" style="border-bottom:1px solid #00376F; ">&nbsp;&nbsp;
		  <strong>合同编码：</strong><a href="?id=<%=request.QueryString("id")%>&page=<%=request.QueryString("page")%>"><%=rs01("编码")%></a>&nbsp;&nbsp;
		  <strong>客户编号：</strong><%=rs01("客户编码")%>&nbsp;&nbsp;<strong>
		客户名称：</strong><%=rs01("客户名称")%> </td>
      </tr>
      <tr>
        <td height="30" align="left" valign="middle" style="border-bottom:1px solid #00376F; ">&nbsp;&nbsp;
		  <strong>联系电话：</strong><%=rs011("联系电话")%>&nbsp;&nbsp;
		  <strong>联系地址：</strong><%=rs011("联系地址")%><%=rs011("办公地址")%></td>
      </tr>
      <tr>
        <td height="30" align="left" valign="middle" >&nbsp;&nbsp;
		  <strong>所属工业园：</strong><%=rs01("所属工业园")%>&nbsp;&nbsp;
		  <strong>房产类型：</strong><%=rs01("房产类型")%>&nbsp;&nbsp;
		  <strong>所属房产：</strong><%=rs01("所属房产")%>&nbsp;&nbsp;
		  <strong>合同开始时间：</strong><%=rs01("合同开始时间")%>&nbsp;&nbsp;
		  <strong>合同结束时间:</strong><%=rs01("合同结束时间")%></td>
        </tr>

<%
if rs01("合同开始时间_年")=rs01("合同结束时间_年") then
	for j=rs01("合同开始时间_月") to rs01("合同结束时间_月")
%>
<%
	next
elseif rs01("合同开始时间_年")<rs01("合同结束时间_年") then
	for i=rs01("合同开始时间_年") to rs01("合同结束时间_年")-1
    	 for j=rs01("合同开始时间_月") to 12
%>
<%		next
		next
		for k=1 to rs01("合同结束时间_月")
%>
<%
next
end if
%>
    </table>
<div style="WIDTH: 100%; HEIGHT: 350; OVERFLOW: scroll; SCROLLBAR-FACE-COLOR: EAECEC; SCROLLBAR-HIGHLIGHT-COLOR: EAECEC; SCROLLBAR-SHADOW-COLOR: BLACK; SCROLLBAR-3DLIGHT-COLOR: EAECEC; SCROLLBAR-ARROW-COLOR: EAECEC; SCROLLBAR-TRACK-COLOR: FFFFFF; SCROLLBAR-DARKSHADOW-COLOR: EAECEC">
    <table width="100%"  style="border:1px solid  #00376F;" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>序号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>年份月份</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>总费用</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>缴费金额</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>余额</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>录入状态</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>缴费状态</strong></td>
        <td width="232" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
      <%
if rs01("合同开始时间_年")=rs01("合同结束时间_年") then
	for ii=rs01("合同开始时间_月") to rs01("合同结束时间_月")
	xh=0
	xh=xh+1
set rssj01=server.createobject("adodb.recordset")
sqlsj01="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh&"'"
rssj01.open sqlsj01,conn,3

set rssj011=server.createobject("adodb.recordset")
sqlsj011="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh-1&"'"
rssj011.open sqlsj011,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs01("合同开始时间_年")%>/<%=ii%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%
		if rssj01("总费用")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj01("总费用"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%if rssj01("缴费金额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj01("缴费金额"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		&nbsp;
		<%if rssj01("余额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj01("余额"),2,-1)&"")
		end if
		%></td>
        <td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<%
	if int(rs01("合同开始时间_年"))<int(year(now)) then
			if rssj01("录入状态")="" then
				response.Write("<span style='color:#FF0000'>未录入</span>")
			else
				response.Write(""&rssj01("录入状态")&"")
			end if	
	elseif int(rs01("合同开始时间_年"))=int(year(now)) then
			if ii<=int(month(now)) then
				if rssj01("录入状态")="" then
					response.Write("<span style='color:#FF0000'>未录入</span>")
				else
					response.Write(""&rssj01("录入状态")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>不能录入</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能录入</span>")
	end if
		%></td>
        <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%		
	if rs01("合同开始时间_年")<year(now) then
			if rssj01("缴费状态")="" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
			else
			  if rssj01("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj01("缴费状态")&"")
				end if
			end if	
	elseif ii=year(now) then
			if j<=month(now) then
				if rssj01("缴费状态")="" then
					response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
			  if rssj01("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj01("缴费状态")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>不能缴费</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能缴费</span>")
	end if	
		%></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
<%			
	if int(rs01("合同开始时间_年"))<year(now) then
			if rssj01("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj011("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("合同开始时间_年")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
			else
		if xh=1 then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		else
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&rs01("合同开始时间_年")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
			end if	
	elseif int(rs01("合同开始时间_年"))=year(now) then
			if ii<=month(now) then
				if rssj01("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj011("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("合同开始时间_年")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
				else
		if xh=1 then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		else
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&rs01("合同开始时间_年")&"&yy="&ii&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
				end if	
			else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
			end if
	else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
	end if
%>		
		
      </tr>
      <%
	next
elseif rs01("合同开始时间_年")<rs01("合同结束时间_年") then
	for i=rs01("合同开始时间_年") to rs01("合同开始时间_年")
    	 for j=rs01("合同开始时间_月") to 12
		 xh=xh+1
set rssj02=server.createobject("adodb.recordset")
sqlsj02="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh&"'"
rssj02.open sqlsj02,conn,3

set rssj021=server.createobject("adodb.recordset")
sqlsj021="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh-1&"'"
rssj021.open sqlsj021,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%>/<%=j%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("总费用")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("总费用"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("缴费金额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("缴费金额"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("余额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("余额"),2,-1)&"")
		end if
		%></td><td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<%
	if i<int(year(now)) then
			if rssj02("录入状态")="" then
				response.Write("<span style='color:#FF0000'>未录入</span>")
			else
				response.Write(""&rssj02("录入状态")&"")
			end if	
	elseif i=int(year(now)) then
			if j<=month(now) then
				if rssj02("录入状态")="" then
					response.Write("<span style='color:#FF0000'>未录入</span>")
				else
				
					response.Write(""&rssj02("录入状态")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>不能录入</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能录入</span>")
	end if
		%></td>
        <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%
	if i<year(now) then
			if rssj02("缴费状态")="" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
			else
			  if rssj02("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj02("缴费状态")&"")
				end if
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("缴费状态")="" then
					response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
			  if rssj02("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj02("缴费状态")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>不能缴费</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能缴费</span>")
	end if
		%></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<%
		
	if i<year(now) then
			if rssj02("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj021("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
			else
		if xh=1 then
				response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
				else
				
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj021("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
				else
		if xh=1 then
				response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
				else
				
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
				end if	
			else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
			end if
	else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
	end if
		%>
		</td>
      </tr>
      <%		next
		next
for i=rs01("合同开始时间_年")+1 to rs01("合同结束时间_年")-1
    	 for j=1 to 12
		 xh=xh+1
set rssj02=server.createobject("adodb.recordset")
sqlsj02="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh&"'"
rssj02.open sqlsj02,conn,3

set rssj021=server.createobject("adodb.recordset")
sqlsj021="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh-1&"'"
rssj021.open sqlsj021,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%>/<%=j%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("总费用")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("总费用"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("缴费金额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("缴费金额"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj02("余额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj02("余额"),2,-1)&"")
		end if
		%></td><td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<%
	if i<int(year(now)) then
			if rssj02("录入状态")="" then
				response.Write("<span style='color:#FF0000'>未录入</span>")
			else
				response.Write(""&rssj02("录入状态")&"")
			end if	
	elseif i=int(year(now)) then
			if j<=int(month(now)) then
				if rssj02("录入状态")="" then
					response.Write("<span style='color:#FF0000'>未录入</span>")
				else
				
					response.Write(""&rssj02("录入状态")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>不能录入</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能录入</span>")
	end if
		%></td>
        <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%
	if i<year(now) then
			if rssj02("缴费状态")="" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
			else
			  if rssj02("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj02("缴费状态")&"")
				end if
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("缴费状态")="" then
					response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
			  if rssj02("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj02("缴费状态")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>不能缴费</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能缴费</span>")
	end if
		%></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<%
		
	if i<year(now) then
			if rssj02("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj021("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
			else
		if xh=1 then
				response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
				else
				
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
			end if	
	elseif i=year(now) then
			if j<=month(now) then
				if rssj02("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj021("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
				else
		if xh=1 then
				response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
				else
				
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&i&"&yy="&j&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
				end if	
			else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
			end if
	else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
	end if
		%>
		</td>
      </tr>
      <%		next
		next		

		for k=1 to rs01("合同结束时间_月")
xh=xh+1
set rssj03=server.createobject("adodb.recordset")
sqlsj03="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh&"'"
rssj03.open sqlsj03,conn,3

set rssj031=server.createobject("adodb.recordset")
sqlsj031="select * from user_sf_zb where 单据编号='"&rs01("编码")&"_"&xh-1&"'"
rssj031.open sqlsj031,conn,3
%>
      <tr>
        <td width="49" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=xh%></td>
        <td width="168" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs01("合同结束时间_年")%>/<%=k%></td>
        <td width="100" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj03("总费用")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj03("总费用"),2,-1)&"")
		end if
		%></td>
        <td width="103" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj03("缴费金额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj03("缴费金额"),2,-1)&"")
		end if
		%></td>
        <td width="105" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">&nbsp;
          <%if rssj03("余额")="" then
		response.Write("-")
		else
		response.Write(""&FormatNumber(rssj03("余额"),2,-1)&"")
		end if
		%></td><td width="116" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
<%
	if int(rs01("合同结束时间_年"))<int(year(now)) then
			if rssj03("录入状态")="" then
				response.Write("<span style='color:#FF0000'>未录入</span>")
			else
				response.Write(""&rssj03("录入状态")&"")
			end if	
	elseif int(rs01("合同结束时间_年"))=int(year(now)) then
			if k<=int(month(now)) then
				if rssj03("录入状态")="" then
					response.Write("<span style='color:#FF0000'>未录入</span>")
				else
					response.Write(""&rssj03("录入状态")&"")
				end if	
			else
			response.Write("<span style='color:#666666'>不能录入</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能录入</span>")
	end if
		%>		
		</td>
        <td width="120" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%
	if rs01("合同结束时间_年")<year(now) then
			if rssj03("缴费状态")="" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
			else
			  if rssj03("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj03("缴费状态")&"")
				end if
			end if	
	elseif rs01("合同结束时间_年")=year(now) then
			if k<=month(now) then
				if rssj03("缴费状态")="" then
					response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
			  if rssj03("缴费状态")="未缴费" then
				response.Write("<span style='color:#FF0000'>未缴费</span>")
				else
				response.Write(""&rssj03("缴费状态")&"")
				end if
				end if	
			else
			response.Write("<span style='color:#666666'>不能缴费</span>")
			end if
	else
	response.Write("<span style='color:#666666'>不能缴费</span>")
	end if
		%></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
			
		<%
		
	if int(rs01("合同结束时间_年"))<int(year(now)) then
			if rssj03("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj031("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("合同结束时间_年")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
			else
			if xh=1 then
					response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
					else
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&rs01("合同结束时间_年")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
			end if	
	elseif int(rs01("合同结束时间_年"))=int(year(now)) then
			if k<=int(month(now)) then
				if rssj03("录入状态")="" then
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		if rssj031("录入状态")<>"已录入" then
		response.Write("<span style='color:#666666'>录入</span>")
		else
		response.Write("<a href='sjlr_xq_lb.asp?id="&rs01("id")&"&ny="&rs01("合同结束时间_年")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>录入</a>")
		end if
				else
			if xh=1 then
					response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
					else
		response.Write("<a href='ckxq.asp?id="&rs01("id")&"&ny="&rs01("合同结束时间_年")&"&yy="&k&"&xh="&xh&"&page="&request.QueryString("page")&"'>查看详情</a>&nbsp;")
		end if
		response.Write("<span style='color:#666666'>录入</span>")
				end if	
			else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
			end if
	else
		response.Write("<span style='color:#666666'>查看详情</span>&nbsp;")
		response.Write("<span style='color:#666666'>录入</span>")
	end if
		%>	
		</td>
      </tr>
      <%
next
end if
%>
    </table>
</div>

<% 
rs0.close
set rs0=nothing
end if
%>
</table>
</body>
</html>
<%
conn.close
set conn=nothing
%>