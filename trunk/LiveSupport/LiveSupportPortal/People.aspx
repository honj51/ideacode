<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="People.aspx.cs" Inherits="PeoplePage" Title="LiveSupport Inc: People" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        People</div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
  <div id="content-side1-three-column">
    <ul class="list-of-links">
      <li><a href="About.aspx">About Us</a></li>
      <li class="current"><a href="People.aspx">Our Employees</a></li>
      <li><a href="About.aspx">Our History</a></li>
      <li><a href="Contact.aspx">Contact Us</a></li>
      <li><a href="About.aspx">Locations</a></li>
    </ul>
  </div>  
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                LiveSupport Employee Profiles</h1>
            <hr />
            <%--Data Source Controls--%>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllPersons"
                TypeName="People"></asp:ObjectDataSource>
            <asp:GridView ID="GridViewAllNews" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                AllowPaging="True" PageSize="5" OnRowCreated="GridViewAllNews_RowCreated" BorderWidth="0"
                BorderColor="white">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                AlternateText='<%# (string)Eval("ImageAltText")%>' CssClass="photo-float-left photo-border" />
                            <h2>
                                <%# Eval("FirstName").ToString() + " " +  Eval("MiddleName").ToString() + " " + Eval("LastName").ToString() %>
                            </h2>
                            <h3>
                                <i>
                                    <%# Eval("Title")%>
                                </i>
                            </h3>
                            <p>
                                <%# Eval("Description")%>
                            </p>
                            <ul>
                                <li>Phone:
                                    <%#Eval("Phone")%>
                                </li>
                                <li>Fax:
                                    <%#Eval("Fax")%>
                                </li>
                                <li>Email:
                                    <%# Eval("Email")%>
                                </li>
                            </ul>
                            <p />
                            <hr />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
            </asp:GridView>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                Life at LiveSupport</h3>
            <p>
                Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e
                regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic
                e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental:
                in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles,
                quam un skeptic Cambridge amico dit me que Occidental es.
            </p>
            <p>
                Li Europan lingues es membres del sam familie. Lor separat existentie es un myth.
                Por scientie, musica, sport etc., li tot Europa usa li sam vocabularium. Li lingues
                differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos
                directe al desirabilit de un nov lingua franca: on refusa continuar payar custosi
                traductores. It solmen va esser necessi far uniform grammatica, pronunciation e
                plu sommun paroles.
            </p>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
