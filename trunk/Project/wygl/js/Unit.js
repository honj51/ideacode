function denglu()
{ 
if(document.form1.unit1.value=='')
	{ 
	 alert("��λ���Ʋ���Ϊ��!");
	 document.form1.unit1.focus();
	 return false;
	 }
if(document.form1.unit1.value.length<4 |document.form1.unit1.value.length>20)
	{
	 alert('��λ���Ƴ���Ϊ4��20���ַ�');
	 document.form1.unit1.focus();
	 return false;
	}	
	
	
if(document.form1.tel.value=='')
	{
	 alert('�绰����Ϊ��!');
	 document.form1.tel.focus();
	 return false;
	}
if(document.form1.tel.value.length<11 | document.form1.tel.value.length>12)
	{
	 alert('�绰���Ȳ���');
	 document.form1.tel.focus();
	 return false;
    } 	
if(document.form1.tel.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('�绰ֻ������')
	 document.form1.tel.focus();
	 return false;
    }
	
	
if(document.form1.fac.value=='')
	{
	 alert('���治��Ϊ��!');
	 document.form1.fac.focus();
	 return false;
	}
if(document.form1.fac.value.length<6 | document.form1.fac.value.length>12)
	{
	 alert('������볤�Ȳ���');
	 document.form1.fac.focus();
	 return false;
    } 	
if(document.form1.fac.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('����ֻ������')
	 document.form1.fac.focus();
	 return false;
    }	
	
	
if(document.form1.code.value=='')
	{
	 alert('�ʱ಻��Ϊ��!');
	 document.form1.fac.focus();
	 return false;
	}
if(document.form1.code.value.length<4 | document.form1.code.value.length>7)
	{
	 alert('�ʱ೤�Ȳ���');
	 document.form1.code.focus();
	 return false;
    } 	
if(document.form1.code.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('�ʱ�ֻ������')
	 document.form1.code.focus();
	 return false;
    }
	
	
	
if(document.form1.address.value=='')
	{
	 alert('��ַ����Ϊ��!');
	 document.form1.address.focus();
	 return false;
	}
if(document.form1.address.value.length<4)
	{
	 alert('��ַ��������Ϊ4���ַ�');
	 document.form1.address.focus();
	 return false;
    } 
	
	
if(document.form1.website.value=='')
	{
	 alert('��ַ����Ϊ��!');
	 document.form1.website.focus();
	 return false;
	}
if(document.form1.website.value.length<6)
	{
	 alert('��ַ���Ȳ���');
	 document.form1.website.focus();
	 return false;
    } 
if(document.form1.website.value.indexOf('www.')<0)
	{
	 alert('��������ȷ��ַ!')
	 document.form1.website.focus();
	 return false;
	 }	
	 
if(document.form1.setting.value=='')
	{
	 alert('�����Ų���Ϊ��!');
	 document.form1.setting.focus();
	 return false;
	}
	
if(document.form1.email.value=='')
	{
	 alert('�������䲻��Ϊ��!');
	 document.form1.email.focus();
	 return false;
	}
if(document.form1.email.value.length<4)
	{
	 alert('�������䳤�Ȳ���');
	 document.form1.email.focus();
	 return false;
    } 	
if(document.form1.email.value.indexOf('@')<0)
	{
	 alert('��������ȷ�������ַ!')
	 document.form1.email.focus();
	 return false;
	 }
	 
if(document.form1.bank.value=='')
	{
	 alert('�������Ʋ���Ϊ��!');
	 document.form1.bank.focus();
	 return false;
	}
if(document.form1.bank.value.length<4)
	{
	 alert('�������Ƴ��Ȳ���');
	 document.form1.bank.focus();
	 return false;
    } 
	
if(document.form1.account.value=='')
	{
	 alert('�����˺Ų���Ϊ��!');
	 document.form1.account.focus();
	 return false;
	}
if(document.form1.account.value.length<10 | document.form1.account.value.length>20)
	{
	 alert('�����˺ų��Ȳ���');
	 document.form1.account.focus();
	 return false;
    }
return true;
}