<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Function.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
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
<script language="JavaScript">
function printpr()   //Ԥ������
{
document.all("qingkongyema").click();//��ӡ֮ǰȥ��ҳü��ҳ��
document.all("dayinDiv").style.display="none"; //��ӡ֮ǰ�����ز����ӡ�����Ԫ�أ����������ء���ӡ���͡���ӡԤ����������ť��

var OLECMDID = 7;
var PROMPT = 1; 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
WebBrowser1.ExecWB(OLECMDID, PROMPT);
WebBrowser1.outerHTML = "";
document.all("dayinDiv").style.display="";//��ӡ֮�󽫸�Ԫ����ʾ��������ʾ������ӡ���͡���ӡԤ����������ť����������´δ�ӡ��

}
function printTure()   //��ӡ����
{
    document.all('qingkongyema').click();//ͬ��
    document.all("dayinDiv").style.display="none";//ͬ��

    window.print();
    document.all("dayinDiv").style.display="";

}
function doPage()
{
    layLoading.style.display = "none";//ͬ��
}
</SCRIPT>


<script language="VBScript">
dim hkey_root,hkey_path,hkey_key
hkey_root="HKEY_CURRENT_USER"
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup"

function pagesetup_null()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
end function

function pagesetup_default()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header" 
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&bҳ�룬&p/&P"
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"
end function
</script>

<body>
<DIV align=center>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="50" align="center"><span class="STYLE1">����������Ͷ�����޹�˾&nbsp;
        <%=request.Form("��ҵ԰����")%> &nbsp;�տ��վ�&nbsp;��
       <%=request.Form("��")%>
        -
       <%=request.Form("��")%>
        ��</span></td>
    </tr>
    <tr>
      <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
<%
FOR i=1 to 4
suiji=suijishu()
suiji1=suiji1&suiji
next
		
		 %>
          <td height="20" align="left" valign="middle">&nbsp;&nbsp;�վݱ��룺
            <%=request.Form("�վݱ���")%>
                        &nbsp;&nbsp;&nbsp;�ͻ����ƣ�
            <%=request.Form("�ͻ�����")%></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle">��ҵ԰���ƣ�
            <%=request.Form("��ҵ԰����")%>
                        &nbsp;&nbsp;&nbsp;�������ͣ�
            <%=request.Form("��������")%>
                        &nbsp;&nbsp;&nbsp;&nbsp;������
                        <%=request.Form("����")%>                        
              &nbsp;&nbsp;&nbsp;<label></label></td>
        </tr>
        <tr>
          <td height="20">&nbsp;</td>
        </tr>
      </table>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" style="border:1px solid #000000">
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
          <%for j=1 to request.Form("����")%>
          <tr>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("��������"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("��������"&j&"")&"")
		  end if
		  %>
            </td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("��������"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("��������"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000" ><%
		  if request.Form("ǰ�ζ���"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("ǰ�ζ���"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("���ζ���"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("���ζ���"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("���"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("���"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("����"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("����"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("����"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("����"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("���ڽ��"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("���ڽ��"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; "><%
		  if request.Form("Ƿ����"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("Ƿ����"&j&"")&"")
		  end if
		  %></td>
          </tr>
          <%next%>
          <tr>
            <td height="30" colspan="9" align="center" valign="middle"><label>
                <div align="center" style="height:30px; vertical-align:middle" id="dayinDiv" name="dayinDiv"> <a href="#" onclick="printTure();">��ӡ</a>
                    <input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="���ҳ��" onclick="pagesetup_null()" />
                </div>
              </label></td>
          </tr>
        </table></td>
    </tr>
  </table>
</DIV>
</body>
</html>
