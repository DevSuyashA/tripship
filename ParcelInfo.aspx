<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ParcelInfo.aspx.cs" Inherits="TripShip.PetInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        <center>
            Your Parcels
        </center>
    </h3>
    <div class="row">
        <div class="col">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [pet_ID], [petName] FROM [Pet] WHERE ([customerID] = @customerID)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
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
    <%--<center>
        <asp:Button class="btn-dark mb-3 p-2" ID="LinkButton1" name="LinkButton1" Text="Add New Parcel" runat="server" OnClick="LinkButton1_Click"></asp:Button>
    </center>--%>
</asp:Content>
