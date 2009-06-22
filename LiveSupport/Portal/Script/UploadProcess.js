function ConvertToFileSize(_size)
{
	if(_size<=0) return '0 Byte';
	var _rank	= 0;
	var _decimal = _size;
	while(_decimal/1024>1)
	{
		_rank++;
		_decimal= _decimal/1024;
	}
	_decimal= _decimal.toString();
	_decimal= _decimal.substring(0,_decimal.indexOf('.')+3);
	var _value;
	switch(_rank)
	{
		default:
		case 0: _value	= _decimal+ ' Bytes';break;
		case 1: _value	= _decimal+ ' KB';break;
		case 2: _value	= _decimal+ ' MB';break;
		case 3: _value	= _decimal+ ' GB';break;
		case 4: _value	= _decimal+ ' TB';break;
		case 5: _value	= _decimal+ ' EB';break;
	}
	return _value;
}

function GetFileName()
{
	if(_currentFileName.length>0)
	{
		var _start	= _currentFileName.lastIndexOf('\\')+1;
		var _end	= _currentFileName.length-1;
		var _fileName = _currentFileName.substring(_start,_end).replace(" filename=\"","");
		if(_fileName.length>30){
			return _fileName.substring(0,30)+'...';
		}else{
			return 	_fileName;
		}
	}else{
		return 'unknow';
	}
}

function GetTimeReamin()
{
	if(_currentSize==0) return '未知';
	if(_avgSpeed<=0) return '未知';
	if(_totalSize-_currentSize<=0) return '小于1分钟.';
	var _reaminSecond	= (_totalSize-_currentSize)/_avgSpeed;
	var _hour	= Math.floor(_reaminSecond/3600);
	var _minute= Math.floor((_reaminSecond%3600)/60);
	var _second= Math.floor(_reaminSecond%60);
	if(_hour<10) _hour = '0'+_hour.toString();
	if(_minute<10) _minute = '0'+_minute.toString();
	if(_second<10) _second = '0'+_second.toString();
	return _hour+':'+_minute+':'+_second;
}

function SetButtons()
{
	if(_currentSize<_totalSize)
	{
		$('o_but_ok').disabled	= true;
		$('o_but_cancel').disabled	= false;
	}
	else
	{
		$('o_but_ok').disabled	= false;
		$('o_but_cancel').disabled	= true;
	}
}

function OK_Click()
{
	window.opener=self;window.close();
	return false;
}

function Cancel_Click()
{
	if(CheckBrowser())	
	{
		try{
			dialogArguments.location.href=dialogArguments.location.href;
			window.close();
		}catch(ex){}
	}
	else
	{
		window.opener.opener=null;
		window.opener.location.href=window.opener.location.href;
		window.close();
		this.disabled=true;
	}
	return true;
}

function CheckBrowser()
{
	if (navigator.appName == 'Microsoft Internet Explorer') 
	{ 
		start = navigator.userAgent.indexOf('MSIE ') + 'MSIE '.length 
		if(navigator.userAgent.indexOf(';', start) > 0) 
		{
			end = navigator.userAgent.indexOf(';', start) 
		} 
		else 
		{ 
			end = navigator.userAgent.indexOf(')', start) 
		} 
		version = parseFloat(navigator.userAgent.substring(start, end)) 
		if(version>5.5)	return true;
	}
	return false;
}

function GetStaut()
{
    switch(_status)
    {
    default:
    return '初始化上传。。。';
    break;
    case 1:
    return '文件上传中。。。';
    break;
    case 2:
    return '上传完成，处理文件中。。。';
    break;
    }
}

function Init()
{
	try
	{
	$('o_totalSize').innerHTML	= ConvertToFileSize(_totalSize);
	$('o_currentSize').innerHTML	= ConvertToFileSize(_currentSize)+' ('+_percent+'% )';
    $('o_currentFile').innerHTML= GetFileName();
    $('o_percent').style.width	= _percent+'%';
    $('o_avgSpeed').innerHTML= ConvertToFileSize(_avgSpeed)+'/s';
    $('o_status').innerHTML	= GetStaut();
    $('o_timeLeft').innerHTML= GetTimeReamin();	
    document.title='已上传：'+ _percent+'%';
    SetButtons();
	}
	catch(e)
	{
	}
}
var url;
function UpdateUploadStatus(id){
	Init();
	url='UploadStatusBar.aspx?UploadGUID='+id+'&t=';
	setInterval("Run()", 1000);
}

function Run()
{
	var funProcess=function(readyState,responseText)
    {
        if(readyState==4)
        {
            arr = responseText.split(',');
            _percent = parseInt(arr[0]);
            _currentSize = parseInt(arr[1]);
            _totalSize = parseInt(arr[2]);
            _currentFileName = arr[3];
            _timeSpan =parseInt(arr[4]);
            _avgSpeed = parseInt(arr[5]);
            _uploadFinished = arr[6];
            _status = parseInt(arr[7]);
        }
    }
    AjaxRunFunction(funProcess,url + Math.random());
    Init();
}