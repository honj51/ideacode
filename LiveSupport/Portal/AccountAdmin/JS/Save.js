function Save() {
    //当前时间
    var now = new Date();
    var year = now.getYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    var date = year + "-" + month + "-" + day;
    var txt = document.getElementById("divMessage").innerHTML;
    b = window.open();
    b.document.open();
    b.document.write(txt);
    b.document.close();
    b.document.execCommand('saveas', true, date);
    b.window.close();
} 