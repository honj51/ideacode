<%@ Page Language="C#" MasterPageFile="~/PortalMasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" Title="互动科技" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            width: 171px;
        }
        </style>

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- <table class="ContentTable">
<tr>
<td style="width:50px;" valign="top" align="center">
<table cellpadding="0" cellspacing="0">
<tr><td><img src="Imgs/sidebar.gif" /></td></tr>
<tr><td style="background-image:url('Imgs/left-centent.GIF');" align="center">
    <br />
<a href="Login.aspx"><img src="Imgs/signin.gif" /></a><br />
    <br /><a href="Licence.aspx"><font style="font-size:14px;">申请免费使用!</font></a> 
    <br />
    <br />

    <img src="Imgs/sidebar-line.gif" />
    <div style="width:100%; text-align:left; margin-left:20px;"> <b>注册流程：</b></div>
    <img src="Imgs/regflow.gif" />
    </td></tr>
    <tr><td style="background-image:url('Imgs/left-down.GIF'); height:24px;"></td></tr>
</table>
</td>
<td></td>
<td valign="top">
<table  width="573" cellpadding="0" cellspacing="0">
<tr><td style="background-image:url('Imgs/centent-title.gif'); height:28px;"></td></tr>
<tr><td style=" background-image:url('Imgs/centent.GIF'); ">
<table style="width:100%;">
<tr><td class="style1" align="center" >
    <br />
    <img src="Imgs/pic-01.gif" /><br />
    <br />
    <a href="Download.aspx"><img src="Imgs/download.gif" /></a></td><td align="left" style="font-size:12px;line-height:22px">&nbsp;&nbsp;&nbsp;&nbsp;<b>“LiveSupport”&nbsp; </b>在线客服系统是江西互动信息技术有限公司出品的一款企业级的网站沟通平台系统。网站的访客不需要下载任何软件或插件，通过点击网站上的在线客服标志，就能直接和网站客服人员进行即时交流。<br />
&nbsp;&nbsp;&nbsp;&nbsp;<b>“LiveSupport”&nbsp; </b>是江西最大的在线客服系统，该系统将为企业发掘更多的潜在客户，提高访客成交率，增加企业收入，降低运营成本，提高工作效率，提升客户满意度，是企业进行在线营销、在线客服、在线咨询的有力工具。系统适用于各类网站，是企业进行网络营销的好帮手。 </td><td style="width:15px;"></td></tr>
</table>
<img src="Imgs/centent-line.gif" />
<table style="width:100%; text-align:left;font-size:12px; line-height:22px" >
<tr ><td style="width:15px;"></td><td valign="top"><img src="Imgs/advantage-07.jpg" /></td>
    <td valign="top" class="style2"><b>增加营销渠道</b><br />改变传统电话、邮件、QQ等客户营销方式，为企业打造主动式营销方式。</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-08.jpg" /></td>
    <td valign="top"><b>增加销售机会</b><br />
通过在线为顾客分析和解决复杂的问题来增强顾客的忠诚度进一步提高销售机会和销售量。</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-09.jpg" /></td>
    <td valign="top" class="style2"><b>降低运营成本</b><br />每个在线客服人员可通过无限的增加即时的在线服务人数，降低了传统客户服务中通过电话交流所产生的成本。</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-10.jpg" /></td>
    <td valign="top"><b>巩固客户关系</b><br />通过与网民在线人性化的交互作用并且以顾客的地址来判断，您可以发现您的回头客逐渐增多。</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-01.gif" /></td>
    <td valign="top" class="style2"><b>无缝沟通</b><br />不用安装任何软件或插件，客户只需轻轻一点，就能够与客服人员进行即时交流，大大降低客户的沟通门槛，提高成交概率。</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-02.gif" /></td>
    <td valign="top"><b>数据分析</b><br />
提供了访客来访时间和地理位置的统计信息，企业可以根据这些数据调整销售人力安排，销售区域策略等，为进行市场决策提供了有力的依据。</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-03.gif" /></td>
    <td valign="top" class="style2"><b>知识储备</b><br />客服可以轻松的通过知识库进行学习；当面对访客的提问时，也可以通过知识库调阅相关资料，快速解答访客问题。</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-04.gif" /></td>
    <td valign="top"><b>精准营销</b><br />
客服人员可以从系统中清楚的知道客户正在访问什么，感兴趣的是什么，并做好充足的准备。</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-05.gif" /></td>
    <td valign="top" class="style2"><b>快捷回复</b><br />将常用的对话内容和网站地址进行分类整理，轻松的对不同的访客快速应答，体现专业，节省效率。</td><td style="width:15px;"></td><td valign="top"><img src="Imgs/advantage-06.gif" /></td><td valign="top"><b>实时监管</b><br />
管理人员能够实时的对客服人员的工作进行监控，并查看访客对客服的满意度评价。</td><td style="width:15px;"></td></tr>
</table>

</td>
<tr><td style="background-image:url('Imgs/advantage-down.GIF'); height:20px;"></td></tr>
</tr></table>
</td>
</tr>
</table>--%>

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD  style=" width:2%"><IMG height=25 
                  src="Imgs/biaodian.jpg" 
 width=100%></TD>
                <TD 
                  background=Imgs/biaodian1.jpg></TD>
                <TD width=70% 
                background=Imgs/biaodian1.jpg>&nbsp;</TD></TR></TBODY></TABLE>

<table>
<tr>
<td style="background-image:url('Imgs/bg.bmp'); background-repeat:repeat-x; height: 155px; width: 782px">


                
                
        <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=8 
                      background=Imgs/index_t3_a1.png 
                      height=32></TD>
                      <TD align=left 
                      background=Imgs/index_t3_a2.png>
                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                          <TBODY>
                          <TR>
                            <TD height=32><IMG height=32 alt="" 
                              src="Imgs/index_t3_title.png" 
                              width=106></TD>
                            <TD></TD>
                            <TD></TD>
                            
                            </TR></TBODY></TABLE></TD>
                      <TD width=10 
                      background=Imgs/index_t3_a3.png></TD></TR>
                    <TR>
                      <TD 
                      background=Imgs/index_t3_b1.png 
                      height=246></TD>
                      <TD vAlign=center align=middle width=728 
                      background=Imgs/index_t3_b2.png>
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR vAlign=top align=left>
                            <TD width=221 
                          
                            height=70>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_3.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center>客户只需轻轻一点，就能够与客服人员进行即时交流，大大降低客户的沟通门槛，提高成交概率。</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD width=221 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_1.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center>通过与网民在线人性化的交互作用并且以顾客的地址来判断，您可以发现您的回头客逐渐增多。</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD width=207 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_2.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=205>
                                <DIV align=center style="width: 200px">提供了访客来访时间和地理位置的统计信息.</DIV></TD></TR></TBODY></TABLE></TD></TR>
                          <TR vAlign=top align=left>
                            <TD 
                            
                            height=70>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_5.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center><SPAN 
                                class=style_0066CC><BR></SPAN>管理人员能够实时的对客服人员的工作进行监控，并查看访客对客服的满意度评价。</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_4.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center>不用安装任何软件或插件，客户只需轻轻一点，就能够与客服人员进行即时交流，大大降低客户的沟通门槛，提高成交概率。</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"></A><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_6.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=205>
                                <DIV align=center>提供了访客来访时间和地理位置的统计信息，企业可以根据这些数据调整销售人力安排，销售区域策略等，为进行市场决策提供了有力的依据。 
                                </DIV></TD></TR></TBODY></TABLE></TD></TR>
                          <TR vAlign=top align=left>
                            <TD height=70><SPAN class=pic01></SPAN>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_8.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center><BR>通过在线为顾客分析和解决复杂的问题来增强顾客的忠诚度进一步提高销售机会和销售量。</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_0.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center><BR>将常用的对话内容和网站地址进行分类整理，轻松的对不同的访客快速应答，体现专业，节省效率。</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_7.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=205>
                                <DIV align=center><BR>改变传统电话、邮件、QQ等客户营销方式，为企业打造主动式营销方式。<SPAN 
                                class=style_g2>

</SPAN></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      <TD 
                      background=Imgs/index_t3_b3.png></TD></TR>
                    <TR>
                      <TD 
                      background=Imgs/index_t3_c1.png 
                      height=11></TD>
                      <TD 
                      background=Imgs/index_t3_c2.png></TD>
                      <TD 
                      background=Imgs/index_t3_c3.png></TD></TR></TBODY></TABLE>
                      
                      
                      <TABLE cellSpacing=0 cellPadding=0 align=center border=0 width=782px>
        <TBODY>
        <TR>
          <TD align="left" colspan="2" class=white12b background=Imgs/mid_titbj.jpg  style="background-repeat:repeat-y"
          height=28>　&nbsp;
          <IMG height=5 src="Imgs/icon7.gif" 
            width=7>&nbsp;产品中心</TD></TR>
            
            <tr>
            <td  style="width:50%">
               
               <TABLE cellSpacing=0 cellPadding=0 width=100% align=center 
              border=0><TBODY>
              <TR>
                <TD colSpan=2 height=1></TD></TR>
              <TR>
                <TD width=141 background=Imgs/tit_bj.jpg 
                height=23>
                <a href="LiveChat.aspx">
                &nbsp;<IMG height=14 
                  src="Imgs/01.jpg" width=22>&nbsp;网站客服</a></TD>
                <TD align=right>&nbsp;</TD></TR>
              <TR>
                <TD colSpan=2 height=3></TD></TR></TBODY></TABLE>
            <TABLE class=type_k height=71 cellSpacing=0 cellPadding=0 width=100% 
            align=center border=0>
              <TBODY>
              <TR>
                <TD align=middle width=129>
                <a href="LiveChat.aspx">
                <IMG height=67 
                  src="Imgs/pic01.jpg" width=77></a></TD>
                <TD vAlign=top>
                  <TABLE cellSpacing=0 cellPadding=0 width="80%" height=100% align=center 
                  border=0>
                    <TBODY>
                  
                    <TR>
                      <TD width=11><IMG height=4 
                        src="Imgs/icon6.gif" width=4></TD>
                      <TD class=midlist><A 
                        href="" 
                        target=_blank>
                        
              </A>一款企业级的网站沟通平台系统</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
               
               </td>
            <td style="width=50%">
             <TABLE   cellSpacing=0 cellPadding=0 width=100% align=center 
              border=0><TBODY>
              <TR>
                <TD colSpan=2 height=1></TD></TR>
              <TR>
                <TD background=Imgs/tit_bj.jpg 
                height=23 class="style1">
                <a  href="HDHouse.aspx">
                &nbsp;<IMG height=14 
                  src="Imgs/02.jpg" width=22>&nbsp;房产中介管理系统
                  </a>
                  </TD>
                <TD align=right>&nbsp;</TD></TR>
              <TR>
                <TD colSpan=2 height=3></TD></TR></TBODY></TABLE>
                
            <TABLE class=type_k height=71 cellSpacing=0 cellPadding=0 width=100%
            align=center border=0>
              <TBODY>
              <TR>
                <TD align=middle width=129>
                <a href="HDHouse.aspx">
                <IMG height=67 
                  src="Imgs/pic03.jpg" width=77>
                  </a>
                  </TD>
                <TD vAlign=top>
                  <TABLE cellSpacing=0 cellPadding=0 width="80%" height=100% align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD width=11><IMG height=4 
                        src="Imgs/icon6.gif" width=4></TD>
                      <TD  >
                          一款企业级的房产中介管理系统。</td><td><a href="Download.aspx" > <img height=19 
                        src="Imgs/download.jpg" width=69 
                        border=0></A></TD></TR>
                  
                        
                        </TBODY></TABLE></TD></TR></TBODY></TABLE>
            
            </td>
            </tr>
            
        
        <TR>
          <TD colspan="2"><IMG height=6 src="Imgs/mid_bottom.jpg" 
            ></TD></TR></TBODY></TABLE>

</td>
</tr>
</table>




</asp:Content>

