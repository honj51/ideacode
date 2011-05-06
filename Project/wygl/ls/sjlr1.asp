<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Function.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
}
body,td,th {
	font-size: 9pt;
	color: #000000;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>

<body>
<form id="form1" name="form1" method="post" action="sjdy.asp" style="margin:0px">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="50" align="center"><span class="STYLE1">深圳兴联兴投资有限公司&nbsp;
        <%=request.Form("工业园名称")%> &nbsp;收款收据&nbsp;（
        <input name="年" type="text" id="年" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("年")%>" />
        -
        <input name="月" type="text" id="月" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("月")%>" />
        ）</span></td>
    </tr>
    <tr>
      <td><table width="810" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
<%
FOR i=1 to 4
suiji=suijishu()
suiji1=suiji1&suiji
next
		
		 %>
          <td height="20" align="left" valign="middle">&nbsp;&nbsp;收据编码：
            <input name="收据编码" type="text" id="收据编码" style="border:1px solid #000000; width:200px; height:20px" value="<%=year(now)%><%=month(now)%><%=day(now)%><%=hour(now)%><%=minute(now)%><%=second(now)%><%=suiji1%>" />
                        &nbsp;&nbsp;&nbsp;客户名称：
            <input name="客户姓名" type="text" id="客户姓名" style="border:1px solid #000000; width:200px; height:20px" value="<%=request.Form("客户姓名")%>" /></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle">工业园名称：
            <input name="工业园名称" type="text" id="工业园名称" style="border:1px solid #000000; width:200px; height:20px" value="<%=request.Form("工业园名称")%>" />
                        &nbsp;&nbsp;&nbsp;房产类型：
            <input name="房产类型" type="text" id="房产类型" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("房产类型")%>" />
                        &nbsp;&nbsp;&nbsp;&nbsp;房产：
                        <input name="房产" type="text" id="房产" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("房产")%>"/>                        
              &nbsp;&nbsp;&nbsp;
              <label>行总：
              <input name="行总" type="text" id="行总" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("行总")%>"/>
              </label></td>
        </tr>
        <tr>
          <td height="20">&nbsp;</td>
        </tr>
      </table>
        <table width="810" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" style="border:1px solid #000000">
          <tr>
            <td width="100" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>费用名称</strong></td>
            <td width="80" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>前次读数</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>本次读数</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>损耗</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>总量</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>单价</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>本期金额</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>欠款金额</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; "><strong>滞纳金</strong></td>
          </tr>
          <%for i=1 to request.Form("行总")%>
          <tr>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="费用名称<%=i%>" type="text" id="费用名称<%=i%>" style="border:1px solid #000000; width:100px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="前次读数<%=i%>" type="text" id="前次读数<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle" style="border:1px solid #000000; width:80px; height:20px" ><input name="本次读数<%=i%>" type="text" id="本次读数<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="损耗<%=i%>" type="text" id="损耗<%=i%>" style="border:1px solid #000000; width:80px;height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="总量<%=i%>" type="text" id="总量<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="单价<%=i%>" type="text" id="单价<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="本期金额<%=i%>" type="text" id="本期金额<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="欠款金额<%=i%>" type="text" id="欠款金额<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; "><input name="滞纳金<%=i%>" type="text" id="滞纳金<%=i%>" style="border:1px solid #000000; width:80px;height:20px" /></td>
          </tr>
          <%next%>
          <tr>
            <td height="30" colspan="9" align="center" valign="middle"><label>
              <input type="submit" name="Submit2" value="生成表" />
              &nbsp;<a href="index.asp">返回</a></label></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
