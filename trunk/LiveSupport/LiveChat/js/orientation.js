// JavaScript Document
var contentHtml = '<a href="#" onclick="openChat();" ><img id="_imgLC" src="' + homeUrl + '/ProcessImage.ashx?aid=' + accountId + '&vid=' + visitorId + '&referrer=' + document.referrer + '&bannerstyle=' + bannerStyle + '" border="0" alt="Click here for live chat" /></a>';
if (bannerPos != 0) {
    var DIV = document.createElement('div');
    DIV.id = "lovexin12";
    DIV.innerHTML = contentHtml;
    window.onload = function() {
        document.body.appendChild(DIV);
        document.body.appendChild(invite_div);
        moveRight();
    }
} else {
document.write('<div>' + contentHtml + '</div>');
window.onload = function() {
document.body.appendChild(invite_div);
}
}

var lastScrollY = 0;

function moveRight() {

    var style = document.getElementById('lovexin12').style;
    style.position = 'absolute';
    style.zIndex = 10000;
    if (bannerPos == 1) {
        style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop) : (document.documentElement.scrollTop));
        style.left = '0px';
    }
    if (bannerPos == 2) {
        style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop) : (document.documentElement.scrollTop));
        style.right = '0px';
    }
    if (bannerPos == 3) {
        style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop - 50 + document.body.clientHeight / 2) : (document.documentElement.scrollTop - 50 + document.documentElement.clientHeight / 2));
        style.left = '0px';
    }
    if (bannerPos == 4) {
        style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight / 2) : (document.documentElement.scrollTop + document.documentElement.clientHeight / 2));
        style.right = '0px';
    }
    if (bannerPos == 5) {
        style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight - 100) : (document.documentElement.scrollTop + document.documentElement.clientHeight - 100));
        style.left = '0px';
    }
    if (bannerPos == 6) {
        style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight - 100) : (document.documentElement.scrollTop + document.documentElement.clientHeight - 100));
        style.right = '0px';
    }
    heartBeat();
    setTimeout("moveRight()", 100);

}
function heartBeat() {
    if (document.getElementById("lovexin12") != null) {
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
        //setTimeout("heartBeat()", 1);
    }
}
window.setInterval("heartBeat()", 1);
  
