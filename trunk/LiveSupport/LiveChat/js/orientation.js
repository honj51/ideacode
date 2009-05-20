// JavaScript Document
var lastScrollY = 0;
moveRight();
function moveRight() {
    document.getElementById("lovexin12").style.position = 'absolute';
    document.getElementById("lovexin12").style.zIndex = 500;

    if (bannerPos == 1) {
        document.getElementById("lovexin12").style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop) : (document.documentElement.scrollTop));
        document.getElementById("lovexin12").style.left = '0px';
    }
    if (bannerPos == 2) {
        document.getElementById("lovexin12").style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop) : (document.documentElement.scrollTop));
        document.getElementById("lovexin12").style.right = '0px';
    }
    if (bannerPos == 3) {
        document.getElementById("lovexin12").style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight / 2) : (document.documentElement.scrollTop + document.documentElement.clientHeight / 2));
        document.getElementById("lovexin12").style.left = '0px';
    }
    if (bannerPos == 4) {
        document.getElementById("lovexin12").style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight / 2) : (document.documentElement.scrollTop + document.documentElement.clientHeight / 2));
        document.getElementById("lovexin12").style.right = '0px';
    }
    if (bannerPos == 5) {
        document.getElementById("lovexin12").style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight - 100) : (document.documentElement.scrollTop + document.documentElement.clientHeight - 100));
        document.getElementById("lovexin12").style.left = '0px';
    }
    if (bannerPos == 6) {
        document.getElementById("lovexin12").style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight - 100) : (document.documentElement.scrollTop + document.documentElement.clientHeight - 100));
        document.getElementById("lovexin12").style.right = '0px';
    }
    else if (bannerPos == 0) {
        document.getElementById("lovexin12").style.top = "0px";
        document.getElementById("lovexin12").style.position = "static";
    }
    var diffY;
    if (document.documentElement && document.documentElement.scrollTop)
        diffY = document.documentElement.scrollTop;
    else if (document.body)
        diffY = document.body.scrollTop
    else {
        /*Netscape stuff*/
    }

    //设置移动的速度0.1
    percent = 0.1 * (diffY - lastScrollY);
    if (percent > 0)
        percent = Math.ceil(percent);
    else
        percent = Math.floor(percent);
    document.getElementById("lovexin12").style.top = parseInt(document.getElementById("lovexin12").style.top) + percent + "px";
    lastScrollY = lastScrollY + percent;
    //alert(lastScrollY);
    setTimeout("moveRight()", 100);

}
function heartBeat() {
    var diffY;
    if (document.documentElement && document.documentElement.scrollTop)
        diffY = document.documentElement.scrollTop;
    else if (document.body)
        diffY = document.body.scrollTop
    else {
        /*Netscape stuff*/
    }

    //设置移动的速度0.1
    percent = 0.1 * (diffY - lastScrollY);
    if (percent > 0)
        percent = Math.ceil(percent);
    else
        percent = Math.floor(percent);
    document.getElementById("lovexin12").style.top = parseInt(document.getElementById("lovexin12").style.top) + percent + "px";
    lastScrollY = lastScrollY + percent;
    //alert(lastScrollY);
}

window.setInterval("heartBeat()", 1);
  
