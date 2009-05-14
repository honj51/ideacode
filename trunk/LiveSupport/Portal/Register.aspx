<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<!--验证码-->
<script type="text/javascript">
    function show_vcode()
    {
        document.getElementById("imgRandom").src = document.getElementById("imgRandom").src + '?temp='+ (new Date().getTime().toString(36)) ;
    }
    </script>
 <img src="images/banner_5.jpg" width="760" style="height: 151px" />
<table cellSpacing="0" cellPadding="0" style="height: 568px; background-color:#CCCCCC;">

<tr><td style="width: 160px; background-image:url('images/left.jpg');" 
        valign="top">
<!--leftMenu-->
<DIV id=column style="margin-top:30px;">
    </DIV>
    
    
    </td>
    <td style="width: 23px; ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="width: 580px;" valign="top"><div style="text-align:left; margin-top:10px;"><img src="images/register.gif" /></div><BR><br />
    <!--内容 -->
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align=middle><FONT color=red></FONT></TD></TR><!-- 第一步: 创建公司信息 -->
  <TR>
    <TD align=left><b><SPAN >第一步: 创建公司信息<SPAN 
      style="FONT-WEIGHT: bold; COLOR: #ff0000">*</SPAN>号为必填项，为了得到LiveSupport客服的专业服务，请您填写真实资料 
      </SPAN></b></TD></TR>
  <TR>
    <TD><br />
      <TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 570px">
        <TBODY style="text-align:left;">
        <TR>
          <TD width="25%"><FONT color=red>*</FONT> 公司名称： </TD>
          <TD><asp:TextBox ID="txtCompanyName" runat="server" Width="160px"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD <FONT color=red>* </FONT>公司网址：&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;http://</TD>
          <TD ><asp:TextBox ID="txtCompanyWebUrl" runat="server" Width="344px"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD ><FONT color=red>*</FONT> 公司电话： </TD>
          <TD > <asp:TextBox ID="txtCompanyPhone" runat="server" Width="160px"></asp:TextBox>
&nbsp;</TD></TR>
        <TR>
          <TD ><FONT color=red>*</FONT> 联系人： </TD>
          <TD ><asp:TextBox ID="txtName" runat="server" Width="160px"></asp:TextBox>
&nbsp;</TD></TR>
        <TR>
          <TD ><FONT color=red>*</FONT> Email地址： </TD>
          <TD ><asp:TextBox ID="txtMail" runat="server" Width="160px"></asp:TextBox>
&nbsp;</TD></TR>
        <TR>
          <TD><FONT color=red>*</FONT> 所在省：</TD>
          <TD>

<asp:DropDownList ID="ddlSheng" runat="server" AutoPostBack="True" 
                  onselectedindexchanged="ddlSheng_SelectedIndexChanged"></asp:DropDownList>

</TD></TR>
        <TR>
          <TD style="height: 15px" >&nbsp;&nbsp;&nbsp;所在城市： </TD>
          <TD style="height: 15px" > <asp:DropDownList ID="ddlShi" runat="server"></asp:DropDownList>
            </TD></TR>
        <TR id=ignore_type>
          <TD ><FONT color=red>*</FONT> 所在行业： </TD>
          <TD><asp:DropDownList ID="ddlVocation" runat="server" Height="16px" Width="349px">
              <asp:ListItem>请选择行业类别</asp:ListItem>
              <asp:ListItem>计算机</asp:ListItem>
              <asp:ListItem>互联网-电子商务</asp:ListItem>
              <asp:ListItem>电子-微电子</asp:ListItem>
              <asp:ListItem>通讯(设备-运营-增值服务)</asp:ListItem>
              <asp:ListItem>广告-会展-公关</asp:ListItem>
              <asp:ListItem>房地产开发-建筑与工程</asp:ListItem>
              <asp:ListItem>物业管理-商业中心</asp:ListItem>
              <asp:ListItem>家居-室内设计-装潢</asp:ListItem>
              <asp:ListItem>服务业</asp:ListItem>
              <asp:ListItem>中介服务(人才-商标专利)</asp:ListItem>
              <asp:ListItem>专业服务(咨询-财会-法律等)</asp:ListItem>
              <asp:ListItem>金融业(投资-保险-证劵-银行-基金)</asp:ListItem>
              <asp:ListItem>贸易-进出口</asp:ListItem>
              <asp:ListItem>媒体-出版-文化传播</asp:ListItem>
              <asp:ListItem>印刷-包装-造纸</asp:ListItem>
              <asp:ListItem>快速消费品(食品-饮料-日化-烟酒等)</asp:ListItem>
              <asp:ListItem>耐用消费品(服饰-纺织-家具)</asp:ListItem>
              <asp:ListItem>家电业</asp:ListItem>
              <asp:ListItem>办公设备-用品</asp:ListItem>
              <asp:ListItem>旅游-酒店-餐饮服务</asp:ListItem>
              <asp:ListItem>批发-零售</asp:ListItem>
              <asp:ListItem>交通-运输-物流</asp:ListItem>
              <asp:ListItem>娱乐-运动-休闲</asp:ListItem>
              <asp:ListItem>制药-生物工程</asp:ListItem>
              <asp:ListItem>医疗-保健-美容-卫生服务</asp:ListItem>
              <asp:ListItem>医疗设备-器械</asp:ListItem>
              <asp:ListItem>环保</asp:ListItem>
              <asp:ListItem>石油-化工-冶炼-原材料</asp:ListItem>
              <asp:ListItem>能源(电力-石油)-水利</asp:ListItem>
              <asp:ListItem>仪器-仪表-工业自动化-电气</asp:ListItem>
              <asp:ListItem>汽车-摩托车(制造-维护-配件-销售-服务)</asp:ListItem>
              <asp:ListItem>机械制造-机电-重工</asp:ListItem>
              <asp:ListItem>原材料及加工(金属-木材-橡胶-朔料-玻璃-陶瓷-建材)</asp:ListItem>
              <asp:ListItem>农-林-牧-渔</asp:ListItem>
              <asp:ListItem>航空-航天研究与制造</asp:ListItem>
              <asp:ListItem>教育-培训-科研-院校</asp:ListItem>
              <asp:ListItem>政府-非营利机构</asp:ListItem>
              <asp:ListItem>其他</asp:ListItem>
              </asp:DropDownList>
            </TD></TR></TBODY></TABLE></TD></TR><!-- 第二步:创建客服信息 -->
  <TR>
    <TD align=left><b><SPAN>
        <br />
        第二步:创建管理员信息 </TR>
  <TR>
    <TD align=left><br />
      <TABLE cellSpacing=0 cellPadding=0 border=0 >
        <TBODY >
        <TR>
          <TD style="width: 30%"><FONT color=red>*</FONT> 客服ID： </TD>
          <TD  width="40%"><asp:TextBox ID="txtLoginId" runat="server" Width="160px"></asp:TextBox>
&nbsp;</TD>
          <TD width="35%"><SPAN id=result>用于登录到<span>LiveSupport</span> 
        </SPAN></TD></TR>
        <TR>
          <TD style="width: 30%" ><FONT color=red>*</FONT> 密码： </TD>
          <TD ><asp:TextBox ID="txtPwd" runat="server" Width="160px" TextMode="Password"></asp:TextBox>
&nbsp;</TD>
          <TD >密码长度为6-20的任何字符 </TD></TR>
        <TR>
          <TD  noWrap style="width: 30%"><FONT color=red>*</FONT> 密码确认： </TD>
          <TD ><asp:TextBox ID="txtPwds" runat="server" Width="160px" TextMode="Password"></asp:TextBox>
&nbsp;</TD>
          <TD >请再输入一次密码 </TD></TR>
        <TR>
          <TD style="width: 30%" >&nbsp;&nbsp; 客服呢称： </TD>
          <TD ><asp:TextBox ID="txtNickname" runat="server" Width="160px"></asp:TextBox>
&nbsp;</TD>
          <TD>对话时显示给访客的名称 </TD></TR></TBODY></TABLE></TD></TR><!-- 第三步:注册验证 -->
  <TR>
    <TD align=left><b><SPAN >
        <br />
        第三步:注册验证 </SPAN></b></TD></TR>
  <TR>
    <TD align=left><br />
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR >
          <TD style="width: 26%">&nbsp;&nbsp; 注册验证码： </TD>
          <TD style="width: 423px" ><!--验证-->

<!-- also can use LiveSupportFigure or LiveSupportFigure.gif --><img id="imgRandom" alt="验证码" src="RandImage.aspx"  class="verifycode_img"/>&nbsp;<a href="javascript:show_vcode()">看不清楚？换个图片</a></TD></TR>
        <TR>
          <TD style="width: 26%; height: 28px;" ><FONT color=red>*</FONT> 输入验证码： </TD>
          <TD style="width: 423px; height: 28px;" ><asp:TextBox ID="txtValidate" 
                  runat="server" Width="160px"></asp:TextBox>
&nbsp;<BR>请输入上面的注册验证码 </TD></TR>
             <TR>
          <TD style="width: 26%; height: 67px;" ></TD>
          <TD style="width: 423px; height: 67px;" >
              <asp:Button ID="btnOK" runat="server" Text="提交" Width="150px" 
                  onclick="Button1_Click" style="height: 26px" />
                 </TD></TR>
          </TBODY></TABLE></TD></TR>
  <TR>
    <TD align=middle height=40>
        <br />
        <br />
&nbsp;</TD></TR></TBODY></TABLE>
    </td></tr>
</table>

    </center>
    <br />
</asp:Content>

