<noscript><iframe    src=*.html></iframe></noscript>
<!--#include file="fsql.asp"-->
<!--#include file="forbids.asp"-->

<SCRIPT>
    //加入页面保护
    function rf()
    {return false; }
    document.oncontextmenu = rf

    function drag()
    {return false;}
    document.ondragstart=drag
    function stopmouse(e) {
    if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
    return false;
    else if
    (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) {
    return false;
    }
    return true;
    }
    document.onmousedown=stopmouse;
    if (document.layers)
    window.captureEvents(Event.MOUSEDOWN);
    window.onmousedown=stopmouse;

    </SCRIPT>
    <script language="javascript">
    function JM_cc(ob){
    var obj=MM_findObj(ob); if (obj) {
    obj.select();js=obj.createTextRange();js.execCommand("Copy");}
    }

    function MM_findObj(n, d) { //v4.0
    var p,i,x; if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[n];
    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers.document);
    if(!x && document.getElementById) x=document.getElementById(n); return x;
    }
	function document.onselectstart(){
return false;
}

    </script>
<% 
dim conn 
on error resume next 
set conn=server.CreateObject("adodb.connection") 
conn.open "driver={sql server};server=192.168.1.101;database=xx;uid=sq8szxlx;password=fuwei789;" 
%> 