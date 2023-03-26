<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="homepage.aspx.cs" Inherits="TripShip.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Services</h2>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/parcel.png" /><br />
                        <asp:Button ID="Button1" runat="server" Text="My Parcel Info" OnClick="Button1_Click" class="btn btn-dark" />
                        <p class="text-center">Get your Pet Info Here</p>
                    </center>

                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/traveller.png" />
                        <br />
                        <center>
                            <asp:Button ID="Button3" runat="server" Text="View Traveller" OnClick="Button3_Click" class="btn btn-dark" />
                            <p class="text-center">Book a Traveller to look after ypur Pet.</p>
                        </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/customerService.png" />
                        <br />
                        <br />
                        <asp:Button ID="Button6" runat="server" Text="Customer Service" OnClick="Button6_Click" class="btn btn-dark" />
                        <p class="text-center">Get your Pet consulted by a Professional Veterinarian</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <section>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <br />
                    <br />
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <a href="#">
                            <img width="150px" src="imgs/notification.png" /><br />
                            <br />
                            <asp:Button ID="Button5" class="btn btn-dark" runat="server" Text="Notifications" OnClick="Button5_Click" />
                        </a>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <p class="text-center">Sign Up to Book Pet Buddies or Consult a Vet.</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <a href='<%= url %>'>
                            <img width="150px" src="imgs/money.png" />
                            <br />
                            <asp:Button ID="Button2" class="btn btn-dark" runat="server" Text="Payment" OnClick="Button2_Click" />
                        </a>
                        <p class="text-center">See your Payments</p>
                    </center>
                </div>
                <%--  <div class="col-md-4" runat="server" Id="viewmyPayments">
                <center>
                <a href="pbPayment.aspx">
                <img width="150px" src="imgs/money.png" /><br />
                <br />
                           
                <h4 class="btn btn-dark">View Payments</h4>

                </a>
                <p class="text-center">Check Payments for your Service</p>
                </center>
                </div> --%>

                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/library.png" />
                        <br />
                        <asp:Button ID="Button4" runat="server" Text="Distribution Center!" OnClick="Button4_Click" class="btn btn-dark" />
                        <p class="text-center">Submit/Collect Parcel</p>
                    </center>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
