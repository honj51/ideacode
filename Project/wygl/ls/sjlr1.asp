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
<form id="form1" name="form1" method="post" action="sjdy.asp" style="margin:0px">
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
              &nbsp;&nbsp;&nbsp;
              <label>���ܣ�
              <input name="����" type="text" id="����" style="border:1px solid #000000; width:50px; height:20px" value="<%=request.Form("����")%>"/>
              </label></td>
        </tr>
        <tr>
          <td height="20">&nbsp;</td>
        </tr>
      </table>
        <table width="810" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" style="border:1px solid #000000">
          <tr>
            <td width="100" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>��������</strong></td>
            <td width="80" height="25" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>ǰ�ζ���</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>���ζ���</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>���</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>����</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>����</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>���ڽ��</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>Ƿ����</strong></td>
            <td width="80" height="25" align="center" valign="middle"  style="border-bottom:1px solid #000000; "><strong>���ɽ�</strong></td>
          </tr>
          <%for i=1 to request.Form("����")%>
          <tr>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="��������<%=i%>" type="text" id="��������<%=i%>" style="border:1px solid #000000; width:100px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="ǰ�ζ���<%=i%>" type="text" id="ǰ�ζ���<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle" style="border:1px solid #000000; width:80px; height:20px" ><input name="���ζ���<%=i%>" type="text" id="���ζ���<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="���<%=i%>" type="text" id="���<%=i%>" style="border:1px solid #000000; width:80px;height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="����<%=i%>" type="text" id="����<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="����<%=i%>" type="text" id="����<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="���ڽ��<%=i%>" type="text" id="���ڽ��<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input name="Ƿ����<%=i%>" type="text" id="Ƿ����<%=i%>" style="border:1px solid #000000; width:80px; height:20px" /></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; "><input name="���ɽ�<%=i%>" type="text" id="���ɽ�<%=i%>" style="border:1px solid #000000; width:80px;height:20px" /></td>
          </tr>
          <%next%>
          <tr>
            <td height="30" colspan="9" align="center" valign="middle"><label>
              <input type="submit" name="Submit2" value="���ɱ�" />
              &nbsp;<a href="index.asp">����</a></label></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
