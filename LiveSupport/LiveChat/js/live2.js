﻿    /*
    *js显示帮助层
    *
    */
    
    document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="http://localhost:3355/livechat/ProcessImage.ashx?aid=2&referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>');
    document.write('<div id="service" style="BEHAVIOR:url(http://localhost:3355/livechat/js/webservice.htc)"></div>');
    

      //输出层
      document.write('<div id="panel2" style="z-index:108;cursor:move;display:none;border:1px solid #339966;width:300px;width:300px;height:100px;left:50%;top:50%;margin-left:-220px;margin-top:-50px;position:fixed;_position:absolute;_left:expression(eval(document.documentElement.clientHeight==0?document.body.offsetWidth:document.documentElement.clientWidth)/2);_top:expression(eval(document.documentElement.clientHeight==0?(document.body.scrollTop+document.body.clientHeight/2):(document.documentElement.scrollTop+document.documentElement.clientHeight/2)));" onmousedown="f_mdown(this)"   onmousemove="f_move(this)"><table style="background-image:url(Images/invite_bg.gif); width:439px; height:157px;" ><tr><td width="159" style="height: 29px;font-size:12px;width: 159px;">&nbsp; 欢迎您来到Live Support</td></tr><tr><td style="height: 81px;width: 159px;"><td width="216" style=" height: 81px;font-size:12px;">亲爱的朋友您好！<br /><br />来到Live Support有什么可以帮您的吗？</td><td width="20"></td></tr><tr><td style="width: 159px;"><td align="right"><a href="javascript:acceptInvitation();"><img src="images/1.jpg" style="border:0px;" /></a><a style="border:1px" href="javascript:declineInvititation();"><img src="images/2.jpg" style="border:0px;"/></a></td></td></tr></table></div>');
      //页面加载事件      
      var   currentMoveObj   =   null;         //当前拖动对象   
      var   relLeft;                           //鼠标按下位置相对对象位置   
      var   relTop;   
      var   comname=2;
      var   chatid="";
      var  timer=null;
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
    
    function openChat()
    {
        panel2Close();//隐藏层
        var win = window.open('http://localhost:3355/LiveChat/Chat.aspx?chatid='+chatid+'&aid='+comname+'', 'chat', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=603,height=510');
        win.focus();
        win.opener = window;
        return ;
    }
    //显示
    function panel2Show()
    {
        document.getElementById("panel2").style.display="block"; 
    }
    //隐藏
    function panel2Close()
    {
        document.getElementById("panel2").style.display="none";
    }
    
    // Cookie 相关函数
    function checkCookieExist(name){
		//调用获取COOKIE的方法,如果有就返回true
		return getCookie(name) ? true : false;		
     }   
       
    function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
    {
        var Days = 30; //此 cookie 将被保存 30 天
        var exp   = new Date(); //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
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

    //调用时间的方法 
   function mytime()
   { 
     callMethod();
     timer=setTimeout("mytime()",5000)//递归调用   
   }
    //访客拒绝邀请
    function declineInvititation()
    {
        service.useService("http://localhost:3355/LiveChat/ServiceConnect.asmx?wsdl","calService");                                       //创建服务对象      
        service.calService.callService(callback1,"DeclineOperatorInvitation",chatid);     
        panel2Close();
    }
   
   //调用webservece方法
   function callMethod()
    {
        service.useService("http://localhost:3355/LiveChat/ServiceConnect.asmx?wsdl","calService");                                       //创建服务对象      
        var parm =getCookie('VisitorId'); //访客ID
        if(parm != null)
        {
            service.calService.callService(callback,"GetOperatorInvitation",parm);      
         }
        //调用方法
    }
    
    function visitorLeave()
    {
       service.useService("http://localhost:3355/LiveChat/ServiceConnect.asmx?wsdl","calService");                                       //创建服务对象
        var parm =getCookie('VisitorId'); //访客ID
        if(parm != null)
        {     
            service.calService.callService(callback1,"VisitorLeave",parm); 
        }
    }
    
    function callback1(res)
    {
       if(res.error)
       {
        alert("爱爱爱");
       }
    }
    function acceptInvitation()
    {
        service.useService("http://localhost:3355/LiveChat/ServiceConnect.asmx?wsdl","calService");                                       //创建服务对象
        var parm1 =chatid;   //chatid       
        service.calService.callService(callback1,"AcceptOperatorInvitation",parm1);       
        openChat();
    }

    function callback(res)
    {
        if (!res.error)//判断是否发生错误
        {
                if(res.value !="")//判断返回的值
                {
                    //alert(res.value);
                    panel2Show();//显示方法
                    chatid=res.value;
                    clearTimeout(timer);
                }
        }
        else
        { 
           alert("发生错误"); //发生错误
        }
    }
    
    function getHitCount()
    {
        var counter;
        if(checkCookieExist("counter"))
	    {
		    counter = getCookie("counter");
	    }
	    else
	    {
		    counter = 0;
	    }
	    return counter;
    }
    
    function addHitCount(){
	    var counter = getHitCount();
    	counter = parseInt(counter)+1;
	    SetCookie("counter",counter);
    }
    
    function subHitCount(){
	    var counter = getHitCount();
	    counter = parseInt(counter)-1;
	    SetCookie("counter",counter);
    }

    function window.onload() 
    {
        addHitCount();
        document.getElementById('Text1').value = getHitCount();
        mytime();
   }
   function window.onbeforeunload()       
   {

        subHitCount();
        if(event.clientX> document.body.clientWidth&&event.clientY <0||event.altKey)       
        {       
                         
        } 
        var counter = getHitCount();
        alert(counter);
        if(counter == 0)
        {
           visitorLeave();          
        }   
              
   }  
