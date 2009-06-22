function Correlative(value, id)
{
value.value > 0 ? document.getElementById(id).style.display = "":
document.getElementById(id).style.display = "none";
}

function PreviewImg(controlID,img)
{
if(!img || !img.value) return;
img.value=img.value.toLowerCase();
var patn = /\.jpg$|\.jpeg$|\.png$|\.gif$/i;
if(patn.test(img.value))
{
$("ctl00_cph_btnSubmit").disabled=false;
$(controlID).innerHTML = '<img src="file:///'+img.value+'" style="height:120px" />';
$(controlID).style.display="";
}
else
{
$("ctl00_cph_btnSubmit").disabled=true;
alert("对不起，不支持该格式的文件！");
$(controlID).style.display="none";
}
}

function D()
{
    return confirm('确定删除该信息？删除后不可还原。');
}

function R()
{
    return confirm('确定将该信息放入回收站？');
}

function Batch()
{
    if(!confirm("执行所选操作？"))
    {
        return false;
    }
    if(GetCount("IDBatch")<1 && $("ddlBatchType").value!="da" && $("ddlBatchType").value!="rsa")
    {
        SetTipBoxText("Result","[对不起，请选择要操作的项！]");return false;
    }
    return true;
}

function checkCheckBoxs(ids)
{
    if(ids)
    {
        ids = ids.toString();
        if(ids.length>0)
        {
            var array = ids.split(',');
            for(var i=0;i<array.length;i++)
            {
                $("cbPlugin"+array[i]).checked=true;
            }
        }
    }
}

var passControl=false;

function Pass(control,id)
{
    if(!control || passControl)return;
    passControl = true;
    var _passPage=document.URL.replace(/(.*\/){0,}([^\.]+).*/ig,"$2");
    var fun=function(readyState,responseText)
    {
        if(readyState==1)
        {
            control.parentNode.innerHTML = "<span class=\"orangeText\">处理中</span>";
        }
        if(readyState==4)
        {
            if(parseInt(responseText)>0)
            {
                if(control.innerHTML=="是")
                {
                    control.parentNode.innerHTML = "<span class=\"redText pointer\" onclick=\"Pass(this," + id + ")\">否</span>";
                }
                else if(control.innerHTML=="否")
                {
                    control.parentNode.innerHTML ="<span class=\"greenText pointer\" onclick=\"Pass(this, " + id + ")\">是</span>";
                }
                else
                {
                    control.parentNode.innerHTML ="<span class=\"blueText\">无权</span>";
                }
            }
            else
            {
                control.parentNode.innerHTML ="<span class=\"orangeText\">无权</span>";
            }
        }
    }
    var sid="";
    if(parseInt($Q("sid")))
    {
        sid="&sid="+parseInt($Q("sid"));
    }
    if(parseInt($Q("mid")))
    {
        sid+="&mid="+parseInt($Q("mid"));
    }
    if(control.innerHTML.substring(0,1)=="是")
    {
        AjaxRunFunction(fun,_passPage + ".aspx?op=cps&id="+id+sid+"&t=" + Math.random());
    }
    else
    {
        AjaxRunFunction(fun,_passPage + ".aspx?op=ps&id="+id+sid+"&t=" + Math.random());
    }
    passControl=false;
}

function GetTime()
{
time = $('Time');
var fun=function(readyState,responseText)
{
if(readyState==4)
{
t = responseText;
timeArray = t.split(',');
t = new Date(timeArray[0], timeArray[1], timeArray[2], timeArray[3],timeArray[4], timeArray[5]);
}
}
AjaxRunFunction(fun,"GetServerTime.aspx?" + Math.random());
}


/***************************************************
选择高亮列表的行
***************************************************/
var srcInput = document.all ? window.dialogArguments : opener.FFDialogArgument;
function Init()
{
    if (srcInput != null)
    {
        var arr = document.getElementsByName("IDBatch");
        for (var i=0; i<arr.length; i++)
        {
            if (Instr(srcInput.value, arr[i].value))
            {
                arr[i].checked = true;
                Check(arr[i]);
            }
            else
            {
                isCheckAll = false;
            }
        }
        if ($('ckbAll'))
        {
            $('ckbAll').checked = isCheckAll;
        }
    }
}

function Check(ckb)
{
    if (ckb.checked)
    {
		if (srcInput != null)
		{
			if (!Instr(srcInput.value, ckb.value))
			{
				if (srcInput.value == "")
				{
					srcInput.value = ckb.value;
				}
				else
				{
					srcInput.value += "," + ckb.value;
				}
			}
		}
        ckb.parentNode.parentNode.className = 'trCheck';
        ckb.parentNode.parentNode.onmouseover = function()
        {
        }
        ckb.parentNode.parentNode.onmouseout = function()
        {
        }
    }
    else
    {
		if (srcInput != null)
			srcInput.value = RemoveStr(srcInput.value, ckb.value);
        if($('ckbAll'))$('ckbAll').checked = false;
        ckb.parentNode.parentNode.rowIndex % 2 == 0 ? ckb.parentNode.parentNode.className = "trAlter" : ckb.parentNode.parentNode.className = "trItem";
        ckb.parentNode.parentNode.onmouseover = function()
        {
            this.className = "trMouseOver";
        }
        ckb.parentNode.parentNode.onmouseout = function()
        {
            this.rowIndex % 2 == 0 ? this.className = "trAlter" : this.className = "trItem";
        }
    }

}
/***************************************************
反选指定名称的checkbox
ckbName:checkbox的name
***************************************************/
function ReverseCheckbox(ckbName, NotCheckTr)
{
	var arrCheckBox = document.getElementsByName(ckbName);
	for (var i=0; i<arrCheckBox.length; i++ )
	{
		arrCheckBox[i].checked = !arrCheckBox[i].checked;
		if (NotCheckTr == null)
			Check(arrCheckBox[i]);
	}
}

function ReCountMoney(iSingleCost ,iProductNum, oFinalyMoney)
{
	if (/^[\d\.]+$/.test(iSingleCost) && /^[\d\.]+$/.test(iProductNum))
	{
		oFinalyMoney.innerHTML = iSingleCost * iProductNum;
	}
}

function SelectClass(ClassID, currObj)
{
	for (var i=0; i<document.links.length; i++)
	{
		if (document.links[i].className.indexOf("tvClass")>-1)
		{
			document.links[i].parentNode.style.backgroundColor = '';
		}
	}
	currObj.parentNode.parentNode.style.backgroundColor = '#5768AE';
	$("_SelectedClassID").value = ClassID;
}

function CheckedPower(sGroup, iSubCount, ckbBox)
{
	var isChecked = false;
	if (ckbBox.checked)
	{
		isChecked = true;
	}
	for (var i=0; i<iSubCount ; i++ )
	{
		$(sGroup + "_Sub_" + i).checked = isChecked;
	}
}
/***************************************************
统计试卷分数
***************************************************/
function CountCent(obj, iDefineCent)
{
	var arr = GetObjLocation(obj)
	var oElement = $('divCurrCent');
	var iCentSum = parseInt($('divCentSum').innerHTML);
	oElement.style.left = arr[0];
	oElement.style.top = arr[1] + 20;
	obj.value = obj.value.replace(/\D/gi, "");
	if (parseInt(obj.value)>iDefineCent)
	{
		alert("您输入数值过大,本题最高得分是:" + iDefineCent);
		obj.value = iDefineCent;
		return false;
	}
	var arrInput = document.getElementsByTagName("input");
	for (var i=0; i<arrInput.length; i++ )
	{
		if (arrInput[i].className == "dataInput")
		{
			if (arrInput[i].value.length > 0)
			{
				iCentSum += parseInt(arrInput[i].value);
			}
		}
	}
	oElement.innerHTML = "当前成绩" + "<span class=\"redText\">" + iCentSum + "</span>";
}

/***************************************************
移除投票选项中的一个项
***************************************************/
function AddNewVoteOption(obj)
{
	var oDiv = document.createElement("DIV");
	oDiv.className = "SingleModule";
	oDiv.innerHTML = "<input type=\"text\" name=\"newOption\" class=\"dataInput\" /> <img src=\"../skin/just/icon/clear.gif\" alt=\"点击删除一个选项\" class=\"imgBtn\" onclick=\"RemoveVoteOption(this)\" />";
	obj.appendChild(oDiv);

}
/***************************************************
增加，移除下载下载地址
***************************************************/
function AddNewDownUrl(obj)
{
	var oDiv = document.createElement("DIV");
	oDiv.className = "SingleModule";
	oDiv.innerHTML = "<input type=\"text\" name=\"DownTitle\" value=\"本地下载\" class=\"dataInput\" style=\"width:80px\" /> " +
                     "<input type=\"text\" name=\"DownUrl\" class=\"dataInput\" /> " +
                     "<img src=\"../Theme/Icon/folder.gif\" alt=\"选择下载\" class=\"imgBtn\" onclick=\"SelectSoft(this.parentNode.getElementsByTagName('INPUT')[1])\" /> " +
                     "<img src=\"../Theme/Icon/clear.gif\" alt=\"点击删除一个选项\" class=\"imgBtn\" onclick=\"RemoveVoteOption(this)\" />";
	obj.appendChild(oDiv);
}
/***************************************************
增加，移除上传控件
***************************************************/
function AddNewUpload(obj)
{
	var oDiv = document.createElement("DIV");
	oDiv.className = "SingleModule";
	oDiv.innerHTML = "<input type=\"file\" name=\"file\" contenteditable=\"false\" style=\"width: 227px\" />" +
                     "<img src=\"../Theme/Icon/clear.gif\" alt=\"点击删除一个上传框\" class=\"imgBtn\" onclick=\"RemoveVoteOption(this)\" />";
	obj.appendChild(oDiv);
}

function RemoveVoteOption(obj)
{
	obj.parentNode.parentNode.removeChild(obj.parentNode);
}
/***************************************************
上传相关函数
***************************************************/
var oCurrUploadTextBox = null;
function SelectPicture(objID)
{
	oCurrUploadTextBox = $(objID);
	showDialog('../App_Page/File.aspx?type=image', 720, 600, window)
}
function SelectSoft(objID)
{
	oCurrUploadTextBox = $(objID);
	showDialog('../App_Page/File.aspx?type=soft', 720, 600, window)
}
function SelectFile(objID)
{
	oCurrUploadTextBox = $(objID);
	showDialog('../App_Page/File.aspx?type=file', 720, 600, window)
}
function SelectThumb(objID)
{
	oCurrUploadTextBox = $(objID);
	showDialog('../App_Page/File.aspx?type=thumb&View=MiniImage', 720, 600, window)
}
function SetUrl(sUrl)
{
	if (oCurrUploadTextBox)
	{
		oCurrUploadTextBox.value = sUrl;
	}
}

function ShowExternalUrl(ckb, txtUrl, trContent)
{
    if (ckb.checked)
    {
        $(txtUrl).disabled = false;
        $(trContent).style.display = 'none';
    }
    else
    {
        $(txtUrl).disabled = true;
        $(trContent).style.display = '';
    }
}

function ShowPlus(obj, trContent)
{
    var elems=document.getElementsByName(obj);
    for(var i=1;i<elems.length;i++)
    if(elems[i].checked && elems[i].value=="0") {$(trContent).style.display="none";return;}
    $(trContent).style.display="";
}


function OpenFile(sUrl)
{
    if (document.all)
    {
        window.dialogArguments.SetUrl(sUrl);
    }
    else
    {
        opener.SetUrl(sUrl);
    }
    window.close();
}
/*
//############自定义表单ajax方法####################
function setLayout(tagname,visible)
{
    if(!confirm('确定删除此标签？'))
    {
        return false;
    }
    switchLoading(true);
    $('hidLayout').value+=tagname+'|'+visible+'$';
    //alert($('hidLayout').value);
    var evalTemp = "$('"+tagname+"').style.display = 'none';switchLoading(false);";
    window.setTimeout(evalTemp,700);  
              
}

//异步保存结果延时
function saveLayout(layoutoption,result)
{
    switchLoading(true); 
    var evalTemp= "_saveLayout('"+layoutoption+"','"+result+"')";
    window.setTimeout(evalTemp,1500);  
}

//异步保存结果 参1：布局对象  参2：布局内容
function _saveLayout(layoutoption,result)
{
    if(result=="")
    {
        alert('界面表单与保存前没差别，此次保存无效');
        switchLoading(false);
        return false;
    }
    cmXMLHttpReq(0,"Admin_LayoutHandler.aspx?s="+Math.random()+"&layout="+layoutoption+"&laycontent="+result,'',saveLayout_callback);      
}

//显示自定义表单保存成功等
function saveLayout_callback(strResponseHtml)
{
    //alert(strResponseHtml);
    if(strResponseHtml=="true")
    {
        alert('保存成功');
        $('hidLayout').value=''; 
    }
    else
        alert('保存失败'); 
    switchLoading(false);  
}

//预览状态下，取消保存
function cancelSaveLayout(result)
{

    if(result!="")
    {   
        //alert(result);
            switchLoading(true); 
        var a = result.split('$');
        for(i=0;i<a.length-1;i++)
        {
            var evalTemp = "$('"+a[i].split('|')[0]+"').style.display='block';";
            window.setTimeout(evalTemp,500);              
        }
        //window.location.href = window.location.href;
    }
    switchLoading(false); 
}

// loading状态切换
function switchLoading(statu)
{
    if($('loader_div'))
    {
        if(statu==true)
        {
            $('loader_div').style.display = 'block';        
        }
        else
        {
            $('loader_div').style.display = 'none';         
        }
    }
}

//#######自定义系统菜单ajax方法#############

//交换上下两个模块的排序号
function orderMenu(mid,premid,midSort,premidSort)
{   
    if(premid==''||premidSort=='')
    {
        alert('当前模块已位于最上级');
        return;
    }
    cmXMLHttpReq(0,"Admin_LayoutHandler.aspx?s="+Math.random()+"&menuop=order&mid="+mid+"&premid="+premid+"&midsort="+midSort+"&premidsort="+premidSort,'',orderMenu_CallBack);   
}

//更新整个菜单的HTML
function orderMenu_CallBack(strResponseHtml)
{
    if(strResponseHtml!='')
    {
        //alert(strResponseHtml);
        $('divMenuList').innerHTML = strResponseHtml;
    }
}

//菜单开关
function toogleMenu(mid)
{
    if(mid=='')
    { 
        alert('该菜单缺少唯一标识');
        return;
    }  
    cmXMLHttpReq(0,"Admin_LayoutHandler.aspx?s="+Math.random()+"&menuop=toogle&menuid="+mid,'',toogleMenu_CallBack);      
}

//菜单开关回调
function toogleMenu_CallBack(strResponseHtml)
{
    if(strResponseHtml!="")
    {
        var res = strResponseHtml.split('$');
        if(res[1]=="1")
        {
            $(res[0]).innerHTML="显示";
            $(res[0]).className="noteShow";           
        }
        else
        {
            $(res[0]).innerHTML="不显示";
            $(res[0]).className="noteHidden";          
        }
    }
    else
    {
        alert('fail');
    }
}

//##############AJAX请求方法####################
 function cmCreateXMLHTTP(){
  var objXMLHTTP=null;
  if (window.XMLHttpRequest) {
      objXMLHTTP = new XMLHttpRequest();
     
  } else if (window.ActiveXObject) {
      objXMLHTTP = new ActiveXObject("Microsoft.XMLHTTP");
      
  }
  return objXMLHTTP;
 }

 function cmXMLHttpReq(nReqType,strReqOpenUrl,strReqParam,pResponseFunc)
 {
  if( nReqType<0 || nReqType>1)
   return;
  var objXMLHTTP = cmCreateXMLHTTP();
  if (objXMLHTTP!=null)
  {
   function responseProcess()
    {
    if (objXMLHTTP.readyState==4)
    {
     pResponseFunc(objXMLHTTP.responseText);
    }

   }
   objXMLHTTP.onreadystatechange = responseProcess;
   if( nReqType==0)
   {
    objXMLHTTP.open("GET",strReqOpenUrl,true);
    objXMLHTTP.send(null);
   }
   else
   {
    objXMLHTTP.open("POST",strReqOpenUrl,true);
    objXMLHTTP.setRequestHeader("content-type","application/x-www-form-urlencoded");
    objXMLHTTP.send(strReqParam);
   }  
  }
 }
*/


window.onload=function()
{
    ExternalLinks();
}