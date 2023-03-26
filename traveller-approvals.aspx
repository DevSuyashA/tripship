<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="traveller-approvals.aspx.cs" Inherits="TripShip.traveller_approvals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <h3>Completed Bookings</h3>
        <asp:Repeater ID="rBuddyDone" runat="server">
            <HeaderTemplate>
                <table class="table data-table-export table-hover nowrap">
                    <thead>
                        <tr>
                            <th class="table-plus">Booking ID</th>
                            <th>Client Name</th>
                            <th>Pet Name</th>
                            <th>Pet Breed</th>
                            <th>Pet Age</th>
                            <th>Pet Type</th>
                            <th>Service Type</th>
                            <th>Address</th>
                            <th>Start Date and Time</th>

                            <th>End Date and Time</th>
                            <th>Payment Status</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="table-plus"><%# Eval("b_ID") %> </td>
                    <td><%# Eval("cName") %></td>
                    <td><%# Eval("pName") %></td>
                    <td><%# Eval("pBreed") %></td>
                    <td><%# Eval("pAge") %></td>
                    <td><%# Eval("pType") %></td>
                    <td><%# Eval("serviceType") %></td>
                    <td><%# Eval("destAddress") %></td>
                    <td><%# Eval("startDnT") %></td>
                    <td><%# Eval("endDnT") %></td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("payID") %>'></asp:Label></td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody> 
</table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
