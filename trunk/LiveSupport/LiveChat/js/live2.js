/// <reference path="jquery-1.2.6-vsdoc.js" />
    var currentMoveObj = null;         //当前拖动对象   
    var relLeft;                           //鼠标按下位置相对对象位置
    var relTop;
    var accountId = null;
    var visitorId = getVisitorId();
    var chatId = "";
    var t = setInterval(hitWebSite, 1000);
    //var t = setInterval(acceptInvitation, 1000);
    var homeUrl = "http://localhost:3355/livechat";
    //var homeUrl = "http://rd01/livechatservice";
    document.write("<script type=\"text/javascript\" language=\"javascript\" src=\"" + homeUrl + "/js/jquery-1.2.6.js\"></script>");
    document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="'+ homeUrl + '/ProcessImage.ashx?aid=' + accountId + '&vid=' + visitorId + '&referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>');
    //$(document).ready(function() { setInterval(hitWebSite, 1000) });
    /*** 主动邀请窗口 ***/
    document.write('<div id="invite_panel" style="z-index:108;cursor:move;display:none;border:1px solid #339966;width:300px;width:300px;height:100px;left:50%;top:50%;margin-left:-220px;margin-top:-50px;position:fixed;_position:absolute;_left:expression(eval(document.documentElement.clientHeight==0?document.body.offsetWidth:document.documentElement.clientWidth)/2);_top:expression(eval(document.documentElement.clientHeight==0?(document.body.scrollTop+document.body.clientHeight/2):(document.documentElement.scrollTop+document.documentElement.clientHeight/2)));" onmousedown="f_mdown(this)"   onmousemove="f_move(this)">' +
        '<table style="background-image:url(' + homeUrl + '/Images/invite_bg.gif); width:439px; height:157px;" >' +
            '<tr><td width="159" style="height: 29px;font-size:12px;width: 159px;">&nbsp; 欢迎您来到Live Support</td></tr>' +
            '<tr><td style="height: 81px;width: 159px;"><td width="216" style=" height: 81px;font-size:12px;">亲爱的朋友您好！<br /><br />来到Live Support有什么可以帮您的吗？</td><td width="20"></td></tr>' +
            '<tr><td style="width: 159px;"><td align="right"><a href="javascript:acceptInvitation();"><img src="'+homeUrl+'/images/1.jpg" style="border:0px;" /></a>' +
                '<a style="border:1px" href="javascript:declineInvititation();"><img src="' + homeUrl + '/images/2.jpg" style="border:0px;"/></a></td></td></tr>' +
        '</table></div>');    
    function   f_mdown(obj)   
    {   
        currentMoveObj   =   obj;                 //当对象被按下时，记录该对象   
        currentMoveObj.style.position   =   "absolute";   
        relLeft   =   event.x   -   currentMoveObj.style.pixelLeft;   
        relTop   =   event.y   -   currentMoveObj.style.pixelTop;   
    }   
    window.document.onmouseup   =   function()   
    {   
        currentMoveObj   =   null;         //当鼠标释放时同时释放拖动对象   
    }   
    function   f_move(obj)   
    {   
        if(currentMoveObj   !=   null)   
        {   
          currentMoveObj.style.pixelLeft=event.x-relLeft;   
          currentMoveObj.style.pixelTop=event.y-relTop;   
        }
    }
    function invite_panelShow() { //显示
        document.getElementById("invite_panel").style.display = "block";
    }
    function invite_panelClose() { //隐藏
        document.getElementById("invite_panel").style.display = "none";
    }
    
    /*** 打开对话窗口 ***/
    function openChat()
    {
        invite_panelClose(); //隐藏层
        var win = window.open(homeUrl + '/Chat.aspx?chatId='+chatId+'&aid='+accountId+'&vid='+visitorId, 'chat', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=603,height=510');
        win.focus();
        win.opener = window;
        return ;
    }

    /*** Cookie函数 ***/
    function checkCookieExist(name){
		return getCookie(name) ? true : false;		
     } 
    function setCookie(name,value)//两个参数，一个是cookie的名子，一个是值
    {
        var Days = 30; //此 cookie 将被保存 30 天
        var exp   = new Date(); //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
        document.cookie
    }
    function getCookie(name)//取cookies函数       
    {
        var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
        if(arr != null) return unescape(arr[2]); return null;

    }
    function delCookie(name)//删除cookie
    {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=getCookie(name);
        if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }

    /*** 业务逻辑函数 ***/
    function hitWebSite() {
        //alert("hitWebSite() called");
        //var vid = getCookie('VisitorId'); //访客ID
        LS_Trace("hitWebSite() called, VisitorId=" + visitorId);
        var url = homeUrl + "/VisitorHandler.ashx?Action=1&VisitorId=" + visitorId + "&callback=?";
        $.getJSON(url,
            function(json) {
        //alert(json.toString());
                if (json != undefined && jQuery.trim(json.InviteChatId) != "") {
                    invite_panelShow(); //显示方法
                    chatId = json.InviteChatId;
                }
            });
        //调用方法
    }

    function acceptInvitation() {
        var url = homeUrl + "/VisitorHandler.ashx?Action=2&Chatid=" + chatId + "&callback=?";
        $.getJSON(url,function(res) {
        //alert(res);
        });
        openChat();
    }

    function declineInvititation() {
        var url = homeUrl + "/VisitorHandler.ashx?Action=3&Chatid=" + chatId + "&callback=?";
        $.getJSON(url, function(res) {
        //alert(res);
        }); 
        invite_panelClose();
    }

    function getVisitorId() {
        if (checkCookieExist("_vid")) {
            return getCookie("_vid");
        }
        else {
            var id = LS_GetRandomId(10);
            setCookie("_vid", id);
            return id;
        }
    }
    
    /*** Utility ***/
    function LS_GetRandomId(len){
        var x=1;
        var val;
        for(var i=0;i<len;i++)
            x=x*10;
         val = Math.round(Math.random() * x);
         return val;
    }

    function LS_Trace(message) {
        if ($("#trace_div") != null) {
            $("#trace_div").html($("#trace_div").html() + message + "</br>");
        }
    }
