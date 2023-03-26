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
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label CssClass="small mb-1" ID="Label5" runat="server" Text="Parcel's Dimension:"></asp:Label>
                            <asp:TextBox class="form-control" ID="TextBox3" placeholder="Length of Parcel" runat="server" TextMode="Number"></asp:TextBox>
                            <asp:TextBox class="form-control" ID="TextBox4" placeholder="Width of Parcel" runat="server" TextMode="Number"></asp:TextBox>
                            <asp:TextBox class="form-control" ID="TextBox6" placeholder="Height of Parcel" runat="server" TextMode="Number"></asp:TextBox>
                            <asp:TextBox class="form-control" ID="TextBox7" placeholder="Weight of Parcel" runat="server" TextMode="Number"></asp:TextBox>
                            <asp:TextBox class="form-control" ID="TextBox8" placeholder="Receiver's Email" runat="server" TextMode="Number"></asp:TextBox>
                            <asp:TextBox class="form-control" ID="TextBox5" placeholder="Amount to be payed" runat="server" TextMode="Number"></asp:TextBox>

                        </div>
                        <%--<div class="flex-row">
                            <div class="col-md-6">
                                <asp:Label CssClass="small mb-1" ID="Label6" runat="server" Text="Source City"></asp:Label>
                                <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" ID="DropDownList3" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <asp:Label CssClass="small mb-1" ID="Label3" runat="server" Text="Source Center"></asp:Label>
                                <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" ID="DropDownList2" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>--%>
                        <div class="flex-row">
                            <div class="col-md-6">
                                <asp:Label CssClass="small mb-1" ID="Label1" runat="server" Text="Destination City"></asp:Label>
                                <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" ID="DropDownList1" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <asp:Label CssClass="small mb-1" ID="Label2" runat="server" Text="Destination Center"></asp:Label>
                                <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" ID="ddlGender" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:TextBox ID="TextBox2" runat="server" type="date"></asp:TextBox>
                        <asp:TextBox ID="TextBox9" runat="server" type="time"></asp:TextBox>
                    </div>
                    <div class="flex-row">
                        <div class="col-md-6">
                            <asp:Label CssClass="small mb-1" ID="Label6" runat="server" Text="Status"></asp:Label>
                            <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" ID="DropDownList3" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <%--<div class="row">
                    <div class="col-md-6">
                    <asp:Label CssClass="small mb-1" ID="Label1" runat="server" Text="Parcel Breed:"></asp:Label>
                    <asp:TextBox class="form-control" ID="TextBox5" placeholder="Enter Breed" runat="server"></asp:TextBox>
                    </div>
                    </div>--%>
                    <div class="col p-1 mt-2">
                        <asp:Button ID="Button1" class="btn-primary p-1" runat="server" Text="Accept" OnClick="Button1_Click" />
                    </div>
                    <div class="col p-1 mt-2">
                        <asp:Button ID="Button2" class="btn-danger p-1" runat="server" Text="Reject" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
