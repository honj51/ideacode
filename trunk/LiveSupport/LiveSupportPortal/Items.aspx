<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Items.aspx.cs" Inherits="Items" Title="LiveSupport Inc: Items" %>

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
            <asp:TreeView ID="TreeViewCategories" runat="server" ShowLines="True" ExpandDepth="0"
                LineImagesFolder="~/TreeLineImages" NodeIndent="0" LeafNodeStyle-CssClass="LeafNodesStyle"
                CssClass="TreeView" NodeStyle-CssClass="NodeStyle" ParentNodeStyle-CssClass="ParentNodeStyle"
                RootNodeStyle-CssClass="RootNodeStyle" SelectedNodeStyle-CssClass="SelectedNodeStyle"
                LeafNodeStyle-Width="100%" NodeStyle-Width="100%" ParentNodeStyle-Width="100%"
                RootNodeStyle-Width="100%" SelectedNodeStyle-Width="100%">
                <Nodes>
                    <asp:TreeNode Text="All Items" SelectAction="Expand" PopulateOnDemand="True" Value="All Items" />
                </Nodes>
                <%--<HoverNodeStyle ForeColor="RoyalBlue" />--%>
                <SelectedNodeStyle BackColor="Transparent" CssClass="SelectedNodeStyle" Width="100%" />
                <RootNodeStyle Font-Bold="True" Font-Size="Larger" HorizontalPadding="5px" CssClass="RootNodeStyle"
                    Width="100%" />
                <ParentNodeStyle CssClass="ParentNodeStyle" Width="100%" />
                <LeafNodeStyle CssClass="LeafNodesStyle" Width="100%" />
                <NodeStyle CssClass="NodeStyle" Width="100%" />
            </asp:TreeView>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h2>
                <asp:Label ID="LabelCurrentCategory" runat="server" Visible="true" Text=""></asp:Label></h2>
            <asp:Panel ID="PanelCategories" runat="server" Visible="true">
                &nbsp;<asp:ObjectDataSource ID="ObjectDataSourceCategories" runat="server" SelectMethod="GetChildCategories"
                    TypeName="Catalog">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="parentCategoryId" QueryStringField="catId" Type="string"
                            DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridViewCategories" runat="server" AutoGenerateColumns="False"
                    AllowPaging="true" PageSize="10" DataSourceID="ObjectDataSourceCategories" BorderWidth="0"
                    BorderColor="white">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" CssClass="photo-border photo-float-left" runat="server" Width="90px"
                                    Height="60px" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>' AlternateText='<%#(string)Eval("ImageAltText")%>' />
                                <b>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "Items.aspx?catId=" + (string)Eval("id") %>'> 
                                                                            <%# Eval("Title").ToString()%>
                                    </asp:HyperLink>
                                </b>
                                <br />
                                <%#Eval("Description").ToString()%>
                                <br />
                                <br />
                                <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="images/arrow.gif" NavigateUrl='<%# "Items.aspx?catId=" + (string)Eval("id") %>' />
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "Items.aspx?catId=" + (string)Eval("id") %>'> 
                                    Read More
                                </asp:HyperLink>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
            </asp:Panel>
            <!-- Child Items -->
            <asp:Panel ID="PanelItems" runat="server" Visible="false">
                <hr />
                <asp:ObjectDataSource ID="ObjectDataSourceItems" runat="server" SelectMethod="GetChildItems"
                    TypeName="Catalog">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="categoryId" QueryStringField="catId" Type="string"
                            DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridViewItems" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                    PageSize="10" DataSourceID="ObjectDataSourceItems" OnRowCreated="GridViewItems_RowCreated"
                    BorderWidth="0" BorderColor="white">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" CssClass="photo-border photo-float-left" runat="server" Width="150px"
                                    Height="100px" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>' AlternateText='<%# (string)Eval("ImageAltText")%>' />
                                <h2>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "ItemDetail.aspx?itemId=" + (string)Eval("Id") %>'> 
                                                                            <%# Eval("Title").ToString()%>
                                    </asp:HyperLink></h2>
                                <br />
                                <%# Eval("Price","{0:C}")%>
                                <br />
                                <%# Eval("Description")%>
                                <br />
                                <br />
                                In Stock:
                                <%#(bool)Eval("InStock") ? "Yes" : "No"%>
                                <br />
                                <br />
                                <img src="images/arrow.gif" alt="arrow" />
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "ItemDetail.aspx?itemId=" + (string)Eval("Id") %>'> 
                                            Read More
                                </asp:HyperLink>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
            </asp:Panel>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Testimonials.aspx">Our customers rave about our products</asp:HyperLink></h3>
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
