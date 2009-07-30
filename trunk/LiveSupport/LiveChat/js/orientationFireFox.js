var LCS_chatBanner_contentHtml = '<a href="#" onclick="openChat();" ><img id="_imgLC" src="' + LCS_homeUrl + '/ProcessImage.ashx?aid=' + LCS_accountId + '&vid=' + LCS_visitorId + '&referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>';
if (LCS_bannerPos != 0) {
    var LCS_chatBanner_DIV = document.createElement('div');
    LCS_chatBanner_DIV.id = "LCS_chatBanner";
    LCS_chatBanner_DIV.innerHTML = LCS_chatBanner_contentHtml;
    window.onload = function() {
        document.body.appendChild(LCS_chatBanner_DIV);
        document.body.appendChild(LCS_invite_div);
        chatBannerPosition();//调用对话图片位置的方法
    }
} else {
document.write('<div>' + LCS_chatBanner_contentHtml + '</div>');
window.onload = function() {
document.body.appendChild(LCS_invite_div);
}
}
///
function getscrollLeft()
{
  if (document.documentElement && document.documentElement.scrollTop)
    return document.documentElement.scrollLeft;
  else if (document.body)
   return  document.body.scrollLeft
}
function getscrollTop()
{
  if (document.documentElement && document.documentElement.scrollTop)
    return document.documentElement.scrollTop;
  else if (document.body)
   return  document.body.scrollTop
}
function getclientHeight()
{
	if (document.documentElement && document.documentElement.scrollTop)
    return document.documentElement.clientHeight;
    else if (document.body)
    return  document.body.clientHeight
}
function getclientWidth()
{
	if (document.documentElement && document.documentElement.scrollTop)
    return document.documentElement.clientWidth;
    else if (document.body)
    return  document.body.clientWidth
}
var lcs_divTop;
var lcs_divWidth;
function chatBannerPosition() {
    var LCS_chatBanner = document.getElementById('LCS_chatBanner');
    LCS_chatBanner.style.position = 'absolute';
    LCS_chatBanner.style.zIndex = 10000;
    if (LCS_bannerPos == 1) {
        lcs_divTop = 0;
        lcs_divWidth =0;
    }
    if (LCS_bannerPos == 2) {
        lcs_divTop = 0;
        lcs_divWidth = getclientWidth() - LCS_chatBanner.offsetWidth;
          
    }
    if (LCS_bannerPos == 3) {
        lcs_divTop =200;
        lcs_divWidth=0;
    }
    if (LCS_bannerPos == 4) {
        lcs_divTop = 200;
        lcs_divWidth = getclientWidth() - LCS_chatBanner.offsetWidth;
    }
    if (LCS_bannerPos == 5) {
        lcs_divTop = getscrollTop() + getclientHeight() - LCS_chatBanner.offsetHeight;
        lcs_divWidth =0;
    }
    if (LCS_bannerPos == 6) {
        lcs_divTop =getscrollTop() + getclientHeight() - LCS_chatBanner.offsetHeight;
        lcs_divWidth =getclientWidth() - LCS_chatBanner.offsetWidth;
    }
    var theFloaters		= new floaters();
    theFloaters.addItem('LCS_chatBanner',lcs_divWidth,lcs_divTop,LCS_chatBanner_contentHtml);
	theFloaters.play();
}
	
	
	var delta=0.8;
	var collection;
	var closeB=false;
	function floaters() {
		this.items	= [];
		this.addItem	= function(id,x,y,content)
				  {
				    var newItem				= {};
					newItem.object			= document.getElementById(id);
					newItem.x				= x;
					newItem.y				= y;

					this.items[this.items.length]		= newItem;
				  }
		this.play	= function()
				  {
					collection = this.items
					setInterval('play()',30);
				  }
		}
		function play()
		{
			if(screen.width<=800 || closeB)
			{
				for(var i=0;i<collection.length;i++)
				{
					collection[i].object.style.display	= 'none';
				}
				return;
			}
			for(var i=0;i<collection.length;i++)
			{
				var followObj		= collection[i].object;
				var followObj_x		=eval(collection[i].x);
				var followObj_y		= eval(collection[i].y);

				if(followObj.offsetLeft!=(getscrollLeft()+followObj_x)) {
					var dx=(getscrollLeft()+followObj_x-followObj.offsetLeft)*delta;
					dx=(dx>0?1:-1)*Math.ceil(Math.abs(dx));
					followObj.style.left=followObj.offsetLeft+dx;
					}

				if(followObj.offsetTop!=(getscrollTop()+followObj_y)) {
					var dy=(getscrollTop()+followObj_y-followObj.offsetTop)*delta;
					dy=(dy>0?1:-1)*Math.ceil(Math.abs(dy));
					followObj.style.top=followObj.offsetTop+dy;
					}
				followObj.style.display	= '';
			}
		}	
		function closeBanner()
		{
			closeB=true;
			return;
		}