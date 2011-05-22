<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print.aspx.cs" Inherits="Print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        #tab2 tr td
        {
            border-bottom:1px solid #000000; 
            border-right:1px solid #000000;
            	
        }
        
        body
        {
        	font-size:12px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
    
    <script type="text/javascript">
        function print1() {
            $("input").hide();
            print();
        }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <table id="tab1" width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000">
            <span>
                <span style="font-size:16px;font-weight:bold;">深圳市兴联兴投资有限公司        &nbsp;&nbsp;收款收据       &nbsp;</span>&nbsp;
            </span>
        </td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;合同编号：      &nbsp;&nbsp;工业园名称：     &nbsp;&nbsp;房产类型：       &nbsp;&nbsp;所属房产：      &nbsp;</td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;用户名称：      &nbsp;&nbsp;用户编码：       &nbsp;</td>
        </tr>
    </table>
    <table id="tab2" width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #000000;">
        <tr>
          <td height="30" align="center" valign="middle"><strong>编号</strong></td>
          <td height="30" align="center" valign="middle"><strong>消费项目</strong></td>
          <td height="30" align="center" valign="middle"><strong><strong>上月读数</strong></strong></td>
          <td height="30" align="center" valign="middle"><strong><strong>本月读数</strong></strong></td>
          <td width="67" align="center" valign="middle"><strong>倍率</strong></td>
          <td width="67" align="center" valign="middle"><strong>损耗</strong></td>
          <td align="center" valign="middle"><strong>总量</strong></td>
          <td align="center" valign="middle"><strong>值</strong></td>
          <td align="center" valign="middle"><strong><strong><strong>滞纳金</strong></strong></strong></td>
          <td align="center" valign="middle"><strong>费用</strong></td>
          <td align="center" valign="middle"><strong>说明</strong></td>
        </tr>
        
         <tr>
          <td height="30" align="center" valign="middle"><!--编号 --></td>
          <td height="30" align="center" valign="middle"><!--消费项目 --></td>
          <td height="30" align="center" valign="middle"><!--上月读数 --></td>
          <td height="30" align="center" valign="middle"><!--本月读数 --></td>
          <td width="67" align="center" valign="middle"><!--倍率 --></td>
          <td width="67" align="center" valign="middle"><!--损耗 --></td>
          <td align="center" valign="middle"><!--总量 --></td>
          <td align="center" valign="middle"><!--值 --></td>
          <td align="center" valign="middle"><!--滞纳金 --></td>
          <td align="center" valign="middle"><!--费用 --></td>
          <td align="center" valign="middle"><!--说明 --></td>
        </tr>
        
        <tr>
          <td height="40" colspan="12" align="left" valign="middle" style="border-bottom:1px solid #000000">&nbsp;&nbsp;
		      总金额：￥          &nbsp;&nbsp;
		      上次结余：￥        &nbsp;&nbsp;
		      需要交费金额：￥    &nbsp;&nbsp;
		  </td>
        </tr>
    </table>
    
    <table id="tab3" width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="right" valign="middle">开票人：      &nbsp;&nbsp;开票时间：      &nbsp;&nbsp;</td>
        </tr>
    </table>
    <div style="text-align:center">
        <input type="button"  onclick="print1()" value="打印"/>
    </div>
</body>
</html>
