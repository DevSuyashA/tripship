<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Paym.aspx.cs" Inherits="TripShip.Paym" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <h2>Order Payment</h2>
            </div>
            <div class="align-self-end">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col-12">

                                    <div class="tab-content ml-1" id="myTabContent">
                                        <%-- BAsic user info --%>

                                        <div class="col-md-8">
                                            <div class="form_container">
                                                <asp:Label ID="lblName" ToolTip="Name" runat="server" Text="Card Holder's Name"></asp:Label>

                                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Card Holder's Name"></asp:TextBox>
                                                <asp:Label ID="lblNumber" ToolTip="Name" runat="server" Text="Card Number"></asp:Label>

                                                <asp:RegularExpressionValidator ID="revCard" runat="server" ErrorMessage="Card number should be 12 digits"
                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                    ValidationExpression="^^[0-9]{12}$" ControlToValidate="txtCardNumber"></asp:RegularExpressionValidator>
                                                <asp:TextBox ID="txtCardNumber" CssClass="form-control" runat="server" placeholder="Enter Your Card Number" TextMode="Number"></asp:TextBox>
                                            </div>

                                            <div class="form_container">
                                                <asp:Label ID="lblMonths" ToolTip="Name" runat="server" Text="Expiry Date"></asp:Label>
                                                <asp:RangeValidator ID="rvMonth" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Please Enter a valid month"
                                                    ControlToValidate="txtMonths" MaximumValue="12"></asp:RangeValidator>
                                                <asp:RegularExpressionValidator ID="revMonth" runat="server" ErrorMessage="Month should be 2 digits"
                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                    ValidationExpression="^^[0-9]{2}$" ControlToValidate="txtMonths"></asp:RegularExpressionValidator>



                                                <asp:RegularExpressionValidator ID="revYear" runat="server" ErrorMessage="Year should be 4 digits"
                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                    ValidationExpression="^^[0-9]{4}$" ControlToValidate="txtYear"></asp:RegularExpressionValidator>

                                                <%--<asp:Label ID="Label2" ToolTip="Name" runat="server" Text="CVV" CssClass="p-4"></asp:Label>--%>
                                                <asp:RegularExpressionValidator ID="revCVV" runat="server" ErrorMessage="CVV number should be 3 digits"
                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                    ValidationExpression="^^[0-9]{3}$" ControlToValidate="txtCVV"></asp:RegularExpressionValidator>


                                            </div>
                                            <div class="form_container">
                                                <asp:TextBox ID="txtMonths" runat="server" TextMode="Number" placeholder="MM"></asp:TextBox>
                                                <asp:TextBox ID="txtYear" runat="server" TextMode="Number" placeholder="YYYY"></asp:TextBox>
                                                <asp:TextBox ID="txtCVV" CssClass="border-2" runat="server" TextMode="Number" placeholder="CVV"></asp:TextBox>
                                            </div>
                                            <div>
                                                <asp:Label ID="Label1" ToolTip="Name" runat="server" Text="<br>"></asp:Label>
                                            </div>

                                            <div class="form_container">

                                                <asp:Label ID="lblAmount" ToolTip="Name" runat="server" Text="Amount to be paid"></asp:Label>

                                                <asp:TextBox ID="txtAmount" runat="server" TextMode="number" Enabled="false" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="btnSubmit" CssClass=" btn btn-success rounded-pill pl-4 pr-4 text-white" runat="server" Text="Confirm Payment" OnClick="btnSubmit_Click"  />
                                        </div>
                                    </div>



                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
