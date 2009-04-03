<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Testimonials.aspx.cs" Inherits="TestimonialsPage" Title="LiveSupport Inc: Testimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Testimonials</div>
        <!--

CONTENT CONTAINER

-->
        <div id="content-container-three-column">
             <!--

  CONTENT SIDE 1 COLUMN

  -->
  <div id="content-side1-three-column">
    <ul class="list-of-links">
      <li class="current"><a href="Testimonials.aspx">Client Testimonials</a></li>
      <li><a href="#">Case Study 1</a></li>
      <li><a href="#">Case Study 2</a></li>
      <li><a href="#">Case Study 3</a></li>
      <li><a href="#">Case Study 4</a></li>
      <li><a href="#">Case Study 5</a></li>
    </ul>
  </div>  
            <!--

  CENTER COLUMN

  -->
            <div id="content-main-three-column">
                <h1>
                    Why Our Customers Love Our Products</h1>
                <hr />
                <%--Data Source Controls--%>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllTestimonials"
                    TypeName="Testimonials"></asp:ObjectDataSource>
                <asp:GridView ID="GridViewAllNews" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                    BorderWidth="0" BorderColor="white" OnRowCreated="GridViewAllNews_RowCreated">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <blockquote>
                                    <h2>
                                        <%# Eval("Title").ToString() %>
                                    </h2>
                                    <%# Eval("Date").ToString() %>
                                    <asp:Image ID="ImageNewsItem" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                        AlternateText='<%# (string)Eval("ImageAltText")%>' CssClass="photo-border photo-float-left" />
                                    <p>
                                        <br />
                                        <%# Eval("Content")%>
                                    </p>
                                </blockquote>
                                <br />
                                <p>
                                    <i>
                                        <%# Eval("Testifier")%>
                                        <br />
                                        <%#Eval("TestifierCompany") %>
                                    </i>
                                </p>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <!-- END MAIN COLUMN -->
            <!--

  CONTENT SIDE 2 COLUMN

  -->
            <div id="content-side2-three-column">
                <h3 class="small">
                    Success snippet one</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                    euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
                    minim veniam, quis nostrud exercitation ulliam corper suscipit lobortis nisl ut
                    aliquip ex ea commodo consequat. Duis autem veleum iriure dolor in hendrerit in
                    vulputate velit esse molestie consequat, vel willum lunombro dolore eu feugiat nulla
                    facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
                    luptatum zzril delenit augue duis dolore te feugait nulla.
                </p>
                <h3 class="small">
                    Success snippet two</h3>
                <p>
                    Li Europan lingues es membres del sam familie. Lor separat existentie es un myth.
                    Por scientie, musica, sport etc., li tot Europa usa li sam vocabularium. Li lingues
                    differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos
                    directe al desirabilit de un nov lingua franca: on refusa continuar payar custosi
                    traductores. It solmen va esser necessi far uniform grammatica, pronunciation e
                    plu sommun.
                </p>
            </div>
            <div class="clear">
            </div>
        </div>
</asp:Content>
