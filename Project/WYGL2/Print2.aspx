<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print2.aspx.cs" Inherits="Print2" %>

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
        .zj
        {
        	float:right;
        	margin-right:10px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    <script type="text/javascript">
    jQuery(function($) {
  
      var makrup = "<tr>"+
          "<td height='30' align='center' valign='middle'>${序号}</td>"+
          "<td height='30' align='center' valign='middle'>${工业园名称}</td>"+
          "<td height='30' align='center' valign='middle'>${房产类型}</td>"+
          "<td height='30' align='center' valign='middle'>${消费项目}</td>"+
          "<td align='center' valign='middle'>${月份}</td>"+
          "<td align='center' valign='middle'>${费用}</td>"+
        "</tr>";
      $.template( "dataTemplate", makrup);

      var dataUrl = '<%=dataUrl%>';
      $.get(dataUrl, function(data){
         $.tmpl( "dataTemplate", data ).appendTo( "#dataList" );
    });   

    });
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
          <td height="35" align="center" valign="middle" style="border-bottom:1px solid #000000">
            <span style="font-size:16px;font-weight:bold;">深圳市兴联兴投资有限公司</span>
          </td>
        </tr>
        <tr>
          <td height="10"></td>
        </tr>
       
    </table>
    <table id="tab2" width="90%" align="center" cellpadding="0" cellspacing="0"  style="border:1px solid  #000000;">
        <tr>
          <td height="30" align="center" valign="middle"><strong>序号</strong></td>
          <td height="30" align="center" valign="middle"><strong>工业园名称</strong></td>
          <td height="30" align="center" valign="middle"><strong><strong>房产类型</strong></strong></td>
          <td height="30" align="center" valign="middle"><strong><strong>消费项目</strong></strong></td>
          <td align="center" valign="middle"><strong>月份</strong></td>
          <td align="center" valign="middle"><strong>费用</strong></td>
        </tr>
        <tbody id="dataList"></tbody>
        <tr>
          
        </tr>
    </table>
    <div style="text-align:center">
        <input type="button"  onclick="print1()" value="打印"/>
    </div>
</body>
</html>
