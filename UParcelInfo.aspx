<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UParcelInfo.aspx.cs" Inherits="TripShip.UParcelInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h3>
        <center>
            Pending Parcels
        </center>
    </h3>
    <div class="row">
        <div class="col">


            <asp:Repeater ID="rParcelInfo" runat="server" OnItemDataBound="rParcelInfo_ItemDataBound" OnItemCommand="rParcelInfo_ItemCommand" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table class="table data-table-export table-hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus">Parcel Name</th>
                                <th>Weight (in Kg)</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Payment Status</th>
                                <th>Destination City</th>
                                <th>Destination Center</th>
                                <th>OTP</th>
                                <th>Pay</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="table-plus"><%# Eval("parcelName") %> </td>
                        <td><%# Eval("weight") %></td>
                        <td><asp:Label runat="server" ID="lblAmount" Text='<%# Eval("price") %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lblParcelStatus" Text='<%# Eval("parcelStatus") %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lblPaymentStatus" Text='<%# Eval("paymentStatus") %>'></asp:Label></td>
                        <td><%# Eval("destCity") %></td>
                        <td><%# Eval("destDistributionCenter") %></td>
                        <td><%# Eval("otp") %></td>
                      <td><asp:LinkButton runat="server" ID="pay" CommandName="pay" CommandArgument='<%# Eval("TrackingID") %>'>Pay</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody> 
</table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [price], [destCity], [destDistributionCenter], [weight], [otp], [TrackingID], [parcelName],[paymentStatus] ,[parcelStatus] FROM [parcelTracking] WHERE ([customerID] = @customerID)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
