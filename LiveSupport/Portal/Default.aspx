<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="LiveSupport Inc: Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

 <!--POSTER PHOTO-->
    <div id="poster-photo-container">
        <div class="poster-photo-image">
           <img src="Images/photo-poster.jpg" width="568" height="180" />
        </div>
        <div id="feature-area-home">现在使用Live Support <a href="Licence.aspx">立即注册</a><br />
            免费试用1个月
        </div>
    </div>
    <!--CONTENT CONTAINER-->
    <div id="content-container-two-column">
        <!--CONTENT MAIN COLUMN-->
        <div id="content-main-two-column">
     
            <h1>
                Live Support, 先进的在线沟通平台</h1>
            <p>
                想知道谁在访问您的网站吗？想和他们实时交流吗？想更有效的把握商机吗？
                Live Support是一款企业级的网站实时交流系统，网站访客只需点击网页中的对话图标，无需安装或者下载任何软件，就能直接和网站客服人员进行即时交流。
            </p>
            <div id="three-column-container">
                <div id="three-column-side1">
                    <a href="ProductServe.aspx">
                        <img src="images/home-photo-1.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        LiveSupport 产品</h2>
                    <p>
                        LiveSupport是一款企业级的网站实时交流系统，网站访客只需点击网页中的对话图标，无需安装或者下载任何软件，就能直接和网站客服人员进行即时交流。</p>
                    <a href="ProductServe.aspx">了解更多</a><img class="arrow" src="images/arrow.gif" alt="" /></div>
                <table id="three-column-middle"><tr><td>
                    <a href="About.aspx">
                        <img src="images/home-photo-2.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        新闻.</h2>
                    <p>
                        LiveSupport系统构建中,敬请期待!</p>
                    <a href="News.aspx">更多</a><img class="arrow" src="images/arrow.gif" alt="" /></td></tr></table>
                </div>
        </div>
        <!--CONTENT SIDE COLUMN-->
        <div id="content-side-two-column">
            <h4>LiveSupport 在线客服!</h4>
            LiveSupport 客服软件 1.0
            <a href="Download/OperatorConsole.msi"><img src="images/btn_down.gif" 
                style="width: 120px; height: 46px;" /></a></br>
            首次安装时可能提示需要安装Microsoft .Net Framework 2.0,请选择是,等安装完成后再安装客服软件。
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
