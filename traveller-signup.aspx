<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="traveller-signup.aspx.cs" Inherits="TripShip.traveller_signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Fill Details</h4>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <center>
                            <img width="100px" src="imgs\buddy.png" />
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
                        <label>Username</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server"
                                placeholder="Enter username"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label>Password</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server"
                                placeholder="" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Address</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"
                                placeholder="Enter Permanant Address" TextMode="MultiLine"></asp:TextBox>
                        </div>
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
                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:CheckBox ID="CheckBox1" runat="server"  />
                            <asp:Label ID="lblTerms" runat="server">I agree to the <a href="#">terms & conditions.</a></asp:Label>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Submit" OnClick="Button2_Click" />
            </div>
        </div>
        <a href="homepage.aspx"><< Back to Home</a><br>
    </div>
</asp:Content>
