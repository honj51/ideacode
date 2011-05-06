function denglu2()
{ 
if(document.form2.序号.value=='')
	{ 
	 alert("序号不能为空!");
	 document.form2.序号.focus();
	 return false;
	 }
if(document.form2.序号.value.length<1 | document.form2.序号.value.length>4)
	{
	 alert('序号长度为1到4个字符');
	 document.form2.序号.focus();
	 return false;
	}	
if(document.form2.序号.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('序号只有数字')
	 document.form2.de_id1.focus();
	 return false;
    }	
	
	
	
if(document.form2.房产类型.value=='')
	{
	 alert('房产类型不能为空!');
	 document.form2.房产类型.focus();
	 return false;
	}
if(document.form2.房产类型.value.length<2 | document.form2.房产类型.value.length>20)
	{
	 alert('房产类型长度不少于2');
	 document.form2.工业园名称.focus();
	 return false;
    } 	
return true;
}