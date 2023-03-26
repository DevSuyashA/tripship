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
                                <label>Gender</label>
                                <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Male" Value="M" />
                                    <asp:ListItem Text="Female" Value="F" />
                                </asp:DropDownList>
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
                                        AutoGenerateColumns="False" DataKeyNames="distributerID" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="distributerID" HeaderText="distributerID" SortExpression="distributerID" />
                                            <asp:BoundField DataField="v_username" HeaderText="username" SortExpression="v_username" />
                                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                            <asp:BoundField DataField="Mobno" HeaderText="Mobno" SortExpression="Mobno" />
                                            <asp:BoundField DataField="Open_time" HeaderText="Open_time" SortExpression="Open_time" />
                                            <asp:BoundField DataField="Close_time" HeaderText="Close_time" SortExpression="Close_time" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand="SELECT * FROM [distributionCenters] WHERE [distributerID]!=0"></asp:SqlDataSource>
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
    <br>
        <a href="homepage.aspx"><< Back to Home</a><br>
</asp:Content>
