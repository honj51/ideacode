<script language="javascript">
<!--

var subval = new Array();
subval[0] = new Array('10','单数','1','=1')
subval[1] = new Array('10','双数','2','=2')
subval[2] = new Array('10','单数','3','=3')
subval[3] = new Array('10','双数','4','=4')
subval[4] = new Array('10','单数','5','=5')
subval[5] = new Array('10','双数','6','=6')
subval[6] = new Array('10','单数','7','=7')
subval[7] = new Array('10','双数','8','=8')
subval[8] = new Array('10','单数','9','=9')
subval[9] = new Array('10','双数','10','=10')
subval[10] = new Array('20','单数','11','=11')
subval[11] = new Array('20','双数','12','=12')
subval[12] = new Array('20','单数','13','=13')
subval[13] = new Array('20','双数','14','=14')
subval[14] = new Array('20','单数','15','=15')
subval[15] = new Array('20','双数','16','=16')
subval[16] = new Array('20','单数','17','=17')
subval[17] = new Array('20','双数','18','=18')
subval[18] = new Array('20','单数','19','=19')
subval[19] = new Array('20','双数','20','=20')
//subval[数组] = new Array('一级的值','二级的值','三级标签','三级的值')

function changeselect2()
{
document.form1.s2.length = 0;
document.form1.s2.options[0] = new Option('==请选择==','');
document.form1.s2.options[1] = new Option('选择单数','单数');
document.form1.s2.options[2] = new Option('选择双数','双数');
document.form1.s3.length = 0;
document.form1.s3.options[0] = new Option('==请选择==','');
}

function changeselect3(sub1,sub2)
{
document.form1.s3.length = 0;
document.form1.s3.options[0] = new Option('==请选择==','');
for (i=0; i<subval.length; i++)
{
if ((subval[i][0] == sub1) & (subval[i][1] == sub2))
{document.form1.s3.options[document.form1.s3.length] = new Option(subval[i][2], subval[i][3]);}
}
}
//-->
</script>

<form name="form1">

三级联动：

<select name="s1" onChange="changeselect2()">
<option>==请选择==</option>
<option value="10">1-10</option>
<option value="20">11-20</option>
</select>

<select name="s2" onChange="changeselect3(document.form1.s1.value,this.value)"> 
<option>==请选择==</option>
</select>

<select name="s3" onChange="alert(this.value)"> 
<option>==请选择==</option>
</select>

</form>

