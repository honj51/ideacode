// JScript 文件
var t;
var timeArray;
var posted=false;
var just15=false;
var just3=false;
var remain;
var sss="True";
function GetTime()
{
var xmlHttp;
if (window.ActiveXObject) {
xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
} 
else if (window.XMLHttpRequest) {
xmlHttp = new XMLHttpRequest();
}
xmlHttp.open("GET", "../App_Page/GetTime.ashx?" + Math.random(), true);
xmlHttp.onreadystatechange=function() {
    if (xmlHttp.readyState==4)
    {
       t = xmlHttp.responseText;
       timeArray=t.split(',');
       t=new Date(timeArray[0],timeArray[1],timeArray[2],timeArray[3],timeArray[4],timeArray[5]);
    }
}
xmlHttp.send();
}

function ShowTime()
{
    GetTime();
    setInterval("Run();",1000);
}

function Run()
{
    t.setSeconds(t.getSeconds()+1);
    document.getElementById('time').innerHTML = t.format("yyyy-MM-dd hh:mm:ss");
}

Date.prototype.format = function(format) //author: meizz
{
  var o = {
    "M+" : this.getMonth(), //month
    "d+" : this.getDate(),    //day
    "h+" : this.getHours(),   //hour
    "m+" : this.getMinutes(), //minute
    "s+" : this.getSeconds(), //second
    "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
    "S" : this.getMilliseconds() //millisecond
  }
  if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
    (this.getFullYear()+"").substr(4 - RegExp.$1.length));
  for(var k in o)if(new RegExp("("+ k +")").test(format))
    format = format.replace(RegExp.$1,
      RegExp.$1.length==1 ? o[k] : 
        ("00"+ o[k]).substr((""+ o[k]).length));
  return format;
}