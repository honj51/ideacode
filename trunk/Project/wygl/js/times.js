  
function   y2000(number)   {     
    return   (number<   1000)   ?   number   +   1900   :   number;     
}   
      
function   getTime()   {     
    var   LocalNow   =   new   Date();     
    var   AbsoluteNow   =   new   Date();     
    AbsoluteNow.setTime(LocalNow.getTime()   +   LocalNow.getTimezoneOffset()*60);     
    //alert(LocalNow.getTimezoneOffset());     
    var   pekingDate   =   new   Date();     
    pekingDate.setTime(AbsoluteNow.getTime()+8*3600);     
    var   thisYear   =   pekingDate.getYear();     
    var   thisMonth   =   pekingDate.getMonth()   +   1;     
    var   thisDay   =   pekingDate.getDate();     
    var   today   =   pekingDate.getDay();   
    var   str   =   y2000(thisYear)+'年';   
    
    if   (thisMonth<   10)     
    str   +=   '0';     
    str   +=   thisMonth   +   '月';     
    
    if   (thisDay<   10)     
    str   +=   '0';     
    str   +=   thisDay   +   '日';   
      
if(today   ==   0)   
    str   +=   '   星期天';   
    else   if(today   ==   1)   
    str   +=   '   星期一';   
    else   if(today   ==   2)   
    str   +=   '   星期二';   
    else   if(today   ==   3)   
    str   +=   '   星期三';   
    else   if(today   ==   4)   
    str   +=   '   星期四';   
    else   if(today   ==   5)   
    str   +=   '   星期五';   
    else   if(today   ==   6)   
    str   +=   '   星期六';   
    return   str;     
}   
    
function   displayTime()   {     
    var   timeStr   =   getTime();     
    document.write(timeStr);     
}   
    
function   MM_preloadsystem_images()   {   //v3.0   
      var   d=document;   if(d.system_images){   if(!d.MM_p)   d.MM_p=new   Array();   
          var   i,j=d.MM_p.length,a=MM_preloadsystem_images.arguments;   for(i=0;   i<A.length;   i++); 
          if   (a[i].indexOf("#")!=0){   d.MM_p[j]=new   Image;   d.MM_p[j++].src=a[i];}}   
}   





function tick() {
var hours, minutes, seconds, xfile;
var intHours, intMinutes, intSeconds;
var today;
today = new Date();
intHours = today.getHours();
intMinutes = today.getMinutes();
intSeconds = today.getSeconds();
if (intHours == 0) {
hours = "12:";
xfile = "午夜";
} else if (intHours < 12) {
hours = intHours+":";
xfile = "上午";
} else if (intHours == 12) {
hours = "12:";
xfile = "正午";
} else {
intHours = intHours - 12
hours = intHours + ":";
xfile = "下午";
}
if (intMinutes < 10) {
minutes = "0"+intMinutes+":";
} else {
minutes = intMinutes+":";
}
if (intSeconds < 10) {
seconds = "0"+intSeconds+" ";
} else {
seconds = intSeconds+" ";
}
timeString = xfile+hours+minutes+seconds;
Clock.innerHTML = timeString;
window.setTimeout("tick();", 100);
}
window.onload = tick;