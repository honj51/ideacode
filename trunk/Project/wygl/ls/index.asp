<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ʱ��Ʊϵͳ</title>
<style type="text/css">
<!--
.STYLE3 {
	font-size: 24px;
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
<form id="form1" name="form1" method="post" action="sjlr.asp" style="margin-top:200px">
  <table width="320" border="0" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid #000000">
    <tr>
      <td height="50" colspan="2" align="center" valign="middle" style="border-bottom:1px solid #000000"><span class="STYLE3">������������Ͷ�����޹�˾</span></td>
    </tr>
    <tr>
      <td height="30" align="right" valign="middle" style="border-bottom:1px solid #000000">��ҵ԰���ƣ�</td>
      <td height="30" align="left" valign="middle" style="border-bottom:1px solid #000000"><input name="��ҵ԰����" type="text" id="��ҵ԰����"  style="border:1px solid #000000; width:200px; height:20px"/></td>
    </tr>
    <tr>
      <td height="30" align="right" valign="middle" style="border-bottom:1px solid #000000">�ͻ�������</td>
      <td height="30" align="left" valign="middle" style="border-bottom:1px solid #000000"><input name="�ͻ�����" type="text" id="�ͻ�����"  style="border:1px solid #000000; width:200px; height:20px"/></td>
    </tr>
    <tr>
      <td height="30" align="right" valign="middle" style="border-bottom:1px solid #000000">�·ݣ�</td>
      <td height="30" align="left" valign="middle" style="border-bottom:1px solid #000000"><label>
        <select name="��">
		<option value="<%=year(now)%>"><%=year(now)%></option>
		<%for n=year(now)-10 to year(now)%>
          <option value="<%=n%>"><%=n%></option>
		 <%next%>
        </select>
      </label>
        <label>��
        <select name="��">
				<option value="<%=month(now)%>"><%=month(now)%></option>
		<%for y=1 to 12%>
          <option value="<%=y%>"><%=y%></option>
		 <%next%>
        </select>
      ��      </label></td>
    </tr>
    <tr>
      <td height="30" align="right" valign="middle" style="border-bottom:1px solid #000000">�������ͣ�</td>
      <td height="30" align="left" valign="middle" style="border-bottom:1px solid #000000"><input name="��������" type="text" id="��������"  style="border:1px solid #000000; width:200px; height:20px"/></td>
    </tr>
    <tr>
      <td width="94" height="30" align="right" valign="middle" style="border-bottom:1px solid #000000">������</td>
      <td width="224" height="30" align="left" valign="middle" style="border-bottom:1px solid #000000"><input name="����" type="text" id="����"  style="border:1px solid #000000; width:200px; height:20px"/></td>
    </tr>
    <tr>
      <td height="30" colspan="2" align="center" valign="middle"><label>
        <input type="submit" name="Submit" value="�ύ" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
