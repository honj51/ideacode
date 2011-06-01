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
    <script src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    <script type="text/javascript">
function print1() {
    $("input").hide();
    $("#bz").hide();
    $("#bz").after("<span>"+$("#bz").val()+"</span>");
    $("#btn").hide()
    $("#select").hide();
    $("#title").after("<span>"+$("#op1").html()+"</span>");
    print();
}

function save_remark() {    
    $.post('',{action:'save_remark',remark:$("#bz").val()},function () {
        alert('保存成功！');
    }); 
}

var makrup = "<tr>"+
      "<td height='30' align='center' valign='middle'>${序号}</td>"+
      "<td height='30' align='center' valign='middle'>${收费项目}</td>"+
      "<td height='30' align='center' valign='middle'>${上月读数}</td>"+
      "<td height='30' align='center' valign='middle'>${本月读数}</td>"+
      "<td width='67' align='center' valign='middle'>${倍率}</td>"+
      "<td width='67' align='center' valign='middle'>${损耗}</td>"+
      "<td align='center' valign='middle'>${总量}</td>"+
      "<td align='center' valign='middle'>${值}</td>"+
      "<td align='center' valign='middle'>${滞纳金}</td>"+
      "<td align='center' valign='middle'>${费用}</td>"+
      "<td align='center' valign='middle'>${说明}</td>"+
    "</tr>";    
    
$.template( "dataTemplate", makrup);

var fs = ['合同编号','所属工业园','房产类型','所属房产','客户名称','客户编码','总金额','上次结余','需要交费金额'];
var dataUrl = '<%=dataUrl%>';
$.get(dataUrl, function(data){
    $.tmpl( "dataTemplate", data.data ).appendTo( "#dataList" );
    for(var i=0;i< fs.length;i++) {
        $("#v"+(i+1)).html(''+data[fs[i]]);
    }
});

function update() {
    var name = prompt("请输入公司名字","");
   // alert($("#op1").val());
    $("#op1").html(name);
    
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
            <span style="font-size:16px;font-weight:bold;">
                <span id="title" style="font-size:16px;font-weight:bold;">
                    <select size="1" id="select" name="select">
                        <option id="op1">深圳市兴联兴投资有限公司</option>
                        <option>xxxxxx投资有限公司</option>
                        <option>wwwwww投资有限公司</option>
                    </select> 
                    <button id="btn" onclick="update()">修改</button>        
                    
                </span>&nbsp;&nbsp;&nbsp;&nbsp;收款收据       &nbsp;&nbsp;
            </span>
            
            
            
        </td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;合同编号： <span id="v1"></span>     &nbsp;&nbsp;工业园名称： <span id="v2"></span>    &nbsp;&nbsp;房产类型： <span id="v3"></span>      &nbsp;&nbsp;所属房产： <span id="v4"></span>      &nbsp;</td>
        </tr>
        <tr>
          <td height="30">&nbsp;&nbsp;&nbsp;用户名称：<span id="v5"></span>      &nbsp;&nbsp;用户编码： <span id="v6"></span>      &nbsp;</td>
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
        
<%--         <tr>
          <td height="30" align="center" valign="middle"><!--编号--></td>
          <td height="30" align="center" valign="middle"><!--消费项目--></td>
          <td height="30" align="center" valign="middle"><!--上月读数--></td>
          <td height="30" align="center" valign="middle"><!--本月读数--></td>
          <td width="67" align="center" valign="middle"><!--倍率--></td>
          <td width="67" align="center" valign="middle"><!--损耗--></td>
          <td align="center" valign="middle"><!--总量--></td>
          <td align="center" valign="middle"><!--值--></td>
          <td align="center" valign="middle"><!--滞纳金--></td>
          <td align="center" valign="middle"><!--费用--></td>
          <td align="center" valign="middle"><!--说明--></td>
        </tr>--%>
        <tbody id="dataList"></tbody>
        
        <tr>
          <td height="40" colspan="12" align="left" valign="middle" style="border-bottom:1px solid #000000">&nbsp;&nbsp;
		      总金额：￥ <span id="v7"></span>         &nbsp;&nbsp;
		      上次结余：￥ <span id="v8"></span>       &nbsp;&nbsp;
		      需要交费金额：￥ <span id="v9"></span>   &nbsp;&nbsp;
		  </td>
        </tr>
        <tr>
            <td colspan="12" >
            备注：<textarea id="bz" cols="80" rows="3" ><%=beizu%></textarea>
            <input type="button"  onclick="save_remark()" value="保存备注"/>
            </td>
        </tr>
    </table>
    
    <table id="tab3" width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="right" valign="middle">开票人： <%=user%>     &nbsp;&nbsp;开票时间： <%=dt%>     &nbsp;&nbsp;</td>
        </tr>
    </table>
    <div style="text-align:center">
        <input type="button"  onclick="print1()" value="打印"/>
    </div>
</body>
</html>
