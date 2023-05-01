<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="createServiceRequest.aspx.cs" Inherits="TripShip.createIssue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

        <div class="col-md-6">

            <h4>Raise a service Request</h4>

            <div class="row">
                <div class="col-md-4">
                    <label>Select Parcel</label>
                    <div class="form-group">
                        <asp:DropDownList  runat="server" ID="ddlTrackingId" DataSourceID="SqlDataSource2"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TrackingID], [parcelName] FROM [parcelTracking] WHERE ([customerID] = @customerID)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="customerID" SessionField="UserID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class=" row col-md-4">

                <asp:TextBox ID="TextBox1" CssClass="form-group" runat="server" TextMode="MultiLine" placeholder="Enter your Query"></asp:TextBox>
            </div>
            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="form-group btn btn-primary" class="active" runat="server" Text="Submit" />
        </div>
        <div class="col-md-6">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <center>

                        <h2>Bookings</h2>
                    </center>
                    <asp:Repeater ID="rServiceRequests" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">Tracking ID</th>
                                        <th>Query</th>
                                        <th>Response</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("TrackingID") %> </td>
                                <td><%# Eval("query") %></td>
                                <td><%# Eval("response") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [service] WHERE ([customerID] = @customerID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="customerID" SessionField="UserID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
