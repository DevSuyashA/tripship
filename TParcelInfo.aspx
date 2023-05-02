<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TParcelInfo.aspx.cs" Inherits="TripShip.TParcelInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="card-block table-border-style">
        <div class="table-responsive">
            <center>
                <h2>New Parcels</h2>
            </center>
            <asp:Repeater ID="rParcelInfo" runat="server" OnItemCommand="rParcelInfo_ItemCommand">
                <HeaderTemplate>
                    <table class="table data-table-export table-hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus">Name</th>
                                <th>Weight</th>
                                <th>Volume</th>
                                <th>Source Center</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="table-plus"><%# Eval("parcelName") %> </td>
                        <td><%# Eval("weight") %></td>
                        <td><%# Eval("Volume") %></td>
                        <td><%# Eval("sourceDistributionCenter") %></td>
                        <td><asp:LinkButton runat="server" ID="acceptParcel" CommandName="acceptParcel" CommandArgument='<%# Eval("TrackingID") %>'>accept</asp:LinkButton></td>

                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody> 
</table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </div>

    <%-- Older Parcels --%>
    <div class="card-block table-border-style">
        <div class="table-responsive">
            <center>
                <h2>Parcels</h2>
            </center>
            <asp:Repeater ID="rAccParcels" runat="server" OnItemCommand="rAccParcels_ItemCommand" OnItemDataBound="rAccParcels_ItemDataBound">
                <HeaderTemplate>
                    <table class="table data-table-export table-hover nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus">Name</th>
                                <th>Weight</th>
                                <th>Volume</th>
                                <th>Source Center</th>
                                <th>Destination Center</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="table-plus"><%# Eval("parcelName") %> </td>
                        <td><%# Eval("weight") %></td>
                        <td><%# Eval("Volume") %></td>
                        <td><%# Eval("sourceDistributionCenter") %></td>
                        <td><%# Eval("destDistributionCenter") %></td>
                        <td><asp:Label runat="server" ID="lblStatus" Text='<%# Eval("parcelStatus") %>'></asp:Label></td>
                        <%--<td><%# Eval("parcelStatus") %></td>--%>
                        <td>
                            <asp:LinkButton runat="server" ID="collectParcel" CommandName="collectParcel" CommandArgument='<%# Eval("TrackingID") %>'>Collect</asp:LinkButton></td>

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
