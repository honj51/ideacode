document.onkeydown = function() {
    if (event.keyCode == 116) {
        event.keyCode = 0;
        event.returnValue = false;
    }
}
document.oncontextmenu = function() { event.returnValue = false; }
///窗体关闭提示
function Exit() {
    if (confirm('是否关闭') == true) {
        PageMethods.CloseChat(getCookie("chatId"));
        window.close();
    }
}
function emailclose() {
    if (confirm('邮件发送成功 我们会尽快回复你！') == true) {
        window.close();
    }
}
  
//交流方式
function shortKeyMenu() {
    document.getElementById(shortKeyMenu).style.display = "block"
}
//显示层
function divShow(divId) {
    document.getElementById(divId).style.display = "block";
}
//关闭层
function divClose(divId) {
    document.getElementById(divId).style.display = "none";
}
var lastCheck = new Date();
function scrollDiv() {
    var d;
    if ((d = document.getElementById('chat')) && ('undefined' != typeof d.scrollTop)) {
        //d.scrollTop = 0;
        d.scrollTop = 5000;
    }
    window.setTimeout("scrollDiv()", 950);
    var now = new Date();
    var elapse = now.getSeconds() - lastCheck.getSeconds();
    var sameMinute = now.getMinutes - lastCheck.getMinutes();
    if (sameMinute != 0 || elapse >= 2) {
        // Check for typing notification
        PageMethods.CheckTypingNotification(getCookie('chatId'), OnCheckTypingNotificationComplete);
        lastCheck = new Date();
    }
}
function OnCheckTypingNotificationComplete(result, methodName) {
    if (result != '') {
        var v = document.getElementById('typingNotification');
        if (v != 'undefined' && v != null)
            v.innerText = result;
    }
}
window.onload = scrollDiv;
function Save() {
    var txt = document.getElementById("upChat").innerHTML
    b = window.open();
    b.document.open();
    b.document.write(txt);
    b.document.close();
    b.document.execCommand('saveas', true, '');
}
//刷新和关闭时调用
//function window.onbeforeunload() {
//    if (event.clientX > document.body.clientWidth && event.clientY < 0 || event.altKey) {
//        alert("may");
//        Exit();
//    }
//} 