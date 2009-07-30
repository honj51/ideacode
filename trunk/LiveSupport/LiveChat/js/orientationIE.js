// JavaScript Document
var LCS_chatBanner_contentHtml = '<a href="#" onclick="openChat();" ><img id="_imgLC" src="' + LCS_homeUrl + '/ProcessImage.ashx?aid=' + LCS_accountId + '&vid=' + LCS_visitorId + '&referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>';
if (LCS_bannerPos != 0) {
    var LCS_chatBanner_DIV = document.createElement('div');
    LCS_chatBanner_DIV.id = "LCS_chatBanner";
    LCS_chatBanner_DIV.innerHTML = LCS_chatBanner_contentHtml;
    window.onload = function() {
        document.body.appendChild(LCS_chatBanner_DIV);
        document.body.appendChild(LCS_invite_div);
        chatBannerPosition();//���öԻ�ͼƬλ�õķ���
    }
} else {
document.write('<div>' + LCS_chatBanner_contentHtml + '</div>');
window.onload = function() {
document.body.appendChild(LCS_invite_div);
}
}
var lastScrollY = 0;
function chatBannerPosition() {

    var LCS_chatBanner = document.getElementById('LCS_chatBanner');
    LCS_chatBanner.style.position = 'absolute';
    LCS_chatBanner.style.zIndex = 10000;
    if (LCS_bannerPos == 1) {
        LCS_chatBanner.style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop) : (document.documentElement.scrollTop));
        LCS_chatBanner.style.left = '0px';
    }
    if (LCS_bannerPos == 2) {
        LCS_chatBanner.style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop) : (document.documentElement.scrollTop));
        LCS_chatBanner.style.right = '0px';
    }
    if (LCS_bannerPos == 3) {
        LCS_chatBanner.style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop - LCS_chatBanner.offsetHeight + document.body.clientHeight / 2) : (document.documentElement.scrollTop - LCS_chatBanner.offsetHeight + document.documentElement.clientHeight / 2));
        LCS_chatBanner.style.left = '0px';
    }
    if (LCS_bannerPos == 4) {
        LCS_chatBanner.style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop + document.body.clientHeight / 2) : (document.documentElement.scrollTop + document.documentElement.clientHeight / 2));
        LCS_chatBanner.style.right = '0px';
    }
    if (LCS_bannerPos == 5) {
        LCS_chatBanner.style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop +100+ document.body.clientHeight - LCS_chatBanner.offsetWidth) : (document.documentElement.scrollTop +100+ document.documentElement.clientHeight - LCS_chatBanner.offsetWidth));
        LCS_chatBanner.style.left = '0px';
    }
    if (LCS_bannerPos == 6) {
        LCS_chatBanner.style.top = eval(document.documentElement.clientHeight == 0 ? (document.body.scrollTop+100 + document.body.clientHeight - LCS_chatBanner.offsetWidth) : (document.documentElement.scrollTop+100 + document.documentElement.clientHeight - LCS_chatBanner.offsetWidth));
        LCS_chatBanner.style.right = '0px';
    }
    heartBeat();
    setTimeout("chatBannerPosition()", 100);

}

function heartBeat() {
    var Lcs_heartBeat_div=document.getElementById('LCS_chatBanner');
    if ( Lcs_heartBeat_div != null) {
        var diffY;
        if (document.documentElement && document.documentElement.scrollTop)
            diffY = document.documentElement.scrollTop;
        else if (document.body)
            diffY = document.body.scrollTop
        else {
        }
        //�����ƶ����ٶ�0.1
        percent = 0.1 * (diffY - lastScrollY);
        if (percent > 0)
            percent = Math.ceil(percent);
        else
            percent = Math.floor(percent);

       Lcs_heartBeat_div.style.top = parseInt(Lcs_heartBeat_div.style.top) + percent + "px";

        lastScrollY = lastScrollY + percent;
       // setTimeout("heartBeat()", 1);
    }
}
window.setInterval("heartBeat()", 1);