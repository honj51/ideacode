﻿/*
*js显示帮助层
*
*/

//输出层
  document.write('<div id="panel2" style="z-index:108;cursor:move;display:none;border:1px solid #339966;width:300px;width:300px;height:100px;left:50%;top:50%;margin-left:-220px;margin-top:-50px;position:fixed;_position:absolute;_left:expression(eval(document.documentElement.clientHeight==0?document.body.offsetWidth:document.documentElement.clientWidth)/2);_top:expression(eval(document.documentElement.clientHeight==0?(document.body.scrollTop+document.body.clientHeight/2):(document.documentElement.scrollTop+document.documentElement.clientHeight/2)));" onmousedown="f_mdown(this)"   onmousemove="f_move(this)"><table style="background-image:url(Images/invite_bg.gif); width:439px; height:157px;" ><tr><td width="159" style="height: 29px;font-size:12px;width: 159px;">&nbsp; 欢迎您来到Live Support</td></tr><tr><td style="height: 81px;width: 159px;"><td width="216" style=" height: 81px;font-size:12px;">亲爱的朋友您好！<br /><br />来到Live Support有什么可以帮您的吗？</td><td width="20"></td></tr><tr><td style="width: 159px;"><td align="right"><a href="javascript:openChat();"><img src="images/1.jpg" style="border:0px;" /></a><a style="border:1px" href="javascript:panel2Close();"><img src="images/2.jpg" style="border:0px;"/></a></td></td></tr></table></div>');
  //页面加载事件
  window.onload=mytime;
  var   currentMoveObj   =   null;         //当前拖动对象   
  var   relLeft;                           //鼠标按下位置相对对象位置   
  var   relTop;   
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
        var win = window.open('http://rd01/LiveChatService/Chat.aspx?aid=4', 'chat', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=603,height=510');
        win.focus();
        win.opener = window;
        return ;
    }
    //显示
    var i=0;
    function panel2Show()
    {
        
        i=i+1;
        if(i==10){
        document.getElementById("panel2").style.display="block"; 
        clearTimeout();
        return;
        }
        panel2Show()
    //  setTimeout("panel2Show()",1000);
    }
    //隐藏
    function panel2Close()
    {
        document.getElementById("panel2").style.display="none";
    }
	
    
    //调用时间的方法 
   function mytime()
   { 
     callMethod();
     setTimeout("mytime()",5000)//递归调用   
   }
   //调用webservece方法
   function callMethod()
    {
        service.useService("http://localhost:3355/LiveChat/Operator.asmx?wsdl","calService");                                       //创建服务对象
        var parm1 = 4;   //取公司ID           
        var parm2 ="127.0.0.1"; //取IP
        service.calService.callService(callback,"GetRequestsByAidandIP",parm1,parm2);                                                            //调用方法
    }
    function callback(res)
    {
        if (!res.error)//判断是否发生错误
        {
                //alert(res.value);
                if(res.value=="ok")//判断返回的值
                {
                     panel2Show();//显示方法
                }
                else
                {
                  //alert(res.value);
                }
                
        }
        else
        { 
           alert("发生错误"); //计算错误
        }
    }