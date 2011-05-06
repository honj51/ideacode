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
<form id="form1" name="form1" method="post" action="sjlr1.asp" style="margin:0px">
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
              &nbsp;&nbsp;&nbsp;行总：
                        <label>
                        <select name="行总" id="行总">
						<%for i=1 to 15%>
                          <option value="<%=i%>"><%=i%></option>
						  <%next%>
                        </select>
                        <input type="submit" name="Submit" value="提交" />
                        </label></td>
        </tr>
        <tr>
          <td height="20">&nbsp;</td>
        </tr>
      </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
