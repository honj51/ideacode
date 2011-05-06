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
    <td height="30" colspan="2"><strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">分类总表统计</a>&nbsp;
	
	    <img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onMouseOver="return hidestatus()" href="?Operation=lb">分类详表统计</a>&nbsp;</strong></td>
  </tr>
  <tr>
    <td height="30" colspan="2">
	<form id="form3" name="form3" method="post" action="zpht.asp" style="margin:0px">
      <table width="715" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="101">&nbsp;多功能搜索：</td>
          <td width="41" align="right" valign="middle">名称：</td>
          <td width="105">
            <input name="客户名称" type="text" id="客户名称"  style="border:1px solid #333333; width:100px; height:20px; margin-left:3px"  autocomplete="off"  />
     </td>
          <td width="49" align="right">工业园：</td>
          <td width="79">
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
            </select>
         </td>
          <td width="43" align="right">类型：</td>
          <td width="78"><select name="ch" id="ch">
            <option  value="请选择">请选择</option>
          </select></td>
          <td width="60" align="right">收费类型：</td>
          <td width="83"><select name="select" id="select">
            <option  value="请选择">请选择</option>
          </select></td>
          <td width="76"><span style="border-bottom:1px solid #00376F;">
            <input name="Submit43" type="submit"  style="border:1px solid #000000; margin-right:3px" value="搜索" onClick="fClose()" onmouseover='return hidestatus()'/>
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
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>序号</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编码</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>客户名称</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属工业园</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>所属房产</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>合同开始时间</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>合同结束时间</strong></td>
        <td height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>合同状态</strong></td>
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

set rs0=server.createobject("adodb.recordset")
if khmc="" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl   order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy="" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where 所属工业园='"&gyy&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 房产类型='"&fclx&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where 所属房产='"&ssfc&"' order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx="" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' order by 合同结束时间-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  房产类型='"&fclx&"' order by 合同结束时间-"&date()&" asc"
elseif khmc<>"" and gyy="" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属房产='"&ssfc&"' order by 合同结束时间-"&date()&" asc"

elseif khmc="" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 所属工业园='"&gyy&"' and  房产类型='"&fclx&"' order by 合同结束时间-"&date()&" asc"
elseif khmc="" and gyy<>"" and  fclx="" and ssfc<>"" then
sql0="select * from zpgl  where 所属工业园='"&gyy&"' and  所属房产='"&ssfc&"' order by 合同结束时间-"&date()&" asc"

elseif khmc="" and gyy="" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where 房产类型='"&fclx&"' and  所属房产='"&ssfc&"' order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' and 房产类型='"&fclx&"'order by 合同结束时间-"&date()&" asc"
elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc="" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' and  所属房产='"&ssfc&"'order by 合同结束时间-"&date()&" asc"

elseif khmc<>"" and gyy<>"" and  fclx<>"" and ssfc<>"" then
sql0="select * from zpgl  where 客户名称='"&khmc&"'and  所属工业园='"&gyy&"' and  房产类型='"&fclx&"' and 所属房产='"&ssfc&"'order by 合同结束时间-"&date()&" asc"


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
        <td height="93" colspan="12" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有合同</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="31" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="135" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("编码")%></td>
        <td width="68" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("客户名称")%></td>
        <td width="76" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("所属工业园")%></td>
        <td width="60" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("房产类型")%>-<%=rs0("所属房产")%></td>
        <td width="97" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("合同开始时间")%></td>
        <td width="88" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<% 
		if rs0("合同结束时间")<>"" then 
			  response.Write(""&rs0("合同结束时间")&"")
		else
		      response.Write("未签订合同")
		end if
		%>		</td>
        <td width="61" height="25" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">
		<%
		if rs0("合同结束时间")<>"" then
		   if rs0("合同结束时间")- date()=0 then
				response.Write("<span style='color:FF0000'>到期</span>")
			elseif 	rs0("合同结束时间")- date()<0 then
			response.Write("<span style='color:FF0000'>到期</span>")
			elseif rs0("合同结束时间")- date()>0 then
			
				if rs0("合同结束时间")- date()<90 then
					response.Write("<span style='color:FF0000'>"&rs0("合同结束时间")- date()&"天到期</span>")
				else
					response.Write("正常")
				end if
			
			end if
		else
		response.Write("<span style='color:#3399FF'>预定</span>")
		end if
		%></td>
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
	<A onMouseover="return hidestatus()" href="?page=1&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">首页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage-1%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">前一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=epage+1%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">后一页</a>&nbsp; 
	<A onMouseover="return hidestatus()" href="?page=<%=rs0.pagecount%>&khmc=<%=khmc%>&gyy=<%=gyy%>&fclx=<%=fclx%>&ssfc=<%=ssfc%>">末页</a>	</span></td>
  </tr>	
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
conn.close
set conn=nothing
%>