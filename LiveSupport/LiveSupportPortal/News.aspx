<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="News.aspx.cs" Inherits="NewsPage" Title="LiveSupport Inc: News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        News</div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li class="current"><a href="News.aspx">All News</a></li>
            </ul>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                LiveSupport News</h1>
            <hr />
            <!-- END MAIN COLUMN -->
            <asp:Panel ID="AllNewsPanel" runat="server">
                <%--Data Source Controls--%>
                <asp:ObjectDataSource ID="ObjectDataSourceAllNews" runat="server" SelectMethod="GetAllNews"
                    TypeName="News"></asp:ObjectDataSource>
                <asp:GridView ID="GridViewAllNews" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSourceAllNews"
                    AllowPaging="True" PageSize="5" OnRowCreated="GridViewAllNews_RowCreated" BorderWidth="0"
                    BorderColor="white" DataKeyNames="Id">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                    AlternateText='<%# (string)Eval("ImageAltText")%>' Width="160" Height="120" CssClass="photo-border photo-float-left" />
                                <h2>
                                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "News.aspx?newsId=" + (string)Eval("Id") %>'> 
                                    <%# Eval("Title").ToString()%>
                                 </asp:HyperLink>
                                </h2>
                                <p class="news-date">
                                    <%# Eval("Date").ToString()%>
                                </p>
                                <p>
                                    <%# Eval("Content").ToString().PadRight(256,' ').Substring(0, 256) %>
                                    </p>
                                <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="images/arrow.gif" NavigateUrl='<%# "News.aspx?newsId=" + (string)Eval("Id") %>'/> 
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "News.aspx?newsId=" + (string)Eval("Id") %>'> 
                                    Read More
                                 </asp:HyperLink>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="NewsDetailPanel" runat="server" Visible="false">
                <asp:ObjectDataSource ID="ObjectDataSourceNewsDetails" runat="server" SelectMethod="GetNewsItem"
                    TypeName="News">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="newsItemId" QueryStringField="newsId" Type="string" DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" AllowPaging="false"
                    BorderWidth="0" BorderColor="white" DataSourceID="ObjectDataSourceNewsDetails">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                    AlternateText='<%# (string)Eval("ImageAltText")%>' Width="160" Height="120" CssClass="photo-border photo-float-left" />
                                <h2>
                                    <%# Eval("Title").ToString()%>
                                </h2>
                                <p class="news-date">
                                    <%# Eval("Date").ToString() %>
                                </p>
                                <p>
                                    <%# Eval("Content").ToString()%>
                                </p>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <a href="News.aspx">Return to All News</a><img src="images/arrow.gif" alt="" />
            </asp:Panel>
        </div>
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                Magazine pull quotes</h3>
            <blockquote>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                    euismod tincidunt ut laoreet dolore magna aliquam erat.</p>
                <p>
                    <cite>Magazine, March 24, 2006</cite></p>
            </blockquote>
            <blockquote>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                    euismod tincidunt ut laoreet dolore magna aliquam erat.</p>
                <p>
                    <cite>Magazine, July 12, 2006</cite></p>
            </blockquote>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
