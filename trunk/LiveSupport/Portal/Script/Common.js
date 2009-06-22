window.onerror=function(){return true};

/*****************Gloab Start****************/
var isIE=navigator.userAgent.indexOf("MSIE")>0;

function $Import(path,type,title){ 
 var s,i; 
 if(type=="js"){ 
  var ss=document.getElementsByTagName("script"); 
  for(i=0;i<ss.length;i++){ 
   if(ss[i].src && ss[i].src.indexOf(path)!=-1)return; 
  } 
  s=document.createElement("script"); 
  s.type="text/javascript"; 
  s.src=path; 
 }else if(type=="css"){ 
  var ls=document.getElementsByTagName("link"); 
  for(i=0;i<ls.length;i++){ 
   if(ls[i].href && ls[i].href.indexOf(path)!=-1)return; 
  } 
  s=document.createElement("link"); 
  s.rel="alternate stylesheet"; 
  s.type="text/css"; 
  s.href=path; 
  s.title=title; 
  s.disabled=false; 
 } 
 else return; 
 var head=document.getElementsByTagName("head")[0]; 
 head.appendChild(s); 
}

function ExternalLinks() { 
    if (!document.getElementsByTagName) return; 
    var anchors = document.getElementsByTagName("a"); 
    for (var i=0; i<anchors.length; i++)
    { 
     var anchor = anchors[i]; 
     if (anchor.getAttribute("href") && (anchor.getAttribute("rel") == "external" || anchor.getAttribute("rel") == "ex")) anchor.target = "_blank"; 
    }
}

/******************Gloab End****************/

/*------------Common Use Start-------------*/
function $(obj)
{
    if (typeof(obj) == 'object')
    {
        return obj;
    }
    else
    {
        return document.getElementById(obj);
    }
}

function $Att(element,attribute)
{
    return element.getAttribute(attribute);
}

function $F(id)
{
    var elem = $(id) || id;
    var values=""; 
    var elems=document.getElementsByName(id);
    var type=isIE ? elem.type.toLowerCase() : elems[0].type.toLowerCase();
    switch(type)
    {
        case "select-one":
            values = elem[i].value ? elem[i].value : elem[i].text;
            break;
        case "select-multiple":
            for(var i=0;i<elem.length;i++)
                if(elem[i].selected) values += elem[i].value ? elem[i].value + "," : elem[i].text + ",";
            values=values.substr(0,values.length-1);
            break;
        case "checkbox":
        case "radio":
            for(var i=0;i<elems.length;i++)
                if(elems[i].checked) values += elems[i].value ? elems[i].value + "," : elems[i].text + ",";
            values=values.substr(0,values.length-1);
            break;
        default:
            values = elem.value;
            break;
    }
    return values;
}

function Nothing()
{
}

function $P(str)
{
    document.write(str);
}

function $Q(item)
{
	var sValue=location.search.match(new RegExp("[\?\&]"+item+"=([^\&]*)(\&?)","i"));
	return sValue?sValue.toString().split(",")[1]:null; 
}

function Goto(url)
{
    window.location = url;
}

function GoBack()
{
    history.back();
}

function CenterScreen(width, height, scrollbars, resizable)
{
    var s;
    var w = (screen.width - width) / 2;
    var h = (screen.height - height) / 2;
    s = "height=" + height + ",width=" + width + ",left=" + w + ",top=" + h;
    if (scrollbars)
    {
        s += ",scrollbars=" + scrollbars;
    }
    if (resizable)
    {
        s += ",resizable=" + resizable;
    }
    return s;
}

function VariegationTable(table)  //给某个表上色，css类名为trAlter与trItem
{
    if($(table))
    {
        var oTR = $(table).getElementsByTagName("tr");
        if (oTR)
        {
            for (var i = 1; i < oTR.length; i++)
            {
                oTR[i].rowIndex % 2 == 0 ? oTR[i].className = "trAlter" : oTR[i].className = "trItem";
                oTR[i].onmouseover = function()
                {
                    this.className = "trMouseOver";
                }
                oTR[i].onmouseout = function()
                {
                    this.rowIndex % 2 == 0 ? this.className = "trAlter" : this.className = "trItem";
                }
            }
            oTR[0].className="trTitle";
        }
    }
}


function CheckAll(ckbName)
{
    var arr = document.getElementsByName(ckbName);
    var isCheck = $('ckbAll').checked;
    for (var i=0; i<arr.length; i++)
    {
        arr[i].checked = isCheck;
        Check(arr[i]);
    }
}

function GetCount(ckbName)
{
    var _getCount=0;
    var arr = document.getElementsByName(ckbName);
    for (var i=0; i<arr.length; i++)
    {
        if(arr[i].type == "checkbox" && arr[i].checked)
        {
            _getCount++;
        }
    }
    return _getCount;
}


function RBChecked(rbName)
{
    var arr = document.getElementsByName(rbName);
    for (var i = 0; i < arr.length; i++)
    {
        if (arr[i].type == "radio" && arr[i].checked == true)
        {
            return true;
        }
    }
    return false;
}

function ResizeImg(width)
{
    var imgs=document.getElementsByTagName("img");
    for(var i=0;i<imgs.length;i++)
    {
        if(imgs[i].width>width) imgs[i].width=width;
    }
}

/*-------------Common Use End--------------*/

/*-------------Cookie Handle Start--------------*/
function SetCookie(sName, sValue, fExpires, sPath, sDomain, bSecure)
{
    var expDays = fExpires * 24 * 60 * 60 * 1000;
    var expDate = new Date();
    expDate.setTime(expDate.getTime() + expDays);
    var sCookie = sName + "=" + encodeURIComponent(sValue);
    if (oExpires)
    {
        sCookie += "; expires=" + expDate.toGMTString();
    }
    if (sPath)
    {
        sCookie += "; path=" + sPath;
    }
    if (sDomain)
    {
        sCookie += "; domain=" + sDomain;
    }
    if (bSecure)
    {
        sCookie += "; secure";
    }
    document.cookie = sCookie;
}

function GetCookie(sName)
{
    var sRE = "(?:;)?" + sName + "=([^;]*);?";
    var oRE = new RegExp(sRE);
    if (oRE.test(document.cookie))
    {
        return decodeURIComponent(RegExp["$1"]);
    }
    else
    {
        return null;
    }
}

function ClearCookie(name)
{
    var ThreeDays = 3 * 24 * 60 * 60 * 1000;
    var expDate = new Date();
    expDate.setTime(expDate.getTime() - ThreeDays);
    document.cookie = name + "=;expires=" + expDate.toGMTString();
}
/*-------------Cookie Handle End--------------*/

/*----------------AJAX Start------------------*/
function AjaxRunFunction(newFunction,url)   //newFunction为要执行的函数,将会传入xmlHttp.readyState,xmlHttp.responseText。
{
    var xmlHttp;
    if (window.ActiveXObject)
    {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest)
    {
        xmlHttp = new XMLHttpRequest();
    }
    xmlHttp.open("GET", url, true);
    xmlHttp.onreadystatechange = function()
    {
        newFunction(xmlHttp.readyState,xmlHttp.responseText);
    }
    xmlHttp.send();
}

function Ajax(controlID, url)
{
    control=$(controlID);
    control.innerHTML = '<table align="center" style="height:100%;font-size:15px;color:red;"><tr><td><img src="/Theme/Default/Loading.gif" alt="loading..." />loading...</td></tr></table>';
    var f = function(readyState,responseText)
    {
        if (readyState == 4)
        {
            control.innerHTML = responseText;
        }
    }
    AjaxRunFunction(f,url);
}
/*----------------AJAX End------------------*/


/*------------------Time--------------------*/
// JScript 文件
var timeOfNow;
var timeArray;

function GetTime()
{
    var fun=function(state,text) {
        if (state==4)
        {
           timeOfNow = text;
           timeArray=timeOfNow.split(',');
           timeOfNow=new Date(timeArray[0],timeArray[1],timeArray[2],timeArray[3],timeArray[4],timeArray[5]);
        }
    }
    AjaxRunFunction(fun, "../App_Page/GetTime.ashx?" + Math.random());
}

function ShowTime()
{
    GetTime();
    setInterval("Run();",1000);
}

function Run()
{
    timeOfNow.setSeconds(timeOfNow.getSeconds()+1);
    document.getElementById('time').innerHTML = timeOfNow.format("hh:mm:ss");
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
/*-----------------Time End--------------------------*/

/***************************************************
隐藏指定的区域
trName:区域ID
***************************************************/
function HideObj(objID)
{
	if($(objID).style.display=='none')
		$(objID).style.display='';
	else
		$(objID).style.display='none';
}

function ShowMoreInfo(objImg, objID)
{
	if($(objID).style.display=='none')
	{
		$(objID).style.display='';
		objImg.src = '../Theme/Icon/SubImg.gif';
	}
	else
	{
		$(objID).style.display='none';
		objImg.src = '../Theme/Icon/AddImg.gif';
	}
}
/***************************************************
获取对象的当前位置,
反回:x,y坐标数组
***************************************************/
function GetObjLocation(obj)
{
	var a = [];
	for (var lx=0,ly=0; obj!=null; lx+=obj.offsetLeft,ly+=obj.offsetTop,obj=obj.offsetParent);	
	a[0] = lx;
	a[1] = ly;
	return a;
}
/***************************************************
在某个对象底部显示图片
***************************************************/
var _ObjImg;
function ShowObjImg(obj, img, w, h)
{
    if (!_ObjImg)
    {
        _ObjImg = document.createElement('img');
        _ObjImg.style.position = 'absolute';
        document.body.appendChild(_ObjImg);
    }
    _ObjImg.width = w;
    _ObjImg.height = h;
    _ObjImg.src = img;
    var arr = GetObjLocation(obj);
    _ObjImg.style.left = arr[0] + 'px';
    _ObjImg.style.top = arr[1]*1 + obj.offsetHeight + 'px';
    _ObjImg.style.zIndex = 999;
    _ObjImg.style.display = 'block';
}
function HideObjImg()
{
    if (_ObjImg) _ObjImg.style.display = 'none';
}
/***************************************************
往文本框中追加字符串.
***************************************************/
function AppendStrToInput(sStr, sInputID)
{
    if ($(sInputID) != null)
    {
        if (Instr($(sInputID).value, sStr))
        {
            $(sInputID).value = RemoveStr($(sInputID).value, sStr);
        }
        else
        {
            if ($(sInputID).value.length > 0)
                $(sInputID).value += "," + sStr;
            else
                $(sInputID).value = sStr;
        }
    }
}
function SetStrToInput(sStr, sInputID)
{
    if ($(sInputID) != null)
    {
        $(sInputID).value = sStr;
    }
}
/***************************************************
查换子串.
***************************************************/
function Instr(sStr, sSubStr)
{
    var arrCheckedValue = sStr.split(',');
    for (var i=0; i<arrCheckedValue.length; i++)
    {
        if (arrCheckedValue[i] == sSubStr)
        {
            return true;
        }
    }
	return false;
}
function RemoveStr(sStr, sSubStr)
{
	var arrCheckedValue = sStr.split(',');
	var sNewStr = "";
    for (var i=0; i<arrCheckedValue.length; i++)
    {
        if (arrCheckedValue[i] != sSubStr)
        {
            if (sNewStr == "")
            {
				sNewStr = arrCheckedValue[i];
            }
			else
			{
				sNewStr += "," + arrCheckedValue[i];
			}
        }
    }
	return sNewStr;
}
/**********************************************
显示模态窗体
***********************************************/
function showDialog(url,width,height,vArguments)
{
	if (url.indexOf('?') > -1)
	{
		url += "&rnd=" + Math.round(Math.random()*10000);
	}
	else
	{
		url += "?rnd=" + Math.round(Math.random()*10000);
	}
	if (document.all)
	{
		var value = showModalDialog(url, vArguments, "dialogWidth:"+width+"px; dialogHeight:"+height+"px; status:0;help:0;");
		return value;
	}
	else
	{
		window.open(url,'','width=' + width + ',height=' + height + ',scrollbars=yes');	
		window.FFDialogArgument = vArguments;
	}
}
function CopyText(sFromID, sToID)
{
    $(sToID).value = $(sFromID).value;
}

/***************************************************
多标签
***************************************************/
function ActiveTab(obj)
{
	var objTabMenu = obj.parentNode.parentNode;
	var iCurrTabIndex;
	var objTabList;
	if (document.all)
	{
		objTabList = objTabMenu.parentNode.lastChild;
	}
	else
	{
		objTabList = objTabMenu.parentNode.childNodes[3];
	}
	for (var i=0; i<objTabMenu.childNodes.length; i++)
	{
		if (objTabMenu.childNodes[i].firstChild == obj)
		{
			iCurrTabIndex = i;
		}
		if (objTabMenu.childNodes[i].tagName && (objTabMenu.childNodes[i].className=='tabButtonActive' || objTabMenu.childNodes[i].className=='tabButton'))
		{
			objTabMenu.childNodes[i].className = 'tabButton';
			objTabList.childNodes[i].style.display = 'none';
		}
	}
	
	obj.parentNode.className = 'tabButtonActive';
	objTabList.childNodes[iCurrTabIndex].style.display = 'block';
}

function DisplayMenu(menuID, currTitle)
{
	var obj = $(menuID);
	if(obj.style.display=="")
	{
	    obj.style.display="none";
	    currTitle.className = "";
	    return;
	}
	for (var i=0; i<obj.parentNode.childNodes.length; i++)
	{
		if (obj.parentNode.childNodes[i].tagName == "UL")
		{
			obj.parentNode.childNodes[i].style.display = "none";
		}
		if (obj.parentNode.childNodes[i].tagName == "SPAN")
		{
			obj.parentNode.childNodes[i].className = "";
		}
	}
	currTitle.className = "activeMenu";
	obj.style.display = "";
}

var scrollInterval;
function Scroll(num)
{
scrollInterval = setInterval("$('divMenuList').scrollTop +=" + num, 20);
}

/*file*/
var _progressWin;
var _submited=false;
function OpenUploadProgress(guid,allowtype)
{
    var allow=","+allowtype+",";
    var url="UploadStatusBar.aspx?UploadGUID="+guid;
    if(_submited)
    {
        event.srcElement.disabled = true;
        return false;
    }
    else
    {
        var ary = document.getElementsByTagName('INPUT');
        var openBar = false;
        for(var i=0;i<ary.length;i++)
        {
            var obj = ary[i];
            if(obj.type  != 'file') continue;
            if(obj.value != '')
            {
                if(obj.value.indexOf(',')>-1)
                {
                    SetTipBoxText('Result','对不起！文件名中含有非法字符逗号！');
                    return false;
                }
                var s = ','+obj.value.toLowerCase().substring(obj.value.lastIndexOf('.')+1)+',';
                if(allow.indexOf(s)<0)
                {
                    SetTipBoxText('Result','对不起！请上传类型为<br />['+allowtype+']<br />的文件！');
                    return false;
                }
                openBar = true;
            }
        }
        if(openBar)
        {
            for(var i=0;i<ary.length;i++)
            {
                var obj = ary[i];
                if(obj.type  != 'file') continue;
                if(obj.value != '')
                {
                    for(var j=i+1;j<ary.length;j++)
                    {
                        if(ary[j].type  != 'file') continue;
                        if(ary[i].value == ary[j].value)
                        {
                            SetTipBoxText('Result','[对不起！请不要上传重复的文件！]');
                            return false;
                        }
                    }
                }
            }
            _submited = true;
            if(isIE)
            {
                _progressWin =	window.showModelessDialog(url, window, 'status:no;help:no;resizable:no;scroll:no;dialogWidth:398px;dialogHeight:200px');
            }
            else
            {
                var swd = window.screen.availWidth;
                var sht = window.screen.availHeight;
                var wd = 398;
                var ht =170;
                var left = (swd-wd)/2;
                var top = (sht-ht)/2;
                _progressWin =	window.open(url,'_blank','status=no,toolbar=no,menubar=no,location=no,height='+ht+',width='+wd+',left='+left+',top='+top, true);
            }
            return true;
        }
        else
        {
            SetTipBoxText('Result','[对不起！请选择要上传的文件！]');
            return false;
        }
    }
}

function SetHomePage(obj,url)
{
    var strHref=window.location.href;
    obj.style.behavior='url(#default#homepage)';
    obj.setHomePage(url);
}




//title提示框
document.write('<div id=\"pltsTipLayer\" style="display: none;position: absolute; z-index:10001"></div>');
var pltsPop,toolTip,pltsPoptop,pltsPopbot,topLeft,botLeft,topRight,botRight;
var pltsoffsetX = 10; // 弹出窗口位于鼠标左侧或者右侧的距离；3-12 合适
var pltsoffsetY = 15; // 弹出窗口位于鼠标下方的距离；3-12 合适
var pltsTitle="";
var pltsTipLayer=$("pltsTipLayer");

var tipTemp;

function PltsMouseOver(ev)
{	
	if(!pltsTipLayer)pltsTipLayer=$("pltsTipLayer");
    var Event=ev||window.event;
    var o=Event.srcElement || Event.target;
    if(o.alt!=null && o.alt!=""){o.dypop=o.alt;tipTemp=o.alt;o.alt="";};
    if(o.title!=null && o.title!=""){o.dypop=o.title;tipTemp=o.title;o.title="";};
    pltsPop=o.dypop;
    if(pltsPop!=null&&pltsPop!=""&&typeof(pltsPop)!="undefined")
    {
        pltsTipLayer.style.left=-1000;
        pltsTipLayer.style.display='';
        var Msg=pltsPop.replace(/\n/g,"<br/>");
        Msg=Msg.replace(/\0x13/g,"<br/>");
        var re=/\{(.[^\{]*)\}/ig;
        if(!re.test(Msg))
        {
            pltsTitle="<label style=\"color:#ffffff\">简介</label>";
        }
        else
        {
            re=/\{(.[^\{]*)\}(.*)/ig;
            pltsTitle=Msg.replace(re,"$1")+" ";
            re=/\{(.[^\{]*)\}/ig;
            Msg=Msg.replace(re,"");
        }
        var content = "<dl id=\"toolTip\" style=\"-moz-opacity:0.85;opacity:0.85;FILTER:alpha(opacity=85);padding:2px;background:#fff;\"><dd id=\"pltsPoptop\" class=\"toolTipTitle\" style=\"line-height:20px;\"><p id=\"topLeft\" class=\"left\"><b><label style=\"color:#ffffff\">↖</label>"+pltsTitle+"</b></p><p id=\"topRight\" class=\"right\" style=\"display:none\"><b>"+pltsTitle+"<label style=\"color:#ffffff\">↗</label ></b></p></dd><dd class=\"toolTipMsg\">"+Msg+"</dd><dd id=\"pltsPopbot\" style=\"display:none\" class=\"toolTipTitle\"><p id=\"botLeft\" class=\"left\"><b><label style=\"color:#ffffff\">↙</label >"+pltsTitle+"</b></p><p id=\"botRight\" class=\"right\" style=\"display:none\"><b>"+pltsTitle+"<label style=\"color:#ffffff\">↘</label></b></p></dd></dl>";
        pltsTipLayer.innerHTML=content;
        toolTip=$("toolTip");
        pltsPoptop=$("pltsPoptop");
        pltsPopbot=$("pltsPopbot");
        topLeft=$("topLeft");
        botLeft=$("botLeft");
        topRight=$("topRight");
        botRight=$("botRight");
        toolTip.style.width=Math.min(pltsTipLayer.clientWidth,document.documentElement.clientWidth/2.2)+"px";
    }
    else
    {
        pltsTipLayer.innerHTML='';
        pltsTipLayer.style.display='none';
    }
}

function PltsMouseMove(ev)
{
	if(!pltsTipLayer)pltsTipLayer=$("pltsTipLayer");
    if(pltsTipLayer.innerHTML=='')return true;
    var Event=ev||window.event;
    var MouseX=Event.clientX;
    var MouseY=Event.clientY;
    var popHeight=pltsTipLayer.clientHeight;
    var popWidth=pltsTipLayer.clientWidth;

    if(MouseY+pltsoffsetY+popHeight>document.documentElement.clientHeight)
    {
        popTopAdjust=-popHeight-pltsoffsetY*1.5;
        pltsPoptop.style.display="none";
        pltsPopbot.style.display="";
    }
    else
    {
        popTopAdjust=0;
        pltsPoptop.style.display="";
        pltsPopbot.style.display="none";
    }
    if(MouseX+pltsoffsetX+popWidth>document.documentElement.clientWidth)
    {
        popLeftAdjust=-popWidth-pltsoffsetX*2;
        topLeft.style.display="none";
        botLeft.style.display="none";
        topRight.style.display="";
        botRight.style.display="";
    }
    else
    {
        popLeftAdjust=0;
        topLeft.style.display="";
        botLeft.style.display="";
        topRight.style.display="none";
        botRight.style.display="none";
    }
    pltsTipLayer.style.left=MouseX+pltsoffsetX+document.documentElement.scrollLeft+popLeftAdjust+"px";
    pltsTipLayer.style.top=MouseY+pltsoffsetY+document.documentElement.scrollTop+popTopAdjust+"px";
    return true;
}

function PltsMouseOut(ev)
{
    if(!pltsTipLayer)pltsTipLayer=$("pltsTipLayer");
    var Event=ev||window.event;
    var o=Event.srcElement || Event.target;
    pltsPop=o.dypop;
    if(pltsPop!=null&&pltsPop!=""&&typeof(pltsPop)!="undefined")
    {
        if(tipTemp!=null && tipTemp!=""){o.title=tipTemp;};
    }
}

function PltsInit()
{
    document.onmouseover = PltsMouseOver;
    document.onmousemove = PltsMouseMove;
    document.onmouseout = PltsMouseOut;
}

PltsInit();
