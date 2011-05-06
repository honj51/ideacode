function denglu()
{ 
if(document.form1.序号.value=='')
	{ 
	 alert("序号不能为空!");
	 document.form1.序号.focus();
	 return false;
	 }
if(document.form1.序号.value.length<1 | document.form1.序号.value.length>4)
	{
	 alert('序号长度为1到4个字符');
	 document.form1.序号.focus();
	 return false;
	}	
if(document.form1.序号.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('序号只有数字')
	 document.form1.de_id1.focus();
	 return false;
    }	
	
	
	
if(document.form1.工业园名称.value=='')
	{
	 alert('工业园名称不能为空!');
	 document.form1.工业园名称.focus();
	 return false;
	}
if(document.form1.工业园名称.value.length<2 | document.form1.工业园名称.value.length>20)
	{
	 alert('工业园名称长度不少于2');
	 document.form1.工业园名称.focus();
	 return false;
    } 	

	
if(document.form1.工业园面积.value=='')
	{
	 alert('工业园面积不能为空!');
	 document.form1.工业园面积.focus();
	 return false;
	}
if(document.form1.工业园面积.value.length<1 | document.form1.工业园面积.value.length>20)
	{
	 alert('工业园面积长度不对');
	 document.form1.de_tel1.focus();
	 return false;
    } 	
if(document.form1.工业园面积.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('工业园面积只有数字')
	 document.form1.de_tel1.focus();
	 return false;
    }	
return true;
}