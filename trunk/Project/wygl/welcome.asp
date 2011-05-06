<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="Safe/conn.asp"-->
<!--#INCLUDE FILE="Safe/md5.asp"-->
<!--#INCLUDE FILE="Safe/nrbh.asp"-->
<!--#INCLUDE FILE="Safe/upload.inc"--> 
<%
set rs=server.createobject("adodb.recordset")
sql="select * from unit where id=1"
rs.open sql,conn,3,2
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<SCRIPT src="js/Unit.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/lj.js" type=text/javascript></SCRIPT>
<style type="text/css">
<!--
body,td,th {
	font-size: 9pt;
	color: #000000;
}
body {
	margin-left: 0px;
	margin-top: 20px;
	margin-right: 0px;
	margin-bottom: 20px;
}
a {
	font-size: 9pt;
}

#add {
position:absolute;
float:inherit;
width:200px;
height:100px;
background-color:#FFFFFF;

border:solid 1px ;
}
#titleadd {
position:relative;
background-color:#3F496D;
text-align:center;
width:200;
height:20px;
cursor:move;
}
a {evt:expression(window.status='深圳市兴联兴投资有限公司')}
.STYLE3 {
	font-size: 14pt;
	font-weight: bold;
}
.STYLE7 {font-size: 10pt}
-->
</style>
<script language="javascript">
function drag(o,k){
k.onselectstart=function() {return(false)};
k.onmousedown=function(e){
e=e||window.event;
var x=e.layerX||e.offsetX;
var y=e.layerY||e.offsetY;
document.onmousemove=function(e){                                
e=e||window.event;
o.style.left=(e.clientX-x)+"px";
o.style.top=(e.clientY-y)+"px";
};
document.onmouseup=function(){document.onmousemove=null;};
};
}
</script>
</head>

<body style="width:100%">
<center><img src="images/welcome.jpg" height="400" />
</center>
<div id="add" style="display:none">
<div id="titleadd">
<table width="100%" height="100%">
<tr><td align="left">网站LOGO上传</td>
<td align="right">
<span style="cursor:hand;">
<img src="../system_images/close.gif"  height="17" onClick="add.style.display='none'"/>
</span>
</td></tr></table></div>
<div id="content">

</div>
</div>
</body>
</html>