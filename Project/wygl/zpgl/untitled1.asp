<script language="javascript">
<!--

var subval = new Array();
subval[0] = new Array('10','����','1','=1')
subval[1] = new Array('10','˫��','2','=2')
subval[2] = new Array('10','����','3','=3')
subval[3] = new Array('10','˫��','4','=4')
subval[4] = new Array('10','����','5','=5')
subval[5] = new Array('10','˫��','6','=6')
subval[6] = new Array('10','����','7','=7')
subval[7] = new Array('10','˫��','8','=8')
subval[8] = new Array('10','����','9','=9')
subval[9] = new Array('10','˫��','10','=10')
subval[10] = new Array('20','����','11','=11')
subval[11] = new Array('20','˫��','12','=12')
subval[12] = new Array('20','����','13','=13')
subval[13] = new Array('20','˫��','14','=14')
subval[14] = new Array('20','����','15','=15')
subval[15] = new Array('20','˫��','16','=16')
subval[16] = new Array('20','����','17','=17')
subval[17] = new Array('20','˫��','18','=18')
subval[18] = new Array('20','����','19','=19')
subval[19] = new Array('20','˫��','20','=20')
//subval[����] = new Array('һ����ֵ','������ֵ','������ǩ','������ֵ')

function changeselect2()
{
document.form1.s2.length = 0;
document.form1.s2.options[0] = new Option('==��ѡ��==','');
document.form1.s2.options[1] = new Option('ѡ����','����');
document.form1.s2.options[2] = new Option('ѡ��˫��','˫��');
document.form1.s3.length = 0;
document.form1.s3.options[0] = new Option('==��ѡ��==','');
}

function changeselect3(sub1,sub2)
{
document.form1.s3.length = 0;
document.form1.s3.options[0] = new Option('==��ѡ��==','');
for (i=0; i<subval.length; i++)
{
if ((subval[i][0] == sub1) & (subval[i][1] == sub2))
{document.form1.s3.options[document.form1.s3.length] = new Option(subval[i][2], subval[i][3]);}
}
}
//-->
</script>

<form name="form1">

����������

<select name="s1" onChange="changeselect2()">
<option>==��ѡ��==</option>
<option value="10">1-10</option>
<option value="20">11-20</option>
</select>

<select name="s2" onChange="changeselect3(document.form1.s1.value,this.value)"> 
<option>==��ѡ��==</option>
</select>

<select name="s3" onChange="alert(this.value)"> 
<option>==��ѡ��==</option>
</select>

</form>

