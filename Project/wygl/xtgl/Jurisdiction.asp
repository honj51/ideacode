<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../Safe/conn.asp"-->
<!--#INCLUDE FILE="../Safe/md5.asp"-->
<!--#INCLUDE FILE="../Safe/nrbh.asp"-->
<%
role_name=request.QueryString("role_name")
role_id=request.QueryString("role_id")

set rs1=server.createobject("adodb.recordset")
sql1="select * from role_lb where role_name='"&role_name&"'"
rs1.open sql1,conn,1,3
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<SCRIPT src="../js/lj.js" type=text/javascript></SCRIPT>
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
    <td><img src="../images/1_1.gif" width="18" height="18">&nbsp;<strong>编辑权限——（<%=role_name%>）</strong></td>
  </tr>
<tr>
  <td align="center" valign="middle">
  <form action="Jurisdiction.asp?action=1&role_id=<%=role_id%>&role_name=<%=role_name%>" method="post"  name="form1" id="form1" style="margin:0px;">
  <%if rs1.bof or rs1.eof then%>
  <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>水缴费管理</strong></td>

        <td width="20%" align="center" valign="middle" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><strong>资源管理</strong></td>
        <td width="20%" align="center" valign="middle"style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><strong>租凭管理</strong></td>
        <td width="20%" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>系统管理</strong></td>
      </tr>
      <tr>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
            <input name="数据录入" type="checkbox" id="数据录入" value="1" />
            </label>
              数据录入</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="缴费管理" type="checkbox" id="缴费管理" value="1" />
              缴费管理</td>
          </tr>
        </table></td>
        <td align="center" valign="top" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
            <input name="工业园管理" type="checkbox" id="工业园管理" value="1" />
            </label>
              工业园管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="房产管理" type="checkbox" id="房产管理" value="1" />
房产管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="客户管理" type="checkbox" id="客户管理" value="1" />
              客户管理</td>
          </tr>

        </table></td>
        <td align="center" valign="top"style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">

          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
              <input name="预定管理" type="checkbox" id="预定管理" value="1" />
              </label>
              预定管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="租凭合同管理" type="checkbox" id="租凭合同管理" value="1" />
租凭合同管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="合同到期提示" type="checkbox" id="合同到期提示" value="1" />
              合同到期提示</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="收款分类统计" type="checkbox" id="收款分类统计" value="1" />
收款分类统计</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="收款详细统计" type="checkbox" id="收款详细统计" value="1" />
收款详细统计</td>
          </tr>
        </table></td>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F;"><table width="80%" border="0" cellpadding="0" cellspacing="0">

          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
              <input name="角色权限" type="checkbox" id="角色权限" value="1" />
              </label>
              角色权限</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="管理员管理" type="checkbox" id="管理员管理" value="1" />
              管理员管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="修改本身密码" type="checkbox" id="修改本身密码" value="1" />
              修改本身密码</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><input name="退出系统" type="checkbox" id="退出系统" value="1" />
              退出系统</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30" colspan="5" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<input name="Submit2" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定"/>
            <input name="Submit2" type="reset"  style="border:1px solid #000000; margin-left:3px; margin-right:3px" value="取消"/>
            <input name="Submit22" type="button"  style="border:1px solid #000000; margin-left:3px" value="返回" onClick="<script>window.location(Role.asp)</script>"/></td>
      </tr>
    </table>
	<%else%>
    <table width="100%"  style="border:1px solid  #00376F; margin-top:10px" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%" height="30" align="center" valign="middle" style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><strong>水缴费管理</strong></td>

        <td width="20%" align="center" valign="middle" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><strong>资源管理</strong></td>
        <td width="20%" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>租凭管理</strong></td>
        <td width="20%" height="30" align="center" valign="middle"style="border-bottom:1px solid #00376F;"><strong>系统管理</strong></td>
      </tr>
      <tr>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F; border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
			   <%if rs1("数据录入")=1 then%>
			  <input name="数据录入" type="checkbox" id="数据录入" value="1" checked="checked" />
			  <%else%>
              <input name="数据录入" type="checkbox" id="数据录入" value="1" />
			  <%end if%>
            </label>
              数据录入</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("缴费管理")=1 then%>
			<input name="缴费管理" type="checkbox" id="缴费管理" value="1" checked="checked" />
			<%else%>
			<input name="缴费管理" type="checkbox" id="缴费管理" value="1" />
			<%end if%>
			缴费管理</td>
          </tr>
        </table></td>
        <td align="center" valign="top" style="border-bottom:1px solid #00376F;border-right:1px solid #00376F"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
			<%if rs1("工业园管理")=1 then%>
              <input name="工业园管理" type="checkbox" id="工业园管理" value="1" checked="checked" />
			  <%else%>
			  <input name="工业园管理" type="checkbox" id="工业园管理" value="1" />
			  <%end if%>
              </label>
              工业园管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("房产管理")=1 then%>
              <input name="房产管理" type="checkbox" id="房产管理" value="1"  checked="checked"/>
              <%else%>
              <input name="房产管理" type="checkbox" id="房产管理" value="1" />
              <%end if%>
              房产管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("客户管理")=1 then%>
			<input name="客户管理" type="checkbox" id="客户管理" value="1"  checked="checked"/>
			<%else%>
			<input name="客户管理" type="checkbox" id="客户管理" value="1" />
			<%end if%>
			客户管理</td>
          </tr>

        </table></td>
        <td align="center" valign="top"style="border-bottom:1px solid #00376F;"><table width="80%" border="0" cellpadding="0" cellspacing="0">

          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
              <%if rs1("预定管理")=1 then%>
              <input name="预定管理" type="checkbox" id="预定管理" value="1" checked="checked" />
              <%else%>
              <input name="预定管理" type="checkbox" id="预定管理" value="1" />
              <%end if%>
              </label>
              预定管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("租凭合同管理")=1 then%>
                <input name="租凭合同管理" type="checkbox" id="租凭合同管理" value="1"  checked="checked"/>
                <%else%>
                <input name="租凭合同管理" type="checkbox" id="租凭合同管理" value="1" />
                <%end if%>
                租凭合同管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("合同到期提示")=1 then%>
              <input name="合同到期提示" type="checkbox" id="合同到期提示" value="1"  checked="checked"/>
              <%else%>
              <input name="合同到期提示" type="checkbox" id="合同到期提示" value="1" />
              <%end if%>
              合同到期提示</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><%if rs1("收款分类统计")=1 then%>
              <input name="收款分类统计" type="checkbox" id="收款分类统计" value="1"  checked="checked"/>
              <%else%>
              <input name="收款分类统计" type="checkbox" id="收款分类统计" value="1" />
              <%end if%>
收款分类统计</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><%if rs1("收款详细统计")=1 then%>
              <input name="收款详细统计" type="checkbox" id="收款详细统计" value="1"  checked="checked"/>
              <%else%>
              <input name="收款详细统计" type="checkbox" id="收款详细统计" value="1" />
              <%end if%>
              收款详细统计</td>
          </tr>
        </table></td>
        <td height="30" align="center" valign="top"style="border-bottom:1px solid #00376F;"><table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee"><label>
			<%if rs1("角色权限")=1 then%>
              <input name="角色权限" type="checkbox" id="角色权限" value="1"  checked="checked"/>
			  <%else%>
			  <input name="角色权限" type="checkbox" id="角色权限" value="1" />
			  <%end if%>
              </label>
              角色权限</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("管理员管理")=1 then%>
              <input name="管理员管理" type="checkbox" id="管理员管理" value="1"  checked="checked"/>
              <%else%>
              <input name="管理员管理" type="checkbox" id="管理员管理" value="1" />
              <%end if%>
              管理员管理</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("修改本身密码")=1 then%>
              <input name="修改本身密码" type="checkbox" id="修改本身密码" value="1"  checked="checked"/>
              <%else%>
              <input name="修改本身密码" type="checkbox" id="修改本身密码" value="1" />
              <%end if%>
              修改本身密码</td>
          </tr>
          <tr>
            <td height="25" align="left" valign="middle" bgcolor="#eeeeee">
			<%if rs1("退出系统")=1 then%>
			<input name="退出系统" type="checkbox" id="退出系统" value="1"  checked="checked"/>             <%else%>
			<input name="退出系统" type="checkbox" id="退出系统" value="1" />
			<%end if%>
			退出系统</td>
          </tr>

        </table></td>
      </tr>
      <tr>
        <td height="30" colspan="5" align="center" valign="middle"style="border-bottom:1px solid #00376F;">
		<input name="Submit2" type="submit"  style="border:1px solid #000000; margin-right:3px" value="确定"/>
            <input name="Submit2" type="reset"  style="border:1px solid #000000; margin-left:3px; margin-right:3px" value="取消"/>
            <input name="Submit22" type="button"  style="border:1px solid #000000; margin-left:3px" value="返回" onClick="<script>window.location(Role.asp)</script>"/></td>
      </tr>
    </table>
<%end if%>
  </form></td>
</tr>
</table>
<%
rs1.close
set rsq1=nothing
%>
</body>
</html>
<%
if request.QueryString("action")=1 then
role_id=request.QueryString("role_id")
role_name=request.QueryString("role_name")
set rs=server.createobject("adodb.recordset")
sql="select * from role_lb where role_name='"&role_name&"'"
rs.open sql,conn,1,3
if rs.bof or rs.eof  then
rs.addnew
rs("role_name")=role_name
rs("数据录入")=request.Form("数据录入")
rs("缴费管理")=request.Form("缴费管理")
rs("工业园管理")=request.Form("工业园管理")
rs("房产管理")=request.Form("房产管理")
rs("客户管理")=request.Form("客户管理")
rs("预定管理")=request.Form("预定管理")
rs("租凭合同管理")=request.Form("租凭合同管理")
rs("合同到期提示")=request.Form("合同到期提示")
rs("收款分类统计")=request.Form("收款分类统计")
rs("收款详细统计")=request.Form("收款详细统计")
rs("角色权限")=request.Form("角色权限")
rs("管理员管理")=request.Form("管理员管理")
rs("修改本身密码")=request.Form("修改本身密码")
rs("退出系统")=request.Form("退出系统")
rs.update
response.write"<script>alert('权限更新成功');location.href='Jurisdiction.asp?role_id="&role_id&"&role_name="&role_name&"';</script>"
else
rs("role_name")=role_name
rs("数据录入")=request.Form("数据录入")
rs("缴费管理")=request.Form("缴费管理")
rs("工业园管理")=request.Form("工业园管理")
rs("房产管理")=request.Form("房产管理")
rs("客户管理")=request.Form("客户管理")
rs("预定管理")=request.Form("预定管理")
rs("租凭合同管理")=request.Form("租凭合同管理")
rs("合同到期提示")=request.Form("合同到期提示")
rs("收款分类统计")=request.Form("收款分类统计")
rs("收款详细统计")=request.Form("收款详细统计")
rs("角色权限")=request.Form("角色权限")
rs("管理员管理")=request.Form("管理员管理")
rs("修改本身密码")=request.Form("修改本身密码")
rs("退出系统")=request.Form("退出系统")
rs.update
response.write"<script>alert('权限更新成功');location.href='Jurisdiction.asp?role_id="&role_id&"&role_name="&role_name&"';</script>"
end if
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>