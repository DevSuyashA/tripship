<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="TripShip.Payments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-block table-border-style">
        <div class="table-responsive">
            <asp:Repeater ID="rPayment" runat="server" OnItemCommand="rPayment_ItemCommand">
                <HeaderTemplate>
                    <table class="table data-table-export table-hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus">Booking ID</th>
                                <th>Duration</th>
                                <th>Parcel Name</th>
                                <th>End Date and Time</th>
                                <th>Traveller's Name</th>
                                <th>Distribution Center's Name</th>
                                <th>Amount</th>
                                <th class="datatable-nosort">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="table-plus"><%# Eval("b_ID") %> </td>
                        <td>
                            <%# Eval("duration") %></td>
                        <td>
                            <%# Eval("petName") %></td>

                        <td><%# Eval("endDnT") %></td>
                        <td><%# Eval("pbName") %></td>
                        <td><%# Eval("vName") %></td>
                        <td><%# Eval("Amount") %></td>
                        <td>
                            <asp:LinkButton ID="lnkPay" Text="Pay" runat="server" CommandName="pay"
                                CommandArgument='<%# Eval("b_ID") %>' OnClientClick="return confirm('Do You want to Pay?');">
                            </asp:LinkButton>
                        </td>

                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody> 
                                                            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
