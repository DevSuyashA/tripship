<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="resolveQueries.aspx.cs" Inherits="TripShip.resolveQueries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

        <div class="col-md-6">

            <h4>Resolve a service Request</h4>

            <div class="row">
                <div class="col-md-4">
                    <label>Reply to this Query</label>
                    <div class="form-group">
                        <asp:TextBox ID="txtQuery" CssClass="form-group" runat="server" TextMode="MultiLine" placeholder="Enter your Query" Enabled="false"></asp:TextBox>
                        <asp:HiddenField runat="server" ID ="hdnID" Value="0"/>
                    </div>
                </div>
            </div>
            <div class=" row col-md-4">
                <asp:TextBox ID="txtResponse" CssClass="form-group" runat="server" TextMode="MultiLine" placeholder="Enter your Response"></asp:TextBox>
            </div>
            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="form-group btn btn-primary" class="active" runat="server" Text="Submit" />
        </div>
        <div class="col-md-6">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <center>

                        <h2>Bookings</h2>
                    </center>
                    <asp:Repeater ID="rServiceRequests" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="rServiceRequests_ItemCommand">
                        <HeaderTemplate>
                            <table class="table data-table-export table-hover nowrap">
                                <thead>
                                    <tr>
                                        <th class="table-plus">Tracking ID</th>
                                        <th>Query</th>
                                        <th>Response</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="table-plus"><%# Eval("TrackingID") %> </td>
                                <td><%# Eval("query") %></td>
                                <td><%# Eval("response") %></td>
                                <td>
                                    <asp:LinkButton ID="lnbEdit" runat="server" CommandArgument='<%# Eval("query")+"^"+ Eval("serviceID") %>' CommandName="edit"><i><span class="fa fa-edit"></span></i></asp:LinkButton></td>

                                <asp:LinkButton ID="lnbdelete" runat="server" CommandArgument='<%# Eval("serviceID") %>' CommandName="delete"><i><span class="fa fa-delete"></span></i></asp:LinkButton></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> 
</table>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [service]">
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
