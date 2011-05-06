function denglu3()
{ 
if(document.form3.two_id2.value=='')
	{ 
	 alert("二级标题列序号不能为空!");
	 document.form3.two_id2.focus();
	 return false;
	 }
if(document.form3.two_id2.value.length<1 |document.form3.two_id2.value.length>4)
	{
	 alert('二级标题列序号长度为1到4个字符');
	 document.form3.two_id2.focus();
	 return false;
	}
if(document.form3.two_id2.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('二级标题列序号只有数字')
	 document.form3.two_id2.focus();
	 return false;
    }
	
	
if(document.form3.two_title2.value=='')
	{
	 alert('二级标题不能为空!');
	 document.form3.two_title2.focus();
	 return false;
	}
if(document.form3.two_title2.value.length<2 | document.form3.two_title2.value.length>40)
	{
	 alert('二级标题长度不对');
	 document.form3.two_title2.focus();
	 return false;
    } 	

return true;
}