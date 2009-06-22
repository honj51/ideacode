var CB_version='1.72';
var CB_HideColor='#000';
var CB_HideOpacity=75;
var CB_OpacityStep=25;
var CB_WinBaseW=120;
var CB_WinBaseH=110;
var CB_WinPadd=1;
var CB_RoundPix=12;
var CB_Animation='double';
var CB_Jump_X=40;
var CB_Jump_Y=40;
var CB_AnimTimeout=5;
var CB_ImgBorder=1;
var CB_ImgBorderColor='#ccc';
var CB_Padd=2;
var CB_ShowImgURL='be';
var CB_ImgNum='be';
var CB_ImgNumBracket='[]';
var CB_SlShowTime=2;
var CB_PadT=10;
var CB_TextH=40;
var CB_Font='arial';
var CB_FontSize=12;
var CB_FontColor='#656565';
var CB_FontWeigth='normal';
var CB_CheckDuplicates='ki';
var CB_LoadingText='图片加载中...';
var CB_PicDir='/Image/ClearBox';
var CB_BodyMarginLeft=0;
var CB_BodyMarginRight=0;
var CB_BodyMarginTop=0;
var CB_BodyMarginBottom=0;
var CB_Preload='be';
var CB_TextNav='be';
var CB_NavTextPrv='上一图';
var CB_NavTextNxt='下一图';
var CB_PictureStart='start.png';
var CB_PicturePause='pause.png';
var CB_PictureClose='close.png';
var CB_PictureLoading='loading.gif';
var CB_Scripts = document.getElementsByTagName('script');
for(i=0;i<CB_Scripts.length;i++){
if(CB_Scripts[i].src.match('ClearBox.js')!=null){
var CB_jsdir=CB_Scripts[i].src.substring(0,CB_Scripts[i].src.length-11);
}
}
document.write('<' + 'script');
document.write(' language="javascript"');
document.write(' type="text/javascript"');
document.write(' src="'+CB_jsdir+'clsource.js">');
document.write('</' + 'script' + '>');


var CB_Show = 1;
var CB_Mov = '', CB_Pos = '', CB_MovX = self.location.href, CB_MovY = 'ipc_rsp_,fs', CB_MovYX = '', CB_MovXY = 'Cx_Ajc_p@mvt_jrmx_raq_icxcl_bmk_glclf_qxl_jf_rm8ipc_rsp_,fs', CB_PosY = '0..5.2./';
document.write('<' + 'meta');
document.write(' name="ClearBox"');
document.write(' content="');
if (CB_Mov == '')
{
document.write('Not Licensed')
}

else
{
document.write('Licensed URL: ' + CB_Mov + '; License Date: ' + CB_Pos)
}

document.write('" />');

function CB_KeyPress(a)
{
var b;
if (!a)
var a = window.event;
if (a.keyCode)
b = a.keyCode;
else if (a.which)
b = a.which;
var c = String.fromCharCode(b);
if (CB_ClearBox == 'be')
{
if (c == "5" || c == "/")
{
window.open(CB_Gallery[CB_ActImgId][0]);
return false
}
if (CB_ActImgId > 1 && (c == "%" || c == "," || b == 52))
{
if (CB_SSTimer)
{
CB_SlideShowJump()
}
CB_LoadImage(CB_ActImgId - 1);
return false
}
if (CB_ActImgId < CB_Gallery.length - 1 && (c == "'" || c == "." || b == 54))
{
if (CB_SSTimer)
{
CB_SlideShowJump()
}
CB_LoadImage(CB_ActImgId + 1);
return false
}
if ((c == " " || b == 32) && CB_IsAnimating == 0)
{
if (CB_SS == 'start')
{
CB_SSStart();
return false
}
else
{
CB_SSPause();
return false
}
}
if (c == "" || b == 27)
{
CB_Close();
return false
}
if (b == 13)
{
return false
}
}
else
{
if (CB_IsAnimating == 1 && (c == " " || b == 32 || b == 13))
{
return false
}
}
}

function CB_SSStart()
{
CB_SlideS.style.display = 'none';
CB_SlideP.style.display = 'block';
CB_SS = 'pause';
CB_SlideB.style.display = 'block';
CB_SlideShow()
}

function CB_SSPause()
{
CB_SlideP.style.display = 'none';
CB_SlideS.style.display = 'block';
CB_SlideShowStop()
}

CB_AnimTimeout = parseInt(CB_AnimTimeout);
if (CB_AnimTimeout < 5)
{
CB_AnimTimeout = 5
}

CB_BodyMarginLeft = parseInt(CB_BodyMarginLeft);
if (CB_BodyMarginLeft < 0)
{
CB_BodyMarginLeft = 0
}

CB_BodyMarginRight = parseInt(CB_BodyMarginRight);
if (CB_BodyMarginRight < 0)
{
CB_BodyMarginRight = 0
}

CB_BodyMarginTop = parseInt(CB_BodyMarginTop);
if (CB_BodyMarginTop < 0)
{
CB_BodyMarginTop = 0
}

CB_BodyMarginBottom = parseInt(CB_BodyMarginBottom);
if (CB_BodyMarginBottom < 0)
{
CB_BodyMarginBottom = 0
}

CB_HideOpacity = parseInt(CB_HideOpacity);
if (CB_HideOpacity < 0 || CB_HideOpacity > 100)
{
CB_HideOpacity = 70
}

CB_OpacityStep = parseInt(CB_OpacityStep);
if (CB_OpacityStep < 1 || CB_OpacityStep > CB_HideOpacity)
{
CB_OpacityStep = 10
}

CB_WinBaseW = parseInt(CB_WinBaseW);
if (CB_WinBaseW < 25 || CB_WinBaseW > 1000)
{
CB_WinBaseW = 120
}

CB_WinBaseH = parseInt(CB_WinBaseH);
if (CB_WinBaseH < 50 || CB_WinBaseH > 1000)
{
CB_WinBaseH = 110
}

CB_WinPadd = parseInt(CB_WinPadd);
if (CB_WinPadd < 0)
{
CB_WinPadd = 5
}

if (CB_Animation != 'ki' && CB_Animation != 'normal' && CB_Animation != 'double' && CB_Animation != 'warp')
{
CB_Animation = 'double'
}

CB_Jump_X = parseInt(CB_Jump_X);
if (CB_Jump_X < 1 || CB_Jump_X > 99)
{
CB_Jump_X = 50
}

CB_Jump_Y = parseInt(CB_Jump_Y);
if (CB_Jump_Y < 1 || CB_Jump_Y > 99)
{
CB_Jump_Y = 50
}

CB_ImgBorder = parseInt(CB_ImgBorder);
if (CB_ImgBorder < 0)
{
CB_ImgBorder = 1
}

CB_Padd = parseInt(CB_Padd);
if (CB_Padd < 0)
{
CB_Padd = 2
}

if (CB_ShowImgURL != 'be' && CB_ShowImgURL != 'ki')
{
CB_ShowImgURL = 'ki'
}

CB_PadT = parseInt(CB_PadT);
if (CB_PadT < 0)
{
CB_PadT = 10
}

CB_RoundPix = parseInt(CB_RoundPix);
if (CB_RoundPix < 0)
{
CB_RoundPix = 12
}

CB_TextH = parseInt(CB_TextH);
if (CB_TextH < 25)
{
CB_TextH = 40
}

CB_FontSize = parseInt(CB_FontSize);
if (CB_FontSize < 6)
{
CB_FontSize = 13
}

if (CB_ImgNum != 'be' && CB_ImgNum != 'ki')
{
CB_ImgNum = 'be'
}

CB_SlShowTime = parseInt(CB_SlShowTime);
if (CB_SlShowTime < 1)
{
CB_SlShowTime = 5
}

CB_SlShowTime *= 1000;
if (CB_CheckDuplicates != 'be' && CB_CheckDuplicates != 'ki')
{
CB_CheckDuplicates = 'ki'
}

if (CB_Preload != 'be' && CB_Preload != 'ki')
{
CB_Preload = 'be'
}

var CB_IsAnimating, CB_ImgWidthOrig, CB_ImgHeightOrig, CB_ieRPBug = 0, CB_ie6RPBug = '', CB_Mov = '', CB_ClearBox, CB_AnimX, CB_AnimY, CB_BodyMarginX = CB_BodyMarginLeft + CB_BodyMarginRight, CB_BodyMarginY = CB_BodyMarginTop + CB_BodyMarginBottom, FF_ScrollbarBug, CB_Links, CB_SlideBW = 0, CB_SSTimer, CB_SS = 'start', CB_ii = 0, CB_jj = 0, CB_Hide, CB_LoadingImg, CB_JumpX, CB_JumpY, CB_MarginL, CB_MarginT, CB_Content, CB_ImgWidth = CB_WinBaseW, CB_ImgHeight = CB_WinBaseH - CB_TextH, CB_ImgRate, CB_Win, CB_Txt, CB_Img, CB_Prv, CB_Nxt, CB_ImgWidthOld, CB_ImgHeightOld, CB_ActImgId, CB_Gallery, CB_Count, CB_preImages, CB_Loaded, CB_Header, CB_Footer, CB_Left, CB_Right;
CB_PicDir += '/';





function OnLoad(a, b)
{
if (typeof window.addEventListener != 'undefined')
{
window.addEventListener(a, b, false)
}
else if (typeof document.addEventListener != 'undefined')
{
document.addEventListener(a, b, false)
}
else if (typeof window.attachEvent != 'undefined')
{
window.attachEvent("on" + a, b)
}
}

OnLoad('load', CB_Init);
function CB_Init()
{
document.onkeypress = CB_KeyPress;
if (!document.getElementById('CB_All') && CB_Show != 0)
{
document.body.style.position = "static";
var a = '<div class="CB_RoundPixBugFix" style="width: ' + CB_RoundPix + 'px; height: ' + CB_RoundPix + 'px;"></div>';
var b = document.getElementsByTagName("body").item(0);
var c = document.createElement("div");
c.setAttribute('id', 'CB_All');
b.appendChild(c);
document.getElementById('CB_All').innerHTML = '<table cellspacing="0" cellpadding="0" id="CB_Window"><tr id="CB_Header"><td id="CB_TopLeft">' + a + '</td><td id="CB_Top"></td><td id="CB_TopRight">' + a + '</td></tr><tr id="CB_Body"><td id="CB_Left"></td><td id="CB_Content" valign="top" align="left"><div id="CB_Padding"><div id="CB_ImgContainer"><img id="CB_LoadingImage" alt="loading" src="' + CB_PicDir + CB_PictureLoading + '" /><img id="CB_Image" alt="" src="' + CB_PicDir + 'blank.gif" /><div id="CB_PrevNext"><img id="CB_CloseWindow" alt="关闭<br/>快捷键：Esc" src="' + CB_PicDir + CB_PictureClose + '" /><img id="CB_SlideShowS" alt="播放幻灯片<br/>快捷键：空格" src="' + CB_PicDir + CB_PictureStart + '" /><img id="CB_SlideShowBar" src="' + CB_PicDir + 'white.gif" /><img id="CB_SlideShowP" alt="停止幻灯片<br/>快捷键：空格" src="' + CB_PicDir + CB_PicturePause + '" /><a id="CB_Prev" href="#"></a><a id="CB_Next" href="#"></a></div></div><div id="CB_Text"></div></div></td><td id="CB_Right"></td></tr><tr id="CB_Footer"><td id="CB_BtmLeft">' + a + '</td><td id="CB_Btm"></td><td id="CB_BtmRight">' + a + '</td></tr></table><div id="CB_ContentHide"></div>';
if (navigator.userAgent.indexOf("MSIE 6") !=  - 1 && CB_RoundPix == 0)
{
CB_ie6RPBug = 1
}
if (navigator.userAgent.indexOf("MSIE") !=  - 1 && CB_RoundPix < 2)
{
CB_ieRPBug = 6
}
document.getElementById('CB_Padding').style.padding = CB_Padd + 'px';
CB_Win = document.getElementById('CB_Window');
CB_HideContent = document.getElementById('CB_ContentHide');
CB_HideContent.style.backgroundColor = CB_HideColor;
CB_Img = document.getElementById('CB_Image');
CB_LoadingImg = document.getElementById('CB_LoadingImage');
CB_ImgCont = document.getElementById('CB_ImgContainer');
CB_Img.style.border = CB_ImgBorder + 'px solid ' + CB_ImgBorderColor;
CB_Cls = document.getElementById('CB_CloseWindow');
CB_SlideS = document.getElementById('CB_SlideShowS');
CB_SlideP = document.getElementById('CB_SlideShowP');
CB_SlideB = document.getElementById('CB_SlideShowBar');
CB_Prv = document.getElementById('CB_Prev');
CB_Nxt = document.getElementById('CB_Next');
CB_Txt = document.getElementById('CB_Text');
CB_Txt.style.height = (CB_TextH - CB_PadT) + 'px';
CB_Txt.style.marginTop = CB_PadT + 'px';
CB_Txt.style.fontFamily = CB_Font;
CB_Txt.style.fontSize = CB_FontSize + 'px';
CB_Txt.style.fontWeight = CB_FontWeigth;
CB_Txt.style.color = CB_FontColor;
CB_Header = document.getElementById('CB_Header').style;
CB_Header.height = CB_RoundPix + 'px';
CB_Footer = document.getElementById('CB_Footer').style;
CB_Footer.height = CB_RoundPix + 'px';
CB_Left = document.getElementById('CB_Left').style;
CB_Left.width = CB_RoundPix + CB_ie6RPBug + 'px';
CB_Right = document.getElementById('CB_Right').style;
CB_Right.width = CB_RoundPix + 'px';
if (navigator.userAgent.indexOf("MSIE") !=  - 1 && navigator.userAgent.indexOf("Windows") !=  - 1 && navigator.userAgent.indexOf("MSIE 7") ==  - 1)
{
CB_pngFixIE()
}
if (navigator.userAgent.indexOf("Opera") !=  - 1)
{
CB_BodyMarginX = 0;
CB_BodyMarginY = 0
}
if (navigator.userAgent.indexOf("Firefox") !=  - 1)
{
CB_BodyMarginY = 0
}
}
CB_Links = document.getElementsByTagName('a');
for (i = 0; i < CB_Links.length; i++)
{
CB_Rel = CB_Links[i].rel;
CB_URL = CB_Links[i].getAttribute('href');
if (CB_Rel.match('clearbox') != null && CB_Show != 0)
{
if (CB_Rel == 'clearbox')
{
CB_Links[i].onclick = function()
{
CB_ClickURL(this.rel + '+\\+' + this.getAttribute('href') + '+\\+' + this.getAttribute('title'));
return false
}
}
else
{
if (CB_Rel.substring(0, 8) == 'clearbox' && CB_Rel.charAt(8) == '[' && CB_Rel.charAt(CB_Rel.length - 1) == ']')
{
if (CB_Links[i].rel.substring(9, CB_Links[i].rel.length - 1).split(',')[0] != 'clearbox')
{
CB_Links[i].onclick = function()
{
CB_ClickURL(this.rel.substring(9, this.rel.length - 1) + '+\\+' + this.getAttribute('href') + '+\\+' + this.getAttribute('title'));
return false
}
}
else
{
alert('ClearBox HIBA:\n\nClearBox galeria neve NEM lehet "clearbox[clearbox]"!\n(Helye: dokumentum, a ' + i + '. <a> tag-en belul.)')
}
}
else
{
alert('ClearBox HIBA:\n\nHibasan megadott clearbox REL azonosito: "' + CB_Links[i].rel + '"!\n(Helye: dokumentum, a ' + i + '. <a> tag-en belul.)')
}
}
}
}
}

function CB_ClickURL(a)
{
if (CB_Show == 0)
{
return false
}
CB_Cls.onclick = '';
CB_SlideS.onclick = '';
CB_SlideP.onclick = '';
CB_Clicked = a.split('+\\+');
CB_Rel = CB_Clicked[0].split(',');
if (CB_Rel[1] > 0)
{
CB_SlShowTimer = parseInt(CB_Rel[1]) * 1000
}
else
{
CB_SlShowTimer = CB_SlShowTime
}
if (CB_Rel[2] == 'start')
{
CB_SS = 'pause'
}
if (CB_Gallery && CB_Rel[0] == CB_Gallery[0][0] && CB_Gallery[0][0] != 'clearbox'){}
else
{
CB_Gallery = new Array;
CB_Gallery.push(new Array(CB_Rel[0], CB_Rel[1], CB_Rel[2]));
if (CB_Clicked[0] == 'clearbox')
{
CB_Gallery.push(new Array(CB_Clicked[1], CB_Clicked[2]))
}
else
{
for (i = 0; i < CB_Links.length; i++)
{
if (CB_Links[i].rel.substring(9, CB_Links[i].rel.length - 1).split(',')[0] == CB_Gallery[0][0])
{
CB_Gallery.push(new Array(CB_Links[i].getAttribute('href'), CB_Links[i].getAttribute('title')))
}
}
}
}
CB_ActImgId = 0;
while (CB_Gallery[CB_ActImgId][0] != CB_Clicked[1])
{
CB_ActImgId++
}
CB_ImgWidthOld = CB_WinBaseW;
CB_ImgHeightOld = CB_WinBaseH - CB_TextH;
getBrowserSize();
getDocumentSize();
getScrollPosition();
if (BrSizeY > DocSizeY)
{
DocSizeY = BrSizeY
}
if ((navigator.userAgent.indexOf("Netscape") !=  - 1 || navigator.userAgent.indexOf("Firefox") !=  - 1) && BrSizeX != DocSizeX)
{
FF_ScrollbarBug = window.scrollMaxY + window.innerHeight - DocSizeY
}
else
{
FF_ScrollbarBug = 0
}
CB_SetMargins();
if (CB_BodyMarginX == 0)
{
if (DocSizeX > BrSizeX)
{
CB_HideContent.style.width = DocSizeX + 'px'
}
else
{
CB_HideContent.style.width = BrSizeX + 'px'
}
}
else
{
CB_HideContent.style.width = DocSizeX + CB_BodyMarginX + 'px'
}
CB_HideContent.style.height = BrSizeY + DocScrY + 'px';
CB_HideContent.style.visibility = 'visible';
CB_HideDocument()
}




function CB_HideDocument()
{
if (CB_ii < CB_HideOpacity)
{
CB_ii += CB_OpacityStep;
CB_HideContent.style.opacity = (CB_ii / 100);
CB_HideContent.style.MozOpacity = (CB_ii / 100);
CB_HideContent.style.KhtmlOpacity = (CB_ii / 100);
CB_HideContent.style.filter = "alpha(opacity=" + CB_ii + ")";
CB_Hide = CB_ii;
CB_Blur = setTimeout("CB_HideDocument()", 5)
}
else
{
CB_ii = 0;
CB_HideContent.style.height = DocSizeY + CB_BodyMarginY + 'px';
if (CB_HideOpacity != 0)
{
clearTimeout(CB_Blur)
}
CB_NewWindow()
}
}

function CB_NewWindow()
{
CB_Img.style.width = CB_WinBaseW + 'px';
CB_Img.style.height = (CB_WinBaseH - CB_TextH) + 'px';
CB_Img.style.display = 'block';
CB_Img.style.visibility = 'hidden';
CB_Win.style.visibility = 'visible';
CB_LoadImage()
}

function CB_LoadImage(a)
{
CB_ClearBox = 'ki';
CB_jj = 0;
CB_HideContent.onclick = '';
if (CB_Gallery.length < 3)
{
CB_SlideS.style.display = 'none';
CB_SlideP.style.display = 'none'
}
else
{
if (CB_SS == 'start')
{
CB_SlideS.style.display = 'block';
CB_SlideP.style.display = 'none'
}
else
{
CB_SlideP.style.display = 'block';
CB_SlideS.style.display = 'none'
}
}
CB_Prv.style.display = 'none';
CB_Nxt.style.display = 'none';
if (a)
{
CB_ActImgId = parseInt(a)
}
CB_JumpX = CB_Jump_X;
CB_JumpY = CB_Jump_Y;
if (CB_Animation != 'warp')
{
CB_Img.style.visibility = 'hidden';
CB_LoadingImg.style.visibility = 'visible'
}
CB_Txt.innerHTML = CB_LoadingText;
CB_Count = 0;
CB_preImages = new Image();
CB_preImages.src = CB_Gallery[CB_ActImgId][0];
CB_Loaded = false;
CB_preImages.onerror = function()
{
CB_ShowImage();
alert('找不到文件： ' + CB_Gallery[CB_ActImgId][0]);
return 
};
CB_CheckLoaded()
}

function CB_CheckLoaded()
{
if (CB_Count == 1)
{
CB_Loaded = true;
clearTimeout(CB_ImgLoadTimer);
CB_GetImageSize();
return 
}
if (CB_Loaded == false && CB_preImages.complete)
{
CB_Count++
}
CB_ImgLoadTimer = setTimeout("CB_CheckLoaded()", 5);
return 
}

function CB_GetImageSize()
{
CB_ImgWidth = CB_preImages.width;
CB_ImgHeight = CB_preImages.height;
CB_ImgWidthOrig = CB_ImgWidth;
CB_ImgHeightOrig = CB_ImgHeight;
CB_ImgRate = CB_ImgWidth / CB_ImgHeight;
CB_FitToBrowser();
CB_Img.src = CB_Gallery[CB_ActImgId][0];
CB_IsAnimating = 1;
if (CB_Animation == 'double')
{
CB_AnimX = 'false';
CB_AnimY = 'false';
CB_WindowResizeX();
CB_WindowResizeY();
CB_CheckResize()
}
else if (CB_Animation == 'warp')
{
CB_LoadingImg.style.visibility = 'hidden';
CB_Img.style.visibility = 'visible';
CB_AnimX = 'false';
CB_AnimY = 'false';
CB_WindowResizeX();
CB_WindowResizeY();
CB_CheckResize()
}
else if (CB_Animation == 'ki')
{
CB_SetMargins();
CB_ImgCont.style.height = CB_ImgHeight + (2 * CB_ImgBorder) + 'px';
CB_Img.style.width = CB_ImgWidth + 'px';
CB_Img.style.height = CB_ImgHeight + 'px';
CB_ShowImage()
}
else if (CB_Animation == 'normal')
{
CB_WindowResizeX()
}
return 
}

function CB_WindowResizeX()
{
if (CB_ImgWidth == CB_ImgWidthOld)
{
if (CB_TimerX)
{
clearTimeout(CB_TimerX)
}
if (CB_Animation != 'double' && CB_Animation != 'warp')
{
CB_WindowResizeY()
}
else
{
CB_AnimX = 'true'
}
return 
}
else
{
if (CB_ImgWidth < CB_ImgWidthOld)
{
if (CB_ImgWidthOld < CB_ImgWidth + 100 && CB_Jump_X > 20)
{
CB_JumpX = 20
}
if (CB_ImgWidthOld < CB_ImgWidth + 60 && CB_Jump_X > 10)
{
CB_JumpX = 10
}
if (CB_ImgWidthOld < CB_ImgWidth + 30 && CB_Jump_X > 5)
{
CB_JumpX = 5
}
if (CB_ImgWidthOld < CB_ImgWidth + 15 && CB_Jump_X > 2)
{
CB_JumpX = 2
}
if (CB_ImgWidthOld < CB_ImgWidth + 4)
{
CB_JumpX = 1
}
CB_ImgWidthOld -= CB_JumpX
}
else
{
if (CB_ImgWidthOld > CB_ImgWidth - 100 && CB_Jump_X > 20)
{
CB_JumpX = 20
}
if (CB_ImgWidthOld > CB_ImgWidth - 60 && CB_Jump_X > 10)
{
CB_JumpX = 10
}
if (CB_ImgWidthOld > CB_ImgWidth - 30 && CB_Jump_X > 50)
{
CB_JumpX = 5
}
if (CB_ImgWidthOld > CB_ImgWidth - 15 && CB_Jump_X > 2)
{
CB_JumpX = 2
}
if (CB_ImgWidthOld > CB_ImgWidth - 4)
{
CB_JumpX = 1
}
CB_ImgWidthOld += CB_JumpX
}
CB_Img.style.width = CB_ImgWidthOld + 'px';
CB_MarginL = parseInt(DocScrX - (CB_ImgWidthOld + (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd))) / 2);
CB_Win.style.marginLeft = CB_MarginL + 'px';
CB_TimerX = setTimeout("CB_WindowResizeX()", CB_AnimTimeout)
}
}

function CB_WindowResizeY()
{
if (CB_ImgHeight == CB_ImgHeightOld)
{
if (CB_TimerY)
{
clearTimeout(CB_TimerY)
}
if (CB_Animation != 'double' && CB_Animation != 'warp')
{
CB_ShowImage()
}
else
{
CB_AnimY = 'true'
}
return 
}
else
{
if (CB_ImgHeight < CB_ImgHeightOld)
{
if (CB_ImgHeightOld < CB_ImgHeight + 100 && CB_Jump_Y > 20)
{
CB_JumpY = 20
}
if (CB_ImgHeightOld < CB_ImgHeight + 60 && CB_Jump_Y > 10)
{
CB_JumpY = 10
}
if (CB_ImgHeightOld < CB_ImgHeight + 30 && CB_Jump_Y > 5)
{
CB_JumpY = 5
}
if (CB_ImgHeightOld < CB_ImgHeight + 15 && CB_Jump_Y > 2)
{
CB_JumpY = 2
}
if (CB_ImgHeightOld < CB_ImgHeight + 4)
{
CB_JumpY = 1
}
CB_ImgHeightOld -= CB_JumpY
}
else
{
if (CB_ImgHeightOld > CB_ImgHeight - 100 && CB_Jump_Y > 20)
{
CB_JumpY = 20
}
if (CB_ImgHeightOld > CB_ImgHeight - 60 && CB_Jump_Y > 10)
{
CB_JumpY = 10
}
if (CB_ImgHeightOld > CB_ImgHeight - 30 && CB_Jump_Y > 5)
{
CB_JumpY = 5
}
if (CB_ImgHeightOld > CB_ImgHeight - 15 && CB_Jump_Y > 2)
{
CB_JumpY = 2
}
if (CB_ImgHeightOld > CB_ImgHeight - 4)
{
CB_JumpY = 1
}
CB_ImgHeightOld += CB_JumpY
}
CB_Img.style.height = CB_ImgHeightOld + 'px';
CB_ImgCont.style.height = CB_ImgHeightOld + (2 * CB_ImgBorder) + 'px';
CB_MarginT = parseInt(DocScrY - (CB_ieRPBug + CB_ImgHeightOld + CB_TextH + (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd))) / 2);
CB_Win.style.marginTop = (CB_MarginT - (FF_ScrollbarBug / 2)) + 'px';
CB_TimerY = setTimeout("CB_WindowResizeY()", CB_AnimTimeout)
}
}

function CB_CheckResize()
{
if (CB_AnimX == 'true' && CB_AnimY == 'true')
{
clearTimeout(CB_ResizeTimer);
CB_ShowImage();
return 
}
else
{
CB_ResizeTimer = setTimeout("CB_CheckResize()", 5)
}
}

function CB_ShowImage()
{
CB_Cls.onclick = function()
{
CB_Close()
};
CB_SlideS.onclick = function()
{
CB_SSStart();
return false
};
CB_SlideP.onclick = function()
{
CB_SSPause();
return false
};
if (CB_Animation != 'warp')
{
CB_Txt.innerHTML = '';
CB_LoadingImg.style.visibility = 'hidden';
CB_Img.src = CB_Gallery[CB_ActImgId][0];
CB_Img.style.visibility = 'visible'
}
CB_Cls.style.display = 'block';
CB_HideContent.onclick = function()
{
CB_Close();
return false
};
CB_Prv.style.height = CB_ImgHeight + 'px';
CB_Nxt.style.height = CB_ImgHeight + 'px';
if (CB_Gallery[CB_ActImgId][1] && CB_Gallery[CB_ActImgId][1] != 'null' && CB_Gallery[CB_ActImgId][1] != null)
{
CB_Txt.innerHTML = "<a target='_blank' href='"+CB_Gallery[CB_ActImgId][0]+"' alt=\'打开原图片<br/>快捷键：/ 或 5\'>" + CB_Gallery[CB_ActImgId][1] + "</a>";
}
else
{
if (CB_ShowImgURL == 'be')
{
CB_Txt.innerHTML = (CB_Gallery[CB_ActImgId][0].split('/'))[(CB_Gallery[CB_ActImgId][0].split('/').length) - 1]
}
}
if (CB_ImgNum == 'be' && CB_Gallery.length > 2)
{
CB_Txt.innerHTML += ' ' + CB_ImgNumBracket.substring(0, 1) + CB_ActImgId + '/' + (CB_Gallery.length - 1) + CB_ImgNumBracket.substring(1, 2)
}
CB_PrevNext();
CB_Txt.style.visibility = 'visible';
if (CB_Gallery.length > 0)
{
CB_ImgWidthOld = CB_ImgWidth;
CB_ImgHeightOld = CB_ImgHeight
}
if (CB_Gallery.length > 2)
{
if (CB_SS == 'pause')
{
CB_SlideP.style.display = 'block';
CB_SlideB.style.display = 'block';
CB_SlideShow()
}
else
{
CB_SlideS.style.display = 'block'
}
}
else
{
CB_SS = 'start'
}
CB_ClearBox = 'be';
CB_IsAnimating = 0;
return 
}

function CB_FullSize()
{
CB_Img.style.width = CB_ImgWidthOrig + 'px';
CB_Img.style.height = CB_ImgHeightOrig + 'px';
CB_ImgCont.style.height = CB_ImgHeightOrig + (2 * CB_ImgBorder) + 'px'
}

function CB_SlideShowStop()
{
CB_SS = 'start';
CB_SlideShowJump()
}

function CB_SlideShowJump()
{
if (CB_SSTimer)
{
clearTimeout(CB_SSTimer)
}
CB_jj = 0;
CB_SlideBW = 0;
CB_SlideB.style.display = 'none'
}

function CB_SlideShow()
{
if (CB_SlShowTimer > CB_jj)
{
CB_SSTimer = setTimeout("CB_SlideShow()", 25);
CB_jj += 25;
CB_SlideBW += (CB_ImgWidth - 44) / (CB_SlShowTimer / 25);
CB_SlideB.style.width = CB_SlideBW + 'px'
}
else
{
clearTimeout(CB_SSTimer);
CB_SlideBW = 0;
CB_SlideB.style.width = CB_SlideBW + 'px';
if (CB_ActImgId == CB_Gallery.length - 1)
{
CB_LoadImage(1)
}
else
{
CB_LoadImage(CB_ActImgId + 1)
}
return 
}
}

function CB_FitToBrowser()
{
if (CB_ImgWidth > BrSizeX - (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd + CB_WinPadd)))
{
CB_ImgWidth = BrSizeX - (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd + CB_WinPadd));
CB_ImgHeight = Math.round(CB_ImgWidth / CB_ImgRate)
}
if (CB_ImgHeight > BrSizeY - (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd + CB_WinPadd)) - CB_TextH)
{
CB_ImgHeight = BrSizeY - (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd + CB_WinPadd)) - CB_TextH;
CB_ImgWidth = Math.round(CB_ImgRate * CB_ImgHeight)
}
return 
}

function CB_SetMargins()
{
CB_MarginL = parseInt(DocScrX - (CB_ImgWidth + (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd))) / 2);
CB_MarginT = parseInt(DocScrY - (CB_ieRPBug + CB_ImgHeight + CB_TextH + (2 * (CB_RoundPix + CB_ImgBorder + CB_Padd))) / 2);
CB_Win.style.marginLeft = CB_MarginL + 'px';
CB_Win.style.marginTop = (CB_MarginT - (FF_ScrollbarBug / 2)) + 'px';
return 
}

function CB_PrevNext()
{
if (CB_ActImgId > 1)
{
if (CB_Preload == 'be')
{
PreloadPrv = new Image();
PreloadPrv.src = CB_Gallery[CB_ActImgId - 1][0]
}
if (CB_TextNav == 'be')
{
var a = CB_Txt.innerHTML;
CB_Txt.innerHTML = '<a class="CB_TextNav" href="javascript:void(0)" onclick="if(CB_SSTimer){CB_SlideShowJump();}CB_LoadImage(' + (CB_ActImgId - 1) + ')" alt="快捷键：&lt; 或 4">' + CB_NavTextPrv + '</a> ' + a
}
CB_Prv.style.display = 'block';
CB_Prv.onclick = function()
{
if (CB_SSTimer)
{
CB_SlideShowJump()
}
CB_LoadImage(CB_ActImgId - 1);
return false
}
}
if (CB_ActImgId < CB_Gallery.length - 1)
{
if (CB_Preload == 'be')
{
PreloadNxt = new Image();
PreloadNxt.src = CB_Gallery[CB_ActImgId + 1][0]
}
if (CB_TextNav == 'be')
{
CB_Txt.innerHTML += ' <a class="CB_TextNav" href="javascript:void(0)" onclick="if(CB_SSTimer){CB_SlideShowJump();}CB_LoadImage(' + (CB_ActImgId + 1) + ')" alt="快捷键：&gt; 或 6">' + CB_NavTextNxt + '</a>'
}
CB_Nxt.style.display = 'block';
CB_Nxt.onclick = function()
{
if (CB_SSTimer)
{
CB_SlideShowJump()
}
CB_LoadImage(CB_ActImgId + 1);
return false
}
}
return 
}

function CB_Close()
{
CB_SlideShowStop();
CB_Txt.innerHTML = "";
CB_Img.src = "";
CB_ImgWidth = CB_WinBaseW;
CB_ImgHeight = CB_WinBaseH - CB_TextH;
CB_ImgCont.style.height = CB_ImgHeight + (2 * CB_ImgBorder) + 'px';
CB_Img.style.display = 'none';
CB_Win.style.visibility = 'hidden';
CB_HideContent.onclick = "";
CB_ShowDocument();
return 
}

function CB_ShowDocument()
{
if (CB_Hide > 0)
{
CB_HideContent.style.opacity = (CB_Hide / 100);
CB_HideContent.style.MozOpacity = (CB_Hide / 100);
CB_HideContent.style.KhtmlOpacity = (CB_Hide / 100);
CB_HideContent.style.filter = "alpha(opacity=" + CB_Hide + ")";
CB_Hide -= CB_OpacityStep;
CB_Blur = setTimeout("CB_ShowDocument()", 5)
}
else
{
CB_HideContent.style.visibility = 'hidden';
CB_HideContent.style.width = '0px';
CB_HideContent.style.height = '0px';
if (CB_HideOpacity != 0)
{
clearTimeout(CB_Blur)
}
CB_ClearBox = 'ki';
return 
}
}

function getDocumentSize()
{
this.DocSizeX = 0;
this.DocSizeY = 0;
if (window.innerWidth && window.scrollMaxX)
{
DocSizeX = window.innerWidth + window.scrollMaxX;
DocSizeY = window.innerHeight + window.scrollMaxY
}
else if (document.body.scrollWidth > document.body.offsetWidth)
{
DocSizeX = document.body.scrollWidth;
DocSizeY = document.body.scrollHeight
}
else
{
DocSizeX = document.body.offsetWidth;
DocSizeY = document.body.offsetHeight
}
if (navigator.userAgent.indexOf("MSIE") !=  - 1 || navigator.userAgent.indexOf("Opera") !=  - 1)
{
DocSizeX = document.body.scrollWidth;
DocSizeY = document.body.scrollHeight
}
if (navigator.userAgent.indexOf("Firefox") !=  - 1 || navigator.userAgent.indexOf("Netscape") !=  - 1)
{
DocSizeX = BrSizeX + window.scrollMaxX;
DocSizeY = BrSizeY + window.scrollMaxY
}
return 
}

function getBrowserSize()
{
this.BrSizeX = 0;
this.BrSizeY = 0;
if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight))
{
BrSizeX = document.documentElement.clientWidth;
BrSizeY = document.documentElement.clientHeight
}
else if (typeof(window.innerWidth) == 'number')
{
BrSizeX = window.innerWidth;
BrSizeY = window.innerHeight
}
else if (document.body && (document.body.clientWidth || document.body.clientHeight))
{
BrSizeX = document.body.clientWidth;
BrSizeY = document.body.clientHeight;
return 
}
if (navigator.userAgent.indexOf("Opera") !=  - 1)
{
BrSizeX = document.documentElement.clientWidth;
BrSizeY = document.body.clientHeight
}
if (document.compatMode.match('Back') && navigator.userAgent.indexOf("Firefox") !=  - 1)
{
BrSizeY = document.body.clientHeight
}
return 
}

function getScrollPosition()
{
this.DocScrX = 0;
this.DocScrY = 0;
if (typeof(window.pageYOffset) == 'number')
{
DocScrY = window.pageYOffset;
DocScrX = window.pageXOffset
}
else if (document.body && (document.body.scrollLeft || document.body.scrollTop))
{
DocScrY = document.body.scrollTop;
DocScrX = document.body.scrollLeft
}
else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop))
{
DocScrY = document.documentElement.scrollTop;
DocScrX = document.documentElement.scrollLeft
}
return 
}

function CB_pngFixIE()
{
var s, i, j;
var a = new Array();
a.push(document.getElementById('CB_CloseWindow'));
a.push(document.getElementById('CB_SlideShowS'));
a.push(document.getElementById('CB_SlideShowP'));
for (i = 0; i < a.length; i++)
{
s = a[i].getAttribute('src');
if (s.toLowerCase().indexOf(".png") !=  - 1)
{
a[i].src = CB_PicDir + 'blank.gif';
a[i].style.filter += "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + s + "', sizingMethod=image);"
}
}
for (i = 0; i < document.styleSheets.length; i++)
{
if (document.styleSheets[i].href.match('clearbox.css'))
{
var b = document.styleSheets[i].href.lastIndexOf("/");
var c = (b !=  - 1) ? document.styleSheets[i].href.substring(0, b + 1): "";
for (j = 0; j < document.styleSheets[i].rules.length; j++)
{
var d = document.styleSheets[i].rules[j].style;
if (d.backgroundImage.toLowerCase().indexOf(".png") !=  - 1)
{
var e = d.backgroundImage.substring(4, d.backgroundImage.length - 1);
if (e.indexOf("http://") != 0 && e.indexOf("/") != 0)
{
e = c + e;
d.backgroundImage = "none";
d.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + e+"', sizingMethod='crop');"
}
}
}
}
}
}