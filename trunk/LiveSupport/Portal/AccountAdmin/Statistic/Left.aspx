<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="AccountAdmin_Statistic_Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .tdStyle
        {
        	padding-left:24px; border:1px outset;  border-color:#FDFDFD; 
        	
        }
         .tableStyle
        {
        	width: 147px; margin-left:20px;
        }
        .tableStyle2
        {
        	font-size:12px; text-align:left; width: 137px;
        }
        .td_bgImg
        {
        	height: 32px;
            width: 140px;
        	background-image:url('../Images/title_bg.gif');  color:White; font-size:12px; vertical-align:middle;
        }
        .td_centerImg
        {
        	background-image:url('../Images/td_center.JPG');
        }
    </style>
    <script language="javascript" type="text/javascript">
        function setTdBgColor(objTd)
        {
            objTd.style.backgroundColor='#eeeeee';
        }
        function backTdBgColor(objTd)
        {
            objTd.style.backgroundColor='White';
        }
        function ShowSorry() {
		    alert('此功能暂未开通!'); 
		}
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <!--内容开始-->
    
       <!--访 客 信 息 分 析  -->
        <table cellpadding="0" cellspacing="0" class="tableStyle">
               <tr><td class="td_bgImg"><font style="margin-left:30px; ">访 客 信 息 分 析 </font></td></tr>
               <tr><td class="td_centerImg" align=center>
                 <table class="tableStyle2">
                    <tr><td onmouseover="setTdBgColor(this)"  onmouseout="backTdBgColor(this)"  class="tdStyle"><a href ="LocationStatistic.aspx" target="fraMain">访客地区分析</a></td></tr>
                    <tr><td onmouseover="setTdBgColor(this)"  onmouseout="backTdBgColor(this)"  class="tdStyle"><a href ="EngineStatistic.aspx" target="fraMain">搜索引擎分析</a></td></tr>
                    <tr><td onmouseover="setTdBgColor(this);" onmouseout="backTdBgColor(this)"  class="tdStyle"><a href="ReferrerStatistic.aspx" target="fraMain">访客来源分析</a></td></tr>
                    <tr><td onmouseover="setTdBgColor(this)"  onmouseout="backTdBgColor(this)"  class="tdStyle"><a href="javascript:ShowSorry()">所在页面分析</a></td></tr>
                </table>
               </td></tr>
               <tr><td><img src="../Images/tddown.JPG" /></td></tr>
        </table>
        <br />
        
        <!--对 话 留 言 分 析  -->
        <table cellpadding="0" cellspacing="0" class="tableStyle" >
               <tr><td class="td_bgImg"><font style="margin-left:30px; ">对 话 留 言 分 析  </font></td></tr>
               <tr><td class="td_centerImg" align=center>
                 <table class="tableStyle2">
                     <tr><td onmouseover="setTdBgColor(this)" onmouseout="backTdBgColor(this)" class="tdStyle"><a href ="ChatHourStatistic.aspx" target="fraMain">对话时段分析</a></a></td></tr>
                     <tr><td onmouseover="setTdBgColor(this)" onmouseout="backTdBgColor(this)" class="tdStyle"><a href="javascript:ShowSorry()">对话级别分析</a></td></tr>
                     <tr><td onmouseover="setTdBgColor(this)" onmouseout="backTdBgColor(this)" class="tdStyle"><a href="javascript:ShowSorry()">有效分析</a></td></tr>
                </table>
               </td></tr>
               <tr><td><img src="../Images/tddown.JPG" /></td></tr>
        </table>
        <br />
        
        <!--客 服 分 析  -->
        <table cellpadding="0" cellspacing="0" class="tableStyle" >
               <tr><td class="td_bgImg"><font style="margin-left:30px; ">客 服 分 析 </font></td></tr>
               <tr><td class="td_centerImg" align=center>
                 <table class="tableStyle2">
                    <tr><td onmouseover="setTdBgColor(this)" onmouseout="backTdBgColor(this)" class="tdStyle"><a href ="OperatorStatistic.aspx" target="fraMain">对话量分析</a></td></tr>
                    <tr><td onmouseover="setTdBgColor(this)" onmouseout="backTdBgColor(this)" class="tdStyle"><a href="javascript:ShowSorry()">服务质量分析</a></td></tr>
                </table>
               </td></tr>
               <tr><td><img src="../Images/tddown.JPG" /></td></tr>
        </table>
        <br />
        
        <!--流 量 分 析  -->
        <table cellpadding="0" cellspacing="0" class="tableStyle" >
               <tr><td class="td_bgImg"><font style="margin-left:30px; ">流 量 分 析 </font></td></tr>
               <tr><td class="td_centerImg" align="center">
                 <table class="tableStyle2">
                    <tr><td onmouseover="setTdBgColor(this)" onmouseout="backTdBgColor(this)" class="tdStyle"><a href="javascript:ShowSorry()">流量分析</a></td></tr>
                </table>
               </td></tr>
               <tr><td><img src="../Images/tddown.JPG" /></td></tr>
        </table>
        
    <!--内容结束-->
    </div>
    </form>
</body>
</html>
