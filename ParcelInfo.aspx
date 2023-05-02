<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ParcelInfo.aspx.cs" Inherits="TripShip.PetInfo" %>

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


            <asp:Repeater ID="rPetInfo" runat="server" OnItemCommand="rPetInfo_ItemCommand">
                <HeaderTemplate>
                    <table class="table data-table-export table-hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus">Parcel Name</th>
                                <th>Weight (in Kg)</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="table-plus"><%# Eval("parcelName") %> </td>
                        <td>
                            <%# Eval("weight") %></td>
                        <td>
                            <%# Eval("price") %></td>
                        <td><%# Eval("parcelStatus") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody> 
</table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>



    <h3>
        <center>
            Upcoming Parcels
        </center>
    </h3>
    <div class="row">
        <div class="col">
            <asp:TextBox runat="server" ID="txtOtp" type="number" autocomplete="off" placeholder="Enter OTP" MaxLength="6" EnableViewState="true" ></asp:TextBox>
            <asp:Repeater ID="rUpcoming" runat="server" OnItemCommand="rUpcoming_ItemCommand" OnItemDataBound="rUpcoming_ItemDataBound" EnableViewState="true">
                <HeaderTemplate>
                    <table class="table data-table-export table-hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus">Parcel Name</th>
                                <th>Weight (in Kg)</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Payment Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="table-plus"><%# Eval("parcelName") %> </td>
                        <td>
                            <%# Eval("weight") %></td>
                        <td>
                            <%# Eval("price") %></td>
                        <td><asp:Label runat="server" ID="lblParcelStatus" Text='<%# Eval("parcelStatus") %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lblPaymentStatus" Text='<%# Eval("paymentStatus") %>'></asp:Label></td>
                        <td><asp:LinkButton runat="server" ID="collectParcel" CommandName="collectParcel" CommandArgument='<%# Eval("TrackingID") %>'>Collect</asp:LinkButton>                            
                            <asp:LinkButton runat="server" ID="enterOTP" CommandName="enterOTP" CommandArgument='<%# Eval("TrackingID") %>'>Verify OTP</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody> 
</table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>

    <h3>
        <center>
            Completed Parcels
        </center>
    </h3>
    <div class="row">
        <div class="col">
            
            <asp:Repeater ID="rCompleted" runat="server">
                <HeaderTemplate>
                    <table class="table data-table-export table-hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus">Parcel Name</th>
                                <th>Weight (in Kg)</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="table-plus"><%# Eval("parcelName") %> </td>
                        <td>
                            <%# Eval("weight") %></td>
                        <td>
                            <%# Eval("price") %></td>
                        <td><%# Eval("parcelStatus") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody> 
</table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
    <%--<center>
        <asp:Button class="btn-dark mb-3 p-2" ID="LinkButton1" name="LinkButton1" Text="Add New Parcel" runat="server" OnClick="LinkButton1_Click"></asp:Button>
    </center>--%>
</asp:Content>
