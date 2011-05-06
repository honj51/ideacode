  
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
    var   str   =   y2000(thisYear)+'��';   
    
    if   (thisMonth<   10)     
    str   +=   '0';     
    str   +=   thisMonth   +   '��';     
    
    if   (thisDay<   10)     
    str   +=   '0';     
    str   +=   thisDay   +   '��';   
      
if(today   ==   0)   
    str   +=   '   ������';   
    else   if(today   ==   1)   
    str   +=   '   ����һ';   
    else   if(today   ==   2)   
    str   +=   '   ���ڶ�';   
    else   if(today   ==   3)   
    str   +=   '   ������';   
    else   if(today   ==   4)   
    str   +=   '   ������';   
    else   if(today   ==   5)   
    str   +=   '   ������';   
    else   if(today   ==   6)   
    str   +=   '   ������';   
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
xfile = "��ҹ";
} else if (intHours < 12) {
hours = intHours+":";
xfile = "����";
} else if (intHours == 12) {
hours = "12:";
xfile = "����";
} else {
intHours = intHours - 12
hours = intHours + ":";
xfile = "����";
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