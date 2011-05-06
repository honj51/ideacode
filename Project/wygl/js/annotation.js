function denglu()
{ 
if(document.form1.title.value=='')
	{ 
	 alert("角色排序不能为空!");
	 document.form1.title.focus();
	 return false;
	 }
if(document.form1.title.value.length<2 |document.form1.title.value.length>20)
	{
	 alert('单位名称长度为2到20个字符');
	 document.form1.title.focus();
	 return false;
	}
var v = DoProcess();
	if(v != true){
	    alert("请输入内容");
		return false;
	}	
return true;
}