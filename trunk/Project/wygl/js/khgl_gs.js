function denglu()
{ 
	
if(document.form1.名称.value=='')
	{
	 alert('名称不能为空!');
	 document.form1.名称.focus();
	 return false;
	}
if(document.form1.名称.value.length<2 | document.form1.名称.value.length>15)
	{
	 alert('名称长度为2-15个字符');
	 document.form1.名称.focus();
	 return false;
    } 	

if(document.form1.描述.value=='')
	{
	 alert('描述不能为空!');
	 document.form1.描述.focus();
	 return false;
	}
if(document.form1.描述.value.length<2 | document.form1.描述.value.length>4)
	{
	 alert('描述长度为2-4个字符');
	 document.form1.描述.focus();
	 return false;
    } 	
	
	
if(document.form1.助记码.value=='')
	{
	 alert('助记码不能为空!');
	 document.form1.助记码.focus();
	 return false;
	}
if(document.form1.助记码.value.length<4 | document.form1.助记码.value.length>20)
	{
	 alert('助记码长度不能少于4');
	 document.form1.助记码.focus();
	 return false;
    } 	
	
if(document.form1.年.value=='请选择')
	{
	 alert('请选择年');
	 document.form1.年.focus();
	 return false;
	}
	
	
if(document.form1.月.value=='请选择')
	{
	 alert('请选择月');
	 document.form1.月.focus();
	 return false;
	}
if(document.form1.日.value=='请选择')
	{
	 alert('请选择日');
	 document.form1.日.focus();
	 return false;
	}

if(document.form1.法人代表.value=='')
	{ 
	 alert("法人代表不能为空!");
	 document.form1.法人代表.focus();
	 return false;
	 }
if(document.form1.法人代表.value.length<2| document.form1.法人代表.value.length>4)
	{
	 alert('法人代表长度为2-4个字符');
	 document.form1.法人代表.focus();
	 return false;
	}	

if(document.form1.办公地址.value=='')
	{ 
	 alert("办公地址不能为空!");
	 document.form1.办公地址.focus();
	 return false;
	 }
if(document.form1.办公地址.value.length<2| document.form1.办公地址.value.length>20)
	{
	 alert('证件号码长度为不对');
	 document.form1.办公地址.focus();
	 return false;
	}	


	
if(document.form1.联系电话.value=='')
	{ 
	 alert("联系电话不能为空!");
	 document.form1.联系电话.focus();
	 return false;
	 }
if(document.form1.联系电话.value.length<11 | document.form1.联系电话.value.length>12)
	{
	 alert('联系电话长度11个字符');
	 document.form1.联系电话.focus();
	 return false;
	}	
if(document.form1.联系电话.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('联系电话只有数字')
	 document.form1.联系电话.focus();
	 return false;
    }

if(document.form1.联系方法.value=='')
	{ 
	 alert("联系方法不能为空!");
	 document.form1.联系方法.focus();
	 return false;
	 }
if(document.form1.联系方法.value.length<4 | document.form1.联系方法.value.length>30)
	{
	 alert('联系方法长度4—30个字符');
	 document.form1.联系方法.focus();
	 return false;
	}	
if(document.form1.联系人.value=='')
	{ 
	 alert("联系人不能为空!");
	 document.form1.联系人.focus();
	 return false;
	 }
if(document.form1.联系人.value.length<2 | document.form1.联系人.value.length>4)
	{
	 alert('联系人长度2—4个字符');
	 document.form1.联系人.focus();
	 return false;
	}	
		
return true;
}