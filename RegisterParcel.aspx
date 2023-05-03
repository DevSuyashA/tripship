<%@ Page Title="Register Parcel" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterParcel.aspx.cs" Inherits="TripShip.RegisterPet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl px-4 mt-4">
        <div class="row">
            <div class="col-xl-8">
                <div class="card mb-4">
                    <div class="card-header">Add New Parcel</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label CssClass="small mb-1" ID="Label4" runat="server" Text="Parcel Name:"></asp:Label>
                                <asp:TextBox class="form-control" ID="TextBox1" placeholder="Enter Parcel Name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <asp:DropDownList ID="ddlUser" runat="server" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="c_username" DataValueField="customerID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [c_username], [customerID] FROM [customers]"></asp:SqlDataSource>
                        <asp:Label ID="usrName" runat="server" Text="Label"></asp:Label>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label CssClass="small mb-1" ID="Label5" runat="server" Text="Parcel's Dimension:"></asp:Label>
                                <asp:TextBox class="form-control" ID="TextBox3" placeholder="Length of Parcel" runat="server" TextMode="Number" required></asp:TextBox>
                                <asp:TextBox class="form-control" ID="TextBox4" placeholder="Width of Parcel" runat="server" TextMode="Number" required></asp:TextBox>
                                <asp:TextBox class="form-control" ID="TextBox6" placeholder="Height of Parcel" runat="server" TextMode="Number" required></asp:TextBox>
                                <asp:TextBox class="form-control" ID="TextBox7" placeholder="Weight of Parcel" runat="server" TextMode="Number" required></asp:TextBox>
                                <asp:TextBox class="form-control" ID="TextBox8" placeholder="Receiver's Email" runat="server" TextMode="email" required></asp:TextBox>
                                <asp:TextBox class="form-control" ID="TextBox5" placeholder="Amount to be payed" runat="server" TextMode="Number" Enabled="false"></asp:TextBox>
                            </div>

                            <div class="flex-row">
                                <div class="col-md-6">
                                    <asp:Label CssClass="small mb-1" ID="Label1" runat="server" Text="Destination City"></asp:Label>
                                    <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" ID="DropDownList1" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="city" DataValueField="city">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [distributerID], [city], [address] FROM [distributionCenters]"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label CssClass="small mb-1" ID="Label2" runat="server" Text="Destination Center"></asp:Label>
                                    <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" ID="ddlDest" runat="server" DataSourceID="SqlDataSource3" DataTextField="address" DataValueField="address">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [address], [distributerID] FROM [distributionCenters] WHERE ([city] = @city)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="city" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-6">
                                    <br />
                                    <asp:TextBox ID="TextBox2" runat="server" type="date"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <asp:Button ID="priceCalc" class="btn-success" runat="server" Text="Calculate" OnClick="priceCalc_Click" />
                    </div>
                    <div class="col p-1 mt-2">
                        <asp:Button ID="Button1" class="btn-primary p-1" runat="server" Text="Accept" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
