<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Function.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
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
      <td height="50" align="center"><span class="STYLE1">����������Ͷ�����޹�˾&nbsp;
        <%=request.Form("��ҵ԰����")%> &nbsp;�տ��վ�&nbsp;��
        <input name="��" type="text" id="��" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("��")%>" />
        -
        <input name="��" type="text" id="��" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("��")%>" />
        ��</span></td>
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
          <td height="20" align="left" valign="middle">&nbsp;&nbsp;�վݱ��룺
            <input name="�վݱ���" type="text" id="�վݱ���" style="border:1px solid #000000; width:200px; height:20px" value="<%=year(now)%><%=month(now)%><%=day(now)%><%=hour(now)%><%=minute(now)%><%=second(now)%><%=suiji1%>" />
                        &nbsp;&nbsp;&nbsp;�ͻ����ƣ�
            <input name="�ͻ�����" type="text" id="�ͻ�����" style="border:1px solid #000000; width:200px; height:20px" value="<%=request.Form("�ͻ�����")%>" /></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle">��ҵ԰���ƣ�
            <input name="��ҵ԰����" type="text" id="��ҵ԰����" style="border:1px solid #000000; width:200px; height:20px" value="<%=request.Form("��ҵ԰����")%>" />
                        &nbsp;&nbsp;&nbsp;�������ͣ�
            <input name="��������" type="text" id="��������" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("��������")%>" />
                        &nbsp;&nbsp;&nbsp;&nbsp;������
                        <input name="����" type="text" id="����" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("����")%>"/>                        
              &nbsp;&nbsp;&nbsp;���ܣ�
                        <label>
                        <select name="����" id="����">
						<%for i=1 to 15%>
                          <option value="<%=i%>"><%=i%></option>
						  <%next%>
                        </select>
                        <input type="submit" name="Submit" value="�ύ" />
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
