<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="LiveSupport Inc: Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

       <!--

POSTER PHOTO

-->
    <div id="poster-photo-container">
        <img src="images/photo-poster.jpg" alt="" class="poster-photo-image" />
          <div id="feature-area-home">����ʹ��Live Support <a href="Register.aspx">����ע��</a><br />
    �������1����</div>
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
                Live Support, �Ƚ������߹�ͨƽ̨</h1>
            <p>
                ��֪��˭�ڷ���������վ���������ʵʱ�����������Ч�İ����̻���
                Live Support��һ����ҵ������վʵʱ����ϵͳ����վ�ÿ�ֻ������ҳ�еĶԻ�ͼ�꣬���谲װ���������κ����������ֱ�Ӻ���վ�ͷ���Ա���м�ʱ������
</p>
            <div id="three-column-container">
                <div id="three-column-side1">
                    <a href="Items.aspx">
                        <img src="images/home-photo-1.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        LiveSupport ��Ʒ</h2>
                    <p>
                        LiveSupport��һ����ҵ������վʵʱ����ϵͳ����վ�ÿ�ֻ������ҳ�еĶԻ�ͼ�꣬���谲װ���������κ����������ֱ�Ӻ���վ�ͷ���Ա���м�ʱ������</p>
                    <a href="Items.aspx">�˽����</a><img class="arrow" src="images/arrow.gif" alt="" /></div>

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
                        ����.</h2>
                    <p>
                        LiveSupportϵͳ������,�����ڴ�!</p>
                    <a href="News.aspx">����</a><img class="arrow" src="images/arrow.gif" alt="" /></div>
                     
            </div>
        </div>
        <!--

CONTENT SIDE COLUMN

-->
        <div id="content-side-two-column">
            <h2>
                LiveSupport ���߿ͷ�!</h2>
<%--            <form id="mainForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>

            <script type="text/javascript">
			document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="ProcessImage.ashx?referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>');
            </script>

        </div>
    </form>--%>
    <script type="text/javascript">
            var chatid="";
			document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="http://localhost/LiveChatService/ProcessImage.ashx?chatid='+chatid+'&aid=4&referrer=' + document.referrer + '" border="0" alt="������߽�̸" /></a>');
            </script>
            <h3>
                �ͷ���ϯ�������
            </h3>
            <ul class="list-of-links">
                <li><a href="Download/OperatorConsole.msi">�ͻ���� LiveOperatorConsole V1.0</a></li>
                <li><a href="#">LiveOperatorConsole V1.0 �û��ֲ�</a></li>
            </ul>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
