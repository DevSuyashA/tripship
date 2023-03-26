<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="vetDash.aspx.cs" Inherits="TripShip.vetDash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Repeater ID="rAvailableOrder" runat="server" OnItemCommand="rAvailableOrder_ItemCommand">
        <HeaderTemplate>
            <table >
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Client Name</th>
                        <th>Pet Name</th>
                        <th>Breed</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Destination</th>
                        <th>Start Date and Time</th>
                        <th>End Date and Time</th>
                        <th>some time origin for relocation</th>
                        <th class="datatable-nosort">Action</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td ><%# Eval("b_ID") %> </td>
                <td><%# Eval("cname") %></td>
                <td><%# Eval("pname") %></td>
                <td><%# Eval("pbreed") %></td>
                <td><%# Eval("pAge") %></td>
                <td><%# Eval("pGender") %></td>
                <td><%# Eval("destAddress") %></td>
                <td><%# Eval("startDnT") %></td>
                <td><%# Eval("endDnT") %></td>
                <td><%# Eval("originAddress") %></td>
                <td>
                    <asp:LinkButton ID="lnkAccept" Text="Accept" runat="server" CommandName="accept"
                         CommandArgument='<%# Eval("b_ID") %>'
                        OnClientClick="return confirm('Do You want to Accept this Service?');">
                                                                            
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody> 
      </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
