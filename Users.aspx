<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="TripShip.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <center>
                    <h3>User Data</h3>
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
                                    <asp:Repeater runat="server" ID="rUsers">
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
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <span>Phone Number - </span>
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("phone") %>'></asp:Label>
                                                                    &nbsp;| <span><span>&nbsp;</span>email - </span>
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("email") %>'></asp:Label>

                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Address -
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("address") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Total Parcels -
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("countOfParcels") %>'></asp:Label>
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

