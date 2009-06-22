function LimitOption(count)
{
    if(count==0)
    {
        return;
    }
    var ckbOT=document.getElementsByName("ot");
    for (var i = 0; i < ckbOT.length; i++)
    {
        if (ckbOT[i].type == "checkbox")
        {
            ckbOT[i].onclick=function()
            {
                var c=GetCount("ot");
                if(c > count)
                {
                   alert("对不起！本次投票最多可选"+count+"项，您已选了"+c+"项\n现系统自动取消您所选择的最后一项。");
                   this.checked=false;
                }
            }
        }   
    }
}

function CheckOption(type)
{
    if(type==0)
    {
        if(RBChecked("ot"))
        {
             return true;
        }
    }
    else
    {
        if(GetCount("ot")>0)
        {
            return true;
        }
    }
    alert("对不起！请选择选项后在投票！");
    return false;
}

function ShowResult(id)
{
	window.open('Result/'+id+'.aspx','',CenterScreen(100,100,1,0));
}

/*
$P('<div id="Des" style="position:absolute;width:100%;height:100%;background:#000;display:none;-moz-opacity: 0.95; opacity: 0.95;filter:alpha(opacity=95);margin:0"><table onclick="return false" id="tTip" cellspacing="0" cellpadding="0" align="center"><tr ondblclick="OpenDes()"><td><img alt="" src="/Image/Vista/TL.gif" /></td><td id="tc"><img alt="" src="/Image/Vista/MinD.gif" /><img alt="在新窗口中打开" src="/Image/Vista/Max.gif" onmouseover="this.src=\'/Image/Vista/MaxO.gif\'" onmouseout="this.src=\'/Image/Vista/Max.gif\'" onclick="OpenDes()" /><img alt="关闭" src="/Image/Vista/Close.gif" onmouseover="this.src=\'/Image/Vista/CloseO.gif\'" onmouseout="this.src=\'/Image/Vista/Close.gif\'" onclick="CloseDes()" /></td><td><img alt="" src="/Image/Vista/TR.gif" /></td></tr><tr><td id="cl"></td><td>');
$P('<div id="Tip" style="background-color:#fff;padding:2px;overflow:auto;"></div>');
$P('</td><td id="cr"></td></tr><tr><td><img alt="" src="/Image/Vista/BL.gif" /></td><td id="bc"></td><td><img alt="" src="/Image/Vista/BR.gif" /></td></tr></table></div>');
var tip = $("Tip");
var des = $("Des");
var tTip=$("tTip");
var desUrl;
function InitPostion()
{
    des.style.display="";
    des.style.left=document.documentElement.scrollLeft+"px";
    des.style.top=0;
    des.style.height=document.documentElement.scrollHeight+"px";
    tip.style.width=document.documentElement.clientWidth-100+"px";
    tip.style.height=document.documentElement.clientHeight - 100+"px";
    tTip.style.marginTop=document.documentElement.scrollTop + 20 +"px";
}
function InitDes(obj, id)
{
    obj.onclick = function()
    { 
        HideScroll();
        InitPostion();
        desUrl="/Vote/Description/Simple/" + id +".aspx";
        Ajax("Tip", desUrl);
    }
}
function HideScroll()
{
    window.onscroll=function()
    {
        document.documentElement.scrollTop = parseInt(tTip.style.marginTop)-20;
        document.documentElement.scrollLeft = parseInt(des.style.left);
    }
    window.onresize=function()
    {
        InitPostion();
    }
}

function ShowScroll()
{window.onscroll=Nothing;
window.onresize=Nothing;
}

function CloseDes()
{
    HideObj($("Des"));
    ShowScroll();
}

function OpenDes()
{
    CloseDes();
    window.open(desUrl.replace("Simple/",""));
}

function ShowImg(url)
{
    $("lblImg").innerHTML = "<img src=\"File:///" + url.value + "\" alt=\"" + url.value + "\" style=\"height:120px\" /><br/>";
}
*/