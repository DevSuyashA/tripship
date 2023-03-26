<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookPB.aspx.cs" Inherits="Library_Management_New.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Pet Buddy</h4>
                                </center>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Pet Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Pet Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Appointment Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="DOB" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Slot Timing</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="9:00 AM- 9:30AM" Value="9:00 AM- 9:30AM" />
                                        <asp:ListItem Text="9:30 AM- 10:00AM" Value="9:30 AM- 10:00AM" />
                                        <asp:ListItem Text="10:00 AM- 10:30AM" Value="10:00 AM- 10:30AM" />
                                        <asp:ListItem Text="10:30 AM- 11:00AM" Value="10:30 AM- 11:00AM" />
                                        <asp:ListItem Text="11:00 AM- 11:30AM" Value="11:00 AM- 11:30AM" />
                                        <asp:ListItem Text="11:30 AM- 12:00PM" Value="11:30 AM- 12:00PM" />
                                        <asp:ListItem Text="12:00 PM- 12:30PM" Value="12:00 PM- 12:30PM" />
                                        <asp:ListItem Text="1:30 PM- 2:00PM" Value="1:30 PM- 2:00PM" />
                                        <asp:ListItem Text="2:00 PM- 2:30PM" Value="2:00 PM- 2:30PM" />
                                        <asp:ListItem Text="2:30 PM- 3:00PM" Value="2:30 PM- 3:00PM" />
                                        <asp:ListItem Text="3:00 PM- 3:30PM" Value="3:00 PM- 3:30PM" />
                                        <asp:ListItem Text="3:30 PM- 4:00PM" Value="3:30 PM- 4:00PM" />
                                        <asp:ListItem Text="4:00 PM- 4:30PM" Value="4:00 PM- 4:30PM" />
                                        <asp:ListItem Text="4:30 PM- 5:00PM" Value="4:30 PM- 5:00PM" />
                                        <asp:ListItem Text="5:00 PM- 5:30PM" Value="5:00 PM- 5:30PM" />
                                        <asp:ListItem Text="5:30 PM- 6:00PM" Value="5:30 PM- 6:00PM" />
                                        <asp:ListItem Text="6:00 PM- 6:30PM" Value="6:00 PM- 6:30PM" />
                                        <asp:ListItem Text="6:30 PM- 7:00PM" Value="6:30 PM- 7:00PM" />
                                        <asp:ListItem Text="7:00 PM- 7:30PM" Value="7:00 PM- 7:30PM" />
                                        <asp:ListItem Text="7:30 PM- 8:00PM" Value="7:30 PM- 8:00PM" />
                                        <asp:ListItem Text="8:00 PM- 8:30PM" Value="8:00 PM- 8:30PM" />
                                        <asp:ListItem Text="8:30 PM- 9:00PM" Value="8:30 PM- 9:00PM" />

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pincode</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <%--<asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>--%>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Email ID" TextMode="Password"></asp:TextBox>
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>
