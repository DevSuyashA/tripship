<%@ Page Title="Book Traveller" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="traveller.aspx.cs" Inherits="TripShip.BookPetB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Add new journey" OnClick="Button1_Click" />
    <asp:MultiView runat="server" ID="mtv1">
        <asp:View ID="traveller" runat="server">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <center>
                        <h2>Journey Details</h2>
                    </center>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">From</th>
                                        <th>To</th>
                                        <th>On</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("sourceCity") %> </td>
                                <td><%# Eval("destinationCity") %></td>
                                <td><%# Eval("startDateTime") %></td>

                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [sourceCity], [destinationCity], [startDateTime] FROM [journeyLog] WHERE ([TravellersID] = @TravellersID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="TravellersID" SessionField="UserID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                </div>
            </div>
        </asp:View>
        <asp:View ID="notTraveller" runat="server">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <center>
                        <h2>Traveller Details</h2>
                    </center>
                    <asp:Repeater ID="rTravellers" runat="server">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">Name</th>
                                        <th>Completed Bookings</th>

                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("name") %> </td>
                                <td><%# Eval("totalBookings") %></td>

                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [name], [totalBookings] FROM [travellers]"></asp:SqlDataSource>


                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
