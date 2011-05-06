function denglu()
{ 
if(document.form1.unit1.value=='')
	{ 
	 alert("单位名称不能为空!");
	 document.form1.unit1.focus();
	 return false;
	 }
if(document.form1.unit1.value.length<4 |document.form1.unit1.value.length>20)
	{
	 alert('单位名称长度为4到20个字符');
	 document.form1.unit1.focus();
	 return false;
	}	
	
	
if(document.form1.tel.value=='')
	{
	 alert('电话不能为空!');
	 document.form1.tel.focus();
	 return false;
	}
if(document.form1.tel.value.length<11 | document.form1.tel.value.length>12)
	{
	 alert('电话长度不对');
	 document.form1.tel.focus();
	 return false;
    } 	
if(document.form1.tel.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('电话只有数字')
	 document.form1.tel.focus();
	 return false;
    }
	
	
if(document.form1.fac.value=='')
	{
	 alert('传真不能为空!');
	 document.form1.fac.focus();
	 return false;
	}
if(document.form1.fac.value.length<6 | document.form1.fac.value.length>12)
	{
	 alert('传真号码长度不对');
	 document.form1.fac.focus();
	 return false;
    } 	
if(document.form1.fac.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('传真只有数字')
	 document.form1.fac.focus();
	 return false;
    }	
	
	
if(document.form1.code.value=='')
	{
	 alert('邮编不能为空!');
	 document.form1.fac.focus();
	 return false;
	}
if(document.form1.code.value.length<4 | document.form1.code.value.length>7)
	{
	 alert('邮编长度不对');
	 document.form1.code.focus();
	 return false;
    } 	
if(document.form1.code.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('邮编只有数字')
	 document.form1.code.focus();
	 return false;
    }
	
	
	
if(document.form1.address.value=='')
	{
	 alert('地址不能为空!');
	 document.form1.address.focus();
	 return false;
	}
if(document.form1.address.value.length<4)
	{
	 alert('地址长度最少为4个字符');
	 document.form1.address.focus();
	 return false;
    } 
	
	
if(document.form1.website.value=='')
	{
	 alert('网址不能为空!');
	 document.form1.website.focus();
	 return false;
	}
if(document.form1.website.value.length<6)
	{
	 alert('网址长度不对');
	 document.form1.website.focus();
	 return false;
    } 
if(document.form1.website.value.indexOf('www.')<0)
	{
	 alert('请输入正确网址!')
	 document.form1.website.focus();
	 return false;
	 }	
	 
if(document.form1.setting.value=='')
	{
	 alert('备案号不能为空!');
	 document.form1.setting.focus();
	 return false;
	}
	
if(document.form1.email.value=='')
	{
	 alert('电子信箱不能为空!');
	 document.form1.email.focus();
	 return false;
	}
if(document.form1.email.value.length<4)
	{
	 alert('电子信箱长度不对');
	 document.form1.email.focus();
	 return false;
    } 	
if(document.form1.email.value.indexOf('@')<0)
	{
	 alert('请输入正确的邮箱地址!')
	 document.form1.email.focus();
	 return false;
	 }
	 
if(document.form1.bank.value=='')
	{
	 alert('银行名称不能为空!');
	 document.form1.bank.focus();
	 return false;
	}
if(document.form1.bank.value.length<4)
	{
	 alert('银行名称长度不对');
	 document.form1.bank.focus();
	 return false;
    } 
	
if(document.form1.account.value=='')
	{
	 alert('银行账号不能为空!');
	 document.form1.account.focus();
	 return false;
	}
if(document.form1.account.value.length<10 | document.form1.account.value.length>20)
	{
	 alert('银行账号长度不对');
	 document.form1.account.focus();
	 return false;
    }
return true;
}