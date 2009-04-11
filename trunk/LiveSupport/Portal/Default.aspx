<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="LiveSupport Inc: Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

       <!--

POSTER PHOTO

-->
    <div id="poster-photo-container">
        <img src="images/photo-poster.jpg" alt="" class="poster-photo-image" />
          <div id="feature-area-home">现在使用Live Support <a href="Register.aspx">立即注册</a><br />
    免费试用1个月</div>
    </div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-two-column">
        <!--

CONTENT MAIN COLUMN

-->
        <div id="content-main-two-column">
            <h1>
                Live Support, 先进的在线沟通平台</h1>
            <p>
                想知道谁在访问您的网站吗？想和他们实时交流吗？想更有效的把握商机吗？
                Live Support是一款企业级的网站实时交流系统，网站访客只需点击网页中的对话图标，无需安装或者下载任何软件，就能直接和网站客服人员进行即时交流。
</p>
            <div id="three-column-container">
                <div id="three-column-side1">
                    <a href="Items.aspx">
                        <img src="images/home-photo-1.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        LiveSupport 产品</h2>
                    <p>
                        LiveSupport是一款企业级的网站实时交流系统，网站访客只需点击网页中的对话图标，无需安装或者下载任何软件，就能直接和网站客服人员进行即时交流。</p>
                    <a href="Items.aspx">了解更多</a><img class="arrow" src="images/arrow.gif" alt="" /></div>

       <!-- 
                <div id="three-column-side2">
                    <a href="Contact.aspx">
                        <img src="images/home-photo-3.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        Customer Support</h2>
                    <p>
                        Amet, consectetuer adipiscing elit, sed diam tincidunt ut laoreet. Consectetuer
                        adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
                        aliquam erat volutpat. Ut wisi enim ad minim veniam.</p>
                    <a href="Contact.aspx">read more</a><img class="arrow" src="images/arrow.gif" alt="" /></div>
                   -->
                <div id="three-column-middle">
                    <a href="About.aspx">
                        <img src="images/home-photo-2.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        新闻.</h2>
                    <p>
                        LiveSupport系统构建中,敬请期待!</p>
                    <a href="News.aspx">更多</a><img class="arrow" src="images/arrow.gif" alt="" /></div>
                     
            </div>
        </div>
        <!--

CONTENT SIDE COLUMN

-->
        <div id="content-side-two-column">
            <h2>
                LiveSupport 在线客服!</h2>
<%--            <form id="mainForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>

            <script type="text/javascript">
			document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="ProcessImage.ashx?referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>');
            </script>

        </div>
    </form>--%>
    <script type="text/javascript">
			document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="http://service.livesupport.cn/LiveChatService/ProcessImage.ashx?aid=4&referrer=' + document.referrer + '" border="0" alt="点击在线交谈" /></a>');
            </script>
            <h3>
                客服座席软件下载
            </h3>
            <ul class="list-of-links">
                <li><a href="Download/OperatorConsole.msi">客户软件 LiveOperatorConsole V1.0</a></li>
                <li><a href="#">LiveOperatorConsole V1.0 用户手册</a></li>
            </ul>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
