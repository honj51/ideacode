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
<SCRIPT src="../js/khgl.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/khgl2.js" type=text/javascript></SCRIPT>
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
    <td height="30" colspan="2"><form id="form3" name="form3" method="post" action="?xmcx=yes" style="margin:0px">
      <strong><img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onmouseover="return hidestatus()" href="khgl.asp?Operation=lb">自然人列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onmouseover="return hidestatus()" href="khgl.asp?Operation=tj">添加自然人</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/1_1.gif" width="18" height="18" />&nbsp;<a onmouseover="return hidestatus()" href="khgl_gs.asp?Operation=lb">公司列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/notify_new.gif" width="16" height="16" />&nbsp;<a onmouseover="return hidestatus()" href="khgl_gs.asp?Operation=tj">添加公司</a></strong>&nbsp;&nbsp;
      <label>
      &nbsp;姓名：
      <input name="textname" type="text" id="textname" />
      </label>
                            <label>
                            <input type="submit" name="Submit" value="查找" />
                            </label>
    </form>
    </td>
  </tr>
<%if Operation="lb" or Operation="" then%>
  <tr>
    <td height="420" colspan="2" align="center" valign="top">
	<table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>序号</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>编码</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>名称</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>描述</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>联系人</strong></td>
        <td align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>联系电话</strong></td>
        <td height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>操作</strong></td>
      </tr>
<%
set rs0=server.createobject("adodb.recordset")
if request.QueryString("xmcx")="yes" then
sql0="select * from user_zrr  where 名称 like '%"&request.Form("textname")&"%' order by id asc"
else
sql0="select * from user_zrr  order by id asc"
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
        <td height="93" colspan="9" align="center" valign="middle" style="border-bottom:1px solid #00376F; ">没有添加自然人</td>
        </tr>
<%
end if
for i=1 to rs0.pagesize
if rs0.bof or rs0.eof then exit for
%>
      <tr>
        <td width="44" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=i%></td>
        <td width="149" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("编码")%></td>
        <td width="149" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("名称")%></td>
        <td width="162" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("描述")%></td>
        <td width="118" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("联系人")%></td>
        <td width="133" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><%=rs0("联系电话")%></td>
        <td width="166" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
<a href="../zpgl/zpht.asp?Operation=tj&id=<%=rs0("id")%>&hylx=zrr">添加合同</a>|	
<a href="?Operation=xg&id=<%=rs0("id")%>">编辑</a>|
<%
set rs0111=server.createobject("adodb.recordset")
sql0111="select * from gyy_fc_lb where 业主='"&rs0("编码")&"'"
rs0111.open sql0111,conn,3
if rs0111.bof or rs0111.eof   then%>
<a href="?action=sc&id=<%=rs0("id")%>">删除</a>
<%
else
response.Write("<span style='color:#999999'>删除</span>")
end if
%>
</td>
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
        <td width="17%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">编码：</td>
        <td width="28%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;">
			   <%
		 FOR i=1 to 4
		 suiji=suijishu()
		 suiji1=suiji1&suiji
		 next
		
		 %>
		<input name="编码" type="text" id="编码"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="zrr<%=year(now)%><%=month(now)%><%=day(now)%><%=hour(now)%><%=minute(now)%><%=second(now)%><%=suiji1%>" autocomplete="off"  readonly="true"/></td>
        <td width="55%" rowspan="5" align="left" valign="middle" style="border-bottom:1px solid #00376F; border-left:1px solid #00376F">&nbsp;</td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">名称：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <input name="名称" type="text" id="名称"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/>
        </label></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">描述：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="描述" type="text" id="描述"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">助记码：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="助记码" type="text" id="助记码"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
        </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">性别：</td>
        <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          &nbsp;
          <input name="性别" type="radio" value="男" checked="checked" />
        男
        <input type="radio" name="性别" value="女" />
        女</label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">出生日期：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
          <select name="年" id="年" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <option value="请选择">请选择</option>
		  <%for n=year(now)-70 to  year(now)%>
            <option value="<%=n%>"><%=n%></option>
			<%next%>
          </select>
          年
          <select name="月" id="月" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <option value="请选择">请选择</option>
        		  <%for y=1 to  12%>
            <option value="<%=y%>"><%=y%></option>
			<%next%>
                              </select>
          月
          <select name="日" id="日" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		  <option value="请选择">请选择</option>
        		<%for r=1 to  31%>
            <option value="<%=r%>"><%=r%></option>
			<%next%>
                              </select>
          日</label></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">证件名称：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="证件名称" id="证件名称" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		<option value="请选择">请选择</option>
          <option value="身份证">身份证</option>

        </select></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">证件号码：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="证件号码" type="text" id="证件号码"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">籍贯：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="籍贯" id="籍贯" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
		<option value="请选择" selected="selected">请选择</option>
          <option value="北京">北京</option>
          <option value="天津">天津</option>
		  <option value="上海">上海</option>
		  <option value="重庆">重庆</option>
		  <option value="黑龙江">黑龙江</option>
		  <option value="吉林">吉林</option>
		  <option value="辽宁">辽宁</option>
		  <option value="河北">河北</option>
		  <option value="山西">山西</option>
		  <option value="青海">青海</option>
		  <option value="山东">山东</option>
		  <option value="河南">河南</option>
		  <option value="江苏">江苏</option>
		  <option value="安徽">安徽</option>
		  <option value="浙江">浙江</option>
		  <option value="福建">福建</option>
		  <option value="湖南">湖南</option>
		  <option value="湖北">湖北</option>
		  <option value="广东">广东</option>
		  <option value="台湾">台湾</option>
		  <option value="海南">海南</option>
		  <option value="甘肃">甘肃</option>
		  <option value="陕西">陕西</option>
		  <option value="四川">四川</option>
		  <option value="贵州">贵州</option>
		  <option value="云南">云南</option>
		  <option value="内蒙古自治区">内蒙古自治区</option>
		  <option value="维吾尔自治区">维吾尔自治区</option>
		  <option value="西藏自治区">西藏自治区</option>
		  <option value="宁夏回族自治区">宁夏回族自治区</option>
		  <option value="广西壮族自治区">广西壮族自治区</option>
		  <option value="香港特别行政区">香港特别行政区</option>
		  <option value="澳门特别行政区">澳门特别行政区</option>
                </select></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">联系电话：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="联系电话" type="text" id="联系电话"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">联系地址：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="联系地址" type="text" id="联系地址"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">联系人：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="联系人" type="text" id="联系人"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" autocomplete="off"/></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">备注：</td>
        <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><textarea name="备注" id="备注" style="border:1px solid #333333; width:400px; height:50px; margin-left:3px" autocomplete="off"></textarea></td>
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
sql1="select * from user_zrr where id='"&request.QueryString("id")&"'"
rs1.open sql1,conn,3
%>
<tr>
    <td colspan="2" align="center" valign="middle">
	<form action="?action=xg&id=<%=rs1("id")%>&Operation=xg" method="post"  name="form2" id="form2" style="margin:0px;" onSubmit="return denglu2()">
	  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
        <tr>
          <td width="17%" height="30" align="right" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">编码：</td>
          <td width="28%" height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="编码" type="text" id="编码"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("编码")%>" autocomplete="off" readonly="true"/></td>
          <td width="55%" rowspan="5" align="left" valign="middle" style="border-bottom:1px solid #00376F; border-left:1px solid #00376F">&nbsp;</td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">名称：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label>
            <input name="名称" type="text" id="名称"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("名称")%>" autocomplete="off" readonly="true"/>
          </label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">描述：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="描述" type="text" id="描述"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("描述")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">助记码：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="助记码" type="text" id="助记码"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("助记码")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">性别：</td>
          <td height="30" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><label> &nbsp;
            <% if rs1("性别")="男" then%>
			<input type="radio" name="性别" value="男" checked="checked" />
            男
            <input type="radio" name="性别" value="女" />
            女
			<%else%>
						<input type="radio" name="性别" value="男"  />
            男
            <input type="radio" name="性别" value="女"  checked="checked"/>
            女
			<%end if%>
			</label></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">出生日期：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="年" id="年" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
			<option value="<%=rs1("出生日期_年")%>"><%=rs1("出生日期_年")%></option>
              <%for n=year(now)-70 to  year(now)%>
              <option value="<%=n%>"><%=n%></option>
              <%next%>
            </select>
年
<select name="月" id="月" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option value="<%=rs1("出生日期_月")%>"><%=rs1("出生日期_月")%></option>
  <%for y=1 to  12%>
  <option value="<%=y%>"><%=y%></option>
  <%next%>
</select>
月
<select name="日" id="日" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
<option value="<%=rs1("出生日期_日")%>"><%=rs1("出生日期_日")%></option>
  <%for r=1 to  31%>
  <option value="<%=r%>"><%=r%></option>
  <%next%>
</select>
日</td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">证件名称：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="证件名称" id="证件名称" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
              <option value="<%=rs1("证件名称")%>"><%=rs1("证件名称")%></option>
              <option value="身份证">身份证</option>
            </select></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">证件号码：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="证件号码" type="text" id="证件号码"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("证件号码")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">籍贯：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><select name="籍贯" id="籍贯" style="border:1px solid #333333;  height:20px; margin-left:3px" autocomplete="off">
              <option value="<%=rs1("籍贯")%>" selected="selected"><%=rs1("籍贯")%></option>
              <option value="北京">北京</option>
              <option value="天津">天津</option>
              <option value="上海">上海</option>
              <option value="重庆">重庆</option>
              <option value="黑龙江">黑龙江</option>
              <option value="吉林">吉林</option>
              <option value="辽宁">辽宁</option>
              <option value="河北">河北</option>
              <option value="山西">山西</option>
              <option value="青海">青海</option>
              <option value="山东">山东</option>
              <option value="河南">河南</option>
              <option value="江苏">江苏</option>
              <option value="安徽">安徽</option>
              <option value="浙江">浙江</option>
              <option value="福建">福建</option>
              <option value="湖南">湖南</option>
              <option value="湖北">湖北</option>
              <option value="广东">广东</option>
              <option value="台湾">台湾</option>
              <option value="海南">海南</option>
              <option value="甘肃">甘肃</option>
              <option value="陕西">陕西</option>
              <option value="四川">四川</option>
              <option value="贵州">贵州</option>
              <option value="云南">云南</option>
              <option value="内蒙古自治区">内蒙古自治区</option>
              <option value="维吾尔自治区">维吾尔自治区</option>
              <option value="西藏自治区">西藏自治区</option>
              <option value="宁夏回族自治区">宁夏回族自治区</option>
              <option value="广西壮族自治区">广西壮族自治区</option>
              <option value="香港特别行政区">香港特别行政区</option>
              <option value="澳门特别行政区">澳门特别行政区</option>
            </select></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">联系电话：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="联系电话" type="text" id="联系电话"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("联系电话")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">联系地址：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="联系地址" type="text" id="联系地址"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("联系地址")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">联系人：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><input name="联系人" type="text" id="联系人"  style="border:1px solid #333333; width:200px; height:20px; margin-left:3px" value="<%=rs1("联系人")%>" autocomplete="off"/></td>
        </tr>
        <tr>
          <td height="30" align="right" valign="middle"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F">备注：</td>
          <td height="30" colspan="2" align="left" valign="middle"style="border-bottom:1px solid #00376F;"><textarea name="备注" id="备注" style="border:1px solid #333333; width:400px; height:50px; margin-left:3px" autocomplete="off"><%=rs1("备注")%></textarea></td>
        </tr>
        <tr>
          <td height="30" colspan="3" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><input name="Submit42" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定" onClick="fClose()" onmouseover='return hidestatus()'/>
              <input name="Submit42" type="reset"  style="border:1px solid #000000; margin-left:3px" value="取消"/>
          </td>
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
sql="select * from user_zrr where 证件名称='"&request.Form("证件名称")&"' and 证件号码='"&request.Form("证件号码")&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("编码")=request.Form("编码")
rs("名称")=request.Form("名称")
rs("助记码")=request.Form("助记码")
rs("描述")=request.Form("描述")
rs("性别")=request.Form("性别")
rs("出生日期_年")=request.Form("年")
rs("出生日期_月")=request.Form("月")
rs("出生日期_日")=request.Form("日")
rs("证件名称")=request.Form("证件名称")
rs("证件号码")=request.Form("证件号码")
rs("籍贯")=request.Form("籍贯")
rs("联系电话")=request.Form("联系电话")
rs("联系地址")=request.Form("联系地址")
rs("联系人")=request.Form("联系人")
rs("备注")=request.Form("备注")
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.write"<script>alert('添加成功');location.href='?Operation=tj';</script>"
else
response.write"<script>alert('证件号码已存在，请仔细核对!');history.go(-1);</script>"         
end if
end if

if action="xg" then
set rs6=server.createobject("adodb.recordset")
sql6="select * from user_zrr where id='"&request.QueryString("id")&"'"
rs6.open sql6,conn,1,3
rs6("编码")=request.Form("编码")
rs6("名称")=request.Form("名称")
rs6("助记码")=request.Form("助记码")
rs6("描述")=request.Form("描述")
rs6("性别")=request.Form("性别")
rs6("出生日期_年")=request.Form("年")
rs6("出生日期_月")=request.Form("月")
rs6("出生日期_日")=request.Form("日")
rs6("证件名称")=request.Form("证件名称")
rs6("证件号码")=request.Form("证件号码")
rs6("籍贯")=request.Form("籍贯")
rs6("联系电话")=request.Form("联系电话")
rs6("联系地址")=request.Form("联系地址")
rs6("联系人")=request.Form("联系人")
rs6("备注")=request.Form("备注")
rs6.update
response.write"<script>alert('修改成功');location.href='?&Operation=lb';</script>"
rs6.close
set rs6=nothing
conn.close
set conn=nothing
end if

if action="sc"	then
set rs2=server.CreateObject("ADODB.RecordSet")
rs2.open "delete from user_zrr where id="&request.QueryString("id"),conn,1
rs2.close
set rs2=nothing
response.write"<script>alert('删除成功');location.href='khgl.asp';</script>"
end if
%>
<%
conn.close
set conn=nothing
%>