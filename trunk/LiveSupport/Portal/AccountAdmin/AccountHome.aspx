<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountHome.aspx.cs" Inherits="AccountAdmin_AccountHome" Title="帐户管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 568px; ">
    <div id="pagetitle" style="">&#36134;&#25143;&#39318;&#39029;</div>
    <div id="content-container-three-column" style="height: 568px; background-color:#CCCCCC;">
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li style="font-size:12px;  class="current"><a  href="AccountHome.aspx"><b>&#36134;&#25143;&#39318;&#39029;</b></a></li>
                <li><a href="SetupInstructions.aspx">&#23433;&#35013;&#25351;&#21335;</a></li>
                <li><a href="OperatorsManagment.aspx">&#22352;&#24109;&#31649;&#29702;</a></li>
                <li><a href="AccountSettings.aspx">&#36134;&#25143;&#35774;&#32622;</a></li>
                <li><a href="CannedResponses.aspx">&#39044;&#32622;&#28040;&#24687;</a></li>
            </ul>
        </div>
        <div id="content-main-three-column">
                        <%--<asp:LoginName ID="LoginName1" runat="server" 
                            FormatString="&#24744;&#22909; {0},&#20320;&#21487;&#22312;&#36825;&#20010;&#39029;&#38754;&#31649;&#29702;&#20320;&#30340;&#36134;&#25143;&#12290; " />--%>
                        <br />
                        1. &#28857;&#20987;&#24038;&#36793;&#30340;&#23433;&#35013;&#25351;&#21335;&#24110;&#21161;&#24744;&#25226;&#26381;&#21153;&#25509;&#20837;&#24744;&#30340;&#32593;&#31449;<br />
                        2. &#28857;&#20987;&#24038;&#36793;&#30340;&#22352;&#24109;&#31649;&#29702;&#20197;&#31649;&#29702;&#24744;&#30340;&#22352;&#24109;<br />
                        3. &#28857;&#20987;&#24038;&#36793;&#30340;&#36134;&#25143;&#35774;&#32622;&#26469;&#35774;&#32622;&#20320;&#30340;&#36134;&#25143;<br />
        </div>
        <div id="content-side2-three-column">
        </div>
        <div class="clear">
        </div>
    </div>
    </div>
</asp:Content>

