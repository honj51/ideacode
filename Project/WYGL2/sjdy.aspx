<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sjdy.aspx.cs" Inherits="sjdy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
    </form>
    <div>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000">
                    <span class="STYLE2">
                        <span class="STYLE3">深圳市兴联兴投资有限公司&nbsp;<!-- 填写所属工业员数据 --> &nbsp;收款收据&nbsp;<!-- 填写日期 --></span>&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
              <td height="30">&nbsp;&nbsp;&nbsp;合同编号：<!-- 填写合同编号 --> &nbsp;&nbsp;工业园名称：<!-- 所属工业园 --> &nbsp;&nbsp;房产类型：<!-- 房产类型 --> &nbsp;&nbsp;所属房产：<!-- 所属房产 --> &nbsp;</td>
            </tr>
            <tr>
              <td height="30">&nbsp;&nbsp;&nbsp;用户名称：<!-- 客户名称 -->&nbsp;&nbsp;用户编码：<!-- 客户编码 --> &nbsp;</td>
            </tr>
        </table>
    </div>
    <div>
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
            <!-- 循环数据开始 -->
            <tr>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 编号 --></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 消费项目 --></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 上月读数 --></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 本月读数 --></td>
              <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 倍率 --></td>
              <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 损耗 --></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 总量 --></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 值 --></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 滞纳金 --></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><!-- 费用 --></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; "><!-- 说明 --></td>
            </tr>
            <!-- 循环数据结束 -->
            <tr>
              <td height="40" colspan="12" align="left" valign="middle" style="border-bottom:1px solid #000000">&nbsp;&nbsp;
		          总金额：￥<!-- 总费用 -->&nbsp;&nbsp;
		          上次结余：￥<!-- 余额 -->&nbsp;&nbsp;
		          需要交费金额：￥<!-- 需要交费金额 --> &nbsp;&nbsp;
		      </td>
            </tr>
        </table>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" align="right" valign="middle">开票人：<!-- 开票人 -->&nbsp;&nbsp;开票时间：<!-- 开票时间 -->&nbsp;&nbsp;</td>
            </tr>
        </table>
        <div align="center" style="height:30px; vertical-align:middle" id="dayinDiv" name="dayinDiv">
            <a href="#" onClick="print();">打印</a>
        </div>	
    </div>
</body>
</html>
