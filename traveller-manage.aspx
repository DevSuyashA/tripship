<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="traveller-manage.aspx.cs" Inherits="TripShip.travellers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Enrolled Travellers</h4>
                                </center>
                            </div>

                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"
                                    AutoGenerateColumns="False" DataKeyNames="TravellersID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="TravellersID" HeaderText="TravellersID"
                                            ReadOnly="True" SortExpression="TravellersID" />
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                        <asp:BoundField DataField="email" HeaderText="email"
                                            SortExpression="email" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                        <asp:BoundField DataField="AdminID" HeaderText="AdminID"
                                            SortExpression="AdminID" />
                                        <asp:BoundField DataField="travellerUname" HeaderText="travellerUname"
                                            SortExpression="travellerUname" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT * FROM [travellers]"></asp:SqlDataSource>
                            </div>
                            <div class="col-6">
                                <asp:TextBox CssClass="form-control" ID="delNum" runat="server" placeholder="Enter ID"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-danger" runat="server" Text="Remove" OnClick="Button3_Click" />
                            </div>

                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <h2>Approvals</h2>
                        <asp:Repeater ID="rUser" runat="server">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th class="table-plus">Request ID</th>
                                            <th>Traveller Name</th>
                                            <th>Contact</th>
                                            <th>TnC</th>
                                            <th>Accept</th>
                                            <th>Deny</th>



                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="table-plus"><%# Eval("b_ID") %> </td>
                                    <td><%# Eval("petName") %></td>
                                    <td><%# Eval("startDnT") %></td>
                                    <td><%# Eval("endDnT") %></td>
                                    <td><%# Eval("serviceType") %></td>
                                    <td><%# Eval("vName") %></td>
                                    <td><%# Eval("pbName") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CommandName="cancel" CommandArgument='<%# Eval("b_ID") %>' OnClientClick="return confirm('Do You want to Cancel?');"></asp:LinkButton>
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
            </div>
        </div>
    </div>
</asp:Content>
