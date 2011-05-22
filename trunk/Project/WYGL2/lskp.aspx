<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lskp.aspx.cs" Inherits="lskp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        body
        {
        	font-size:11px;
        }
        
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
    <script type="text/javascript">
        function getVal() {            
            var nu = $("#number").val();
            for (i=0;i<=nu;i++){
                var t = "#tr"+i;
                $(t).clone(true).attr("id","tr"+(i+1)).insertAfter(t);                 
                             
            } 
            
           
        }
       
       function print1() {
           $("input").hide();
           $("button").hide();
           $("#line").hide();
           $("input").each(function (i) {
                if ($(this).attr("id") == "__VIEWSTATE") return;
                $(this).after("<span>"+$(this).val()+"</span>");                
           });
           
           print();
       }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    
    <div id="div1" style="padding-top:10px;">
        <table style="width:90%; border:0; align:center; cellpadding:0; cellspacing:0;">
            <tr>
                <td height="40" align="center" valign="middle" style="border-bottom:1px solid #000000">
                    <span class="STYLE2">
                        <span class="STYLE3" style="font-size:14px;font-weight:bold">深圳市兴联兴投资有限公司&nbsp;<input type="text" /> &nbsp;收款收据&nbsp;( <input type="text" /> - <input type="text" /> )</span>&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
              <td height="30">&nbsp;&nbsp;&nbsp;收据编码：<input type="text" /> &nbsp;&nbsp;客户名称：<input type="text" /> </td>
            </tr>
            <tr>
              <td height="30">&nbsp;&nbsp;&nbsp;工业园名称：<input type="text" />&nbsp;&nbsp;&nbsp;房产类型：&nbsp;&nbsp;<input type="text" /> &nbsp;&nbsp;房产：<input type="text" /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div id="line" style="float:right;">生成<input id="number" type="text" style="width:30px;"/>行 <button value="生成" onclick="getVal()">生成</button></div> </td>
            </tr>
        </table>
    </div>
    
    <div id="div2" style="padding-top:20px;">
        <table id="tb2" width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #000000;">
            <tr style="font-size:12px;">
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>费用名称</strong></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>前次读数</strong></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>本次读数</strong></strong></td>
              <td height="30" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong>本月读数</strong></strong></td>
              <td width="67" align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>损耗</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>总量</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>单价</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>本期金额</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong>欠款金额</strong></td>
              <td align="center" valign="middle" style="border-bottom:1px solid #000000; border-right:1px solid #000000"><strong><strong><strong>滞纳金</strong></strong></strong></td>
            </tr>
            
            <tr id="tr0">
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
              
            </tr>
            
         </table>
         <div style="text-align:center;padding-top:20px;" >
            <button onclick="print1()">打印</button>
         </div>
         
    </div>
</body>
</html>
