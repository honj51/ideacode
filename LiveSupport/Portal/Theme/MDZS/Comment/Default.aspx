<%@ Page Language="C#" MasterPageFile="~/BasePage/Master/Default.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Comment.Default" %>

<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
    <h1>
        <asp:Literal ID="IDName" runat="server" /></h1>
    <LeeHom:LHRepeater ID="rpt" runat="server" PageSize="10" SqlPageEnabled="True">
        <HeaderTemplate>
            <ul style="width: 100%; margin: 5px auto;" id="Comment">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="info"><span style="float: right;">
                <img alt="回复此贴" src="../Theme/LHTheme/Replay.gif" onclick="ReplayComment('<%#this.Floor-- %>','<%#Eval("Poster") %>');" />
                <img height="20" src="../Theme/LHTheme/Agree.gif" alt="支持！" onclick="Agree(<%#Eval("ID") %>)" /><span id="A<%#Eval("ID") %>"><%#Eval("Agree") %></span>
                <img src="../Theme/LHTheme/Disagree.gif" alt="反对！" onclick="Disagree(<%#Eval("ID") %>)" />
                <span id="D<%#Eval("ID") %>">
                    <%#Eval("Disagree") %></span></span><img alt="" src="../Theme/LHTheme/Team.gif" class="team" /><b><%#this.Floor+1 %></b>
                楼 <font color="green">
                    <%#Eval("Poster") %><%#string.IsNullOrEmpty(Eval("Contact").ToString()) ? "" : (" <img src=\"../Theme/LHTheme/Mail.gif\" alt=\"" + Eval("Contact") + "\" />")%>
                </font>发表于：
                <%#Eval("PostTime") %></li>
            <li class="content">
                <%#LeeHom.Utility.Text.StringOperate.HtmlEncode(Eval("Contents").ToString())%></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </LeeHom:LHRepeater>
    <asp:Panel ID="pnlNew" runat="server">
        <fieldset style="width: 100%;">
            <legend>
                <img src="../Theme/LHTheme/PMLogin.gif" />
                <img src="../Theme/LHTheme/NewComment.gif" />
            </legend>
            <table style="background: #FFF; width: 100%;">
                <tr>
                    <td>
                        笔 名：
                    </td>
                    <td>
                        <LeeHom:LHValidateTextBox ID="Poster" runat="server" />
                        <span class="p9"><font color="red">*</font></span><input onclick="if(this.checked)$('<%=Poster.ClientID %>').value='游客';else $('<%=Poster.ClientID %>').value=''; " type="checkbox" />匿名
                    </td>
                </tr>
                <tr>
                    <td>
                        评 论：
                    </td>
                    <td>
                        <LeeHom:LHValidateTextBox ID="Contents" TextMode="MultiLine" onkeydown="CommentChange(this);" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        联系方式：
                    </td>
                    <td>
                        <LeeHom:LHValidateTextBox ID="Contact" runat="server" AllowNull="true" />
                        <br />
                        （此信息有助于我们与您联系。
                        <asp:RadioButtonList ID="IsPublic" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Selected="True" Value="0">不对外公开</asp:ListItem>
                            <asp:ListItem Value="1">对外公开</asp:ListItem>
                        </asp:RadioButtonList>
                        ）
                    </td>
                </tr>
                <tr>
                    <td>
                        选择表情：
                    </td>
                    <td>
                        <asp:RadioButtonList ID="Face" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Selected="True" Value="">无</asp:ListItem>
                            <asp:ListItem Value="1">对外公开</asp:ListItem>
                        </asp:RadioButtonList>
                        <%--<input name="face" type="radio" value="001.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/001.gif" />
                        <input name="face" type="radio" value="010.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/010.gif" />
                        <input name="face" type="radio" value="031.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/031.gif" />
                        <input name="face" type="radio" value="040.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/040.gif" />
                        <input name="face" type="radio" value="046.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/046.gif" />
                        <input name="face" type="radio" value="064.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/064.gif" />
                        <input name="face" type="radio" value="067.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/067.gif" />
                        <input name="face" type="radio" value="070.gif" />
                        <img src="http://www.pconline.com.cn/images/comment/070.gif" />--%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="center">
                        <LeeHom:LHValidateImageButton ID="btnSubmit" ImageUrl="~/Theme/LHTheme/SubmitComment.gif"
                            runat="server" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
</asp:Content>
