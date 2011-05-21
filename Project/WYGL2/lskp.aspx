<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lskp.aspx.cs" Inherits="lskp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        #div1 input 
        {
            width:100px;	
        }
         #div2 input 
        {
            width:50px;	
        }
        
    </style>
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    
    <div id="div1" style="padding-top:10px;">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000">
                    <span class="STYLE2">
                        <span class="STYLE3">深圳市兴联兴投资有限公司&nbsp;<input type="text" /> &nbsp;收款收据&nbsp;( <input type="text" /> - <input type="text" /> )</span>&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
              <td height="30">&nbsp;&nbsp;&nbsp;合同编号：<input type="text" /> &nbsp;&nbsp;工业园名称：<input type="text" /> &nbsp;&nbsp;房产类型：<input type="text" /> &nbsp;&nbsp;所属房产：<input type="text" /> &nbsp;</td>
            </tr>
            <tr>
              <td height="30">&nbsp;&nbsp;&nbsp;用户名称：<input type="text" />&nbsp;&nbsp;&nbsp;用户编码：&nbsp;&nbsp;<input type="text" /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;生成<input type="text" style="width:30px;"/>行 <button value="生成">生成</button></td>
            </tr>
        </table>
    </div>
    
    <div id="div2" style="padding-top:30px;">
        <table width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #000000;">
            <tr>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>编号</strong></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>消费项目</strong></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>上月读数</strong></strong></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>本月读数</strong></strong></td>
              <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>倍率</strong></td>
              <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>损耗</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>总量</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>值</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong><strong>滞纳金</strong></strong></strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>费用</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; "><strong>说明</strong></td>
            </tr>
            
            <tr>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><input type="text"/></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; "><input type="text"/></td>
            </tr>
            
         </table>
    </div>
</body>
</html>
