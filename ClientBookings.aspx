<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ClientBookings.aspx.cs" Inherits="TripShip.ClientBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="user" runat="server">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <center>

                        <h2>Bookings</h2>
                    </center>
                    <asp:Repeater ID="rUser" runat="server" OnItemCommand="rUser_ItemCommand" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">Tracking ID</th>
                                        <th>Parcel Name</th>
                                        <th>Parcel Status</th>
                                        <th>Destination</th>
                                        <th>Weight</th>
                                        <th>OTP</th>
                                        <th>Payment Status</th>
                                        <th>Pay</th>




                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("TrackingID") %> </td>
                                <td><%# Eval("parcelName") %></td>
                                <td><%# Eval("parcelStatus") %></td>
                                <td><%# Eval("destCity") %></td>
                                <td><%# Eval("weight") %></td>
                                <td><%# Eval("otp") %></td>
                                <td><%# Eval("paymentStatus") %></td>
                                <td>
                                    <asp:LinkButton ID="lnkPay" Text="Pay" runat="server" CommandName="pay" CommandArgument='<%# Eval("TrackingID") %>' OnClientClick="return confirm('Do You want to Pay?');"></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TrackingID], [parcelName], [parcelStatus], [destCity], [weight], [otp], [paymentStatus] FROM [parcelTracking] WHERE ([customerID] = @customerID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="customerID" SessionField="userID" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </asp:View>
        <asp:View ID="Vet" runat="server">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <asp:Repeater ID="rVet" runat="server">
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
                                        <th>End Date and Time</th>
                                        <th>Payment Status</th>
                                        <%--<th class="datatable-nosort">Action</th>--%>
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

                                <td><%# Eval("endDnT") %></td>
                                <td>

                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("payID") %>'></asp:Label>
                                </td>
                                <%--<td>
<asp:LinkButton ID="lnkPay" Text="Pay" runat="server" CommandName="pay"
CommandArgument='<%# Eval("b_ID") %>' OnClientClick="return confirm('Do You want to Pay?');">
</asp:LinkButton>
</td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <h2>Completed Bookings</h2>
                    <asp:Repeater ID="rVetCompletedBookings" runat="server">
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
                                        <th>End Date and Time</th>
                                        <th>Payment Status</th>
                                        <%--<th class="datatable-nosort">Action</th>--%>
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
                                <td><%# Eval("endDnT") %></td>
                                <td>

                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("payID") %>'></asp:Label>
                                </td>
                                <%-- <td>
<asp:LinkButton ID="lnkPay" Text="Pay" runat="server" CommandName="pay"
CommandArgument='<%# Eval("b_ID") %>' OnClientClick="return confirm('Do You want to Pay?');">
</asp:LinkButton>
</td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

            </div>
        </asp:View>
        <asp:View ID="travellers" runat="server">
            <h2>Available for Bookings</h2>
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <asp:Repeater ID="rTravellerAvailable" runat="server" OnItemCommand="rTravellerAvailable_ItemCommand">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">Tracking ID</th>
                                        <th>Parcel Name</th>
                                        <th>Weight</th>
                                        <th>Volume</th>
                                        <th>Destination</th>
                                        <th class="datatable-nosort">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("TrackingID") %> </td>
                                <td><%# Eval("parcelName") %></td>
                                <td><%# Eval("weight") %></td>
                                <td><%# Eval("Volume") %></td>
                                <td><%# Eval("destDistributionCenter") %></td>
                                <td>
                                    <asp:LinkButton ID="lnkaccept" Text="Accept" runat="server" CommandName="accept"
                                        CommandArgument='<%# Eval("TrackingID") %>' OnClientClick="return confirm('Do You want to Accept?');">
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
                <div class="table-responsive">
                    <h3>Pending Bookings</h3>
                    <asp:Repeater ID="rTravellerAccepted" runat="server" OnItemCommand="rTravellerAccepted_ItemCommand">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">Tracking ID</th>
                                        <th>Parcel Name</th>
                                        <th>Pickup From</th>
                                        <th>Weight</th>
                                        <th>Drop At</th>
                                        <th>Change Status</th>

                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("TrackingID") %> </td>
                                <td><%# Eval("parcelName") %></td>
                                <td><%# Eval("sourceDistributionCenter") %></td>
                                <td><%# Eval("weight") %></td>
                                <td><%# Eval("destDistributionCenter") %></td>
                                <td>
                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CommandName="edit"
                                        CommandArgument='<%# Eval("TrackingID") %>'></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="table-responsive">
                    <h3>Completed Bookings</h3>
                    <asp:Repeater ID="rTravellerDone" runat="server">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">Tracking ID</th>
                                        <th>Parcel Name</th>
                                        <th>Dropped At</th>
                                        <th>Date</th>
                                        <th>Payment Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("TrackingID") %> </td>
                                <td><%# Eval("parcelName") %></td>
                                <td><%# Eval("destDistributionCenter") %></td>
                                <td><%# Eval("endDateTime") %></td>
                                <td><%# Eval("paymentStatus") %></td>


                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>

</asp:Content>

