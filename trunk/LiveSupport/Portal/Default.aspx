<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="LiveSupport Inc: Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!--POSTER PHOTO-->
    <div id="poster-photo-container">
        <div class="poster-photo-image">
           <img src="Images/photo-poster.jpg" width="568" height="180" />
        </div>
        <div id="feature-area-home">����ʹ��Live Support <a href="Login.aspx">������¼</a><br /><a href="Licence.aspx">û���˺�?��ע��</a><br />
            �������!
        </div>
    </div>
    <!--CONTENT CONTAINER-->
    <div id="content-container-two-column">
        <!--CONTENT MAIN COLUMN-->
        <div id="content-main-two-column">
     
            <h1>
                Live Support, �Ƚ������߹�ͨƽ̨</h1>
            <p style="font-size:13px;">
                ��֪��˭�ڷ���������վ���������ʵʱ�����������Ч�İ����̻���
                Live Support��һ����ҵ������վʵʱ����ϵͳ����վ�ÿ�ֻ������ҳ�еĶԻ�ͼ�꣬���谲װ���������κ����������ֱ�Ӻ���վ�ͷ���Ա���м�ʱ������
            </p>
            <div id="three-column-container">
                <div id="three-column-side1">
                    <a href="ProductServe.aspx">
                        <img src="images/home-photo-1.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        LiveSupport ��Ʒ</h2>
                    <p style="font-size:13px;">
                        LiveSupport��һ����ҵ������վʵʱ����ϵͳ����վ�ÿ�ֻ������ҳ�еĶԻ�ͼ�꣬���谲װ���������κ����������ֱ�Ӻ���վ�ͷ���Ա���м�ʱ������</p>
                    <a href="ProductServe.aspx">�˽����</a><img class="arrow" src="images/arrow.gif" alt="" /></div>
                <table id="three-column-middle"><tr><td>
                    <a href="About.aspx">
                        <img src="images/home-photo-2.jpg" class="photo-border" alt="Enter Alt Text Here" /></a>
                    <h2>
                        ����.</h2>
                    <p style="font-size:13px;">
                        LiveSupportϵͳ������,�����ڴ�!</p>
                    <a href="News.aspx">����</a><img class="arrow" src="images/arrow.gif" alt="" /></td></tr></table>
                </div>
        </div>
        <!--CONTENT SIDE COLUMN-->
        <div id="content-side-two-column" style="font-size:13px;">
            <h4>LiveSupport ���߿ͷ�!</h4>
            LiveSupport�ͷ����1.0
            <a href="Download/OperatorConsole.msi">
            <img src="images/btn_down.gif" 
                style="width: 148px; height: 46px;" /></a></br><br />
            <b>��ʾ��</b><br />
            �״ΰ�װʱ������ʾ��Ҫ��װMicrosoft .Net Framework 2.0,��ѡ����,�Ȱ�װ��ɺ��ٰ�װ�ͷ������
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
