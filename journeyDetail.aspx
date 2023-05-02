<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="journeyDetail.aspx.cs" Inherits="Library_Management_New.journeyDetail" %>

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
                                    <img src="imgs/generaluser.png" width="100px" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Add Journey </h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Select Source Center</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="city" DataValueField="city"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [distributionCenters]"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Travel Start Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="DOB" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDate" ControlToValidate="TextBox2" runat="server" ForeColor="Red" ErrorMessage="Date is required!"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <%--<div class="row">
<div class="col-md-6">
<label>Contact No</label>
<div class="form-group">--%>
                        <%--<asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>--%>
                        <%--</div>--%>
                        <%-- </div>--%>
                        <%-- <div class="col-md-6">
<label>Email ID</label>
<div class="form-group">--%>
                        <%--  <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>--%>
                        <%--</div>
</div>--%>
                        <%--</div>--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Select Destination Center</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="city" DataValueField="city"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [distributionCenters]"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Travel End Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="DOB" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox2" runat="server" ForeColor="Red" ErrorMessage="Date is required!"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <%-- <div class="col-md-4">
<label>Pincode</label>
<div class="form-group">--%>
                            <%--<asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>--%>
                            <%-- </div>
</div>--%>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Acceptable Weight</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtWeight" runat="server" TextMode="Number" placeholder="Enter max weight in kgs"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <%--<div class="row">
<div class="col-md-4">
<label>Service Type</label>
<div class="form-group">
<asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ServiceID"></asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ServiceID], [Name] FROM [Service] WHERE ([isVet] = @isVet)">
<selectparameters>
<asp:Parameter DefaultValue="False" Name="isVet" Type="Boolean" />
</selectparameters>
</asp:SqlDataSource>
</div>
</div>
</div>--%>
                        <div class="row">
                            <div class="col-4 align-self-center">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg" ID="Button1" runat="server" Text="Add Journey" OnClick="Button1_Click" />
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
