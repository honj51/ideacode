<%@ Page Title="客服中心-LiveSupport在线客服系统" Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="GetCode.aspx.cs" Inherits="AccountAdmin_Default3"  ValidateRequest="true"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="act" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <style>
    .modalPopup 
    {
	    background-color:#BFD1EE;
	    border-style:solid;
	    border-color:Gray;
	    width:250px;
    }
    .modalBackground 
    {
	    background-color:Gray;
	    filter:alpha(opacity=70);
	    opacity:0.7;
    }    
     </style>
   <table cellpadding="0" cellspacing="0">
    <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
    <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">
        配置图片代码</td></tr>
    <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
  </table>
 
 <table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td>
   <table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center"> 
    <!--头部--->
      <div id="content-main-three-column" style="text-align:left;">
        <!--内容-->
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                  <TABLE style=" width:510px; text-align:left;" cellSpacing=1 cellPadding=0 
  <TBODY>
                      <tr>
                          <td colspan="3">
                              域名 ：<asp:DropDownList 
          ID="drpDomainName" runat="server" 
          Width="214px"  onselectedindexchanged="drpDomainName_SelectedIndexChanged" 
          AutoPostBack="True" CausesValidation="True" >
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              客服图标风格：</td>
                          <td valign="middle" 
          class="style1">
                              <asp:DropDownList ID="DropDownList1" runat="server" 
                                                                                    
                                  AppendDataBoundItems="True" AutoPostBack="True" 
                                                                                    
                                  onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                  <asp:ListItem Value="0">风格一</asp:ListItem>
                                  <asp:ListItem Value="1">风格二</asp:ListItem>
                              </asp:DropDownList>
                              &nbsp;&nbsp;
                              <asp:HyperLink ID="HyperLink2" runat="server"  NavigateUrl="#" ForeColor="#FF6666" ToolTip="自定义Banner图片">自定义</asp:HyperLink>
                              <act:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    TargetControlID="HyperLink2"
                    PopupControlID="Panel1"
                    PopupDragHandleControlID="Panel1"
                    BackgroundCssClass="modalBackground"
                    DropShadow="true"
                    CancelControlID="Button3" />
                          </td>
                          <td align="left">
                              <div><asp:Image ID="Image6" Width="160px" Height="70px" runat="server" 
                                      ImageUrl="~/AccountAdmin/Images/online0.JPG" />
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              主动邀请风格：</td>
                          <td valign="middle" 
          class="style1">
                              <asp:DropDownList ID="DropDownList2" runat="server" 
          AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                  <asp:ListItem Value="0">风格一</asp:ListItem>
                                  <asp:ListItem Value="1">风格二</asp:ListItem>
                              </asp:DropDownList>
                              &nbsp;&nbsp;&nbsp;
                              <asp:HyperLink ID="HyperLink3" runat="server"  NavigateUrl="#"  ForeColor="#FF6666" ToolTip="自定义主动邀请图片">自定义</asp:HyperLink>
                              <act:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                    TargetControlID="HyperLink3"
                    PopupControlID="Panel2"
                    PopupDragHandleControlID="Panel2"
                    BackgroundCssClass="modalBackground"
                    DropShadow="true" 
                    CancelControlID="Button4" />
                          </td>
                          <td align="left">
                            <asp:Image ID="Image7" Width="161px" Height="53px" runat="server" 
                                  ImageUrl="~/AccountAdmin/Images/invite_bg0.gif" />
                          </td>
                      </tr>
                      <tr>
                          <td class="style2">
                              聊天页面风格：</td>
                          <td valign="middle" class="style3">
                              <asp:DropDownList ID="DropDownList3" runat="server" 
               AutoPostBack="True" onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                                  <asp:ListItem Selected="True">风格一</asp:ListItem>
                              </asp:DropDownList>
                              &nbsp;&nbsp;&nbsp;
                              <asp:HyperLink ID="HyperLink4" runat="server" ForeColor="#FF6666" NavigateUrl="#" ToolTip="自定义聊天页面样式">自定义</asp:HyperLink>
                              <act:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                    TargetControlID="HyperLink4"
                    PopupControlID="Panel3"
                    PopupDragHandleControlID="Panel3"
                    BackgroundCssClass="modalBackground"
                    DropShadow="true" 
                    CancelControlID="Button7" />
                          </td>
                          <td align="left" class="style2">
                          <asp:Image ID="Image8" Width="164px" Height="87px" runat="server" 
                                  ImageUrl="~/AccountAdmin/Images/chat_bg0.gif" />
                          </td>
                      </tr>
                      </tr>
                      <tr>
                          <TD >
                              图标位置：</TD>
                          <TD colspan=2 >
                              <asp:RadioButton ID="RadioButton0" runat="server" Text="固定客服图标" 
                                  GroupName="icon" />
                              &nbsp;
                              <asp:RadioButton ID="RadioButton1" runat="server" Text="左上角" GroupName="icon" />
                              &nbsp;<asp:RadioButton ID="RadioButton3" runat="server" Text="左中间" 
                                  GroupName="icon" />
                              <asp:RadioButton ID="RadioButton5" runat="server" Text="左下角" GroupName="icon" />
                              <br />
                              <asp:RadioButton ID="RadioButton2" runat="server" Text="右上角" GroupName="icon" />
                              <asp:RadioButton ID="RadioButton4" runat="server" Text="右中间 " 
                                  GroupName="icon" />
                              <asp:RadioButton ID="RadioButton6" runat="server" Text="右下角 " 
                                  GroupName="icon" />
                          </TD>
                      </TR>
                      <tr>
                          <td colspan="3" align="center">
                          <br />
                              <asp:Button ID="Button1" runat="server" Text="确定" Width="115px" 
                                  onclick="Button1_Click" Height="28px" />
                          </td>
                      </tr>
                      </TBODY>
                  </TABLE>
              </ContentTemplate>
          </asp:UpdatePanel>
      </div>
       <!--导航结束-->
</td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
 
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" 
style="display:none" Height="182px" Width="354px">
<div style="margin:5px;background-color:#FFF; width: 345px; height: 172px;">
<div style="background-image:url('images/BG123.JPG'); height:25px; width: 347px; text-align:center;" > <strong>
    上传漂浮旗子图片</strong></div>
<table border="0" style="height: 131px; width: 342px" >
<tr style="height:50px;">  
<td >在线图片：&nbsp;
<asp:FileUpload ID="FileUpload2" runat="server" Width="187px" />
</td>
<td >
<asp:Image ID="Image2" runat="server" Width="50px" ImageUrl="~/AccountAdmin/Images/online1.JPG" />
</td>
</tr>
<tr style="height:50px;">
<td  align="center">离线图片：&nbsp;
<asp:FileUpload ID="FileUpload1" runat="server" Height="23px" 
style="margin-bottom: 0px" Width="186px" /><div>
    <asp:Label ID="Label1" runat="server" ForeColor="#FF0066" Visible="False"></asp:Label></div>
</td>
<td >
<asp:Image ID="Image3" runat="server"  Width="50px" ImageUrl="~/AccountAdmin/Images/offline1.jpg" />
</tr>
<tr>
<td align="center">
<asp:Button ID="Button2" runat="server" Text="上传" Width="51px" 
        onclick="Button2_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button3" runat="server" Text="取消" Width="58px" />
</td>
<td align="center" >&nbsp;</td>
</tr>
</table>
</div>
</asp:Panel>

        <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Height="232px" 
            style="display:none" Width="354px">
            <div style="margin:5px;background-color:#FFF; width: 345px; height: 222px;">
                <div style="background-image: url('../images/BG123.JPG'); height: 25px; width: 347px; text-align:center;">
                    <strong>上传主动邀请图片</strong></div>
                <table border="0" style="height: 131px; width: 342px">
                    <tr style="height:50px;">
                        <td>
                            背景图片：&nbsp;
                            <asp:FileUpload ID="FileUpload3" runat="server" Width="187px" />
                        </td>
                        <td>
                            <asp:Image ID="Image4" runat="server" Width="50px"  ImageUrl="~/AccountAdmin/Images/invite_bg0.gif"/>
                        </td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            确定图片：&nbsp;
                            <asp:FileUpload ID="FileUpload4" runat="server" Height="23px" 
                                style="margin-bottom: 0px" Width="186px" />
                        </td>
                        <td>
                            <asp:Image ID="Image5" runat="server"  Width="50px" ImageUrl="~/AccountAdmin/Images/btn_ok0.jpg" />
                        </td>
                    </tr>
                     <tr style="height:50px;">
                        <td>
                            忽略图片：&nbsp;
                            <asp:FileUpload ID="FileUpload5" runat="server" Height="23px" 
                                style="margin-bottom: 0px" Width="186px" />
                            <div><asp:Label ID="Label2" runat="server" ForeColor="#FF0066" Visible="False"></asp:Label></div>
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" Width="50px" ImageUrl="~/AccountAdmin/Images/btn_no0.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="Button5" runat="server" Text="上传" Width="51px" 
                                onclick="Button5_Click" style="height: 26px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" Text="取消" Width="58px" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
<asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Height="232px" 
            style="display:none" Width="354px">
            <div style="margin:5px;background-color:#FFF; width: 345px; height: 222px;">
                <div style="background-image: url('../images/BG123.JPG'); height: 25px; width: 347px; text-align:center;">
                    <strong>上传聊天页面图片</strong></div>
                <table border="0" style="height: 131px; width: 342px">
                    <tr style="height:50px;">
                        <td>
                            背景图片：&nbsp;
                            <asp:FileUpload ID="FileUpload6" runat="server" Width="187px" Enabled="False" ToolTip="此功能暂不开放"/>
                        </td>
                        <td>
                            <asp:Image ID="Image9" runat="server" Width="50px"  
                                ImageUrl="~/AccountAdmin/Images/chat_bg0.gif" Height="41px"/>
                        </td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            右边图片：&nbsp;
                            <asp:FileUpload ID="FileUpload7" runat="server" Height="23px" 
                                style="margin-bottom: 0px" Width="186px" />
                        </td>
                        <td>
                            <asp:Image ID="Image10" runat="server"  Width="50px" 
                                ImageUrl="~/AccountAdmin/Images/chatright.jpg" Height="32px" />
                        </td>
                    </tr>
                     <tr style="height:50px;">
                        <td>
                            顶部图片：&nbsp;
                            <asp:FileUpload ID="FileUpload8" runat="server" Height="23px" 
                                style="margin-bottom: 0px" Width="186px" />
                            <div><asp:Label ID="Label3" runat="server" ForeColor="#FF0066" Visible="False"></asp:Label></div>
                        </td>
                        <td>
                            <asp:Image ID="Image11" runat="server" Width="50px" 
                                ImageUrl="~/AccountAdmin/Images/chattop.jpg" Height="32px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="Button6" runat="server" Text="上传" Width="51px" 
                             style="height: 26px" onclick="Button6_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button7" runat="server" Text="取消" Width="58px" 
                             />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        
         </asp:Content>

 
 

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .modalPopup 
    {
	    background-color:#BFD1EE;
	    border-style:solid;
	    border-color:Gray;
	    width:250px;
    }
    </style>

</asp:Content>


 
 

