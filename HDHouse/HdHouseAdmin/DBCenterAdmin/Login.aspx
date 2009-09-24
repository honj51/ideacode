<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="Images/Login.css">
</head>
<body id="loginbody">
    <form runat="server">
    <div id="adminboxall">
        <div class="adminboxtop">
        </div>
        <div id="adminboxmain">
            <div class="menu">
                <label>
                  <%--  <input style="border-right-width: 0px; width: 76px; border-top-width: 0px; border-bottom-width: 0px;
                        height: 26px; border-left-width: 0px" id="IbtnEnter" src="Images/admin_menu.gif"
                        type="image" name="IbtnEnter">--%>
                        <asp:ImageButton ID="ImageButton1" runat="server"  CssClass="imagebotton1" ImageUrl="Images/admin_menu.gif"/>             
                </label>
            </div>
        </div>
        <div class="adminboxbottom">
            <div id="login">
                <ul>
                    <li class="text">用户名：<br>
                        <div class="box1">
<%--                            <input style="font-family: 宋体" id="26b2l884" class="boxcontent" maxlength="20" type="text"
                                name="26b2l884">--%>
                                <asp:TextBox ID="TextBox1"  CssClass="boxcontent" runat="server"></asp:TextBox>
                        </div>
                    </li>
                    <li class="text">密 码：<br>
                        <div class="box2">
                         <%--   <input id="6b2l88460" class="boxcontent" maxlength="20" type="password" name="6b2l88460">--%>
                         <asp:TextBox  ID="password" CssClass="boxcontent" runat="server" 
                                TextMode="Password"></asp:TextBox>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <a title="网站首页" href="http://www.trader-tools.com.cn/" target="_blank">
            <img border="0" alt="Powered by PowerEasy®" src="Images/admin_text.gif" width="186"
                height="10"></a>
        <div class="clearbox">
        </div>
    </div>
    <span style="display: none; color: red" id="ValrUserName"></span><span style="display: none;
        color: red" id="ValrPassword"></span><span style="display: none; color: red" id="ValrAdminValidateCode">
        </span>
    <div style="display: none; color: red" id="ValidationSummary1">
    </div>
    </form>
</body>
</html>
