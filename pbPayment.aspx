<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="pbPayment.aspx.cs" Inherits="TripShip.pbPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <center>
                    <h3>Your Payments</h3>
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
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" >
                                        <Columns>
                                            <asp:BoundField DataField="b_ID" HeaderText="Booking ID" SortExpression="b_ID" />
                                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                            <asp:BoundField DataField="TrTime" HeaderText="TrTime" SortExpression="TrTime" />
                                            <asp:BoundField DataField="Client" HeaderText="Client Name" SortExpression="Client" />
                                            <asp:BoundField DataField="petName" HeaderText="Pet" SortExpression="Name"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
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
