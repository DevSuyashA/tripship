<%@ Page Title="Book Traveller" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="traveller.aspx.cs" Inherits="TripShip.BookPetB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Add new journey" OnClick="Button1_Click" />

     <div class="card-block table-border-style">
                <div class="table-responsive">
                    <center>

                        <h2>Bookings</h2>
                    </center>
                    <asp:Repeater ID="rTravellers" runat="server" >
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
</asp:Content>
