<%@ Page AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Language="C#"
    MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="registar-container" style="text-align: center">
        <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" 
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
            CreateUserText="&#27880;&#20876;&#26032;&#29992;&#25143;" 
            CreateUserUrl="~/Register.aspx" Font-Names="Verdana" Font-Size="12px" 
            ForeColor="#333333" 
            onloginerror="Login1_LoginError" 
            DestinationPageUrl="~/AccountAdmin/AccountHome.aspx">
            <TextBoxStyle Font-Size="12px" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="12px" ForeColor="#284E98" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
        &nbsp;
    
    </div>
</asp:Content>
