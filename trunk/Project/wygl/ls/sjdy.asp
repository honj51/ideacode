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
function printpr()   //预览函数
{
document.all("qingkongyema").click();//打印之前去掉页眉，页脚
document.all("dayinDiv").style.display="none"; //打印之前先隐藏不想打印输出的元素（此例中隐藏“打印”和“打印预览”两个按钮）

var OLECMDID = 7;
var PROMPT = 1; 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
WebBrowser1.ExecWB(OLECMDID, PROMPT);
WebBrowser1.outerHTML = "";
document.all("dayinDiv").style.display="";//打印之后将该元素显示出来（显示出“打印”和“打印预览”两个按钮，方便别人下次打印）

}
function printTure()   //打印函数
{
    document.all('qingkongyema').click();//同上
    document.all("dayinDiv").style.display="none";//同上

    window.print();
    document.all("dayinDiv").style.display="";

}
function doPage()
{
    layLoading.style.display = "none";//同上
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
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P"
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"
end function
</script>

<body>
<DIV align=center>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="50" align="center"><span class="STYLE1">深圳兴联兴投资有限公司&nbsp;
        <%=request.Form("工业园名称")%> &nbsp;收款收据&nbsp;（
       <%=request.Form("年")%>
        -
       <%=request.Form("月")%>
        ）</span></td>
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
          <td height="20" align="left" valign="middle">&nbsp;&nbsp;收据编码：
            <%=request.Form("收据编码")%>
                        &nbsp;&nbsp;&nbsp;客户名称：
            <%=request.Form("客户姓名")%></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle">工业园名称：
            <%=request.Form("工业园名称")%>
                        &nbsp;&nbsp;&nbsp;房产类型：
            <%=request.Form("房产类型")%>
                        &nbsp;&nbsp;&nbsp;&nbsp;房产：
                        <%=request.Form("房产")%>                        
              &nbsp;&nbsp;&nbsp;<label></label></td>
        </tr>
        <tr>
          <td height="20">&nbsp;</td>
        </tr>
      </table>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" style="border:1px solid #000000">
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
          <%for j=1 to request.Form("行总")%>
          <tr>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("费用名称"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("费用名称"&j&"")&"")
		  end if
		  %>
            </td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("费用名称"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("费用名称"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000" ><%
		  if request.Form("前次读数"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("前次读数"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("本次读数"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("本次读数"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("损耗"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("损耗"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("总量"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("总量"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("单价"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("单价"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; border-right:1px solid #000000"><%
		  if request.Form("本期金额"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("本期金额"&j&"")&"")
		  end if
		  %></td>
            <td height="20" align="center" valign="middle"  style="border-bottom:1px solid #000000; "><%
		  if request.Form("欠款金额"&j&"")="" then
		  response.Write("-")
		  else
		  response.Write(""&request.Form("欠款金额"&j&"")&"")
		  end if
		  %></td>
          </tr>
          <%next%>
          <tr>
            <td height="30" colspan="9" align="center" valign="middle"><label>
                <div align="center" style="height:30px; vertical-align:middle" id="dayinDiv" name="dayinDiv"> <a href="#" onclick="printTure();">打印</a>
                    <input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="清空页码" onclick="pagesetup_null()" />
                </div>
              </label></td>
          </tr>
        </table></td>
    </tr>
  </table>
</DIV>
</body>
</html>
