<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ItemDetail.aspx.cs" Inherits="ItemDetail" Title="LiveSupport Inc: Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Items</div>
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <h2>
                <a href="Items.aspx">All Items</a></h2>
            <ul class="list-of-links">
                <li><a href="Items.aspx">All Widgets</a></li>
                <li><a href="#">Widget systems</a></li>
                <li><a href="#">Widget accessories</a></li>
                <li><a href="#">Widgets for fun</a></li>
            </ul>
            <h2>
                Specials</h2>
            <ul class="list-of-links no-lines">
                <li><a href="#">Special #1</a></li>
                <li><a href="#">Special #2</a></li>
                <li><a href="#">Special #3</a></li>
                <li><a href="#">Special #4</a></li>
            </ul>
            <h2>
                Popular widgets</h2>
            <ul class="list-of-links no-lines">
                <li><a href="#">Popular #1</a></li>
                <li><a href="#">Popular #2</a></li>
                <li><a href="#">Popular #3</a></li>
                <li><a href="#">Popular #4</a></li>
            </ul>
            <h2>
                New Widgets</h2>
            <ul class="list-of-links no-lines">
                <li><a href="#">New Widget #1</a></li>
                <li><a href="#">New Widget #2</a></li>
                <li><a href="#">New Widget #3</a></li>
                <li><a href="#">New Widget #4</a></li>
            </ul>
            <h2>
                Upgrade your widget with these great accessories</h2>
            <a href="#">
                <img src="images/product-small-12.jpg" alt="Product 12 name" class="photo-border" /></a>
            <a href="#">
                <img src="images/product-small-11.jpg" alt="Product 11 name" class="photo-border" /></a>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <asp:ObjectDataSource ID="ObjectDataSourceItem" runat="server" SelectMethod="GetItem"
                TypeName="Catalog">
                <SelectParameters>
                    <asp:QueryStringParameter Name="itemId" QueryStringField="itemId" Type="string" DefaultValue="" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" AllowPaging="false"
                BorderWidth="0" BorderColor="white" DataSourceID="ObjectDataSourceItem">
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <h1>
                                <%# Eval("Title").ToString() %>
                            </h1>
                            <br />
                            <asp:Image ID="Image1" CssClass="photo-border" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                AlternateText='<%# (string)Eval("ImageAltText")%>' />
                            <br />
                            <br />
                            <br />
                            <h2>
                                <%# Eval("Price","{0:C}")%>
                            </h2>
                            <br />
                            <%# Eval("Description")%>
                            <br />
                            <br />
                            In Stock:
                            <%#(bool)Eval("InStock") ? "Yes" : "No"%>
                            <hr />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <a href="Items.aspx">Return to All Items</a><img src="images/arrow.gif" alt="" />
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Testimonials.aspx">Our customer rave about our products</asp:HyperLink></h3>
            <blockquote>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                    euismod tincidunt ut laoreet dolore magna aliquam erat.</p>
                <p>
                    <cite>Jane Doe, Phoenix, AZ</cite></p>
            </blockquote>
            <blockquote>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                    euismod tincidunt ut laoreet dolore magna aliquam erat.</p>
                <p>
                    <cite>John Doe, New York, NY</cite></p>
            </blockquote>
            <blockquote>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                    euismod tincidunt ut laoreet dolore magna aliquam erat.</p>
                <p>
                    <cite>Jane Doe, Phoenix, AZ</cite></p>
            </blockquote>
            <blockquote>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                    euismod tincidunt ut laoreet dolore magna aliquam erat.</p>
                <p>
                    <cite>John Doe, New York, NY</cite></p>
            </blockquote>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
