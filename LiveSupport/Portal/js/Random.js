function show_vcode() {
    document.getElementById("imgRandom").src = document.getElementById("imgRandom").src + '?temp=' + (new Date().getTime().toString(36));
}