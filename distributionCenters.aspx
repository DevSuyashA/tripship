<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="distributionCenters.aspx.cs" Inherits="TripShip.distributionCenters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <center>
                    <h3>Distribution Centers</h3>
                </center>
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card">
                        <div class="card-body">


                            <div class="row">
                                <div class="col">
                                    <%--<asp:GridView class="table table-striped table-bordered" ID="gvUsers" runat="server" AutoGenerateColumns="False" >--%>
                                    <asp:Repeater runat="server" ID="rDistribution">
                                        <%--<columns>
                                            <%-- <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id">
                                                <ControlStyle Font-Bold="True" />
                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>--%>
                                            <%--<asp:TemplateField>--%>
                                            <itemtemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ownerName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <span>Address - </span>
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("address") %>'></asp:Label>
                                                                    &nbsp;| <span><span>&nbsp;</span>City - </span>
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("city") %>'></asp:Label>

                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Contact -
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Contact") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <br />
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Opening Time -
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Convert.ToDateTime( Eval("openingTime")).ToString("hh:mm tt") %>'></asp:Label>
                                                                        &nbsp;| <span><span>&nbsp;</span>Closing Time - </span>
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Convert.ToDateTime( Eval("closingTime")).ToString("hh:mm tt") %>'></asp:Label>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%--                                                                <div class="col-lg-2">
                                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                                </div>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr />  
                                            </itemtemplate>
                                            <%--</asp:TemplateField>--%>
                                        <%--</columns>--%>
                                        <%--</asp:GridView>--%>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <center>
                <a href="homepage.aspx"><< Back to Home</a><span class="clearfix"></span>
                <br />
                <center>
        </div>
    </div>
</asp:Content>
