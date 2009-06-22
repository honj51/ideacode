var page=document.URL.substring(0,document.URL.lastIndexOf("/"));
var commentType=page.substring(page.lastIndexOf("/")+1);

function Agree(id)
{
    CommentVote(id,1)
}

function Disagree(id)   //btnSubmit的Click事件
{
    CommentVote(id,-1);
}

function CommentVote(id,type)
{
    if(GetCookie(commentType+id)=="1")
    {
        alert("您已对该项进行过投票，请勿重复投票，谢谢！");
        return;
    }
    var control;
    if(parseInt(type)==1)
    {
        control=$("A"+id);
    }
    else
    {
        control=$("D"+id);
    }
    var fun=function(readyState,responseText)
    {
        if(readyState==4)
        {
            if(parseInt(responseText)>0)
            {
                control.innerHTML=parseInt(control.innerText)+1;
                SetCookie(commentType+id,"1",0.25);
            }
            else
            {
              alert("您已对该项进行过评论，请勿重复评论，谢谢！");
            }
        }
     }
    if(parseInt(type)==1)
    {
        AjaxRunFunction(fun,page+"/Agree" + id + ".aspx?tmp=" + Math.random());
    }
    else
    {
       AjaxRunFunction(fun,page+"/Disagree" + id + ".aspx?tmp=" + Math.random());
    }
}

function ReplayComment(floor,name)
{
    var tb=$("ctl00_body_Contents");
    if(!tb) return;
    tb.focus(); 
    tb.value="回复 "+floor+" 楼("+name+")："; 
    tb.onchange();
    return false;
}

function CommentChange(obj)
{
    if(obj.value.length>500)
    {
        obj.value=obj.value.substring(0,500);
        alert("对不起，评论最多允许500个字！现自动截断！");
    }
}

function Search(sid,key)
{
    if(key && key.value.length>0)
    {
        window.location="../Search_Article_"+sid+"/"+key.value+".aspx";
    }
    else
    {
        alert("对不起，请输入关键字！");
        key.focus();
    }
    return false;
}

function ScrollImg()
{
    var speed=20
    var scroll_begin = $("scroll_begin");
    var scroll_end = $("scroll_end");
    var scroll_div = $("scroll_div");
    scroll_end.innerHTML=scroll_begin.innerHTML
    function Marquee(){
        if(scroll_end.offsetWidth-scroll_div.scrollLeft<=0)
        scroll_div.scrollLeft-=scroll_begin.offsetWidth
            else{
                scroll_div.scrollLeft++
            }
        }
    var MyMar=setInterval(Marquee,speed)
    scroll_div.onmouseover=function() {clearInterval(MyMar)}
    scroll_div.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
}

function ResizeImg()
{
    var imgs=document.getElementsByTagName("img");
    for(var i=0;i<imgs.length;i++)
    {
        if(imgs[i].width>630) imgs[i].width=630;
    }
}

window.onload=function()
{
    ExternalLinks();
    ResizeImg();
}