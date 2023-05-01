<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manage-center.aspx.cs"
    Inherits="TripShip.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-xl">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Add Distribution Center</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs\vet.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server"
                                        placeholder="Enter Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"
                                        placeholder="Enter Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>City</label>
                                <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" placeholder="Enter City"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtNum" runat="server"
                                        placeholder="Enter Contact Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" TextMode="MultiLine"
                                        runat="server" placeholder="Enter Adress"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server"
                                        placeholder="Enter username"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder=""
                                        TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Opening Time</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" TextMode="Time"
                                placeholder="Select Opening Time"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Closing Time</label>

                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"
                                placeholder="Select Closing Time" TextMode="Time"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <asp:Button ID="Button2" class="btn btn-md btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Existing Distribution Centers</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">

                                <div class="card-body">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"
                                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="distributerID" HeaderText="Dist ID" SortExpression="distributerID" />
                                            <asp:BoundField DataField="ownerName" HeaderText="ownerName" SortExpression="ownerName" />
                                            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                                            <asp:BoundField DataField="totalPackage" HeaderText="totalPackage" SortExpression="totalPackage" />
                                            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                                            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand="SELECT [distributerID],[ownerName], [Contact], [totalPackage], [address], [city] FROM [distributionCenters]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <asp:TextBox CssClass="form-control" ID="delNum" runat="server" placeholder="Enter ID"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <asp:Button ID="Button4" class="btn btn-md btn-block btn-danger" runat="server" Text="Remove" OnClick="Button4_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <a href="homepage.aspx"><< Back to Home</a><br>
</asp:Content>
