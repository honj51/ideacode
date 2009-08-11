/// <reference path="jquery-1.2.6-vsdoc.js" />
    var LCS_visitorId = getVisitorId();
    var LCS_chatId = "";
    var LCS_invite_panel_time;
    document.write("<script type=\"text/javascript\" language=\"javascript\" src=\"" + LCS_homeUrl + "/js/jquery-1.2.6.js\"></script>");
    setInterval(hitWebSite, 1000);
    /*** 主动邀请窗口 ***/
    var LCS_invite_div = document.createElement('div');
    LCS_invite_div.id = 'LCS_invite_panel';
    LCS_invite_div.style.width = '438px';
    LCS_invite_div.style.height = '158px';
    LCS_invite_div.style.cocursor = 'move';
    LCS_invite_div.style.position = 'absolute';
    LCS_invite_div.style.display = 'none';
    LCS_invite_div.style.background = 'url(' + LCS_inviteImageUrl + '/' + LCS_invitePanel_BGStyle + ')';
    LCS_invite_div.innerHTML = '<div style=" padding:8px 0px 0px 10px; color:#FFF; font-size:12px; height:20px;" >欢迎您来到'+LCS_companyName+'</div><div style="font-size:14px; padding:20px 0px 0px 145px; height:75px;" >亲爱的朋友您好！<br /><br />来到'+LCS_companyName+'有什么可以帮您的吗？</div><br /><div  style=" padding:10px 0px 0px 230px;"><a href="#"  onclick="javascript:acceptInvitation();"><img src="' + LCS_inviteImageUrl + '/' + LCS_invitePanel_OKBtn + '" style="border:0px;"  width="70" height="26" /></a>&nbsp;&nbsp;&nbsp;<a href="#"  onclick="javascript:declineInvititation();" ><img src="' + LCS_inviteImageUrl + '/' + LCS_invitePanel_NOBtn + '" style="border:0px;" width="70" height="26" /></a></div>';
    function invitetime() {
        document.getElementById('LCS_invite_panel').style.left = eval(document.documentElement.clientHeight == 0 ? document.body.offsetWidth : document.documentElement.clientWidth) / 2 - 214;
        document.getElementById('LCS_invite_panel').style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight / 2 - 80) : (document.documentElement.scrollTop + document.documentElement.clientHeight / 2) - 80);
        LCS_invite_panel_time = setTimeout("invitetime()", 80);
    }
    function invite_panelShow() { //显示
        if (document.getElementById("LCS_invite_panel") != null) {
            document.getElementById("LCS_invite_panel").style.display = "block";
            invitetime();//开动时间
        }
    }
    function invite_panelClose() { //隐藏
        if (document.getElementById("LCS_invite_panel")) {
            document.getElementById("LCS_invite_panel").style.display = "none";
            clearTimeout(LCS_invite_panel_time);//关闭时间
        } 
    }

    /*** 打开对话窗口 ***/
    function openChat() {
        invite_panelClose();//隐藏主动邀请层方法
        var win = window.open(LCS_homeUrl + '/Chat.aspx?chatId=' + LCS_chatId + '&aid=' + LCS_accountId + '&vid=' + LCS_visitorId, 'chat', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=603,height=520');
        LCS_chatId = "";
        win.focus();
        win.opener = window;
        return;
    }

    /*** Cookie函数 ***/
    function checkCookieExist(name) {
        return getCookie(name) ? true : false;
    }
    function setCookie(name, value)//两个参数，一个是cookie的名子，一个是值
    {
        var Days = 30; //此 cookie 将被保存 30 天
        var exp = new Date(); //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
        document.cookie
    }
    function getCookie(name)//取cookies函数       
    {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) return unescape(arr[2]); return null;

    }
    function delCookie(name)//删除cookie
    {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval = getCookie(name);
        if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    }

    /*** 业务逻辑函数 ***/
    function hitWebSite() {
        var url = LCS_homeUrl + "/VisitorHandler.ashx?Action=1&VisitorId=" + LCS_visitorId + "&callback=?";
        if(typeof($) == 'undefined') return;
        $.getJSON(url,
        function(json) {
            if (json != undefined && jQuery.trim(json.InviteChatId) != "") {
                invite_panelShow(); //显示主动邀请层方法
                LCS_chatId = json.InviteChatId;
            }else
            {
                 invite_panelClose();//隐藏主动邀请层方法
            }
        });
        //调用方法
    }
    //接受客服主动邀请
    function acceptInvitation() {
        var url = LCS_homeUrl + "/VisitorHandler.ashx?Action=2&Chatid=" + LCS_chatId + "&callback=?";
        $.getJSON(url, function(res) {
        });
        openChat();
    }
    //忽略客服主动邀请
    function declineInvititation() {
         invite_panelClose();//隐藏主动邀请层方法
        var url = LCS_homeUrl + "/VisitorHandler.ashx?Action=3&Chatid=" + LCS_chatId + "&callback=?";
        $.getJSON(url, function(res) {
        });
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
    /***取随机数 ***/
    function LS_GetRandomId(len) {
        var x = 1;
        var val;
        for (var i = 0; i < len; i++)
            x = x * 10;
        val = Math.round(Math.random() * x);
        return val;
    }
